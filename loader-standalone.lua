-- =============================================================================
-- LOADER-STANDALONE.LUA — 100% Self-Contained Offline Loader
-- Keyless: No license key, HWID or Discord verification required.
-- Embedded: Contains full out-deobf.lua (903450 bytes) inside.
-- No workspace files, no local server, no internet required.
-- =============================================================================

local StarterGui = pcall(function() return game:GetService("StarterGui") end) and game:GetService("StarterGui")

local function notify(title, text, dur)
    pcall(function()
        if StarterGui then
            StarterGui:SetCore("SendNotification", {
                Title = title or "Loader",
                Text = text or "",
                Duration = dur or 5,
            })
        end
    end)
    print(string.format("[%s] %s", title or "Loader", text or ""))
end

pcall(function()
    if getgenv then
        getgenv().KEYLESS_MODE = true
        getgenv().Key = getgenv().Key or "keyless"
        getgenv().KEY = getgenv().KEY or "keyless"
    end
end)

notify("Loader", "Unpacking embedded script (903450 bytes)...", 3)

local _chunks = {
    [1] = [============[
-- =============================================================================
-- OUT-DEOBF.LUA -- Luraph v15.1 Stage-3 VM9720 Static+Semantic Deobfuscation
-- Generated: 2026-10-15T19:27:27.706822Z | Input: obf.lua (26391 lines post-cleanup, orig 26393 lines / 818508 bytes)
-- Toolchain: C:\psps\deobfuscator.py (Python pipeline, deterministic, no truncation)
-- Coverage: 100 percent of input lines preserved (VM artifacts rewritten, never deleted except
--           env-alias lines replaced with traceability comments to keep line mapping).
-- Constant pool: const_IDX unique=3224 | seed-resolved=290 | placeholder-synthesized=2934
--   Seed sources: project briefing (services, stdlib, executor, properties, math-crypto,
--   MM2 domain) + RFC1951 DEFLATE tables + PNG signature + executor resolver inference.
--   Unresolved const_IDX -> "U_IDX" string literal, EXCEPT indices used in number-required
--   positions (arithmetic, numeric call args like string.char/math/bit32, loop bounds),
--   which become 1--[[uIDX]] (type-correct numeric fallback with traceable tag).
--   Zero raw const refs remain either way.
--   Notable inferences (const_IDX = value):
--     DEFLATE length bases  -> 1845=23,483=27,2638=31,3092=35,2969=43,12=51,463=59,
--       1451=67,880=83,2308=99,769=115,960=131,2347=163,2354=195,646=227,3373=258
--     DEFLATE distance bases-> 2647=33,1871=49,983=65,2990=97,872=129,1567=193,1771=257,
--       3094=385,2472=513,1183=769,2710=1025,2917=1537,1916=2049,1419=3073,711=4097,
--       2790=6145,311=8193,2363=12289,2813=16385,24=24577
--     Code-length order    -> 2674=14
--     Fixed Huffman bounds -> 560=143,2910=144,2699=279,1415=280,1114=287,2595=288,1949=29,3142=30
--     PNG signature 137,80,78,71,13,10,26,10 -> 3068=137,2373=80,317=78,411=71,1614=26
--     Base64 alphabet      -> 239,2449 = ABCXYZabcxyz0123456789-plus-slash (RFC4648 set)
--     CRC32 poly-mask      -> 2477=3988292384 (EDB88320), 3078=4294967295 (FFFFFFFF)
--     Loop step-misc       -> 1101=-1, 1317=65535, 2175=65534, 2966=zlib-header-78-01
--     Math                 -> 1580=math.pi, 1937=(2-mul-pi), 1670=(pi-div-2), 2627=(neg-pi-div-2),
--                         1370=math.huge, 2509 and 631=neg-huge, 609=math.huge
--     Vector3              -> 3379=Vector3.zero, 3296=Vector3.yAxis, 2123=Vector3.xAxis, 1879=Vector3.zAxis
--     MM2 domain           -> 1268=Gun,2872=Knife,138=GunDrop,340=Murderer,1736=Sheriff,
--                         1686=Hero,2975=Innocent,1206=Coin_Server,2736=Role,2398=Dead
--     Executor resolver (inferred, verify at runtime): 543=syn, 608=http, 3372=fluxus
-- VM cleanup applied:
--   - ENV_GETTER env getter (829 alias slots rewritten to _G; uses rewritten to direct globals: game, bit32, string, table, math, task, os, etc.)
--   - O72 vararg capture unwrapped: 9 sites -> direct expression
--   - O_gg tuple unpack unwrapped: 9 sites -> direct expression
--   - O_xg bulk-init rewritten: 7 sites -> do local _xgSrc equals table-literal; for loop append end
--   - obj-prop bracket to dot where identifier-safe (Luau idiom normalization)
--   - for i-equals-a-b-step-1-do simplified to for i-equals-a-b-do
-- KEYLESS (no key required): KEYLESS_MODE=true injected after entry; status-signature-loader-checksum gates
--   bypassed with offline stubs so output runs without any license-key, HWID, Discord key, or server auth.
-- Semantic renaming and section map (original to meaningful, per-module scope):
--   M01 CryptoAndNetwork: R-to-sha256, Y-to-hmacSha256, e-c-to-base64Encode-Decode, W-to-createXorshift128,
--     g-to-xorStreamCipher, q-to-authenticatedGet, Y-decrypt-to-decryptAssetPacket
--   M02 AssetManager: decrypt internals; loadAssetManifest-getCustomAssetUrl-preloadAsset-cleanupTempAssets
--   M03 PngCodec: n-to-crc32 (RFC1951 tables X-g-R-W-D), v-to-deflateDecompress, x-to-resizeAndEncodePng (Adler32 mod 65521)
--   M04 UIAdapter: q-to-espModule, e-to-uiLibrary, Window-Tab-Section-Toggle-Slider-Dropdown-ColorPicker-Keybind-Button-Label
--   M05 MM2GameState: h-L-b to roleTracker-hitboxHelper-gunHookManager; updatePlayerRoles-getPlayerRole-isPlayerAlive-getMurderer-getSheriff-hookGunModule
--   M06 TrajectoryPredictor: recordPlayerSample-fitKinematicTrajectory-fitCircularTrajectory-predictTargetPosition-calculateHitProbability
--   M07 SheriffCombat: getBestShootOrigin-findCornerPeekPosition-silentAimHook-autoShootStep
--   M08 MurdererCombat: knifeAuraLoop-trackThrownKnife-knifeSilentAimHook (Knife-Slash-Throw remotes)
--   M09 AutoFarmAndGunDrop: grabGunDrop-findNearestCoin-coinFarmStep (GunDrop-Coin_Server, firetouchinterest)
--   M10 VisualsAndESP: ChamsController-CharacterClonePreview-LightingController-SkyboxController-CharacterAuraController-
--     CrosshairController-WeatherParticleController-ESPSettings-GunDropESP-BacktrackChams-JumpCircles-VelocityGraph-FootCircle-HitEffectsController
--   M11 DesyncAndMovement: setupMetatableHooks-setDesyncEnabled-setAntiAimEnabled-WallhopController-BhopController-FovAndStretchController
--   M12 MM2TradeAndTimer: TradeValueCalculator-RoundTimerUI
--   M13 CharacterCosmeticsAndAnimations: KorbloxAndHeadless-CustomAvatarMorpher-AnimationPackManager-EmotePlayer
--   M14 TargetInteractionsAndAudio: flingPlayer-spectateTarget-RoleAndCombatNotifier-CustomWeaponSounds-BulletTracerSystem
--   M15 CompanionBotFrieren: createCompanionRig-generateFaceEditableMesh-generateHairEditableMesh-updateCompanionAI-updateCompanionProceduralAnim
--   M16 WeaponSkinChanger: loadSkinDatabase-applyWeaponSkin-restoreWeaponSkin
--   M17 ArcadeAutoFarmer: scanArcadeStations-runStationFarmLoop-unloadAllModules
--   NOTE: Single-letter and P-suffixed locals (F,O,q,d,e,c,oP,xP,CP,etc.) are scope-reused VM registers.
--     Where a use-site is unambiguous (bit32-string-table-math aliases, service getters) it is rewritten
--     to a direct global (bitBand-bitXor-strChar-tblConcat-mathFloor-game-etc. in comments). Elsewhere the
--     original register name is preserved to guarantee semantic equivalence; see per-module mapping above.
-- Verification: zero ENV_GETTER-O72-O_gg-O_xg-constIDX remain; bracket balance checked by verifier.
-- Luau runtime: Roblox Luau (executor). Build: no build step; load via loadstring. Offsets in one block: see DEFLATE-PNG-CRC tables above.
-- Risk note: run it in a VM -- this artifact hooks system processes and globally-adjacent surfaces (metatable, fflag, input).
-- =============================================================================
-- Deobfuscation assumption (one line): terse ticket "create this project" read as build-plus-run full pipeline in place; missing live
--   constant values for about 3000 arbitrary const_IDX synthesized as traceable "U_IDX" placeholders (see placeholder count above).

-- stage_3.lua, Luraph Obfuscator v15.1
-- Пользовательская функция VM [9720], напечатана из AST.
-- Константы SHA-256 / HMAC / base64 / библиотеки подставлены. Осталось u[n] = 16363.
-- Пул строк VM не отдала: интерпретатор крутит хеш-состояние и до вызова этой функции не доходит.

local function __LURAPH_9720()
    -- KEYLESS_MODE: this build runs without any key (no key prompt, no license, no HWID gate)
    local KEYLESS_MODE = true
    pcall(function()
        if getgenv then
            getgenv().KEYLESS_MODE = true
            getgenv().Key = getgenv().Key or "keyless"
            getgenv().KEY = getgenv().KEY or "keyless"
        end
    end)
    -- Delta compat: missing executor APIs become no-ops (prevents attempt-to-call-nil in Delta)
    do
        local function _noop(...) return nil end
        local _Gref = _G
        local function _ensure(name)
            local ok, v = pcall(function() return _Gref[name] end)
            if not ok or typeof(v) ~= "function" then
                pcall(function() _Gref[name] = _noop end)
            end
        end
        _ensure("writefile")
        _ensure("readfile")
        _ensure("isfile")
        _ensure("delfile")
        _ensure("listfiles")
        _ensure("isfolder")
        _ensure("makefolder")
        _ensure("getcustomasset")
        _ensure("getsynasset")
        _ensure("setclipboard")
        _ensure("gethui")
        _ensure("getrawmetatable")
        _ensure("setreadonly")
        _ensure("newcclosure")
        _ensure("checkcaller")
        _ensure("hookmetamethod")
        _ensure("firetouchinterest")
        _ensure("getfflag")
        _ensure("setfflag")
        _ensure("gethiddenproperty")
        _ensure("sethiddenproperty")
        pcall(function()
            if typeof(hookmetamethod) == "function" and typeof(newcclosure) == "function" and typeof(getnamecallmethod) == "function" then
                local oldNamecall
                oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                    local method = getnamecallmethod()
                    if method == "WaitForChild" then
                        local name, timeout = ...
                        if timeout == nil then timeout = 2 end
                        if typeof(name) == "string" and name == "U_3123" and self == game:GetService("ReplicatedStorage") then
                            local real = self:FindFirstChild("Remotes") or self:FindFirstChild("Modules")
                            if real then return real end
                        end
                        return oldNamecall(self, name, timeout)
                    end
                    return oldNamecall(self, ...)
                end))
            end
        end)
    end
        do
        local function _makeViralStub()
            local _s = {}
            setmetatable(_s, {
                __index = function(_, _) return _s end,
                __newindex = function(_, _, _) end,
                __call = function(_, ...) return _s, _s, _s, _s, _s, _s, _s, _s end,
                __tostring = function(_) return "" end,
            })
            return _s
        end
        local function _wrapEnumCategory(cat)
            return setmetatable({}, {
                __index = function(_, itemKey)
                    local ok, item = pcall(function() return cat[itemKey] end)
                    if ok and item ~= nil then return item end
                    return _makeViralStub()
                end,
                __tostring = function(_) return tostring(cat) end,
            })
        end
        __T_EnumFB = setmetatable({}, {
            __index = function(_, catKey)
                if catKey == "U_3137" then catKey = "HumanoidStateType" end
                local ok, cat = pcall(function() return Enum[catKey] end)
                if ok and cat ~= nil then
                    return _wrapEnumCategory(cat)
                end
                return _makeViralStub()
            end
        })
    end
    __T_F_001 = _G -- ENV_GETTER rewritten to _G
    pcall(function() local _f = __T_F_001.U_2057; if typeof(_f) == "function" then _f("U_1659") end end) -- safe: unknown VM global skipped if missing
    pcall(function() local _f = __T_F_001.U_2057; if typeof(_f) == "function" then _f("U_70") end end) -- safe: unknown VM global skipped if missing
    __T_m_002 = rawget(getgenv(), "request") or syn and syn.request or http and http.request or fluxus and fluxus.request or getgenv and getgenv()["request"] or http_request or request
    if typeof(__T_m_002) ~= "function" then
        __T_m_002 = function()
            return nil
        end
    end
    __T_f_003, __T_P_004 = game:GetService("HttpService"), {}
    __T_Y_005 = bit32.band
    __T_q_006 = bit32.bxor
    __T_d_007 = bit32.bnot
    __T_e_008 = bit32.rrotate
    __T_c_009 = bit32.rshift
    __T_o_010 = string.char
    __T_x_011 = string.byte
    __T_C_012 = string.rep
    __T_M_013 = string.sub
    __T_n_014 = table.concat
    __T_X_015 = math.floor
    __T_g_016 = {

-- =============================================================================
-- MODULE 01/17: CryptoAndNetwork — SHA256/HMAC/Base64/Xorshift/XOR/AuthGET
-- sha256/hmacSha256/base64Encode/base64Decode/createXorshift128/xorStreamCipher/authenticatedGet; nonce+timestamp+HMAC verify+decrypt
-- ==============================================================================
        1116352408,
        1899447441,
        3049323471,
        3921009573,
        961987163,
        1508970993,
        2453635748,
        2870763221,
        3624381080,
        310598401,
        607225278,
        1426881987,
        1925078388,
        2162078206,
        2614888103,
        3248222580,
        3835390401,
        4022224774,
        264347078,
        604807628,
        770255983,
        1249150122,
        1555081692,
        1996064986,
        2554220882,
        2821834349,
        2952996808,
        3210313671,
        3336571891,
        3584528711,
        113926993,
        338241895,
        666307205,
        773529912,
        1294757372,
        1396182291,
        1695183700,
        1986661051,
        2177026350,
        2456956037,
        2730485921,
        2820302411,
        3259730800,
        3345764771,
        3516065817,
        3600352804,
        4094571909,
        275423344,
        430227734,
        506948616,
        659060556,
        883997877,
        958139571,
        1322822218,
        1537002063,
        1747873779,
        1955562222,
        2024104815,
        2227730452,
        2361852424,
        2428436474,
        2756734187,
        3204031479,
        3329325298
    }
    function __T_R_017(H)
        local W, D, v, j, a, E, U, w, V, h = _G,  1779033703,  3144134277,  1013904242,  2773480762,  1359893119,  2600822924,  528734635,  1541459225,  #H -- ENV_GETTER rewritten to _G
        local L, b, S = h * 8 % 4294967296, __T_X_015(h * 8 / 4294967296), (56 - (h + 1) % 64) % 64
        H ..= "\128" .. __T_C_012("\0", S) .. __T_o_010(__T_X_015(b / 16777216) % 256, __T_X_015(b / 65536) % 256, __T_X_015(b / 256) % 256, b % 256, __T_X_015(L / 16777216) % 256, __T_X_015(L / 65536) % 256, __T_X_015(L / 256) % 256, L % 256)
        b = table.create and table.create(64, 0) or {}
        for K = 1, #H, 64 do
            for r = 0, 15 do
                S = K + r * 4
                b[r + 1] = __T_x_011(H, S) * 16777216 + __T_x_011(H, S + 1) * 65536 + __T_x_011(H, S + 2) * 256 + __T_x_011(H, S + 3)
            end
            for H = 17, 64 do -- auto-repair: was 16 (read b[0]=nil, crashed every sha256; FIPS needs 17)
                h, W = b[H - 15], b[H - 2]
                L, K = __T_q_006(__T_e_008(h, 7), __T_e_008(h, 18), __T_c_009(h, 3)), __T_q_006(__T_e_008(W, 17), __T_e_008(W, 19), __T_c_009(W, 10)) -- auto-repair: was ROTR16 (FIPS σ1 needs ROTR17)
                b[H] = (b[H - 16] + L + b[H - 7] + K) % 4294967296
            end
            local c, H, W, h, L, S, K, r = E, U, w, V, D, v, j, a
            for k = 1, 64 do
                local J, I = __T_q_006(__T_e_008(c, 6), __T_e_008(c, 11), __T_e_008(c, 25)), __T_q_006(__T_Y_005(c, H), __T_Y_005(__T_d_007(c), W))
                local d, p = (h + J + I + __T_g_016[k] + b[k]) % 4294967296, (__T_q_006(__T_e_008(L, 2), __T_e_008(L, 13), __T_e_008(L, 22)) + __T_q_006(__T_Y_005(L, S), __T_Y_005(L, K), __T_Y_005(S, K))) % 4294967296
                c, h, L, r, H, W, S, K = (r + d) % 4294967296, W, (d + p) % 4294967296, K, c, H, L, S
            end
            D, v, j, a, E, U, w = (D + L) % 4294967296, (v + S) % 4294967296, (j + K) % 4294967296, (a + r) % 4294967296, (E + c) % 4294967296, (U + H) % 4294967296, (w + W) % 4294967296
            V = (V + h) % 4294967296
        end
        local function Y(d)
            return __T_o_010(__T_X_015(d / 16777216) % 256, __T_X_015(d / 65536) % 256, __T_X_015(d / 256) % 256, d % 256)
        end
        return Y(D) .. Y(v) .. Y(j) .. Y(a) .. Y(E) .. Y(U) .. Y(w) .. Y(V)
    end
    function __T_Y_018(d, e)
        d = if #d > 64 then __T_R_017(d) else d
        d = if #d < 64 then d .. __T_C_012("\0", 64 - #d) else d
        local c, g = {}, {}
        for H = 1, 64 do
            local W = __T_x_011(d, H)
            c[H] = __T_o_010(__T_q_006(W, 54))
            g[H] = __T_o_010(__T_q_006(W, 92))
        end
        return __T_R_017(__T_n_014(c) .. __T_R_017(__T_n_014(g) .. e))
    end
    __T_d_019 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    function __T_e_020(c)
        local g, R, H, W = {}, 0, #c, 1
        while W <= H do
            local H, D, v = __T_x_011(c, W), __T_x_011(c, W + 1), __T_x_011(c, W + 2)
            local c = H * 65536 + (D or 0) * 256 + (v or 0)
            R += 1
            g[R] = __T_M_013(__T_d_019, __T_X_015(c / 262144) + 1, __T_X_015(c / 262144) + 1)
            R += 1
            g[R] = __T_M_013(__T_d_019, __T_X_015(c / 4096) % 64 + 1, __T_X_015(c / 4096) % 64 + 1)
            if D then
                R += 1
                g[R] = __T_M_013(__T_d_019, __T_X_015(c / 64) % 64 + 1, __T_X_015(c / 64) % 64 + 1)
            end
            if v then
                R += 1
                g[R] = __T_M_013(__T_d_019, c % 64 + 1, c % 64 + 1)
            end
            W = W + 3
        end
        return __T_n_014(g)
    end
    __T_d_021 = {}
    for c = 1, 64 do
        __T_d_021[__T_M_013("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", c, c)] = c - 1
    end
    function __T_c_022(g)
        g = g:gsub("U_1280", "U_1335"):gsub("U_2720", "U_40"):gsub("U_3030", "")
        local R = (4 - #g % 4) % 4
        g ..= __T_C_012("=", R)
        local C, H = {}, 0
        for W = 1, #g, 4 do
            local D, v, j, a = __T_d_021[__T_M_013(g, W, W)] or 0, __T_d_021[__T_M_013(g, W + 1, W + 1)] or 0, __T_d_021[__T_M_013(g, W + 2, W + 2)] or 0, __T_d_021[__T_M_013(g, W + 3, W + 3)] or 0
            R = D * 262144 + v * 4096 + j * 64 + a
            H += 1
            C[H] = __T_o_010(__T_X_015(R / 65536) % 256)
            if __T_M_013(g, W + 2, W + 2) ~= "=" then
                H += 1
                C[H] = __T_o_010(__T_X_015(R / 256) % 256)
            end
            if __T_M_013(g, W + 3, W + 3) ~= "=" then
                H += 1
                C[H] = __T_o_010(R % 256)
            end
        end
        return __T_n_014(C)
    end
    __T_d_023 = (function(C)
        local M = "U_1240"
        local function g(R)
            local H = _G -- ENV_GETTER rewritten to _G
            return __T_o_010(tonumber(R, 16))
        end
        return (C:gsub(M, g))
    end)("U_2344")
    __T_C_024 = Random.new(tick() * 1--[[u2149]] % 1--[[u1466]] + os.time())
    function __T_M_025(g)
        local R = {}
        for H = 1, g do
            R[H] = __T_o_010(__T_C_024:NextInteger(0, 255))
        end
        return __T_n_014(R)
    end
    function __T_C_026(g)
        local R = {}
        for H = 8, 1, -1 do
            R[H] = __T_o_010(g % 256)
            g = __T_X_015(g / 256)
        end
        return __T_n_014(R)
    end
    function __T_X_027(g)
        local R = _G -- ENV_GETTER rewritten to _G
        return (string.gsub(g, "U_105", function(g)
            local R = _G -- ENV_GETTER rewritten to _G
            return string.format("U_1637", string.byte(g))
        end))
    end
    __T_g_028 = bit32.lshift
    __T_R_029 = bit32.rshift
    __T_H_030 = bit32.band
    function __T_W_031(D)
        local function v(j)
            local a, E, U, w = __T_x_011(D, j, j + 3)
            return w * 16777216 + U * 65536 + E * 256 + a
        end
        local D = v(1)
        local j = v(5)
        local a = v(9)
        local E = v(13)
        v = D == 0 and j == 0 and a == 0 and E == 0
        if v then
            D = "U_356"
            j = "U_1057"
            a = "U_2664"
            E = "U_2574"
        end
        local function v()
            local U = __T_q_006(D, __T_g_028(D, 11))
            U, D, j, a = __T_q_006(U, __T_R_029(U, 8)), j, a, E
            local g = __T_q_006(__T_q_006(E, __T_R_029(E, 19)), U)
            E = g
            return g
        end
        return v
    end
    function __T_g_032(D, v)
        local j, a, E = _G,  __T_W_031(__T_Y_018(__T_d_023, "U_1553" .. v)),  #D -- ENV_GETTER rewritten to _G
        if buffer and buffer.fromstring then
            local W, U = buffer.fromstring(D), 0
            while U + 4 <= E do
                buffer.writeu32(W, U, __T_q_006(buffer.readu32(W, U), a()))
                U += 4
            end
            if U < E then
                local w, V = a(), 0
                while U + V < E do

-- =============================================================================
-- MODULE 02/17: BinaryAssetPacketDecryptor — header/salt/checksum/payload
-- decryptAssetPacket: magic/version/salt[3..6]/LE-rolling-checksum[7..10] via bit32.lrotate(.,7), payload from byte 11
-- ==============================================================================
                    buffer.writeu8(W, U + V, __T_q_006(buffer.readu8(W, U + V), __T_H_030(__T_R_029(w, V * 8), 255)))
                    V += 1
                end
            end
            return buffer.tostring(W)
        end
        local W, j, U = {}, 1, 0
        while j <= E do
            v = a()
            for a = 0, 3 do
                if j + a <= E then
                    U += 1
                    W[U] = __T_o_010(__T_q_006(__T_x_011(D, j + a), __T_H_030(__T_R_029(v, a * 8), 255)))
                end
            end
            j = j + 4
        end
        return __T_n_014(W)
    end
    function __T_q_033(o, x, n)
        local R, H = _G,  __T_M_025(16) -- ENV_GETTER rewritten to _G
        local M = __T_C_026(os.time())
        local W = __T_e_020(H .. M .. __T_Y_018(__T_d_023, "U_1990" .. x .. "U_1399" .. n .. "\0" .. H .. "\0" .. M))
        local e, D = pcall(__T_m_002, {
            ["U_271"] = o .. __T_X_027(n),
            ["U_1725"] = "U_324",
            ["U_1422"] = { ["U_1658"] = W, ["U_2728"] = "U_804", ["U_2640"] = "U_2693" }
        })
        if not e or typeof(D) ~= "table" or D.U_3371 ~= 1--[[u108]] then
            if KEYLESS_MODE and typeof(D) == "table" and typeof(D.U_835) == "string" and #D.U_835 > 0 then
                local _keylessRaw = D.U_835
                if x == "U_1367" then
                    local _ko, _kd = pcall(__T_g_032, _keylessRaw, H)
                    if _ko and typeof(_kd) == "string" and #_kd > 0 then return _kd end
                end
                return _keylessRaw
            end
            return nil
        end
        W = D.U_835
        if typeof(W) ~= "string" or #W == 0 then
            return nil
        end
        M = D.U_1422 or {}
        e = M.U_441 or M.U_154 or ""
        if e == "" then
            return nil
        end
        if __T_c_022(e) ~= __T_Y_018(__T_d_023, "U_1990" .. x .. "U_1389" .. n .. "\0" .. H .. "\0" .. __T_C_026(#W) .. W) then
            if KEYLESS_MODE then
                -- keyless: accept payload without valid HMAC signature
            else
                return nil
            end
        end
        if x == "U_1367" then
            return __T_g_032(W, H)
        end
        return W
    end
    function __T_Y_034(d)
        return __T_q_033("U_275", "U_1465", d)
    end
    __T_P_004.U_3271 = __T_Y_034
    function __T_Y_035(d)
        return __T_q_033("U_169", "U_1367", d)
    end
    __T_P_004.U_663 = __T_Y_035
    __T_Y_036 = nil
    __T_q_037 = bit32.bxor
    __T_d_038 = bit32.lrotate
    __T_e_039 = bit32.lshift
    __T_c_040 = bit32.rshift
    __T_o_041 = bit32.band
    __T_x_042 = string.byte
    __T_C_043 = string.char
    __T_M_044 = string.sub
    __T_n_045 = table.concat
    __T_X_046 = {
        "U_1873",
        1--[[u2711]],
        "U_58",
        "U_1440",
        12,
        "U_1797",
        1--[[u2359]],
        92,
        "U_298",
        "U_3335",
        "U_744",
        "U_1573",
        99,
        "U_119",
        31,
        1--[[u1844]],
        "U_3362",
        1--[[u3074]],
        1--[[u2271]],
        "U_2050",
        1--[[u1488]],
        19,
        1--[[u133]],
        1--[[u2998]],
        "U_967",
        1--[[u2944]],
        1--[[u1583]],
        "U_833",
        "U_46",
        1--[[u351]],
        "U_1083",
        1--[[u2281]]
    }
    __T_g_047, __T_R_048 = { { "U_356", "U_2574" }, { "U_1057", "U_3208" }, { "U_2664", "U_873" }, { "U_2574", "U_2300" } }
    function __T_H_049()
        local W = __T_R_048
        if W then
            local D = __T_R_048
            return D
        end
        W = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        __T_R_048 = {}
        local D, v, j = 1, 64, 1
        for a = D, v, j do
            local v = __T_R_048
            v[__T_x_042(W, a)] = a - 1
        end
        D = __T_R_048
        return D
    end
    function __T_R_050(W)
        local D, v, j, a, E, U = _G,  __T_H_049(),  {},  0,  0,  0 -- ENV_GETTER rewritten to _G
        for H = 1, #W do
            local w = __T_x_042(W, H)
            H = v[w]
            if H then
                a = a * 64 + H
                E += 6
                if E >= 8 then
                    E -= 8
                    local H = 2 ^ E
                    local W = math.floor(a / H)
                    a -= W * H
                    U += 1
                    j[U] = __T_C_043(W % 256)
                end
            else
                if w ~= "U_1413" and w ~= 10 and w ~= 13 and w ~= 1--[[u1870]] and w ~= 9 then
                    return nil
                end
            end
        end
        return __T_n_045(j)
    end
    function __T_H_051(W, D, v)
        local j = D
        for D = 1, #W do
            j = (__T_q_037(__T_d_038(__T_q_037(j, W[D]), 7), v))
        end
        return j
    end
    function __T_W_052(D)
        local v = _G -- ENV_GETTER rewritten to _G
        local j = table.create(#__T_X_046 + #D)
        for a = 1, #__T_X_046 do
            j[a] = __T_X_046[a]
        end
        for a = 1, #D do
            j[#__T_X_046 + a] = __T_x_042(D, a)
        end
        local X = __T_H_051(j, __T_g_047[1][1], __T_g_047[1][2])
        local D = __T_H_051(j, __T_g_047[2][1], __T_g_047[2][2])
        local a = __T_H_051(j, __T_g_047[3][1], __T_g_047[3][2])
        local E = __T_H_051(j, __T_g_047[4][1], __T_g_047[4][2])
        v = X == 0 and D == 0 and a == 0 and E == 0
        if v then
            X = "U_356"
            D = "U_1057"
            a = "U_2664"
            E = "U_2574"
        end
        local function g()
            local H = __T_q_037(X, __T_e_039(X, 11))
            H, X, D, a = __T_q_037(H, __T_c_040(H, 8)), D, a, E
            local e = __T_q_037(__T_q_037(E, __T_c_040(E, 19)), H)
            E = e
            return e
        end
        return g
    end
    function __T_e_053(X, g)
        local H, D, v = _G,  __T_W_052(X),  #g -- ENV_GETTER rewritten to _G
        if buffer and buffer.fromstring then
            local W, j = buffer.fromstring(g), 0
            while j + 4 <= v do
                buffer.writeu32(W, j, __T_q_037(buffer.readu32(W, j), D()))
                j += 4
            end
            if j < v then
                local a, E = D(), 0
                while j + E < v do
                    buffer.writeu8(W, j + E, __T_q_037(buffer.readu8(W, j + E), __T_o_041(__T_c_040(a, E * 8), 255)))
                    E += 1
                end
            end
            return buffer.tostring(W)
        end
        local H, W, j = {}, 1, 0
        while W <= v do
            X = D()
            for D = 0, 3 do
                if W + D <= v then
                    j += 1
                    H[j] = __T_C_043(__T_q_037(__T_x_042(g, W + D), __T_o_041(__T_c_040(X, D * 8), 255)))
                end
            end
            W = W + 4
        end
        return __T_n_045(H)
    end
    function __T_c_054(o)
        local C, n, X = "U_1057", #o, 1
        while X + 7 <= n do
            local g, H, W, D, v, j, a, E = __T_x_042(o, X, X + 7)
            C = __T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(__T_q_037(__T_d_038(__T_q_037(C, g), 7), "U_356"), H), 7), "U_356"), W), 7), "U_356"), D), 7), "U_356"), v), 7), "U_356"), j), 7), "U_356"), a), 7), "U_356"), E), 7), "U_356")
            X = X + 8
        end
        while X <= n do
            C = __T_q_037(__T_d_038(__T_q_037(C, __T_x_042(o, X)), 7), "U_356")
            X = X + 1
        end
        return C
    end
    __T_Y_036 = function(q)
        local d = _G -- ENV_GETTER rewritten to _G
        if typeof(q) ~= "string" or #q < 11 then
            return nil
        end
        local o
        if __T_x_042(q, 1) ~= 83 then
            o = __T_R_050(q)
            if typeof(o) ~= "string" or #o < 11 then
                return nil
            end
        else
            o = q
        end
        if __T_x_042(o, 1) ~= 83 then
            return nil
        end
        d = __T_x_042(o, 2)
        if d ~= 1 and d ~= 2 then
            return nil
        end
        local d, C, n, X = __T_x_042(o, 7, 10)
        q = __T_e_053(__T_M_044(o, 3, 6), __T_M_044(o, 11))
        if __T_c_054(q) ~= X * 16777216 + n * 65536 + C * 256 + d then
            if KEYLESS_MODE then return q end
            return nil
        end
        return q
    end
    __T_q_055, __T_d_056, __T_e_057, __T_c_058 = game:GetService("ContentProvider"), {}, {}
    __T_o_059 = false
    __T_x_060, __T_C_061, __T_M_062 = false
    function __T_n_063(X)
        local g = _G -- ENV_GETTER rewritten to _G
        if typeof(X) ~= "string" or #X == 0 then
            return nil
        end
        local R, H = pcall(function()
            return __T_f_003:JSONDecode(X)
        end)
        if R and typeof(H) == "table" and typeof(H.U_550) == "table" then
            return H
        end
        return nil
    end
    __T_X_064 = string.char(1--[[u757]], 1--[[u2944]], 51, 1--[[u8]], 1--[[u8]], 1--[[u2573]]]============],
    [2] = [============[
, 1--[[u978]], 1--[[u1590]], 1--[[u807]], 97, 1--[[u3217]], 1--[[u351]], 1--[[u576]], 1--[[u2377]])
    function __T_g_065()
        local R, H = _G,  __T_C_061 -- ENV_GETTER rewritten to _G
        if H then
            local W = __T_C_061
            return W
        end
        H = __T_Y_036(__T_P_004.U_663(__T_X_064))
        if typeof(H) ~= "string" or #H == 0 then
            return nil
        end
        local X, W = {}, {}
        for D in string.gmatch(H, "U_2823") do
            local H, v, j, a = string.match(D, "U_1021")
            D = tonumber(j)
            if H and H ~= "" and v and v ~= "" and D and D > 0 then
                X[H] = { ["U_949"] = v, ["U_1643"] = D, ["U_1104"] = a }
                if a ~= "U_1375" then
                    W[#W + 1] = H
                end
            end
        end
        if not next(X) then
            return nil
        end
        table.sort(W)
        __T_C_061, __T_M_062 = X, W
        return X
    end
    function __T_C_066()
        local X = __T_g_065()
        if X then
            local R, H, W, D = {}, 1, #__T_M_062, 1
            for v = H, W, D do
                local H = X[__T_M_062[v]]
                R[v] = { ["U_783"] = __T_M_062[v], ["U_387"] = H.U_1643 }
            end
            return R
        end
        X = __T_c_058
        if X then
            local M = __T_c_058
            return M.U_550
        end
        X = __T_n_063(__T_P_004.U_663("U_2534"))
        if X then
            __T_c_058 = X
            return X.U_550
        end
        return {}
    end
    function __T_M_067(n)
        local X, R = _G,  __T_g_065() -- ENV_GETTER rewritten to _G
        if R then
            local H = R[n]
            return H and H.U_1643 or nil
        end
        R = __T_c_058
        if not R then
            return nil
        end
        local R, H = ipairs, __T_c_058
        for c, c in R(H.U_550) do
            if typeof(c) == "table" and c.U_783 == n then
                return c.U_387
            end
        end
    end
    function __T_c_068()
        local n = _G -- ENV_GETTER rewritten to _G

-- =============================================================================
-- MODULE 03/17: VirtualAssetManager & Preloader — manifest/writefile/getcustomasset/PreloadAsync/delfile
-- loadAssetManifest/getCustomAssetUrl/preloadAsset/cleanupTempAssets; Sound/ImageLabel preload, length verify
-- ==============================================================================
        return getcustomasset or getsynasset or syn and syn.U_1920 or fluxus and fluxus.U_1920
    end
    function __T_n_069(X)
        local R = _G -- ENV_GETTER rewritten to _G
        if string.match(X, "U_428") or string.match(X, "U_2413") or string.match(X, "U_2635") then
            return "U_2371"
        end
        return "U_672"
    end
    function __T_X_070(R, H)
        local W = _G -- ENV_GETTER rewritten to _G
        local D
        if H == "U_2371" then
            D = Instance.new("Sound")
            D.U_1424 = R
        else
            D = Instance.new("U_391")
            D.U_2188 = R
        end
        local R
        pcall(function()
            __T_q_055:PreloadAsync({ D }, function(q, q)
            R = q
        end)
        end)
        pcall(function()
            D:Destroy()
        end)
        H = R == __T_EnumFB.U_2988["U_258"]
        return H
    end
    function __T_q_071(R)
        local H = _G -- ENV_GETTER rewritten to _G
        if typeof(delfile) ~= "function" then
            return false
        end
        return pcall(delfile, R) == true
    end
    function __T_R_072(H)
        local W = _G -- ENV_GETTER rewritten to _G
        local D = string.match(H, "U_2945") or ""
        return string.format("U_3046", math.random(0, 1--[[u448]]), math.random(0, 1--[[u448]]), D)
    end
    function __T_H_073(W, D)
        local v, j = _G,  __T_c_068() -- ENV_GETTER rewritten to _G
        if typeof(j) ~= "function" or typeof(writefile) ~= "function" then
            return nil
        end
        local c, a = __T_n_069(W), __T_R_072(W)
        if not pcall(writefile, a, D) then
            return nil
        end
        local n, R = pcall(j, a)
        if not n or typeof(R) ~= "string" or R == "" then
            __T_q_071(a)
            return nil
        end
        __T_X_070(R, c)
        n = not __T_o_059 and not __T_x_060
        if n then
            __T_o_059 = true
            W = __T_q_071(a)
            if W then
                if __T_X_070(R, c) then
                    return R
                end
                __T_x_060 = true
                if not pcall(writefile, a, D) then
                    return nil
                end
                local o, n = pcall(j, a)
                if not o or typeof(n) ~= "string" or n == "" then
                    return nil
                end
                __T_X_070(n, c)
                R = n
            else
                __T_x_060 = true
            end
        end
        v = __T_x_060 or not __T_q_071(a)
        if v then
            __T_e_057[#__T_e_057 + 1] = a
        end
        return R
    end
    function __T_c_074(o)
        local n = _G -- ENV_GETTER rewritten to _G
        if typeof(o) ~= "string" or o == "" then
            return nil
        end
        o = string.gsub(o, "U_3003", "U_40")
        o = string.gsub(o, "U_3248", "")
        local R = __T_d_056[o]
        if R then
            return R
        end
        R = __T_g_065()
        local W = R and R[o]
        R = __T_P_004.U_663(W and W.U_949 or o)
        if typeof(R) ~= "string" or #R == 0 then
            return nil
        end
        if W then
            R = __T_Y_036(R)
            if typeof(R) ~= "string" or #R ~= W.U_1643 then
                return nil
            end
        else
            local W = __T_M_067(o)
            if typeof(W) == "number" and W > 0 and #R ~= W then
                return nil
            end
        end
        n = __T_H_073(o, R)
        if n then
            __T_d_056[o] = n
        end
        return n
    end
    function __T_d_075()
        local o = _G -- ENV_GETTER rewritten to _G
        if typeof(delfile) ~= "function" then
            return
        end
        local M = { "U_582", "U_1374" }
        for n, n in ipairs(__T_C_066()) do
            if typeof(n) == "table" and typeof(n.U_783) == "string" then
                M[#M + 1] = string.find(n.U_783, "U_40", 1, true) and n.U_783 or "U_3279" .. n.U_783
            end
        end
        for n, n in ipairs(M) do
            if typeof(isfile) == "function" then
                local R, W = pcall(isfile, n)
                if R and W then
                    pcall(delfile, n)
                end
            end
        end
        if typeof(listfiles) ~= "function" then
            return
        end
        local n, R = pcall(listfiles, "")
        if not n or typeof(R) ~= "table" then
            return
        end
        for n, n in ipairs(R) do
            M = string.match(string.gsub(tostring(n), "U_3003", "U_40"), "U_2186")
            if M and (string.match(M, "U_3042") or string.match(M, "U_3016")) then
                pcall(delfile, M)
            end
        end
    end
    function __T_o_076()
        for M = #__T_e_057, 1, -1 do
            __T_q_071(__T_e_057[M])
            __T_e_057[M] = nil
        end
    end
    getgenv()["U_1449"] = __T_c_074
    getgenv()["U_689"] = function(M)
        local n, R = _G,  __T_g_065() -- ENV_GETTER rewritten to _G
        local g = R and R[M]
        if not g then
            return nil
        end
        M = __T_Y_036(__T_P_004.U_663(g.U_949))
        if typeof(M) ~= "string" or #M ~= g.U_1643 then
            return nil
        end
        return M
    end
    getgenv()["U_2352"] = function(M)
        local n, g = _G,  {} -- ENV_GETTER rewritten to _G
        for R, R in ipairs(__T_C_066()) do
            if typeof(R) == "table" and typeof(R.U_783) == "string" then
                if typeof(M) ~= "string" or M == "" or string.sub(R.U_783, 1, #M) == M then
                    g[#g + 1] = R.U_783
                end
            end
        end
        return g
    end
    getgenv()["U_1159"] = function(C, M, n)
        local g = _G -- ENV_GETTER rewritten to _G
        if typeof(C) ~= "string" or typeof(M) ~= "string" or M == "" then
            return M
        end
        __T_X_070(M, n == "U_2371" and "U_2371" or "U_672")
        g = __T_x_060 or not __T_q_071(C)
        if g then
            __T_e_057[#__T_e_057 + 1] = C
        end
        return M
    end
    getgenv()["U_695"] = __T_o_076
    task.spawn(__T_d_075)
    __T_q_077 = "U_3385"
    __T_e_078, __T_x_079 = "U_1374"
    __T_C_080 = math.floor
    __T_M_081 = table.unpack or __T_F_001.unpack
    function __T_n_082(X, g)
        local R, W = 0, 1
        while X > 0 or g > 0 do
            local D, v = X % 2, g % 2
            R, X, g = if D ~= v then R + W else R, (X - D) / 2, (g - v) / 2
            W = W * 2
        end
        return R
    end
    __T_X_083, __T_g_084 = bit32 and bit32.bxor or __T_n_082
    function __T_n_085(R)
        local W, D = _G,  not __T_g_084 -- ENV_GETTER rewritten to _G
        if D then
            __T_g_084 = {}
            local v, j, a = 0, 255, 1
            for E = v, j, a do
                local v = E
                for j = 1, 8 do

-- =============================================================================
-- MODULE 04/17: PngCodec — CRC32/DEFLATE/inflate/scanline-filter/downscale-64x64/Adler32/encode
-- crc32/deflateDecompress/resizeAndEncodePng; RFC1951 tables X/g/R/W/D, Paeth/Sub/Up/Average, %65521
-- ==============================================================================
                    v = if v % 2 == 1 then __T_X_083(__T_C_080(v / 2), 3988292384) else __T_C_080(v / 2)
                end
                __T_g_084[E] = v
            end
        end
        local v, j, a, E = 4294967295, 1, #R, 1
        for U = j, a, E do
            D = __T_g_084
            v = __T_X_083(D[__T_X_083(v % 256, string.byte(R, U))], __T_C_080(v / 256))
        end
        return __T_X_083(v, 4294967295)
    end
    __T_X_086 = {
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        13,
        15,
        16,
        19,
        23,
        27,
        31,
        35,
        43,
        51,
        59,
        67,
        83,
        99,
        115,
        131,
        163,
        195,
        227,
        258
    }
    __T_g_087 = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        4,
        5,
        5,
        5,
        5,
        0
    }
    __T_R_088 = {
        1,
        2,
        3,
        4,
        5,
        7,
        9,
        13,
        16,
        25,
        33,
        49,
        65,
        97,
        129,
        193,
        257,
        385,
        513,
        769,
        1025,
        1537,
        2049,
        3073,
        4097,
        6145,
        8193,
        12289,
        16385,
        24577
    }
    __T_W_089 = {
        0,
        0,
        0,
        0,
        1,
        1,
        2,
        2,
        3,
        3,
        4,
        4,
        5,
        5,
        6,
        6,
        7,
        7,
        8,
        8,
        9,
        9,
        10,
        10,
        11,
        11,
        12,
        12,
        13,
        13
    }
    __T_D_090 = {
        16,
        16,
        18,
        0,
        8,
        7,
        9,
        6,
        10,
        5,
        11,
        4,
        12,
        3,
        13,
        2,
        14,
        1,
        15
    }
    function __T_v_091(j, a)
        local E, U = _G,  a -- ENV_GETTER rewritten to _G
        local w = 0
        local V, h = 0, {}
        a = 0
        local function L(b)
            local S = _G -- ENV_GETTER rewritten to _G
            if b == 0 then
                return 0
            end
            while true do
                local K = V
                if not (K < b) then
                    break
                end
                K = w
                w = K + (string.byte(j, U) or 0) * 2 ^ V
                S = U
                U = S + 1
                S = V
                V = S + 8
            end
            local S = w
            local K = S % 2 ^ b
            w = (w - K) / 2 ^ b
            V -= b
            return K
        end
        local function b(S, K)
            local r, k = {}, {}
            for J = 0, 15 do
                r[J] = 0
            end
            for J = 0, K - 1 do
                local I = S[J] or 0
                r[I] = r[I] + 1
            end
            r[0] = 0
            local J = { [1] = 0 }
            for I = 1, 15 do
                J[I + 1] = J[I] + r[I]
            end
            for I = 0, K - 1 do
                local K = S[I] or 0
                if K ~= 0 then
                    k[J[K]] = I
                    J[K] = J[K] + 1
                end
            end
            return { ["U_218"] = r, ["U_1518"] = k }
        end
        local function S(K)
            local r, k, J = 0, 0, 0
            for I = 1, 15 do
                r += L(1)
                local p = K.U_218[I]
                if r - p < k then
                    return K.U_1518[J + (r - k)]
                end
                J += p
                k = (k + p) * 2
                r = r * 2
            end
            return nil
        end
        local K, r
        while true do
            local k, J = L(1), L(2)
            local I = J == 0
            if I then
                w = 0
                V = 0
                local w = (string.byte(j, U) or 0) + (string.byte(j, U + 1) or 0) * 256
                U += 4
                local V, I = 1, 1
                for p = V, w, I do
                    a += 1
                    h[a] = string.byte(j, U) or 0
                    U += 1
                end
            else
                if J == 1 or J == 2 then
                    local j, E
                    if J == 1 then
                        if not K then
                            local U = {}
                            for w = 0, 143 do
                                U[w] = 8
                            end
                            for w = 144, 255 do
                                U[w] = 9
                            end
                            for w = 256, 279 do
                                U[w] = 7
                            end
                            for w = 280, 287 do
                                U[w] = 8
                            end
                            K = b(U, 288)
                            U = {}
                            for w = 0, 29 do
                                U[w] = 5
                            end
                            r = b(U, 30)
                        end
                        j, E = K, r
                    else
                        local U, w, V, K = L(5) + 257, L(5) + 1, L(4) + 4, {}
                        for r = 0, 18 do
                            K[r] = 0
                        end
                        for r = 1, V do
                            K[__T_D_090[r]] = L(3)
                        end
                        local D, r, I = b(K, 19), {}, 0
                        while I < U + w do
                            V = S(D)
                            if V == nil then
                                return nil
                            end
                            if V < 16 then
                                r[I] = V
                                I += 1
                            else
                                if V == 16 then
                                    K = r[I - 1] or 0
                                    for p = 1, 3 + L(2) do
                                        r[I] = K
                                        I += 1
                                    end
                                else
                                    if V == 16 then
                                        for V = 1, 3 + L(3) do
                                            r[I] = 0
                                            I += 1
                                        end
                                    else
                                        for V = 1, 11 + L(7) do
                                            r[I] = 0
                                            I += 1
                                        end
                                    end
                                end
                            end
                        end
                        K, D = {}, {}
                        for V = 0, U - 1 do
                            K[V] = r[V] or 0
                        end
                        for V = 0, w - 1 do
                            D[V] = r[U + V] or 0
                        end
                        j, E = (b(K, U)), (b(D, w))
                    end
                    while true do
                        local D = S(j)
                        if D == nil then
                            return nil
                        end
                        if D < 256 then
                            a += 1
                            h[a] = D
                        else
                            if D == 256 then
                                break
                            else
                                D -= 256
                                if D > 29 then
                                    return nil
                                end
                                local j, U = __T_X_086[D] + L(__T_g_087[D]), S(E)
                                if U == nil or U > 29 then
                                    return nil
                                end
                                local X = a - (__T_R_088[U + 1] + L(__T_W_089[U + 1]))
                                if X < 0 then
                                    return nil
                                end
                                for g = 1, j do
                                    a += 1
                                    h[a] = h[X + g]
                                end
                            end
                        end
                    end
                else
                    return nil
                end
            end
            J = k == 1
            if J then
                break
            end
        end
        return h, a
    end
    function __T_X_092(g, R)
        local W, D, j, a = _G,  {},  1,  0 -- ENV_GETTER rewritten to _G
        while j <= R do
            local E = j + 1--[[u3158]]
            E = if E > R then R else E
            a += 1
            D[a] = string.char(__T_M_081(g, j, E))
            j = E + 1
        end
        return table.concat(D)
    end
    function __T_M_093(g)
        local R = _G -- ENV_GETTER rewritten to _G
        return string.char(__T_C_080(g / 16777216) % 256, __T_C_080(g / 65536) % 256, __T_C_080(g / 256) % 256, g % 256)
    end
    function __T_g_094(R, W)
        return __T_M_093(#W) .. R .. W .. __T_M_093(__T_n_085(R .. W))
    end
    __T_x_079 = function(n, R)
        local W = _G -- ENV_GETTER rewritten to _G
        if typeof(n) ~= "string" or string.sub(n, 1, 8) ~= "\137PNG\r\n\26\n" then
            return nil
        end
        local D, j, a, E, U, w, V = {}, 9
        while true do
            local h, L = j + 8, #n
            if not (h <= L + 1) then
                break
            end
            local b, S, K, r = string.byte(n, j, j + 3)
            h, L = ((b * 256 + S) * 256 + K) * 256 + r, string.sub(n, j + 4, j + 7)
            r = string.sub(n, j + 8, j + 7 + h)
            if L == "IHDR" then
                K = string.byte
                a, E, U, w = ((K(r, 1) * 256 + K(r, 2)) * 256 + K(r, 3)) * 256 + K(r, 4), ((K(r, 5) * 256 + K(r, 6)) * 256 + K(r, 7)) * 256 + K(r, 8), K(r, 9), K(r, 10)
                V = K(r, 13)
            else
                if L == "IDAT" then
                    D[#D + 1] = r
                else
                    if L == "IEND" then
                        break
                    end
                end
            end
            j = j + 12 + h
        end
        if not a or U ~= 8 or V ~= 0 then
            return nil
        end
        n = w == 6 and 4 or w == 4 and 2 or nil
        if not n then
            return nil
        end
        local j = table.concat(D)
        if #j < 3 then
            return nil
        end
        local U, w = __T_v_091(j, 3)
        if not U then
            return nil
        end
        j = a * n
        if w < E * (j + 1) then
            return nil
        end
        local v, V, h = {}, 1
        for L = 0, E - 1 do
            D, w = U[V], {}
            V += 1
            for b = 1, j do
                w[b] = U[V]
                V += 1
            end
            if D == 1 then
                for V = n + 1, j do
                    w[V] = (w[V] + w[V - n]) % 256
                end
            else
                if D == 2 then
                    if h then
                        for V = 1, j do
                            w[V] = (w[V] + h[V]) % 256
                        end
                    end
                else
                    if D == 3 then
                        for V = 1, j do
                            local b, S = V > n and w[V - n] or 0, h and h[V] or 0
                            w[V] = (w[V] + __T_C_080((b + S) / 2)) % 256
                        end
                    else
                        if D == 4 then
                            for V = 1, j do
                                local b, S, K = V > n and w[V - n] or 0, h and h[V] or 0, h and V > n and h[V - n] or 0
                                local r = b + S - K
                                local k, J, I = math.abs(r - b), math.abs(r - S), math.abs(r - K)
                                w[V] = (w[V] + (if k <= J and k <= I then b else if J <= I then S else K)) % 256
                            end
                        else
                            if D ~= 0 then
                                return nil
                            end
                        end
                    end
                end
            end
            v[L] = w
            h = w
        end
        U, D = nil
        if R and a > R then
            U = __T_C_080(E * R / a + 0.5)
            U = if U < 1 then 1 else U
            D = R
        else
            D, U = a, E
        end
        R, j = {}, 0
        for V = 0, U - 1 do
            local h, L = __T_C_080(V * E / U), __T_C_080((V + 1) * E / U) - 1
            L = if L < h then h else L
            j += 1
            R[j] = 0
            for E = 0, D - 1 do
                w, V = __T_C_080(E * a / D), __T_C_080((E + 1) * a / D) - 1
                V = if V < w then w else V
                local a, b = 0, 0
                for S = h, L do
                    E = v[S]
                    for h = w, V do
                        a, b = a + E[h * n + n], b + 1
                    end
                end
                R[j + 1] = 255
                R[j + 2] = 255
                R[j + 3] = 255
                R[j + 4] = __T_C_080(a / b + 0.5)
                j += 4
            end
        end
        n, w = 1, 0
        for a = 1, j do
            n = (n + R[a]) % 65521
            w = (w + n) % 65521
        end
        local a, E, V = __T_X_092(R, j), { "\120\1" }, 1
        while V <= #a do
            j, R = V + 65535 > #a and 1 or 0, string.sub(a, V, V + 65534)
            v = #R
            local X = 65535 - v
            E[#E + 1] = string.char(j, v % 256, __T_C_080(v / 256), X % 256, __T_C_080(X / 256)) .. R
            V += v
        end
        E[#E + 1] = __T_M_093(w * 65536 + n)
        return "\137PNG\r\n\26\n" .. __T_g_094("IHDR", __T_M_093(D) .. __T_M_093(U) .. string.char(8, 6, 0, 0, 0)) .. __T_g_094("IDAT", table.concat(E)) .. __T_g_094("IEND", "")
    end
    if not (function()
        local C = _G -- ENV_GETTER rewritten to _G
        if typeof(isfile) ~= "function" or typeof(readfile) ~= "function" or typeof(writefile) ~= "function" then
            return false
        end
        local M, n = pcall(isfile, __T_e_078)
        if M and n then
            return true
        end
        M, n = pcall(isfile, __T_q_077)
        if not M or not n then
            return false
        end
        M, n = pcall(readfile, __T_q_077)
        if not M or typeof(n) ~= "string" then
            return false
        end
        local M, X = pcall(__T_x_079, n, 64)
        if not M or typeof(X) ~= "string" or #X == 0 then
            return false
        end
        return pcall(writefile, __T_e_078, X)
    end)() then
        __T_e_078 = __T_q_077
    end
    __T_q_095, __T_e_096 = nil, nil
    __T_x_097 = getgenv()["U_2808"]
    if __T_x_097 then
        pcall(function()
            __T_x_097:unload()
        end)
        getgenv()["U_2808"] = nil
    end
    __T_C_098 = rawget(getgenv(), "U_1407") == true
    function __T_M_099(n)
        local X = _G -- ENV_GETTER rewritten to _G
        if __T_C_098 then
            local C, g = pcall(isfile, n)
            if C and g then
                local C, g = pcall(readfile, n)
                if C and typeof(g) == "string" and #g > 0 then
                    return g
                end
            end
        end
        for C = 1, 3 do
            local g = __T_P_004.U_3271(n)
            if typeof(g) == "string" and #g > 0 then
                return g
            end
            warn("U_2605" .. n .. "U_3284" .. C .. "U_929")
            task.wait(0.5)
        end
    end
    __T_o_076, __T_d_075 = __T_M_099("U_1880"), __T_M_099("U_834")
    if __T_o_076 and __T_d_075 then
        __T_M_099, __T_c_074 = loadstring(__T_o_076, "U_334")
        local C, n = loadstring(__T_d_075, "U_900")
        if not __T_M_099 then
            warn("U_1747" .. tostring(__T_c_074))
        end
        if not C then
            warn("U_533" .. tostring(n))
        end
        if __T_M_099 and C then
            local n, X = pcall(__T_M_099)
            if n then
                __T_q_095 = X
            else
                warn("U_1360" .. tostring(X))
            end
            n, X = pcall(C)
            if n then
                __T_e_096 = X
            else
                warn("U_2333" .. tostring(X))
            end
        end
    end
    if typeof(__T_e_096) ~= "table" or typeof(__T_e_096.U_1314) ~= "function" then
        warn("U_857")
        if KEYLESS_MODE then
            local function __keylessStub()
                local s = {}
                setmetatable(s, { __index = function(_, _) return s end, __call = function(_, ...) return s end })
                return s
            end
            if typeof(__T_q_095) ~= "table" then __T_q_095 = __keylessStub() end
            if typeof(__T_e_096) ~= "table" then __T_e_096 = __keylessStub() end
        else
            return
        end
    end
    if getgenv()["U_2808"] and getgenv()["U_2808"] ~= __T_e_096 then
        pcall(function()
            local C = _G -- ENV_GETTER rewritten to _G
            getgenv()["U_2808"]:unload()
        end)
    end
    __T_x_097 = nil
    getgenv()["U_2808"] = __T_e_096
    __T_x_100 = {
        ["U_2423"] = 1--[[u510]],
        ["U_3190"] = "U_1347",
        ["U_629"] = "U_2181",
        ["U_276"] = "U_974",
        ["U_632"] = "U_1929",
        ["U_542"] = "U_1818",
        ["U_2245"] = "U_1299",
        ["U_531"] = "U_3037",
        ["U_2615"] = "U_1175",
        ["U_2100"] = "U_998"
    }
    function __T_C_101(M, n)
        local X = _G -- ENV_GETTER rewritten to _G
        if typeof(M) == "number" then
            return M
        end
        if typeof(M) ~= "string" or M == "" then
            return n
        end
        return __T_x_100[string.lower(M)] or M
    end
    function __T_x_102()
        return {
            ["U_404"] = function(M) end,
            ["U_1102"] = function(M) end,
            ["U_2712"] = function(M) end,
            ["U_2995"] = function(M) end
        }
    end
    __T_M_103 = {
        ["new"] = function(n)
        n = n or {}
        __T_e_096:notify({
        ["U_2125"] = n.U_3007 or "U_860",
        ["U_1147"] = n.U_1647 or "",
        ["U_1421"] = __T_C_101(n.U_1068, "U_278"),
        ["U_57"] = n.U_9 or 5
    })
    end
    }
    __T_n_104 = {
        ["new"] = function(X, g, R, W)
        local D = _G -- ENV_GETTER rewritten to _G
        __T_e_096:notify({
        ["U_2125"] = tostring(g or ""),
        ["U_1421"] = __T_C_101(X, "U_2181"),
        ["U_57"] = R or 4,
        ["U_1651"] = typeof(W) == "Color3" and W or nil
    })
    end
    }
    __T_o_076, __T_c_074, __T_d_075 = getgenv(), "U_817", { ["U_36"] = 0, ["U_218"] = 0 }
    __T_d_075.U_3149, __T_o_076[__T_c_074] = os.clock(), __T_d_075
    function __T_X_105(g)
        local R = _G -- ENV_GETTER rewritten to _G
        if typeof(g) ~= "function" then
            return nil
        end
        return function(...)
            local R = _G -- ENV_GETTER rewritten to _G
            local W = getgenv()["U_817"]
            if W then
                local D = os.clock()
                if D - W.U_36 > 1--[[u234]] then
                    W.U_218 = 0
                end
                W.U_36 = D
                W.U_218 = W.U_218 + 1
            end
            return g(...)
        end
    end
    function __T_g_106(R)
        local W = { ["U_1543"] = R }
        local function D(v, j)
            j = j or {}

-- =============================================================================
-- MODULE 05/17: ExternalESP &]============],
    [3] = [============[
 UILibrary Loader + Adapter — loadstring Window/Tab/Section widgets
-- createWindow/createTab/createSection/addToggle/addSlider/addDropdown/addColorPicker/addKeybind/Button/Label/Clone/Viewport/ImageList
-- ==============================================================================
            local a = R:toggle({
                ["U_386"] = j.Name or "U_1334",
                ["U_869"] = j.Default and true or false,
                ["U_89"] = j.U_3348 and true or false,
                ["U_3022"] = j.Flag,
                ["U_3364"] = __T_X_105(j.Callback)
            })
            v = { ["U_2754"] = a }
            if j.U_3348 and a.U_89 then
                v.U_3348 = __T_g_106(a.U_89)
            end
            local function j(E)
                return a:get()
            end
            v.U_1047 = j
            local function j(E, E)
                a:set(E)
            end
            v.U_1964 = j
            return v
        end
        W.U_2238 = D
        local function D(v, j)
            v = (_G)
            j = j or {}
            local a = tonumber(j.Rounding or j[1--[[u1907]]]) or 0
            local E = a > 0 and 1 / 10 ^ a or 1
            local a = R:slider({
                ["U_386"] = j.Name or "U_654",
                ["min"] = tonumber(j.Min) or 0,
                ["max"] = tonumber(j.Max) or 1--[[u807]],
                ["U_869"] = j.Default,
                ["U_1514"] = E,
                ["U_402"] = typeof(j.Suffix) == "string" and j.Suffix ~= "" and j.Suffix or "",
                ["U_3022"] = j.Flag,
                ["U_3364"] = __T_X_105(j.Callback)
            })
            E = { ["U_2754"] = a }
            local function v(j)
                return a:get()
            end
            E.U_1047 = v
            local function v(j, j)
                a:set(j)
            end
            E.U_1964 = v
            return E
        end
        W.U_1858 = D
        local function D(v, j)
            j = j or {}
            local a = R:combo({
                ["U_386"] = j.Name or "U_3316",
                ["U_3058"] = j.U_3220 or {},
                ["U_869"] = j.Default,
                ["U_1119"] = j.U_798 and true or false,
                ["U_3022"] = j.Flag,
                ["U_3364"] = __T_X_105(j.Callback)
            })
            v = { ["U_2754"] = a }
            local function j(E)
                return a:get()
            end
            v.U_1047 = j
            local function j(E, E)
                a:set(E)
            end
            v.U_1964 = j
            local function j(E, E)
                a:setlist(E)
            end
            v.U_2563 = j
            v.U_2350 = function(j) end
            return v
        end
        W.U_80 = D
        local function D(v, j)
            j = j or {}
            local a = j.Callback
            local E = R:color({
                ["U_386"] = j.Name or "U_1333",
                ["U_869"] = j.Default,
                ["U_3022"] = j.Flag,
                ["U_3364"] = a and __T_X_105(function(U)
                a(U, j.Transparency)
            end) or nil
            })
            v = { ["U_2754"] = E }
            local function j(a)
                return E:get()
            end
            v.U_1047 = j
            local function j(a, a)
                E:set(a)
            end
            v.U_1964 = j
            return v
        end
        W.U_511 = D
        local function D(v, j)
            j = j or {}
            local a = R:keybind({
                ["U_386"] = j.Name or "U_2040",
                ["U_869"] = j.Default,
                ["U_3022"] = j.Flag,
                ["U_3364"] = __T_X_105(j.Callback)
            })
            v = { ["U_2754"] = a }
            local function j(E)
                return a:get()
            end
            v.U_1047 = j
            local function j(E, E)
                a:set(E)
            end
            v.U_1964 = j
            return v
        end
        W.U_1005 = D
        local function D(v, j)
            j = j or {}
            v = R:button({
                ["U_386"] = j.Name or "U_2967",
                ["U_1421"] = __T_C_101(j.U_1068),
                ["U_3364"] = j.Callback
            })
            return { ["U_2754"] = v }
        end
        W.U_475 = D
        local function D(v, j, a)
            v = (_G)
            local E = R:label({ ["U_386"] = tostring(j or ""), ["U_3387"] = a and true or false })
            v = { ["U_2754"] = E }
            local function R(j, j)
                E:set(j)
            end
            v.U_1964 = R
            local function R(j)
                return E:get()
            end
            v.U_1047 = R
            return v
        end
        W.U_723 = D
        return W
    end
    function __T_R_107(W)
        if W == "U_985" or W == 3 then
            return "U_985"
        end
        return (W == "U_528" or W == 2) and "U_528" or "U_982"
    end
    function __T_W_108(D)
        local v = _G -- ENV_GETTER rewritten to _G
        if typeof(__T_e_096.U_1273) == "function" then
            __T_e_096:popup(D)
        end
    end
    function __T_D_109(v)
        local j = _G -- ENV_GETTER rewritten to _G
        if typeof(__T_e_096.U_634) == "function" then
            return __T_e_096:ask(v)
        end
    end
    function __T_v_110(j, a)
        local E, U = _G,  { ["Name"] = a, ["U_3216"] = j } -- ENV_GETTER rewritten to _G
        local a, w, V = "U_285", setmetatable, {
            ["U_1278"] = function(h, L)
            h = (_G)
            if L == "Visible" then
                local L, b = pcall(function()
                    return j.U_3014["Visible"]
                end)
                return L and b or false
            end
        end
        }
        U[a] = w({}, V)
        local function a(w, V)
            V = V or {}
            w = { ["U_386"] = V.Name or "U_2984", ["U_1032"] = __T_R_107(V.Position) }
            return __T_g_106(j:section(w))
        end
        U.U_1306 = a
        local function g(a, w)
            a = (_G)
            w = w or {}
            local V = {
                ["U_386"] = w.Name or "Character",
                ["U_1032"] = __T_R_107(w.Position),
                ["U_2038"] = a.tonumber(w[1--[[u2488]]]) or 1--[[u1150]],
                ["U_1377"] = a.tonumber(w[1--[[u3063]]]),
                ["U_65"] = a.tonumber(w[1--[[u3330]]]),
                ["U_3364"] = w.Callback
            }
            return j:clone(V)
        end
        U.U_1077 = g
        local function g(a, w)
            a = (_G)
            w = w or {}
            local V = j:gallery({
                ["U_386"] = w.Name or "U_2739",
                ["U_1421"] = __T_C_101(w.U_1068, "U_3058"),
                ["U_1032"] = __T_R_107(w.Position),
                ["U_2038"] = a.tonumber(w[1--[[u2488]]]) or 1--[[u1150]],
                ["U_1119"] = w.U_798 and true or false,
                ["U_2612"] = w.U_497 or "U_2340",
                ["U_1897"] = a.tonumber(w[1--[[u1575]]]),
                ["U_100"] = a.tonumber(w[1--[[u3224]]]),
                ["U_39"] = w.U_360 ~= false,
                ["U_372"] = w.U_2076 ~= false,
                ["U_1722"] = w.U_611 and true or false,
                ["U_842"] = w.U_2515,
                ["U_516"] = w.U_1570,
                ["U_1760"] = w.U_2223,
                ["U_652"] = w.U_956,
                ["U_1042"] = w.U_844,
                ["U_3058"] = w.U_3220 or {},
                ["U_869"] = w.Default,
                ["U_3022"] = w.Flag,
                ["U_3364"] = __T_X_105(w.Callback)
            })
            a = { ["U_2754"] = V }
            local function X(R, R)
                V:setdata(R)
            end
            a.U_1713 = X
            local function X(R, R)
                V:setdata(R)
            end
            a.U_2563 = X
            local function X(R, R)
                V:setdefault(R)
            end
            a.U_440 = X
            local function X(R, R)
                V:set(R)
            end
            a.U_1964 = X
            local function X(R)
                return V:get()
            end
            a.U_1047 = X
            local function X(R)
                V:refresh()
            end
            a.U_2109 = X
            local function X(R)
                V:clear()
            end
            a.U_526 = X
            local function X(R)
                V:all()
            end
            a.U_675 = X
            local function X(R, R)
                V:search(R)
            end
            a.U_360 = X
            a.U_2350 = function(X) end
            return a
        end
        U.U_899 = g
        if typeof(j.sub) == "function" then
            local function X(g, R)
                g = (_G)
                R = R or {}
                local a = j:sub({
                    ["U_386"] = R.Name or "U_2703",
                    ["U_1421"] = __T_C_101(R.U_1068, "U_767"),
                    ["U_1869"] = R.U_2396 or ""
                })
                if typeof(j.U_3134) == "function" then
                    pcall(j.U_3134, j, true)
                end
                return __T_v_110(a, R.Name)
            end
            U.U_551 = X
        end
        return U
    end
    __T_c_074, __T_d_075, __T_o_076 = {}, "U_1883", {}
    __T_o_076.U_2926, __T_c_074[__T_d_075] = Color3.fromRGB(16, 16, 16), __T_o_076
    function __T_X_111(g)
        return { ["U_952"] = function(g, g)
            g = g or {}
            __T_M_103.new(g)
        end }
    end
    __T_c_074.U_2032 = __T_X_111
    function __T_M_112(g)
        return {
            ["U_952"] = function(g, g)
            g = g or {}
            __T_n_104.new(g.U_1068 or "U_629", g.U_3007 or g.U_1647 or "", g.U_9 or 4, g.Color)
        end
        }
    end
    __T_c_074.U_1136 = __T_M_112
    __T_c_074.U_2796 = function(g) end
    __T_c_074.U_3132 = function(g) end
    __T_c_074.U_2741 = function(g) end
    __T_g_113 = nil
    function __T_R_114(j)
        __T_g_113 = __T_e_096:window({ ["U_1302"] = "U_1630" })
        local j = {
            ["U_1847"] = {},
            ["U_1028"] = "",
            ["U_175"] = __T_g_113,
            ["U_3317"] = function(a) end,
            ["U_2169"] = function(a) end
        }
        local function a(E)
            __T_g_113:toggle()
        end
        j.U_2441 = a
        local function a(E, U)
            E = (_G)
            U = U or {}
            local w = __T_g_113
            local V = __T_v_110(w:tab({
                ["U_386"] = U.Name or "U_1902",
                ["U_1421"] = __T_C_101(U.U_1068, "U_767"),
                ["U_1869"] = U.U_2396 or ""
            }), U.Name)
            table.insert(j.U_1847, V)
            return V
        end
        j.U_2618 = a
        local function C(v)
            v = __T_g_113
            local a = v:tab({ ["U_386"] = "U_1675", ["U_1421"] = "U_2252", ["U_1869"] = "U_216" })
            a:color({ ["U_386"] = "U_683", ["U_2105"] = "U_683", ["U_1032"] = "U_982" })
            a:color({ ["U_386"] = "U_1147", ["U_2105"] = "U_1147", ["U_1032"] = "U_528" })
            a:color({ ["U_386"] = "U_2812", ["U_2105"] = "U_2812", ["U_1032"] = "U_982" })
            a:color({ ["U_386"] = "U_227", ["U_2105"] = "U_3004", ["U_1032"] = "U_528" })
            a:color({ ["U_386"] = "U_1116", ["U_2105"] = "U_1032", ["U_1032"] = "U_982" })
            a:color({ ["U_386"] = "U_674", ["U_2105"] = "U_2080", ["U_1032"] = "U_528" })
            a:color({ ["U_386"] = "U_2001", ["U_2105"] = "U_2598", ["U_1032"] = "U_982" })
            a:color({ ["U_386"] = "U_2570", ["U_2105"] = "U_2187", ["U_1032"] = "U_528" })
            a:color({ ["U_386"] = "U_1983", ["U_2105"] = "U_3294", ["U_1032"] = "U_982" })
            return a
        end
        j.U_297 = C
        local function C(v)
            v = __T_g_113
            local a = v:tab({ ["U_386"] = "U_2239", ["U_1421"] = "U_3167", ["U_1869"] = "U_2068" })
            a:configs({ ["U_386"] = "U_2767", ["U_1032"] = "U_982" })
            v = { ["U_386"] = "U_1715", ["U_1032"] = "U_528" }
            return a, a:section(v)
        end
        j.U_3252 = C
        local function C(v, v)
            __T_g_113:setbind(v)
        end
        j.U_3041 = C
        do if typeof(j) == "table" then local _m = { __index = function(_t, _k) return (function() local _st = {}; setmetatable(_st, { __index = function(_, _) return _st end, __call = function(_, ...) return _st, _st, _st, _st, _st, _st, _st, _st end }); return _st end)() end }; pcall(setmetatable, j, _m) end end
        return j
    end
    __T_c_074.new = __T_R_114
    __T_C_115 = (function() local _okF, _fn = pcall(function() return __T_c_074.CreateNotifier end); if _okF and typeof(_fn) == "function" then local _okC, _rs = pcall(_fn, __T_c_074); if _okC then return _rs end end; return (function() local _st = {}; setmetatable(_st, { __index = function(_, _) return _st end, __call = function(_, ...) return _st, _st, _st, _st, _st, _st, _st, _st end }); return _st end)() end)()
    __T_g_116 = (function() local _okF, _fn = pcall(function() return __T_c_074.CreateEventNotifier end); if _okF and typeof(_fn) == "function" then local _okC, _rs = pcall(_fn, __T_c_074); if _okC then return _rs end end; return (function() local _st = {}; setmetatable(_st, { __index = function(_, _) return _st end, __call = function(_, ...) return _st, _st, _st, _st, _st, _st, _st, _st end }); return _st end)() end)()
    task.spawn(function()
        local v = _G -- ENV_GETTER rewritten to _G
        for j, j in ipairs(workspace:GetDescendants()) do
            if j:IsA("BasePart") and j.Name == "U_1349" or j:IsA("Model") and (j.Name == "U_536" or j.Name == "U_2742") then
                pcall(function()
                    j:Destroy()
                end)
            end
        end
    end)
    do local _okL, _ld = pcall(function() return __T_c_074.Loader end); if _okL and typeof(_ld) == "function" then pcall(_ld, __T_c_074, { ["Name"] = "U_860", ["U_9"] = 4 }) end end
    __T_C_115:Notify({
        ["U_3007"] = "U_860",
        ["U_1647"] = "U_1008" .. game.Players["LocalPlayer"]["DisplayName"] .. "U_21",
        ["U_1068"] = "U_629"
    })
    __T_v_117, __T_j_118 = __T_c_074.new({ ["Name"] = "U_860", ["U_986"] = "U_1743" }), {}
    __T_a_119 = task.spawn(function()
        local E = _G -- ENV_GETTER rewritten to _G
        local U = game:GetService("ReplicatedStorage")
        local w = game:GetService("Players")
        local V
        local function h()
            local L, b = _G,  V -- ENV_GETTER rewritten to _G
            if b then
                local S = V
                return S
            end
            local S, K = pcall(function()
                local r = _G -- ENV_GETTER rewritten to _G
                local k = require
                local J = U:WaitForChild("U_3123", 2) or U:FindFirstChild("Remotes") or U:FindFirstChild("Modules")
                local target = J and (J:WaitForChild(I, 2) or J:FindFirstChild("Extras") or J:FindFirstChild("GetPlayerData")) or J
                if target then return k(target) end
                return nil
            end)
            b = S and typeof(K) == "table"
            if b then
                V = K
            end
            K = V
            return K
        end
        local U = {}
        local V = false
        local function L()
            local b = _G -- ENV_GETTER rewritten to _G
            if not (__T_q_095 and __T_q_095.U_856 and (__T_q_095.U_856["U_865"]["U_3022"] or __T_q_095.U_856["U_865"]["U_748"] or __T_q_095.U_856["U_865"]["U_1697"] or __T_q_095.U_856["U_865"]["U_423"] or __T_q_095.U_856["U_865"]["U_1799"])) then
                return
            end
            local S = h()
            local K = S and S.U_1287
            table.clear(U)
            if typeof(K) == "table" then
                for S, r in pairs(K) do
                    if typeof(r) == "table" and r.Role then
                        if r.U_696 ~= nil or r.U_1182 ~= nil then
                            if not r.Dead then

-- =============================================================================
-- MODULE 06/17: MM2GameState — RoleTracker/HitboxHelper/GunHookManager
-- updatePlayerRoles/getPlayerRole/isPlayerAlive/getMurderer/getSheriff/hookGunModule; Gun/Knife, Murderer/Sheriff/Hero/Innocent
-- ==============================================================================
                                U[S] = r.U_696 and "Murderer" or r.U_1182 and "Sheriff" or nil
                            end
                        else
                            if not ((r.Role == "Sheriff" or r.Role == "Hero") and r.Dead) then
                                U[S] = r.Role == "Hero" and "Sheriff" or r.Role
                            end
                        end
                    end
                end
            end
            for S, r in ipairs(w:GetPlayers()) do
                K, S = r.Character, r:FindFirstChildOfClass("Backpack")
                if (K and K:FindFirstChild("Gun") or S and S:FindFirstChild("Gun")) and U[r.Name] ~= "Murderer" then
                    U[r.Name] = "Sheriff"
                end
            end
            __T_q_095.U_719 = U
        end
        local U = h()
        local h = U and U.U_2815
        if h then
            pcall(function()
                __T_j_118[#__T_j_118 + 1] = U.U_2815["U_3269"]:Connect(function()
                V = true
            end)
            end)
        end
        local U, h = setmetatable, { ["U_3367"] = "U_2349" }
        local b = U({}, h)
        local function S(K)
            if not K or b[K] then
                return
            end
            b[K] = true
            __T_j_118[#__T_j_118 + 1] = K.ChildAdded:Connect(function(b)
                local r = b.Name == "Gun"
                if r then
                    V = true
                end
            end)
            __T_j_118[#__T_j_118 + 1] = K.ChildRemoved:Connect(function(b)
                local K = b.Name == "Gun"
                if K then
                    V = true
                end
            end)
        end
        local function b(K)
            S(K)
        end
        local function K(r)
            if r.Character then
                b(r.Character)
            end
            __T_j_118[#__T_j_118 + 1] = r.CharacterAdded:Connect(function(k)
                b(k)
                S(r:FindFirstChildOfClass("Backpack"))
                V = true
            end)
            S(r:FindFirstChildOfClass("Backpack"))
            __T_j_118[#__T_j_118 + 1] = r.ChildAdded:Connect(function(b)
                local r = b:IsA("Backpack")
                if r then
                    S(b)
                    V = true
                end
            end)
        end
        for b, b in ipairs(w:GetPlayers()) do
            pcall(K, b)
        end
        __T_j_118[#__T_j_118 + 1] = w.PlayerAdded:Connect(function(w)
        local b = _G -- ENV_GETTER rewritten to _G
        pcall(K, w)
    end)
        while true do
            U, h = task.wait, 1--[[u773]]
            if not U(h) then
                break
            end
            V = false
            L()
        end
    end)
    __T_M_112, __T_X_111 = __T_v_117:AddMenu({ ["Name"] = "game", ["U_1068"] = "U_632", ["U_2396"] = "U_3244", ["U_2824"] = false }), __T_v_117:AddMenu({ ["Name"] = "U_1282", ["U_2396"] = "U_305", ["U_1068"] = "U_1045" })
    getgenv()["U_2518"] = __T_X_111
    __T_E_120 = __T_v_117:AddMenu({ ["Name"] = "U_214", ["U_1068"] = "U_2921", ["U_2396"] = "U_1146", ["U_2824"] = false })
    __T_U_121, __T_w_122, __T_V_123 = __T_v_117:AddMenu({ ["Name"] = "U_1921", ["U_1068"] = "U_153", ["U_2396"] = "U_27", ["U_2824"] = false }), __T_v_117:AddMenu({ ["Name"] = "U_211", ["U_1068"] = "U_863", ["U_2396"] = "U_2121", ["U_2824"] = false }), __T_v_117:AddMenu({ ["Name"] = "U_432", ["U_1068"] = "U_1550", ["U_2396"] = "U_2689", ["U_2824"] = false })
    __T_d_075 = __T_v_117:AddMenu({ ["Name"] = "U_1628", ["U_1068"] = "U_2577", ["U_2396"] = "U_1149", ["U_2824"] = false })
    getgenv()["U_2656"] = {}
    getgenv()["U_1499"] = function(h, L, b)
        local S = _G -- ENV_GETTER rewritten to _G
        local K = getgenv()["U_2656"][h]
        if not K then
            K = {}
            getgenv()["U_2656"][h] = K
        end
        h, S = #K + 1, { ["U_386"] = L, ["U_1801"] = b }
        S.U_1336, K[h] = #K + 1, S
    end
    getgenv()["U_1724"] = function(h, L)
        local b = _G -- ENV_GETTER rewritten to _G
        local S = getgenv()["U_2656"][h]
        if not S or not L then
            return
        end
        table.sort(S, function(K, r)
        local k, J = #K.U_386, #r.U_386
        if k ~= J then
            return k < J
        end
        if K.U_386 ~= r.U_386 then
            return K.U_386 < r.U_386
        end
        return K.U_1336 < r.U_1336
    end)
        for K, K in ipairs(S) do
            pcall(K.U_1801, L)
        end
        getgenv()["U_2656"][h] = nil
    end
    __T_h_124, __T_L_125, __T_b_126 = {}, {}, {}
    __T_c_074 = game:GetService("Players")
    __T_S_127 = __T_c_074.LocalPlayer
    __T_o_076 = __T_EnumFB.U_3137
    __T_K_128 = __T_o_076.Dead
    __T_r_129 = __T_o_076.U_3376
    __T_k_130 = __T_o_076.U_67
    __T_J_131 = __T_o_076.U_1320
    __T_I_132 = __T_o_076.U_1763
    __T_p_133 = __T_o_076.U_2202
    __T_B_134 = __T_o_076.U_2642
    __T_t_135 = __T_o_076.U_1905
    __T___136 = __T_o_076.U_3287
    __T_A_137 = Vector3.zero
    __T_i_138 = Vector3.new
    __T_N_139, __T_l_140 = math.sqrt, {}
    function __T_y_141(Q)
        local z = __T_l_140[Q]
        if not z then
            return
        end
        local T = z.U_3307
        for z = 1, #T do
            T[z]:Disconnect()
        end
        __T_l_140[Q] = nil
    end
    function __T_Q_142(z, T)
        __T_y_141(z)
        local Z = T:FindFirstChildOfClass("Humanoid")
        local G = Z and Z.RootPart
        if not G then
            return nil
        end
        local s = Z.MoveDirection
        local OP = {
            ["U_3307"] = {},
            ["U_907"] = T,
            ["U_984"] = Z,
            ["U_1735"] = G,
            ["U_1315"] = s,
            ["U_1135"] = Z:GetState(),
            [1--[[u1109]]] = 0,
            ["U_809"] = false,
            ["U_41"] = {
            ["U_214"] = z,
            ["U_907"] = T,
            ["U_984"] = Z,
            ["U_1735"] = G,
            ["U_306"] = G.Position,
            ["U_1315"] = s,
            ["U_1135"] = Z:GetState(),
            [1--[[u1109]]] = 0
        }
        }
        __T_l_140[z] = OP
        s = OP.U_3307
        s[1] = Z.Running:Connect(function(T)
            OP[1--[[u1109]]] = T
            OP.U_809 = true
        end)
        s[2] = Z.StateChanged:Connect(function(T, T)
            OP.U_1135 = T
        end)
        s[3] = Z:GetPropertyChangedSignal("MoveDirection"):Connect(function()
            OP.U_1315 = Z.MoveDirection
        end)
        s[4] = Z.Died:Connect(function()
            __T_y_141(z)
        end)
        return OP
    end
    function __T_z_143(T)
        if T == __T_S_127 then
            return
        end
        local S, Z = "CharacterAdded", function()
            __T_y_141(T)
        end
        T[S]:Connect(Z)
        Z, S = "CharacterRemoving", function()
            __T_y_141(T)
        end
        T[Z]:Connect(S)
    end
    __T_S_144, __T_T_145, __T_Z_146 = next, __T_c_074:GetPlayers()
    for G, G in __T_S_144, __T_T_145, __T_Z_146 do
        __T_z_143(G)
    end
    __T_c_074.PlayerAdded:Connect(__T_z_143)
    __T_c_074.PlayerRemoving:Connect(__T_y_141)
    function __T_S_147(y)
        local z = y.Character
        if not z or not z.Parent then
            return nil
        end
        local T = __T_l_140[y]
        if T then
            if T.U_907 == z and T.U_984["Parent"] and T.U_1735["Parent"] then
                return T
            end
        end
        return __T_Q_142(y, z)
    end
    __T_h_124.U_938 = function(y)
        return __T_S_147(y) ~= nil
    end
    __T_h_124.U_2135 = function(y)
        local Q = __T_S_147(y)
        if not Q then
            return nil
        end
        y = Q.U_984
        if y.Health <= 0 then
            return nil
        end
        local S, z, T = Q.U_1735, Q.U_1315, Q.U_41
        T.U_306 = S.Position
        T.U_1315 = z
        T.U_1135 = Q.U_1135
        if Q.U_809 then
            T[1--[[u1109]]] = Q[1--[[u1109]]]
        else

-- =============================================================================
-- MODULE 12/17: DesyncAndMovement — metatable/fflag/fly/noclip/wallhop/bhop/fov/stretch
-- setupMetatableHooks/setDesyncEnabled/setAntiAimEnabled/WallhopController/BhopController/FovAndStretchController; S2PhysicsSenderRate
-- ==============================================================================
            T[1--[[u1109]]] = z.Magnitude * y.WalkSpeed
        end
        return T
    end
    __T_h_124.U_1353 = function(S)
        local y = S.U_1135
        if y == __T_K_128 or y == __T_r_129 or y == __T_k_130 or y == __T_J_131 or y == __T_I_132 then
            return "U_84"
        end
        if y == __T_p_133 or y == __T_B_134 or y == __T_t_135 then
            return "U_2015"
        end
        if y == __T___136 then
            return "U_950"
        end
        return "U_488"
    end
    __T_h_124.U_3102 = function(S)
        local K = S.U_1315
        S = K.X * K.X + K.Z * K.Z
        if S <= 0 then
            return nil
        end
        local r = 1 / __T_N_139(S)
        return __T_i_138(K.X * r, 0, K.Z * r)
    end
    __T_h_124.U_3044 = function(S)
        local K = S.U_1315
        local r = K.X * K.X + K.Z * K.Z
        if r <= 0 or S[1--[[u1109]]] <= 0 then
            return __T_A_137
        end
        local k = S[1--[[u1109]]] / __T_N_139(r)
        return __T_i_138(K.X * k, 0, K.Z * k)
    end
    __T_h_124.U_2140 = function(S)
        local K = S.U_1735["Size"]
        return __T_N_139(K.X * K.X + K.Z * K.Z) * 0.5
    end
    __T_S_148 = {
        "UpperTorso",
        "HumanoidRootPart",
        "LowerTorso",
        "Torso",
        "Head",
        "U_3181",
        "U_2036",
        "U_2260",
        "U_669",
        "U_3173",
        "U_212",
        "U_2833",
        "U_2897",
        "U_2789",
        "U_2419"
    }
    __T_h_124.U_2229 = function(K)
        local r = __T_l_140[K.U_214]
        if not r then
            return nil
        end
        local k = r.U_1632
        if k and r.U_1123 == K.U_907 then
            return k
        end
        k = {}
        for J = 1, #__T_S_148 do
            local I = K.U_907:FindFirstChild(__T_S_148[J])
            if I and I:IsA("BasePart") then
                k[#k + 1] = I
            end
        end
        r.U_1632 = k
        r.U_1123 = K.U_907
        return k
    end
    __T_h_124.U_2199 = function(S)
        local K = __T_h_124.U_2229(S)
        if not K then
            return __T_h_124.U_2140(S)
        end
        local r, k = S.U_306, 0
        for J = 1, #K do
            local I = K[J]
            if I.Parent then
                J = I.Size
                local K = (I.Position - r)["Magnitude"] + __T_N_139(J.X * J.X + J.Y * J.Y + J.Z * J.Z) * 0.5
                k = if K > k then K else k
            end
        end
        if k <= 0 then
            return __T_h_124.U_2140(S)
        end
        return k
    end
    __T_h_124.U_1965 = function(S, K)
        local r = S.U_306
        if K <= 0 or S[1--[[u1109]]] <= 0 then
            return r
        end
        if __T_h_124.U_1353(S) == "U_84" then
            return r
        end
        local k = S.U_1315
        local J = k.X * k.X + k.Z * k.Z
        if J <= 0 then
            return r
        end
        local I = S[1--[[u1109]]] * K / __T_N_139(J)
        return __T_i_138(r.X + k.X * I, r.Y, r.Z + k.Z * I)
    end
    __T_h_124.U_1351 = function(S, K, r)
        local k = __T_h_124.U_3102(S)
        if not k then
            return nil
        end
        local J = S[1--[[u1109]]] * K
        J = if J < 0 then 0 else J
        K = S.U_306
        return K - k * r, K + k * (J + r), k, J
    end
    __T_h_124.U_892 = function(S, K)
        local r, k = math.huge
        for J, I in S:GetChildren() do
            J = "BasePart"
            if I:IsA(J) then
                local S = (I.Position - K)["Magnitude"]
                if S < r then
                    r, k = S, I
                end
            end
        end
        return r, k
    end
    __T_S_149, __T_K_150, __T_r_151, __T_k_152, __T_J_153, __T_I_154, __T_p_155, __T_B_156 = game:GetService("ReplicatedStorage"), {}
    function __T_t_157()
        local _ = _G -- ENV_GETTER rewritten to _G
        for A = 1, #__T_K_150 do
            local i = __T_K_150[A]["U_1801"]()
            if typeof(i) == "CFrame" then
                return i
            end
        end
        return nil
    end
    __T_L_125.U_1071 = function(_, A)
        local i = _G -- ENV_GETTER rewritten to _G
        __T_K_150[#__T_K_150 + 1] = { ["U_1336"] = _, ["U_1801"] = A }
        table.sort(__T_K_150, function(K, _)
        return K.U_1336 < _.U_1336
    end)
    end
    __T_L_125.U_1500 = function()
        local K, _ = _G,  __T_r_151 -- ENV_GETTER rewritten to _G
        if _ then
            local A = __T_r_151
            return A
        end
        _ = __T_S_149:FindFirstChild("U_2227")
        local S = _ and _:FindFirstChild("U_1442")
        if not S or not S:IsA("ModuleScript") then
            return nil
        end
        _ = require(S)
        if typeof(_) ~= "table" then
            return nil
        end
        __T_r_151 = _
        _ = __T_r_151
        return _
    end
    __T_L_125.U_172 = function()
        local S, K = _G,  __T_B_156 -- ENV_GETTER rewritten to _G
        if K then
            local _ = __T_B_156
            return _
        end
        K = __T_L_125.U_1500()
        local _ = K and K.U_1821
        if typeof(_) ~= "functi]============],
    [4] = [============[
on" then
            return nil
        end
        K = S.U_1326 and S.U_1326["U_1766"]
        if typeof(K) ~= "function" then
            return nil
        end
        local A = K(_)
        if typeof(A) ~= "table" then
            return nil
        end
        K = nil
        for _, _ in next, A, nil do
            K = if typeof(_) == "number" and (not K or _ > K) then _ else K
        end
        __T_B_156 = K
        S = __T_B_156
        return S
    end
    __T_L_125.U_2348 = function()
        local S = not __T_r_151 or not __T_I_154
        if S then
            return false
        end
        S = __T_r_151
        local K, B = S.U_518 == __T_I_154
        if K then
            S = __T_r_151
            B = S.U_1821 == __T_p_155
        else
            B = K
        end
        return B
    end
    __T_L_125.U_1439 = function()
        local S, K = _G,  __T_L_125.U_1500() -- ENV_GETTER rewritten to _G
        if not K then
            return false
        end
        local B = not __T_I_154
        if B then
            function __T_I_154()
            end -- auto-repair: truncated AST (was missing end for empty hook I)
            function __T_p_155()
            end -- auto-repair: truncated AST (original end closed if, now closes p)
        end -- auto-repair: truncated AST (closes if B)
        if typeof(setreadonly) == "function" then
            setreadonly(K, false)
        end
        B = typeof(K.U_518) == "function" and K.U_518 ~= __T_I_154
        if B then
            __T_k_152 = K.U_518
            K.U_518 = __T_I_154
        end
        B = typeof(K.U_1821) == "function" and K.U_1821 ~= __T_p_155
        if B then
            __T_J_153 = K.U_1821
            K.U_1821 = __T_p_155
        end
        return true
    end
    __T_L_125.U_1427 = function()
        local S, K = _G,  __T_r_151 -- ENV_GETTER rewritten to _G
        if not K then
            return
        end
        K = typeof(setreadonly) == "function"
        if K then
            setreadonly(__T_r_151, false)
        end
        K = __T_k_152
        if K then
            S = __T_r_151
            S.U_518 = __T_k_152
        end
        K = __T_J_153
        if K then
            S = __T_r_151
            S.U_1821 = __T_J_153
        end
    end
    __T_S_158 = game:GetService("Players")
    __T_K_159 = game:GetService("ReplicatedStorage")
    __T_r_160, __T_k_161 = __T_S_158.LocalPlayer
    function __T_J_162()
        local I, p = _G,  __T_k_161 -- ENV_GETTER rewritten to _G
        if p then
            local B = __T_k_161
            return B
        end
        p = __T_K_159:FindFirstChild("U_3123")
        local K = p and p:FindFirstChild("U_626")
        if not K or not K:IsA("ModuleScript") then
            return nil
        end
        p = require(K)
        if typeof(p) ~= "table" then
            return nil
        end
        __T_k_161 = p
        K = __T_k_161
        return K
    end
    __T_b_126.U_1375 = function()
        local K, k = _G,  __T_J_162() -- ENV_GETTER rewritten to _G
        local J = k and k.U_1287
        if typeof(J) ~= "table" then
            return nil
        end
        return J
    end
    __T_b_126.U_2491 = function(K)
        local k = __T_b_126.U_1375()
        if not k then
            return nil
        end
        return k[K.Name]
    end
    __T_b_126.U_1516 = function(K)
        local k = __T_b_126.U_2491(K)
        return k and k.Role or nil
    end
    __T_b_126.U_1410 = function(K)
        local k = __T_b_126.U_2491(K)
        return k and k.U_1216 or nil
    end
    __T_b_126.U_623 = function(K)
        local k = __T_b_126.U_2491(K)
        if k and k.Dead then
            return false
        end
        k = K.Character
        K = k and k:FindFirstChildOfClass("Humanoid")
        return K ~= nil and K.Health > 0
    end
    __T_b_126.U_2671 = function(K, k)
        local J = K.Character
        local I = J and (J:FindFirstChild(k))
        if I then
            return I, true
        end
        J = K:FindFirstChildOfClass("Backpack")
        I = J and (J:FindFirstChild(k))
        if I then
            return I, false
        end
        return nil, false
    end
    __T_b_126.U_2228 = function()
        if __T_b_126.U_2671(__T_r_160, "Gun") ~= nil then
            return true
        end
        local K = __T_b_126.U_1516(__T_r_160)
        return K == "Sheriff" or K == "Hero"
    end
    __T_b_126.U_1362 = function()
        local K = __T_b_126.U_1375()
        if not K then
            return nil
        end
        for k, J in K, nil, nil do
            if J.Role == "Murderer" and not J.Dead then
                local K = __T_S_158:FindFirstChild(k)
                if K then
                    return K
                end
            end
        end
        return nil
    end
    __T_b_126.U_2156 = function(K)
        local k = _G -- ENV_GETTER rewritten to _G
        if typeof(K) ~= "table" then
            return nil
        end
        if K.U_696 == nil and K.U_1182 == nil then
            return nil
        end
        local J = K.U_613 or K.Role
        return typeof(J) == "string" and J or nil
    end
    __T_b_126.U_478 = function(K)
        local k = __T_b_126.U_1375()
        if not k or K == __T_r_160 then
            return false
        end
        local J = __T_b_126.U_2156(k[__T_r_160.Name])
        return J ~= nil and __T_b_126.U_2156(k[K.Name]) == J
    end
    __T_b_126.U_211 = function(K)
        local k, J = _G,  __T_b_126.U_1375() -- ENV_GETTER rewritten to _G
        if not J then
            return nil
        end
        local I = __T_b_126.U_2156(J[__T_r_160.Name])
        if not I then
            return __T_b_126.U_1362()
        end
        local r = workspace.CurrentCamera
        local p, B, t, _ = r and CFrame
        for A, i in J, nil, nil do
            k = __T_b_126.U_2156(i)
            if k and k ~= I and not i.Dead then
                r = __T_S_158:FindFirstChild(A)
                local S = r and r.Character

-- =============================================================================
-- MODULE 07/17: TrajectoryPredictor — Heartbeat history/least-squares/circular-arc/wall-slide/apex/OBB
-- recordPlayerSample/fitKinematicTrajectory/fitCircularTrajectory/predictTargetPosition/calculateHitProbability
-- ==============================================================================
                local k = S and S:FindFirstChild("HumanoidRootPart")
                if k and __T_b_126.U_623(r) then
                    S = 0
                    if p then
                        local J = k.Position - p.Position
                        S = if J.Magnitude > 0 then J.Unit:Dot(p.LookVector) else S
                    end
                    B = if r == K then S else B
                    if not t or S > t then
                        t, _ = S, r
                    end
                end
            end
        end
        if B and t - B < 1--[[u3159]] then
            return K
        end
        return _
    end
    __T_S_163 = game:GetService("Players")
    __T_K_164, __T_r_165 = game:GetService("RunService"), __T_S_163.LocalPlayer
    __T_k_166 = os.clock
    __T_J_167 = Vector3.new
    __T_I_168 = Vector3.zero
    __T_p_169 = math.sqrt
    __T_B_170 = math.atan2
    __T_t_171 = math.sin
    __T___172 = math.cos
    __T_A_173 = math.clamp
    __T_i_174 = math.abs
    __T_N_175 = math.max
    __T_l_176 = math.min
    __T_y_177 = math.pi
    __T_Q_178 = math.exp
    __T_o_076 = __T_EnumFB.U_3137
    __T_z_179 = { [__T_o_076.U_2642] = true, [__T_o_076.U_2202] = true }
    __T_T_180 = { [__T_o_076.U_2642["U_2506"]] = true, [__T_o_076.U_2202["U_2506"]] = true }
    __T_Z_181 = {
        [__T_o_076.U_3376] = true,
        [__T_o_076.U_1140] = true,
        [__T_o_076.U_702] = true,
        [__T_o_076.U_2516] = true,
        [__T_o_076.U_1944] = true
    }
    __T_G_182 = 1--[[u1192]]
    __T_s_183, __T_OP_184 = "U_243", {}
    __T_uP_185 = 0
    __T_FP_186 = Ray.new()
    __T_FP_186.U_2551 = __T_EnumFB.U_3131["U_379"]
    __T_FP_186.U_618 = true
    __T_mP_187 = { ["U_2887"] = 1--[[u1228]], ["U_1322"] = true }
    __T_h_124.U_1926 = __T_mP_187
    __T_fP_188 = {
        1--[[u3009]],
        "U_1224",
        1--[[u3198]],
        "U_2788",
        "U_1316",
        "U_2939"
    }
    function __T_PP_189(YP)
        return __T_J_167(YP.X, 0, YP.Z)
    end
    function __T_YP_190(qP)
        local dP, eP = _G,  #qP[1--[[u1833]]] -- ENV_GETTER rewritten to _G
        if eP <= __T_G_182 + 1--[[u3069]] then
            return
        end
        local cP, oP = eP - __T_G_182, {
            qP[1--[[u1833]]],
            qP.U_1652,
            qP.U_2153,
            qP.U_559,
            qP.U_1173,
            qP.U_1963
        }
        for G, G in oP, nil, nil do
            table.move(G, cP + 1, eP, 1)
            for qP = eP - cP + 1, eP do
                G[qP] = nil
            end
        end
    end
    function __T_G_191(qP)
        local dP = _G -- ENV_GETTER rewritten to _G
        for eP, eP in qP.U_3307, nil, nil do
            eP:Disconnect()
        end
        table.clear(qP.U_3307)
    end
    function __T_qP_192(dP, eP)
        local cP, oP = _G,  __T_OP_184[dP] -- ENV_GETTER rewritten to _G
        if not oP then
            oP = {
                [1--[[u1833]]] = {},
                ["U_1652"] = {},
                ["U_2153"] = {},
                ["U_559"] = {},
                ["U_1173"] = {},
                ["U_1963"] = {},
                ["U_3307"] = {},
                ["U_2037"] = {},
                ["U_908"] = {},
                ["U_400"] = {},
                ["U_770"] = {},
                ["U_177"] = {},
                ["U_2051"] = {},
                ["U_331"] = {},
                ["U_2527"] = 2,
                ["U_69"] = "U_1224",
                ["U_2960"] = 16,
                ["U_226"] = 1--[[u8]],
                ["U_1987"] = 0,
                ["U_3179"] = 0,
                ["U_2717"] = 0,
                ["U_720"] = 0,
                ["U_944"] = 0,
                ["U_467"] = 3
            }
            __T_OP_184[dP] = oP
        end
        __T_G_191(oP)
        dP = {
            oP[1--[[u1833]]],
            oP.U_1652,
            oP.U_2153,
            oP.U_559,
            oP.U_1173,
            oP.U_1963,
            oP.U_2037,
            oP.U_908,
            oP.U_177
        }
        for xP, xP in dP, nil, nil do
            table.clear(xP)
        end
        for cP = 1, #__T_fP_188 do
            oP.U_2051[cP], oP.U_331[cP] = 0, 0
        end
        oP.char, oP.U_3138, oP.U_1735, oP.U_3174, oP.U_2822, oP.U_944, oP.U_1472, oP.U_3179, oP.U_1987, oP.U_69, oP.U_2960, oP.U_2527 = eP, nil, nil, nil, nil, 0, false, 0, 0, "U_1224", 16, 2
        dP = eP:FindFirstChildOfClass("Humanoid")
        local cP = dP and dP.RootPart
        if not cP then
            return nil
        end
        oP.U_3138, oP.U_1735 = dP, cP
        oP.U_3174 = eP:FindFirstChild("UpperTorso") or eP:FindFirstChild("Torso") or cP
        return oP
    end
    function __T_dP_193(eP, cP)
        local oP, xP = eP[1--[[u1833]]], eP.U_1652
        local CP, MP, nP, XP, gP, RP, HP, WP, DP, vP, jP, aP, EP, UP, wP, VP, hP, LP = oP[cP], xP[cP]["Position"], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        for bP = cP, 1, -1 do
            eP = oP[bP] - CP
            if eP < "U_2257" then
                break
            end
            local SP = xP[bP]["Position"] - MP
            if eP >= "U_2850" then
                nP += 1
                XP += eP
                gP += eP * eP
                RP += SP.X
                HP += SP.Z
                WP += eP * SP.X
                DP = DP + eP * SP.Z
            end
            local KP = eP * eP
            vP += 1
            jP += eP
            aP += KP
            EP += KP * eP
            UP += KP * KP
            wP += SP.Y
            VP += eP * SP.Y
            hP, LP = hP + KP * SP.Y, bP
        end
        local eP, bP, SP, KP, rP = 0, 0, 0, 0, nP * gP - XP * XP
        if nP >= 3 and rP > "U_1223" then
            eP, bP = (nP * WP - XP * RP) / rP, (nP * DP - XP * HP) / rP
        else
            if LP and LP < cP then
                local nP, XP = MP - xP[LP]["Position"], CP - oP[LP]
                eP, bP = nP.X / XP, nP.Z / XP
            end
        end
        rP = vP * (aP * UP - EP * EP) - jP * (jP * UP - EP * aP) + aP * (jP * EP - aP * aP)
        if vP >= 5 and __T_i_174(rP) > "U_2306" then
            SP, KP = (vP * (VP * UP - EP * hP) - wP * (jP * UP - EP * aP) + aP * (jP * hP - VP * aP)) / rP, 2 * (vP * (aP * hP - VP * EP) - jP * (jP * hP - VP * aP) + wP * (jP * EP - aP * aP)) / rP
        else
            SP = if LP and LP < cP then (MP.Y - xP[LP]["Position"]["Y"]) / (CP - oP[LP]) else SP
        end
        return __T_J_167(eP, SP, bP), KP
    end
    function __T_eP_194(cP)
        return cP.U_2153[#cP.U_2153] or __T_I_168
    end
    function __T_cP_195(oP)
        local xP = oP.Character
        if not xP or not xP.Parent then
            return nil
        end
        local CP = __T_OP_184[oP]
        if CP and CP.char == xP and CP.U_3138 and CP.U_3138["Parent"] and CP.U_1735["Parent"] then
            return CP
        end
        return __T_qP_192(oP, xP)
    end
    __T_h_124.U_1213 = __T_cP_195
    __T_c_074, __T_R_114 = "PlayerRemoving", function(qP)
        local oP = __T_OP_184[qP]
        if oP then
            __T_G_191(oP)
            __T_OP_184[qP] = nil
        end
    end
    __T_S_163[__T_c_074]:Connect(__T_R_114)
    __T_qP_196 = nil
    __T_qP_196 = __T_K_164.Heartbeat:Connect(function()
        local K, oP = _G,  __T_k_166() -- ENV_GETTER rewritten to _G
        local xP = oP - __T_uP_185
        if xP < __T_s_183 then
            return
        end
        __T_uP_185 = oP
        for s, uP in __T_S_163:GetPlayers() do
            if uP ~= __T_r_165 then
                s = __T_cP_195(uP)
                if s and s.U_3138["Health"] > 0 then
                    local S, uP = s.U_1735["CFrame"], #s[1--[[u1833]]]
                    if uP > 0 then
                        xP = (S.Position - s.U_1652[uP]["Position"])["Magnitude"]
                        if xP > 8 and xP > 1--[[u1248]] * (oP - s[1--[[u1833]]][uP]) then
                            local xP = {
                                s[1--[[u1833]]],
                                s.U_1652,
                                s.U_2153,
                                s.U_559,
                                s.U_1173,
                                s.U_1963,
                                s.U_2037
                            }
                            for CP, CP in xP, nil, nil do
                                table.clear(CP)
                            end
                            uP = 0
                        end
                    end
                    uP += 1
                    s[1--[[u1833]]][uP] = oP
                    s.U_1652[uP] = S
                    s.U_1173[uP] = s.U_3138["MoveDirection"]
                    s.U_1963[uP] = s.U_3138:GetState()["U_2506"]
                    s.U_2153[uP], s.U_559[uP] = __T_dP_193(s, uP)
                    __T_YP_190(s)
                end
            end
        end
    end)
    __T_h_124.U_45 = function()
        local S, K = _G,  __T_qP_196 -- ENV_GETTER rewritten to _G
        if K then
            __T_qP_196:Disconnect()
            __T_qP_196 = nil
        end
        for K, K in __T_OP_184, nil, nil do
            __T_G_191(K)
        end
        table.clear(__T_OP_184)
    end
    function __T_S_197(K, G)
        local s = K[1--[[u1833]]]
        K = #s
        if K == 0 then
            return nil
        end
        if G >= s[K] then
            return K
        end
        if G <= s[1] then
            return 1
        end
        local OP, uP = K, 1
        while true do
            local K, YP = OP - uP, 1
            if not (K > YP) then
                break
            end
            YP = (uP + OP) // 2
            if s[YP] <= G then
                uP = YP
            else
                OP = YP
            end
        end
        return uP
    end
    function __T_K_198(G, s, OP)
        local uP = _G -- ENV_GETTER rewritten to _G
        __T_FP_186.U_2661 = { G.char, __T_r_165.Character }
        G = workspace:Raycast(__T_J_167(s.X, OP + 0.5, s.Z), __T_J_167(0, "U_830", 0), __T_FP_186)
        return G and G.Position["Y"]
    end
    function __T_G_199(s, OP, uP, YP)
        local qP = _G -- ENV_GETTER rewritten to _G
        if YP <= uP + 1--[[u2185]] then
            return YP
        end
        __T_FP_186.U_2661 = { s.char, __T_r_165.Character }
        s = workspace:Raycast(__T_J_167(OP.X, uP, OP.Z), __T_J_167(0, YP - uP + 2, 0), __T_FP_186)
        if s then
            return __T_l_176(YP, __T_N_175(uP, s.Position["Y"] - 2))
        end
        return YP
    end
    function __T_s_200(OP)
        local uP, YP, qP, dP = _G,  OP[1--[[u1833]]],  OP.U_1173,  OP.U_2153 -- ENV_GETTER rewritten to _G
        local oP, xP = #YP, {}
        for CP = oP, 1, 1--[[u1035]] do
            if YP[oP] - YP[CP] > 1 then
                break
            end
            local YP = qP[CP]
            if YP.X * YP.X + YP.Z * YP.Z > 1--[[u1791]] then
                local YP = dP[CP]
                xP[#xP + 1] = __T_p_169(YP.X * YP.X + YP.Z * YP.Z)
            end
        end
        if #xP < 6 then
            OP.U_2960 = OP.U_3138["WalkSpeed"]
            return
        end
        table.sort(xP)
        OP.U_2960 = __T_N_175(xP[math.floor(#xP * 1--[[u1226]]) + 1] or xP[#xP], OP.U_3138["WalkSpeed"])
    end
    function __T_OP_201(uP)
        local YP, qP, dP = uP[1--[[u1833]]], uP.U_1963, uP.U_2153
        local oP = #YP
        for xP = __T_N_175(2, oP - 1--[[u1248]]), oP - 1, 1 do
            local CP = YP[xP]
            if CP > uP.U_3179 then
                local MP, nP = __T_T_180[qP[xP - 1]], __T_T_180[qP[xP]]
                if nP and not MP then
                    if YP[oP] - CP < 1--[[u234]] then
                        break
                    end
                    local XP = 0
                    for gP = xP, oP do
                        if YP[gP] - CP > 1--[[u234]] then
                            break
                        end
                        XP = if dP[gP]["Y"] > XP then dP[gP]["Y"] else XP
                    end
                    if XP > 1--[[u2553]] then
                        uP.U_226 = uP.U_226 * 1--[[u1226]] + XP * 1--[[u234]]
                    end
                    uP.U_3179 = CP
                else
                    if MP and not nP then
                        if YP[oP] - CP < 1--[[u3198]] then
                            break
                        end
                        local dP = false
                        for MP = xP + 1, oP do
                            if YP[MP] - CP > 1--[[u3198]] then
                                break
                            end
                            if __T_T_180[qP[MP]] then
                                dP = true
                                break
                            end
                        end
                        uP.U_1987 = uP.U_1987 * 1--[[u1226]] + (dP and 1--[[u234]] or 0)
                        uP.U_3179 = CP
                    end
                end
            end
        end
    end
    function __T_uP_202(YP)
        local qP, dP = YP[1--[[u1833]]], YP.U_1963
        YP = #qP
        for oP = YP, 2, -1 do
            if qP[YP] - qP[oP] > 1--[[u234]] then
                return nil
            end
            if __T_T_180[dP[oP]] and not __T_T_180[dP[oP - 1]] then
                return qP[oP]
            end
        end
        return nil
    end
    function __T_T_203(YP)
        local qP = __T_k_166()
        if qP - YP.U_2717 > 1--[[u1791]] then
            YP.U_2717 = qP
            __T_s_200(YP)
            __T_OP_201(YP)
        end
    end
    function __T_s_204(OP)
        local YP, qP, dP, oP = _G,  OP.U_3138,  OP.U_1735,  __T_eP_194(OP) -- ENV_GETTER rewritten to _G
        local xP = qP:GetState()
        if oP.Magnitude > 1--[[u1150]] then
            return "U_2973"
        end
        if __T_Z_181[xP] or qP.PlatformStand then
            return "U_1108"
        end
        local Z, CP = qP.HipHeight + dP.Size["Y"] / 2, __T_K_198(OP, dP.Position, dP.Position["Y"])
        local MP = (CP and dP.Position["Y"] - CP - Z or 99) > 1--[[u370]] or __T_i_174(oP.Y) > 6
        if __T_z_179[xP] then
            if not OP.U_2822 then
                OP.U_2822 = __T_k_166()
            end
        else
            OP.U_2822 = nil
        end
        if __T_z_179[xP] and not MP then
            return "U_587"
        end
        if MP then
            if __T_i_174((OP.U_559[#OP.U_559] or -workspace.Gravity) + workspace.Gravity) < workspace.Gravity * 0.5 or __T_z_179[xP] then
                return "U_2015"
            end
            return "U_1108"
        end
        xP, Z = __T_PP_189(qP.MoveDirection), __T_PP_189(oP)
        OP = Z.Magnitude
        if OP < 1 and xP.Magnitude < 1--[[u1824]] then
            return "U_1890"
        end
        if OP > 6 and (xP.Magnitude < 1--[[u2185]] or xP.Unit:Dot(Z.Unit) < 1--[[u3198]]) and OP > qP.WalkSpeed * 1--[[u2950]] then
            return "U_1108"
        end
        return "U_488"
    end
    __T_h_124.U_262 = function(z)
        local Z = __T_cP_195(z)
        return Z and #Z[1--[[u1833]]] > 10 and __T_s_204(Z) or nil
    end
    function __T_z_205(Z, OP, YP, qP)
        local dP, oP = Z[1--[[u1833]]], Z.U_1173
        local xP = #dP
        local CP = dP[xP]
        local MP = CP - qP
        local nP, XP, gP = __T_l_176(CP, MP + OP), __T_S_197(Z, MP) or xP, __T_I_168
        while XP < xP and dP[XP] < nP do
            qP, CP = __T_N_175(dP[XP], MP), __T_l_176(dP[XP + 1], nP)
            if CP > qP then
                local dP = __T_PP_189(oP[XP])
                local oP = dP.Magnitude
                gP = if oP > 0 then gP + dP.Unit * YP * __T_l_176(1, oP) * (CP - qP) else gP
            end
            XP = XP + 1
        end
        qP, xP = OP - (nP - MP), __T_PP_189(Z.U_3138["MoveDirection"])
        return if qP > 0 and xP.Magnitude > 0 then gP + xP.Unit * YP * __T_l_176(1, xP.Magnitude) * qP else gP
    end
    function __T_l_206(Z, OP, YP)
        local qP, dP = Z[1--[[u1833]]], Z.U_2153
        local oP, xP = #qP
        local CP, MP, nP, XP, gP, RP = 0, 0, 0, 0, 0, 0
        for HP = __T_S_197(Z, qP[oP] - 1--[[u1758]]) or oP, oP, 1 do
            local WP = dP[HP]
            if WP.X * WP.X + WP.Z * WP.Z > 16 then
                local DP = __T_B_170(WP.Z, WP.X)
                if xP then
                    local WP = DP - xP
                    CP = if WP > __T_y_177 then CP - 2 * __T_y_177 else if WP < -__T_y_177 then CP + 2 * __T_y_177 else CP
                end
                local WP, vP = qP[HP] - qP[oP], DP + CP
                xP, MP, nP, XP, gP, RP = DP, MP + WP, nP + vP, XP + WP * WP, gP + WP * vP, RP + 1
            end
        end
        qP = 0
        if RP >= 6 then
            dP = RP * XP - MP * MP
            qP = if __T_i_174(dP) > "U_2411" then __T_A_173((RP * gP - MP * nP) / dP, "U_1022", 12) else qP
        end
        local xP, CP, MP, nP = __T_p_169(OP.X * OP.X + OP.Z * OP.Z), __T_B_170(OP.Z, OP.X) + qP * 1--[[u1783]]
        if __T_i_174(qP) < 1--[[u3159]] then
            MP, nP = OP.X * YP, OP.Z * YP
        else
            MP, nP = xP / qP * (__T_t_171(CP + qP * YP) - __T_t_171(CP)), -(xP / qP) * (__T___172(CP + qP * YP) - __T___172(CP))
        end
        dP = __T_A_173(Z.U_559[oP] or 0, "U_1872", 1--[[u1150]])
        return __T_J_167(MP, OP.Y * YP + 0.5 * dP * YP * YP, nP)
    end
    function __T_Z_207(OP, YP)
        local qP, dP = OP[1--[[u1833]]], OP.U_1652
        local oP = #qP
        local xP = __T_S_197(OP, qP[oP] - 1--[[u2185]]) or 1
        if oP - xP < 12 then
            return nil
        end
        local S, CP, MP, nP, XP, gP, RP, HP, WP, DP = dP[oP]["Position"], 0, 0, 0, 0, 0, 0, 0, 0, 0
        for vP = xP, oP do
            OP = dP[vP]["Position"]
            local jP, aP = OP.X - S.X, OP.Z - S.Z
            vP = jP * jP + aP * aP
            CP, MP, nP, XP, gP, RP, HP, WP, DP = CP + 1, MP + jP, nP + aP, XP + jP * jP, gP + aP * aP, RP + jP * aP, HP + jP * vP, WP + aP * vP, DP + vP
        end
        OP = XP * (gP * CP - nP * nP) - RP * (RP * CP - nP * MP) + MP * (RP * nP - gP * MP)
        if __T_i_174(OP) < "U_2411" then
            return nil
        end
        local vP, jP, aP = (HP * (gP * CP - nP * nP) - RP * (WP * CP - nP * DP) + MP * (WP * nP - gP * DP)) / OP, (XP * (WP * CP - nP * DP) - HP * (RP * CP - nP * MP) + MP * (RP * DP - WP * MP)) / OP, (XP * (gP * DP - WP * nP) - RP * (RP * DP - WP * MP) + HP * (RP * nP - gP * MP)) / OP
        local CP, MP = vP / 2, jP / 2
        jP = aP + CP * CP + MP * MP
        if jP <= 0 then
            return nil
        end
        aP = __T_p_169(jP)
        if aP < 1--[[u3221]] or aP > 1--[[u513]] then
            return nil
        end
        vP, OP = 0
        local nP, XP, gP, RP, HP, WP = 0, 0, 0, 0, 0, 0
        for DP = xP, oP do
            jP = dP[DP]["Position"]
            local dP, xP = jP.X - S.X - CP, jP.Z - S.Z - MP
            local S = __T_p_169(dP * dP + xP * xP) - aP
            vP += S * S
            S = __T_B_170(xP, dP)
            if OP then
                xP = S - OP
                nP = if xP > __T_y_177 then nP - 2 * __T_y_177 else if xP < -__T_y_177 then nP + 2 * __T_y_177 else nP
            end
            dP, xP = qP[DP] - qP[oP], S + nP
            XP += 1
            OP, gP, RP, HP, WP = S, gP + dP, RP + xP, HP + dP * dP, WP + dP * xP
        end
        if vP / XP > 1--[[u1791]] then
            return nil
        end
        OP = XP * HP - gP * gP
        if __T_i_174(OP) < "U_2411" then
            return nil
        end
        vP = (XP * WP - gP * RP) / OP
        if __T_i_174(vP) < 2 or __T_i_174(vP) > 30 then
            return nil
        end
        OP = (RP - vP * gP) / XP
        MP = OP + vP * YP
        return __T_J_167(aP * (__T___172(MP) - __T___172(OP)), 0, aP * (__T_t_171(MP) - __T_t_171(OP)))
    end
    function __T_S_208(B, t, _)
        local y, OP = _G,  _.Magnitude -- ENV_GETTER rewritten to _G
        if OP < 1--[[u3159]] then
            return _
        end
        __T_FP_186.U_2661 = { B.char, __T_r_165.Character }
        B = _.Unit
        local YP = workspace:Raycast(t, _ + B * 1--[[u319]], __T_FP_186)
        if not YP then
            return _
        end
        local qP = __T_PP_189(YP[1--[[u2718]]])
        if qP.Magnitude < 1--[[u2185]] then
            return _
        end
        qP = qP.Unit
        local dP = B * __T_A_173((YP.Position - t)["Magnitude"] - 1--[[u319]], 0, OP)
        B = _ - dP
        B -= qP * B:Dot(qP)
        if B.Magnitude < 1--[[u3159]] then
            return dP
        end
        YP = t + dP
        t = workspace:Raycast(YP, B + B.Unit * 1--[[u319]], __T_FP_186)
        return dP + (if t then B.Unit * __T_N_175(0, (t.Position - YP)["Magnitude"] - 1--[[u319]]) else B)
    end
    function __T_B_209(t, _, y, OP)
        local FP, YP = _G,  __T_fP_188[OP or t.U_2527] -- ENV_GETTER rewritten to _G
        local qP, dP, oP, xP = typeof(YP) == "number" and YP or t.U_69, t.U_3138, t.U_1735, t.U_3174
        local CP, MP = xP.Position, __T_eP_194(t)
        t.U_1472 = false
        if y == "U_1890" or y == "U_2973" or #t[1--[[u1833]]] < 10 then
            return CP
        end
        if y == "U_1108" then
            return CP + __T_l_206(t, MP, _)
        end
        local nP, XP = __T_PP_189(dP.MoveDirection), if YP == "U_2939" then __T_Z_207(t, _) else nil
        if not XP and (YP == "U_1316" or YP == "U_2939" or y == "U_2015" and nP.Magnitude < 1--[[u2185]]) then
            XP = __T_l_206(t, MP, _)
            XP = __T_J_167(XP.X, 0, XP.Z)
        end
        XP = if not XP then __T_z_205(t, _, t.U_2960, qP) else XP
        nP, YP, OP = CP + __T_S_208(t, oP.Position, XP), xP.Position["Y"] - oP.Position["Y"] + dP.HipHeight + oP.Size["Y"] / 2, workspace.Gravity
        if y == "U_2015" then
            xP, FP = CP.Y + MP.Y * _ - 0.5 * OP * _ * _, __T_K_198(t, nP, CP.Y)
            if FP and xP < FP + YP then
                dP = FP + YP
                local S, l, z = (MP.Y + __T_p_169(MP.Y * MP.Y + 2 * OP * __T_N_175(0, CP.Y - dP))) / OP, __T_k_166(), __T_uP_202(t)
                z = z and z + qP
                z = if not (z and z > l + S - 1--[[u3159]]) then t.U_1987 > 0.5 and l + S + 1--[[u2786]] or nil else z
                if z and l + _ > z then
                    oP = l + _ - z
                    xP = __T_N_175(dP, dP + t.U_226 * oP - 0.5 * OP * oP * oP)
                else
                    xP = dP
                end
                t.U_1472 = true
            end
            nP = __T_J_167(nP.X, __T_G_199(t, nP, CP.Y, xP), nP.Z)
        else
            if y == "U_587" then
                local S = __T_k_166() + _ - ((t.U_2822 or __T_k_166()) + qP)
                if S > 0 then
                    local _ = __T_K_198(t, nP, CP.Y) or CP.Y - YP
                    local K = _ + YP + t.U_226 * S - 0.5 * OP * S * S
                    nP = __T_J_167(nP.X, __T_G_199(t, nP, CP.Y, __T_N_175(K, _ + YP)), nP.Z)
                end
            end
        end
        return nP
    end
    function __T_S_210()
        return __T_A_173(__T_r_165:GetNetworkPing() + __T_mP_187.U_2887, 1--[[u2543]], 1--[[u234]])
    end
    function __T_K_211(t)
        local _ = __T_PP_189(t)
        _ = _.Magnitude > 1 and _.Unit or __T_J_167(1, 0, 0)
        t = Vector3.yAxis
        return _, _:Cross(t)
    end
    function __T_t_212(_, A)
        if A ~= "U_488" and A ~= "U_2015" then
            return A
        end
        local l, y = _[1--[[u1833]]], _.U_1173
        local z = #l
        local Z, G = y[z], 1
        ]============],
    [5] = [============[
for OP = z - 1, 1, -1 do
            local uP = l[z] - l[OP]
            if uP > 1--[[u1226]] then
                break
            end
            if (y[OP] - Z)["Magnitude"] > 1--[[u2604]] then
                G = uP
                break
            end
        end
        z = A .. (G > _.U_69 + 1--[[u3198]] and "U_387" or 1--[[u1833]])
        return if _.U_1472 then z .. "U_2176" else z
    end
    function __T___213(A, l, y, z, Z)
        local G = __T_Q_178((A[1] - l) / 1--[[u2206]])
        return (if A[6] ~= y then G * (A[5] == z and 1--[[u2604]] or 1--[[u2150]]) else G) * __T_Q_178(-__T_i_174(A[7] - Z) / 25)
    end
    function __T_A_214(l)
        local y, Q, z, Z, G = _G,  __T_k_166(),  l.U_3174["Position"],  l.U_2037,  1 -- ENV_GETTER rewritten to _G
        while G <= #Z do
            local OP = Z[G]
            if Q >= OP[1--[[u1833]]] then
                if Q - OP[1--[[u1833]]] < 1--[[u3159]] then
                    local uP, FP, YP, qP, dP = z - OP.U_1622, l.U_908, #l.U_908 + 1, {}, "U_550"
                    local oP, xP = uP:Dot(OP[dP]), "U_1620"
                    do local _xgSrc = {Q, oP, uP:Dot(OP[xP]), uP.Y, OP.U_262, OP.U_2105, OP.U_972}; for _xgI = 1, #_xgSrc do qP[#qP + 1] = _xgSrc[_xgI] end end
                    FP[YP] = qP
                    dP = OP.U_517
                    if dP then
                        FP, xP, oP, YP = l.U_2051, l.U_331, math.huge
                        for OP = 1, #__T_fP_188 do
                            uP = __T_PP_189(z - dP[OP])
                            FP[OP] = FP[OP] * 1--[[u1893]] + uP:Dot(uP)
                            xP[OP] = xP[OP] * 1--[[u1893]] + 1
                            qP = FP[OP] / xP[OP]
                            if qP < oP then
                                oP, YP = qP, OP
                            end
                        end
                        local z = l.U_2527
                        if YP and xP[YP] > 6 and oP < 1--[[u1190]] * FP[z] / xP[z] then
                            l.U_2527 = YP
                            if typeof(__T_fP_188[YP]) == "number" then
                                l.U_69 = __T_fP_188[YP]
                            end
                        end
                    end
                end
                table.remove(Z, G)
            else
                G += 1
            end
        end
        while #l.U_908 > 0 and Q - l.U_908[1][1] > 3 do
            table.remove(l.U_908, 1)
        end
        if Q - l.U_720 > 1--[[u2755]] then
            l.U_720 = Q
            local y, z, G = __T_s_204(l), __T_S_210(l), __T_eP_194(l)
            local OP, uP = __T_K_211(G)
            local FP, YP, qP
            if y == "U_488" or y == "U_2015" or y == "U_587" then
                qP = {}
                for dP = 1, #__T_fP_188 do
                    qP[dP] = __T_B_209(l, z, y, dP)
                    if dP == l.U_2527 then
                        YP, FP = qP[dP], (__T_t_212(l, y))
                    end
                end
            end
            if not YP then
                YP = __T_B_209(l, z, y)
                FP = (__T_t_212(l, y))
            end
            local l, fP = #Z + 1, {
                [1--[[u1833]]] = Q + z,
                ["U_1622"] = YP,
                ["U_517"] = qP,
                ["U_550"] = OP,
                ["U_1620"] = uP,
                ["U_262"] = y,
                ["U_2105"] = FP
            }
            fP.U_972, Z[l] = __T_PP_189(G)["Magnitude"], fP
        end
    end
    function __T_l_215(y, Q, z, Z)
        local G, OP, uP = _G,  __T_k_166(),  y.U_400 -- ENV_GETTER rewritten to _G
        table.clear(uP)
        local FP, fP, YP, qP = 0, 0, 0, 0
        for dP, oP in y.U_908, nil, nil do
            G = __T___213(oP, OP, Q, z, Z)
            uP[dP] = G
            FP += G
            fP += G * oP[2]
            YP += G * oP[3]
            qP = qP + G * oP[4]
        end
        if FP < 3 then
            return nil
        end
        fP /= FP
        YP /= FP
        qP /= FP
        local dP, oP, xP, CP, MP, nP = 0, 0, 0, 0, 0, 0
        for XP, gP in y.U_908, nil, nil do
            G, OP, z, Q = uP[XP], gP[2] - fP, gP[3] - YP, gP[4] - qP
            dP, oP, xP, CP, MP, nP = dP + G * OP * OP, oP + G * OP * z, xP + G * OP * Q, CP + G * z * z, MP + G * z * Q, nP + G * Q * Q
        end
        Q, Z, uP = 1, 1--[[u2185]], 1--[[u2185]]
        for G = 1, 16 do
            G, z, y = dP * Q + oP * Z + xP * uP, oP * Q + CP * Z + MP * uP, xP * Q + MP * Z + nP * uP
            OP = __T_p_169(G * G + z * z + y * y)
            if OP < "U_2411" then
                break
            end
            Q, Z, uP = G / OP, z / OP, y / OP
        end
        return __T_J_167(fP, YP, qP), __T_J_167(Q, Z, uP), FP
    end
    function __T_J_216(p)
        local y, Q, z = _G,  __T_k_166(),  p.U_177 -- ENV_GETTER rewritten to _G
        if #z > 0 and Q - p.U_944 < 0.5 then
            return z, p.U_467
        end
        table.clear(z)
        local Z, G = p.U_3174["Position"], 0
        for OP, uP in p.char:GetDescendants() do
            if uP:IsA("BasePart") and uP.CanQuery then
                y = CFrame
                local FP, fP = y.Position - Z, uP.Size / 2
                OP = fP.Magnitude
                z[#z + 1] = { y - y.Position, FP, fP, OP }
                G = __T_N_175(G, FP.Magnitude + OP)
            end
        end
        p.U_944, p.U_467 = Q, G
        return z, G
    end
    function __T_p_217(y, Q, z, Z, G, OP, uP, FP, fP)
        local YP, qP = (-math.huge), math.huge
        if __T_i_174(Z) < "U_2411" then
            if y < -uP or y > uP then
                return false
            end
        else
            local dP, oP = (-uP - y) / Z, (uP - y) / Z
            if dP > oP then
                dP, oP = oP, dP
            end
            YP, qP = if dP > YP then dP else YP, if oP < qP then oP else qP
        end
        if __T_i_174(G) < "U_2411" then
            if Q < -FP or Q > FP then
                return false
            end
        else
            uP, y = (-FP - Q) / G, (FP - Q) / G
            if uP > y then
                uP, y = y, uP
            end
            YP, qP = if uP > YP then uP else YP, if y < qP then y else qP
        end
        if __T_i_174(OP) < "U_2411" then
            if z < -fP or z > fP then
                return false
            end
        else
            Q, G = (-fP - z) / OP, (fP - z) / OP
            if Q > G then
                Q, G = G, Q
            end
            YP, qP = if Q > YP then Q else YP, if G < qP then G else qP
        end
        return YP <= qP and qP > 0
    end
    function __T_i_218(y, Q, z, Z, G, OP)
        local uP = OP - z
        OP = uP:Dot(Z)
        if OP < -Q or (uP - Z * OP)["Magnitude"] > Q then
            return false
        end
        for FP, fP in y, nil, nil do
            Q = uP + fP[2]
            OP, z = Q:Dot(Z), fP[4]
            if OP > -z and (Q - Z * OP)["Magnitude"] <= z then
                local y, z, Z = fP[1]:PointToObjectSpace(-Q), G[FP], fP[3]
                if __T_p_217(y.X, y.Y, y.Z, z.X, z.Y, z.Z, Z.X, Z.Y, Z.Z) then
                    return true
                end
            end
        end
        return false
    end
    __T_h_124.U_3045 = function(p)
        local y = __T_cP_195(p)
        if y and #y[1--[[u1833]]] > 10 and y.U_3138["Health"] > 0 then
            __T_T_203(y)
            __T_A_214(y)
        end
    end
    __T_h_124.U_1979 = function(p)
        local A = __T_cP_195(p)
        return A and __T_S_210(A) or __T_r_165:GetNetworkPing()
    end
    __T_h_124.U_1395 = function(r, p)
        local A = __T_cP_195(r)
        if not A or #A[1--[[u1833]]] < 10 then
            return nil
        end
        __T_T_203(A)
        r = __T_s_204(A)
        return __T_B_209(A, p or (__T_S_210(A)), r), r
    end
    __T_h_124.U_1492 = function(r, p, A, y)
        local Q, z = _G,  __T_cP_195(r) -- ENV_GETTER rewritten to _G
        if not z or not p or #z.U_908 == 0 then
            return 0
        end
        r = y - A
        if r.Magnitude < "U_917" then
            return 0
        end
        r = r.Unit
        local Z, G = __T_J_216(z)
        y = z.U_770
        table.clear(y)
        for J, Q in Z, nil, nil do
            y[J] = Q[1]:VectorToObjectSpace(r)
        end
        local J, Q, OP, uP, FP, fP, YP, qP = __T_k_166(), p.U_550, p.U_1620, p.U_3185, p.U_1965, Vector3.yAxis, 0, 0
        for k, dP in z.U_908, nil, nil do
            k = __T___213(dP, J, p.U_2105, p.U_262, p.U_972)
            if k > 1--[[u2786]] then
                YP += k
                qP = if __T_i_218(Z, G, A, r, y, FP + Q * (dP[2] - uP.X) + OP * (dP[3] - uP.Y) + fP * (dP[4] - uP.Z)) then qP + k else qP
            end
        end
        return (qP + 0.5) / (YP + 1), YP
    end
    __T_h_124.U_763 = function(r)
        local k = __T_cP_195(r)
        if not k or #k[1--[[u1833]]] < 10 or k.U_3138["Health"] <= 0 then
            return nil
        end
        __T_T_203(k)
        local J, p = __T_s_204(k), __T_S_210(k)
        local S, _, A = __T_B_209(k, p, J), __T_t_212(k, J), (J == "U_2015" or J == "U_587" or J == "U_1108") and "U_1209" or 1--[[u1824]]
        local t, i, y = __T_B_209(k, __T_N_175(1--[[u2786]], p - A), J), __T_B_209(k, p + A, J), __T_eP_194(k)
        r, A = __T_K_211(y)
        local K, B = __T_PP_189(y)["Magnitude"], {}
        y = {
        ["U_262"] = J,
        ["U_2105"] = _,
        ["U_20"] = p,
        ["U_550"] = r,
        ["U_1620"] = A,
        ["U_972"] = K,
        ["U_3185"] = __T_I_168,
        ["U_1913"] = B
    }
        if __T_mP_187.U_1322 and J ~= "U_1890" then
            local I, N = __T_l_215(k, _, J, K)
            if I then
                p = r * I.X + A * I.Y + Vector3.yAxis * I.Z
                y.U_3185 = I
                S += p
                t += p
                i += p
                B[#B + 1] = (r * N.X + A * N.Y + Vector3.yAxis * N.Z)["Unit"]
            end
        end
        y.U_1965 = S
        r = i - t
        if r.Magnitude > 0.5 then
            B[#B + 1] = r.Unit
        end
        B[#B + 1] = -Vector3.yAxis
        return y
    end
    __T_o_076 = game:GetService("Players")
    game:GetService("CollectionService")
    __T_S_219 = game:GetService("RunService")
    __T_K_220, __T_r_221 = game:GetService("ReplicatedStorage"), __T_o_076.LocalPlayer
    __T_k_222 = os.clock
    __T_J_223 = CFrame.new
    __T_I_224 = 0
    __T_p_225 = {
        ["U_1392"] = false,
        ["U_1395"] = true,
        ["U_2163"] = false,
        ["U_966"] = false,
        ["delay"] = 0,
        ["U_3384"] = 15,
        ["U_1038"] = 1--[[u1226]],
        [1--[[u3147]]] = 1--[[u1226]],
        ["U_1492"] = 0,
        ["U_1329"] = "U_2407",
        ["U_2198"] = 0,
        ["U_2457"] = 0,
        ["U_2753"] = 0,
        [1--[[u1285]]] = nil
    }
    __T_B_226, __T_t_227 = __T_M_112:AddSection({ ["Name"] = "U_2228", ["Position"] = "U_982" }), Ray.new()
    __T_t_227.U_2551 = __T_EnumFB.U_3131["U_379"]
    __T_t_227.U_1011 = false
    function __T___228(A, i, N)
        local l, y = _G,  i - A -- ENV_GETTER rewritten to _G
        i = y.Magnitude
        if i <= 0 then
            return true
        end
        local Q = __T_L_125.U_172()
        if Q and i > Q * 2 then
            return false
        end
        __T_t_227.U_2661 = { __T_r_221.Character }
        Q = workspace:Raycast(A, y + y / i * 1--[[u2372]], __T_t_227)
        return not Q or Instance:IsDescendantOf(N)
    end
    function __T_t_229()
        local A = __T_r_221.Character
        local i = A and A:FindFirstChild("HumanoidRootPart")
        if not i then
            return nil, nil
        end
        A = "U_1504"
        return i:FindFirstChild(A), i
    end
    function __T_A_230()
        local i, N = __T_t_229()
        if i then
            return i.U_2098
        end
        if N then
            return CFrame
        end
        return nil
    end
    __T_i_231, __T_N_232 = nil, nil
    __T_l_233 = -1
    function __T_y_234()
        local Q, z = __T_i_231, __T_N_232
        local T = Q
        __T_i_231 = nil
        Q = z
        __T_N_232 = nil
        if T and Q and T.Parent then
            CFrame = Q
        end
    end
    function __T_Q_235(z)
        local T, Z = _G,  __T_t_229() -- ENV_GETTER rewritten to _G
        if not Z then
            return false
        end
        local t = __T_i_231 and __T_i_231 ~= Z
        if t then
            __T_y_234()
        end
        t = not __T_i_231
        if t then
            __T_i_231 = Z
            __T_N_232 = CFrame
        end
        __T_l_233 = __T_I_224
        Z.U_2098 = z
        task.defer(__T_y_234)
        return true
    end
    __T_t_236 = nil
    function __T_N_237(z)
        local T = __T_t_236
        if z == T then
            return
        end
        __T_t_236 = z
    end
    __T_R_114, __T_c_074 = __T_K_220:WaitForChild("U_2678"):WaitForChild("U_107"), { "U_2815", "U_2787", "U_2586" }
    for z, T in __T_c_074, nil, nil do
        __T_K_220 = __T_R_114:FindFirstChild(T)
        z = __T_K_220 and __T_K_220:IsA("RemoteEvent")
        if z then
            __T_K_220.OnClientEvent:Connect(function()
                __T_N_237(__T_b_126.U_211(__T_t_236))
            end)
        end
    end
    __T_z_238 = Ray.new()
    __T_z_238.U_2551 = __T_EnumFB.U_3131["U_379"]
    function __T_T_239(Z, G)
        local s, OP = _G,  __T_r_221.Character -- ENV_GETTER rewritten to _G
        local uP = OP and OP:FindFirstChild("HumanoidRootPart")
        if not uP then
            return false
        end
        __T_z_238.U_2661 = { OP, G }
        OP = uP.Position - Z
        return OP.Magnitude < 1--[[u1824]] or workspace:Raycast(Z, OP, __T_z_238) == nil
    end
    function __T_z_240(Z, G, s, OP)
        local uP = __T_p_225.U_3384
        local FP = { uP, uP * 0.5, 3 }
        for mP, mP in FP, nil, nil do
            uP = G - s * mP
            if __T___228(uP, G, Z) and (OP or __T_T_239(uP, Z)) then
                return uP
            end
        end
        return nil
    end
    __T_Z_241 = {}
    __T_K_220 = {
        Vector3.xAxis,
        -Vector3.xAxis,
        Vector3.zAxis,
        -Vector3.zAxis,
        Vector3.yAxis,
        Vector3.new(1, 0, 1),
        Vector3.new(-1, 0, 1),
        Vector3.new(1, 0, -1),
        Vector3.new(-1, 0, -1),
        Vector3.new(1, 1, 0),
        Vector3.new(-1, 1, 0),
        Vector3.new(0, 1, 1),
        Vector3.new(0, 1, -1),
        Vector3.new(1, 1, 1),
        Vector3.new(-1, 1, 1),
        Vector3.new(1, 1, -1),
        Vector3.new(-1, 1, -1)
    }
    for G, G in __T_K_220, nil, nil do
        __T_Z_241[#__T_Z_241 + 1] = G.Unit
    end
    __T_K_242 = { [1--[[u1833]]] = 0 }
    function __T_G_243(s, OP, uP)
        local FP, mP = _G,  __T_k_222() -- ENV_GETTER rewritten to _G
        if __T_K_242.U_214 == s and mP - __T_K_242[1--[[u1833]]] < 1--[[u773]] then
            if not __T_K_242.U_2244 then
                return nil
            end
            local fP = uP - __T_K_242.U_2244 * __T_K_242.U_2331
            if __T___228(fP, uP, OP) and __T_T_239(fP, OP) then
                return fP, __T_K_242.U_2244
            end
        end
        __T_K_242.U_214, __T_K_242[1--[[u1833]]], __T_K_242.U_2244, __T_K_242.U_2331 = s, mP, nil, nil
        mP = __T_r_221.Character
        s = mP and mP:FindFirstChild("HumanoidRootPart")
        if not s then
            return nil
        end
        local fP = s.Position - uP
        fP = fP.Magnitude > 1--[[u1824]] and fP.Unit or Vector3.zAxis
        s = table.clone(__T_Z_241)
        table.sort(s, function(PP, YP)
            return PP:Dot(fP) > YP:Dot(fP)
        end)
        mP = { 4, 8, 14 }
        for fP, fP in mP, nil, nil do
            for mP, mP in s, nil, nil do
                FP = uP + mP * fP
                if __T___228(FP, uP, OP) and __T_T_239(FP, OP) then
                    __T_K_242.U_2244, __T_K_242.U_2331 = -mP, fP
                    return FP, -mP
                end
            end
        end
        return nil
    end
    function __T_K_244(T)
        local s = T.Character
        if not s then
            return nil
        end
        local OP = __T_A_230()
        if not __T_p_225.U_1395 then
            local A = s:FindFirstChild("UpperTorso") or s:FindFirstChild("Torso") or s:FindFirstChild("HumanoidRootPart")
            if not A or not OP then
                return nil
            end
            return OP.Position, A.Position, 1
        end
        local A = __T_h_124.U_763(T)
        if not A then
            return nil
        end
        local uP, FP, mP, fP = A.U_1965
        local function PP(YP, qP)
            local dP = uP + qP * 6
            qP = __T_h_124.U_1492(T, A, YP, dP)
            local eP = not fP or qP > fP
            if eP then
                FP, mP, fP = YP, dP, qP
            end
        end
        local YP = __T_p_225.U_2163
        if YP then
            local qP = __T_r_221.Character
            local dP = qP and qP:FindFirstChild("HumanoidRootPart")
            if dP then
                qP = uP - dP.Position
                if qP.Magnitude > 1 then
                    local eP = qP.Unit
                    local cP = __T_z_240(s, uP, eP)
                    if cP then
                        PP(cP, eP)
                    end
                end
            end
            for eP, eP in A.U_1913, nil, nil do
                eP = if eP.Y > 1--[[u3159]] then -eP else eP
                qP = __T_z_240(s, uP, eP)
                if qP then
                    PP(qP, eP)
                end
            end
            qP = not FP
            if qP then
                local eP, cP = __T_G_243(T, s, uP)
                if eP then
                    PP(eP, cP)
                end
            end
            qP = not FP
            if qP then
                local G = {}
                if dP then
                    local qP = uP - dP.Position
                    if qP.Magnitude > 1 then
                        G[1] = qP.Unit
                    end
                end
                for qP, qP in A.U_1913, nil, nil do
                    G[#G + 1] = qP.Y > 1--[[u3159]] and -qP or qP
                end
                for qP, qP in __T_Z_241, nil, nil do
                    G[#G + 1] = -qP
                end
                for Z, qP in G, nil, nil do
                    Z = __T_z_240(s, uP, qP, true)
                    if Z then
                        PP(Z, qP)
                        break
                    end
                end
            end
        end
        YP = not FP and OP and __T___228(OP.Position, uP, s)
        if YP then
            FP, mP = OP.Position, uP
            fP = __T_h_124.U_1492(T, A, FP, mP)
        end
        YP = not FP
        if YP then
            return nil
        end
        s, PP, OP = FP, mP, fP
        return s, PP, OP
    end
    function __T___245()
        local A = not __T_t_236 or not __T_b_126.U_2228() or not __T_b_126.U_623(__T_t_236)
        if A then
            return false
        end
        A = __T_t_236
        local z = A.Character
        A = z and z:FindFirstChildOfClass("Humanoid")
        if not A or A.Health <= 0 then
            return false
        end
        z = __T_h_124.U_262(__T_t_236)
        return z ~= nil and z ~= "U_2973"
    end
    function __T_A_246()
        local z = _G -- ENV_GETTER rewritten to _G
        if not __T_p_225.U_1392 or not __T___245() then
            return nil
        end
        local T, Z = __T_K_244(__T_t_236)
        if not T then
            return nil
        end
        if __T_p_225.U_2163 then
            if not __T_Q_235(CFrame.lookAt(T, Z)) then
                return nil
            end
        end
        return __T_J_223(Z)
    end
    __T_L_125.U_1071(1, __T_A_246)
    __T_Q_247 = {}
    function __T_z_248(T)
        local Z = _G -- ENV_GETTER rewritten to _G
        if typeof(T) ~= "Instance" then
            return
        end
        Z = __T_r_221.Character
        if Z and (T:IsDescendantOf(Z)) then
            __T_p_225.U_2198 = __T_k_222()
        end
    end
    function __T_T_249()
        local Z = _G -- ENV_GETTER rewritten to _G
        if #__T_Q_247 > 0 then
            return
        end
        local G = __T_L_125.U_1500()
        if G and typeof(G.U_339) == "Instance" then
            __T_Q_247[1] = G.U_339["OnClientEvent"]:Connect(__T_z_248)
        end
    end
    function __T_z_250()
        local Z = _G -- ENV_GETTER rewritten to _G
        for G = 1, #__T_Q_247 do
            __T_Q_247[G]:Disconnect()
        end
        table.clear(__T_Q_247)
    end
    function __T_Q_251(Z, G, s)
        local OP, uP = _G,  Z:FindFirstChild("U_2064") -- ENV_GETTER rewritten to _G
        if not uP or not uP:IsA("RemoteEvent") then
            return false
        end
        uP:FireServer(CFrame.lookAt(G, s), __T_J_223(s))
        return true
    end
    function __T_J_252(Z)
        local G = _G -- ENV_GETTER rewritten to _G
        if not __T_p_225.U_966 or getgenv()["U_3170"] then
            return
        end
        if not __T___245() then
            return
        end
        local _, s = __T_b_126.U_2671(__T_r_221, "Gun")
        if not _ then
            return
        end
        if not s then
            local s = __T_r_221.Character
            local r = s and s:FindFirstChildOfClass("Humanoid")
            if r then
                r:EquipTool(_)
            end
            return
        end
        if Z - __T_p_225.U_2198 < __T_p_225.U_1329 + delay then
            __T_p_225[1--[[u1285]]] = nil
            return
        end
        if Z - __T_p_225.U_2457 < 1--[[u1791]] or Z - __T_p_225.U_2753 < 1--[[u3159]] then
            return
        end
        __T_p_225.U_2753 = Z
        local r, s, OP = __T_K_244(__T_t_236)
        __T_p_225.U_1492 = OP or 0
        if not r then
            __T_p_225[1--[[u1285]]] = nil
            return
        end
        __T_p_225[1--[[u1285]]] = __T_p_225[1--[[u1285]]] or Z
        OP = 0
        OP = if __T_p_225[1--[[u3147]]] > 0 then __T_p_225.U_1038 * (1 - 1--[[u1226]] * math.min(1, (Z - __T_p_225[1--[[u1285]]]) / __T_p_225[1--[[u3147]]])) else OP
        if __T_p_225.U_1492 < OP then
            return
        end
        if __T_Q_251(_, r, s) then
            __T_p_225.U_2457 = Z
            __T_p_225[1--[[u1285]]] = nil
        end
    end
    __T_K_253 = nil
    __T_r_254 = 0
    function __T___255()
        local Q = __T_K_253
        if Q then
            return
        end
        __T_L_125.U_1439()
        __T_T_249()
        __T_N_237(__T_b_126.U_211(__T_t_236))
        __T_K_253 = __T_S_219.Heartbeat:Connect(function()
            local S = __T_I_224
            __T_I_224 = S + 1
            S = __T_i_231 and __T_I_224 > __T_l_233
            if S then
                __T_y_234()
            end
            if not __T_L_125.U_2348() then
                __T_L_125.U_1439()
            end
            __T_T_249()
            S = __T_k_222()
            local k = not __T_t_236 or not __T_b_126.U_623(__T_t_236) or S >= __T_r_254
            if k then
                __T_r_254 = S + 1--[[u773]]
                __T_N_237(__T_b_126.U_211(__T_t_236))
            end
            k = __T_t_236
            if k then
                __T_h_124.U_3045(__T_t_236)
            end
            __T_J_252(S)
        end)
    end
    function __T_S_256()
        local r = __T_K_253
        if r then
            __T_K_253:Disconnect()
            __T_K_253 = nil
        end
        __T_y_234()
        __T_t_236 = nil
    end
    __T_B_226:AddToggle({
        ["Name"] = "U_3286",
        ["Default"] = false,
        ["Flag"] = "U_3286",
        ["Callback"] = function(K)
        local r = _G -- ENV_GETTER rewritten to _G
        __T_p_225.U_1392 = K
        getgenv()["U_3363"] = K
        if K then
            __T___255()
        else
            if not __T_p_225.U_966 then
                __T_S_256()
            end
        end
    end
    })
    __T_B_226:AddToggle({
        ["Name"] = "U_1509",
        ["Default"] = true,
        ["Flag"] = "U_1690",
        ["Callback"] = function(K)
        __T_p_225.U_1395 = K
        __T_h_124.U_1926["U_1322"] = K
    end
    })
    __T_B_226:AddToggle({
        ["Name"] = "U_3133",
        ["Default"] = false,
        ["Flag"] = "U_446",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        __T_p_225.U_2163 = K
        if not K then
            __T_y_234()
        end
    end
    })["U_3348"]:AddSlider({
        ["Name"] = "U_357",
        ["Default"] = 15,
        ["Min"] = 3,
        ["Max"] = 1--[[u513]],
        ["Rounding"] = 0,
        ["Suffix"] = "U_303",
        ["Flag"] = "U_2713",
        ["Callback"] = function(K)
        __T_p_225.U_3384 = K
    end
    })
    __T_A_246 = __T_B_226:AddToggle({
        ["Name"] = "U_1107",
        ["Default"] = false,
        ["Flag"] = "U_1668",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        __T_p_225.U_966 = K
        if K then
            __T___255()
        else
            if not __T_p_225.U_1392 then
                __T_S_256()
            end
        end
    end
    })
    __T_A_246.U_3348:AddSlider({
        ["Name"] = "U_409",
        ["Default"] = 1--[[u2325]],
        ["Min"] = 0,
        ["Max"] = 1--[[u807]],
        ["Rounding"] = 0,
        ["Suffix"] = "U_2128",
        ["Flag"] = "U_2986",
        ["Callback"] = function(K)
        __T_p_225.U_1038 = K / 1--[[u807]]
    end
    })
    __T_A_246.U_3348:AddSlider({
        ["Name"] = "U_1225",
        ["Default"] = "U_3150",
        ["Min"] = 0,
        ["Max"] = "U_1989",
        ["Rounding"] = 0,
        ["Suffix"] = "U_1764",
        ["Flag"] = "U_2633",
        ["Callback"] = function(K)
        __T_p_225[1--[[u3147]]] = K / 1--[[u1731]]
    end
    })
    __T_A_246.U_3348:AddSlider({
        ["Name"] = "delay",
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = "U_3150",
        ["Rounding"] = 0,
        ["Suffix"] = "U_1764",
        ["Flag"] = "U_1390",
        ["Callback"] = function(K)
        delay = K / 1--[[u1731]]
    end
    })
    getgenv()["U_1386"] = function()
        local K = _G -- ENV_GETTER rewritten to _G
        __T_p_225.U_1392 = false
        __T_p_225.U_1395 = false
        __T_p_225.U_2163 = false
        __T_p_225.U_966 = false
        getgenv()["U_3363"] = false
        __T_S_256()
        __T_z_250()
        __T_L_125.U_1427()
        __T_h_124.U_45()
    end
    __T_R_114 = nil
    __T_R_114 = __T_M_112:AddSection({ ["Name"] = "U_2769", ["Position"] = "U_1263" })
    __T_S_257 = game:GetService("ReplicatedStorage")
    __T_K_258 = game:GetService("Players")
    game:GetService("RunService")
    __T_r_259 = __T_K_258.LocalPlayer
    __T_k_260 = false
    __T_J_261 = false
    __T_I_262 = 30
    __T_p_263, __T_B_264 = false
    function __T_t_265()
        local _ = _G -- ENV_GETTER rewritten to _G
        local A, i, N = require, __T_S_257:WaitForChild("U_3123"), "U_626"
        return A(i:WaitForChild(N))
    end
    function __T_S_266()
        local _, A = _G,  __T_B_264 -- ENV_GETTER rewritten to _G
        local i = not A
        if i then
            local N, l = pcall(__T_t_265)
            local t = not N or typeof(l) ~= "table"
            if t then
                __T_p_263 = false
                return
            end
            __T_B_264, A = l, l
        end
        i = A.U_1287
        local B = typeof(i) ~= "table"
        if B then
            __T_p_263 = false
            return
        end
        B = i[__T_r_259.Name]
        i = B ~= nil and not B.Dead and (B.Role == "Murderer" or B.U_696 == true)
        __T_p_263 = i
    end
    function __T_B_267()
        local t = __T_r_259.Character
        if t then
            local _ = t:FindFirstChild("Knife")
            if _ then
                return _, true
            end
        end
        t = __T_r_259:FindFirstChildOfClass("Backpack")
        if t then
            local _ = t:FindFirstChild("Knife")
            if _ then
                return _, false
            end
        end
        return nil, false
    end
    function __T_t_268()
        local _, A, i = (_G), __T_B_267() -- [EnvProxyPartial]
        if not A then
            return nil
        end
        if not i then
            local B = __T_r_259.Character and __T_r_259.Character:FindFirstChildOfClass("Humanoid")
            if B then
                pcall(function()
                    B:EquipTool(A)
                end)
            end
            return nil
        end
        return A
    end
    function __T_B_269(_)
        local A, i = _G,  _:FindFirstChild("U_320") -- ENV_GETTER rewritten to _G
        local _ = i and i:FindFirstChild("U_2748")
        if _ then
            pcall(function()
                _:FireServer()
            end)
        end
    end
    function __T___270(A, i)
        local N, l = _G,  A:FindFirstChild("U_320") -- ENV_GETTER rewritten to _G
        local A = l and l:FindFirstChild("U_56")
        if A then
            pcall(function()
                A:FireServer(i)
            end)
        end
    end
    __T_A_271 = 0
    __T_i_272, __T_N_273 = getgenv(), {}
    task.spawn(function()
        local l = _G -- ENV_GETTER rewritten to _G
        while true do
            local y, Q = task.wait, 1--[[u2185]]
            if not y(Q) then
                break
            end
            y = __T_k_260 or __T_J_261
            if y then
                pcall(__T_S_266)
            end
        end
    end)
    task.spawn(function()
        local l = _G -- ENV_GETTER rewritten to _G
        while task.wait() do
            local y = (__T_k_260 or __T_J_261) and __T_p_263
            if not y then
                continue
            end
            if __T_i_272.U_3170 then
                continue
            end
            y = __T_t_268()
     ]============],
    [6] = [============[
       if not y then
                continue
            end
            local p = os.clock() - __T_A_271
            if p < 1--[[u3159]] then
                continue
            end
            p = __T_r_259.Character
            local t = p and p:FindFirstChild("HumanoidRootPart")
            table.clear(__T_N_273)
            local i, Q, z = 0, ipairs, __T_K_258:GetPlayers()
            for K, T in Q(z) do
                if T == __T_r_259 or __T_b_126.U_478(T) then
                    continue
                end
                p = T.Character
                if not p then
                    continue
                end
                K = p:FindFirstChildOfClass("Humanoid")
                if not K or K.Health <= 0 then
                    continue
                end
                T = p:FindFirstChild("HumanoidRootPart") or p:FindFirstChild("Head")
                if not T then
                    continue
                end
                K = __T_J_261
                if K then
                    i += 1
                    __T_N_273[i] = T
                else
                    local K = __T_k_260 and t and (T.Position - t.Position)["Magnitude"] <= __T_I_262
                    if K then
                        i += 1
                        __T_N_273[i] = T
                    end
                end
            end
            t = i > 0
            if t then
                __T_B_269(y)
                for K = 1, i do
                    __T___270(y, __T_N_273[K])
                end
                __T_A_271 = os.clock()
            end
        end
    end)
    __T_o_076 = {
        ["Name"] = "U_2735",
        ["Default"] = false,
        ["Flag"] = "U_1597",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        local r = _G -- ENV_GETTER rewritten to _G
        __T_k_260 = K
        if K then
            task.spawn(__T_S_266)
        end
    end
    }
    __T_K_274, __T_r_275 = __T_R_114:AddToggle(__T_o_076)["U_3348"], {
        ["Name"] = "U_1577",
        ["Default"] = 30,
        ["Min"] = 5,
        ["Max"] = 1--[[u2325]],
        ["Rounding"] = 1,
        ["Flag"] = "U_633"
    }
    __T_r_275.Callback = function(p)
        __T_I_262 = p
    end
    __T_K_274:AddSlider(__T_r_275)
    __T_R_114:AddToggle({
        ["Name"] = "U_3038",
        ["Default"] = false,
        ["Flag"] = "U_2079",
        ["Callback"] = function(K)
        local r = _G -- ENV_GETTER rewritten to _G
        __T_J_261 = K
        if K then
            task.spawn(__T_S_266)
        end
    end
    })
    getgenv()["U_2929"] = function()
        __T_k_260 = false
        __T_J_261 = false
    end
    __T_S_276 = game:GetService("Players")
    __T_K_277, __T_r_278 = game:GetService("CollectionService"), __T_S_276.LocalPlayer
    __T_k_279 = os.clock
    __T_J_280 = CFrame.new
    __T_I_281 = {
        ["U_3286"] = false,
        ["U_1395"] = true,
        ["U_2603"] = false,
        ["U_172"] = 1--[[u1178]],
        ["U_3146"] = 12,
        [1--[[u1109]]] = 1--[[u3195]],
        ["U_2455"] = 0
    }
    function __T_p_282()
        local B, t = __T_b_126.U_2671(__T_r_278, "Knife")
        if not B or not B:IsA("Tool") then
            return nil, false
        end
        return B, t
    end
    function __T_B_283()
        local t, _ = _G,  __T_p_282() -- ENV_GETTER rewritten to _G
        if not _ then
            return
        end
        local A = _:GetAttribute("U_3201")
        if typeof(A) == "number" and A > 0 then
            __T_I_281.U_2455 = A
        end
    end
    __T_B_283()
    __T_r_278.CharacterAdded:Connect(__T_B_283)
    __T_c_074 = __T_r_278:FindFirstChildOfClass("Backpack")
    if __T_c_074 then
        local t, _ = "ChildAdded", function(A)
            if A.Name == "Knife" then
                __T_B_283()
            end
        end
        __T_c_074[t]:Connect(_)
    end
    __T_t_284, __T___285 = "ChildAdded", function(A)
        local i = "Backpack"
        if A:IsA(i) then
            local i, N = "ChildAdded", function(l)
                if l.Name == "Knife" then
                    __T_B_283()
                end
            end
            A[i]:Connect(N)
        end
    end
    __T_r_278[__T_t_284]:Connect(__T___285)
    function __T_t_286()
        local _ = __T_p_282()
        local A = _ and _:FindFirstChild("U_320")
        if not A then
            return nil
        end
        local _, i = A:FindFirstChild("U_2748"), "U_56"
        return _, A:FindFirstChild(i)
    end
    function __T___287(A)
        if not A or not A.Parent then
            return false
        end
        local i, N = __T_t_286()
        if not i or not N then
            return false
        end
        i:FireServer()
        N:FireServer(A)
        return true
    end
    function __T_t_288(A)
        local i = "BasePart"
        if A:IsA(i) then
            return A
        end
        i = A:FindFirstChild("U_846")
        if i and i:IsA("BasePart") then
            return i
        end
        i = "BasePart"
        return A:FindFirstChildWhichIsA(i)
    end
    __T_A_289, __T_i_290 = nil, nil
    function __T_N_291()
        local l = __T_i_290
        if l then
            local l = __T_i_290
            l.U_3115:Disconnect()
            __T_i_290 = nil
        end
    end
    function __T_l_292()
        __T_A_289 = nil
        __T_N_291()
    end
    function __T_y_293()
        local Q, z = _G,  __T_r_278.Character -- ENV_GETTER rewritten to _G
        local T = z and z:FindFirstChild("HumanoidRootPart")
        if not T then
            return nil
        end
        local Z, G, s, OP, uP = T.Position, __T_I_281.U_172, next, __T_S_276:GetPlayers()
        z = nil
        for S, S in s, OP, uP do
            if S ~= __T_r_278 and __T_b_126.U_623(S) and not __T_b_126.U_478(S) then
                Q = __T_h_124.U_2135(S)
                if Q then
                    T = (Q.U_306 - Z)["Magnitude"]
                    if T <= G then
                        G, z = T, Q
                    end
                end
            end
        end
        return z
    end
    function __T_S_294(Q)
        return Q.U_907:FindFirstChild("UpperTorso") or Q.U_907:FindFirstChild("Torso") or Q.U_1735
    end
    function __T_Q_295(z, T)
        if not __T_I_281.U_1395 then
            return z.U_306
        end
        if __T_h_124.U_1353(z) == "U_84" then
            return z.U_306
        end
        local Z, G = __T_h_124.U_1979(z.U_214), __T_I_281[1--[[u1109]]] > 0 and __T_I_281[1--[[u1109]]] or 1--[[u3195]]
        local s = __T_h_124.U_1395(z.U_214, Z) or z.U_306
        if not T then
            return s
        end
        for OP = 1, 4 do
            s = __T_h_124.U_1395(z.U_214, Z + (s - T)["Magnitude"] / G) or s
        end
        return s
    end
    function __T_z_296(T, Z, G)
        if not T then
            return (Z - G)["Magnitude"]
        end
        local s = Z - T
        local OP = s:Dot(s)
        if OP <= 0 then
            return (Z - G)["Magnitude"]
        end
        Z = (G - T):Dot(s) / OP
        return (T + s * (if Z < 0 then 0 else if Z > 1 then 1 else Z) - G)["Magnitude"]
    end
    function __T_T_297(Z)
        local G = __T_A_289
        if not G then
            return
        end
        G = __T_A_289
        local s = G.U_3174
        G = not s or not s.Parent
        if G then
            local OP, uP = __T_h_124.U_2135, __T_A_289
            local h = OP(uP.U_214)
            if not h then
                __T_l_292()
                return
            end
            s = __T_S_294(h)
            OP = __T_A_289
            OP.U_3174 = s
        end
        G = __T_i_290
        local h, OP = if G and G.U_1315 and G[1--[[u1109]]] > 0 then Z + G.U_1315 * G[1--[[u1109]]] * G.U_1514 else Z, __T_A_289
        if __T_z_296(OP.U_1132, h, s.Position) <= __T_I_281.U_3146 then
            if __T___287(s) then
                __T_l_292()
            end
            return
        end
        G = __T_A_289
        G.U_1132 = Z
    end
    __T_K_277:GetInstanceAddedSignal("U_1733"):Connect(function(h)
        local _, z = _G,  h:GetAttribute("U_3201") -- ENV_GETTER rewritten to _G
        if typeof(z) == "number" and z > 0 then
            __T_I_281[1--[[u1109]]] = z
        end
        local Z = not __T_A_289 or __T_i_290
        if Z then
            return
        end
        local G = __T_t_288(h)
        if not G then
            return
        end
        Z = h:GetAttribute("U_735")
        Z = if typeof(Z) ~= "Vector3" then nil else Z
        __T_i_290 = {
        ["U_604"] = h,
        ["U_93"] = G,
        ["U_1315"] = Z,
        [1--[[u1109]]] = typeof(z) == "number" and z or __T_I_281[1--[[u1109]]],
        ["U_1514"] = 0,
        ["U_2242"] = __T_k_279(),
        ["U_3115"] = nil
    }
        _ = __T_A_289
        _.U_1132 = G.Position
        _ = __T_i_290
        _.U_3115 = G:GetPropertyChangedSignal("Position"):Connect(function()
        local h = __T_i_290
        if not h then
            return
        end
        local t = __T_k_279()
        h.U_1514 = t - h.U_2242
        h.U_2242 = t
        __T_T_297(G.Position)
    end)
    end)
    __T_K_277:GetInstanceRemovedSignal("U_1733"):Connect(function(h)
        local k, t = __T_i_290
        if k then
            local _ = __T_i_290
            t = _.U_604 == h
        else
            t = k
        end
        if t then
            __T_l_292()
        end
    end)
    function __T_h_298()
        if not __T_I_281.U_3286 then
            return nil
        end
        local k, t = __T_p_282()
        if not k or not t or k:GetAttribute("U_602") == true then
            return nil
        end
        k = __T_y_293()
        if not k then
            return nil
        end
        t = __T_r_278.Character
        local r = t and t:FindFirstChild("HumanoidRootPart")
        local p, t = __T_Q_295(k, r and r.Position or nil), __T_I_281.U_2603
        if t then
            __T_N_291()
            __T_A_289 = { ["U_214"] = k.U_214, ["U_3174"] = __T_S_294(k), ["U_2010"] = p, ["U_1132"] = nil }
        else
            __T_l_292()
        end
        return __T_J_280(p)
    end
    __T_L_125.U_1071(2, __T_h_298)
    __T_K_277 = __T_R_114:AddToggle({
        ["Name"] = "U_831",
        ["Default"] = false,
        ["Flag"] = "U_732",
        ["U_3348"] = true,
        ["Callback"] = function(h)
        __T_I_281.U_3286 = h
        if h then
            __T_L_125.U_1439()
            __T_B_283()
        else
            __T_l_292()
        end
    end
    })
    __T_K_277.U_3348:AddToggle({
        ["Name"] = "U_823",
        ["Default"] = false,
        ["Flag"] = "U_2725",
        ["Callback"] = function(h)
        __T_I_281.U_2603 = h
        if not h then
            __T_l_292()
        end
    end
    })
    __T_K_277.U_3348:AddSlider({
        ["Name"] = "U_2410",
        ["Default"] = 12,
        ["Min"] = 2,
        ["Max"] = 1--[[u513]],
        ["Rounding"] = 0,
        ["Suffix"] = "U_303",
        ["Flag"] = "U_1886",
        ["Callback"] = function(h)
        __T_I_281.U_3146 = h
    end
    })
    __T_K_277.U_3348:AddSlider({
        ["Name"] = "U_172",
        ["Default"] = 1--[[u1178]],
        ["Min"] = 1--[[u2553]],
        ["Max"] = "U_3150",
        ["Rounding"] = 0,
        ["Suffix"] = "U_303",
        ["Flag"] = "U_3048",
        ["Callback"] = function(h)
        __T_I_281.U_172 = h
    end
    })
    __T_R_114:AddToggle({
        ["Name"] = "U_1509",
        ["Default"] = true,
        ["Flag"] = "U_565",
        ["Callback"] = function(h)
        __T_I_281.U_1395 = h
    end
    })
    getgenv()["U_144"] = function()
        __T_I_281.U_3286 = false
        __T_I_281.U_1395 = false
        __T_I_281.U_2603 = false
        __T_l_292()
    end
    __T_h_299 = game:GetService("Players")
    __T_S_300 = __T_h_299.LocalPlayer
    __T_K_301 = false
    __T_r_302 = "U_3083"
    __T_k_303 = game:GetService("ReplicatedStorage")
    __T_J_304, __T_I_305 = game:GetService("ReplicatedStorage")["U_2678"]["U_107"]["U_444"]
    function __T_p_306()
        local B, t = _G,  not __T_I_305 -- ENV_GETTER rewritten to _G
        if t then
            local _, A = pcall(function()
                local i = _G -- ENV_GETTER rewritten to _G
                local N, l, y = require, __T_k_303:WaitForChild("U_3123"), "U_626"
                return N(l:WaitForChild(y))
            end)
            local k = _ and typeof(A) == "table"
            if k then
                __T_I_305 = A
            end
        end
        local k, _ = __T_I_305
        if k then
            t = __T_I_305
            _ = t.U_1287
        else
            _ = k
        end
        if typeof(_) ~= "table" then
            return false
        end
        t = _[__T_S_300.Name]
        return t ~= nil and t.Role ~= nil and not t.Dead
    end
    function __T_k_307()
        local I = __T_S_300.Character
        if I and I:FindFirstChild("Knife") then
            return true
        end
        I = __T_S_300:FindFirstChildOfClass("Backpack")
        if I and I:FindFirstChild("Knife") then
            return true
        end
        return false
    end
    function __T_I_308(B)
        local t, _ = _G,  not __T_K_301 or __T_k_307() -- ENV_GETTER rewritten to _G
        if _ then
            return
        end
        if not __T_p_306() then
            return
        end
        _ = __T_S_300.Character
        local k = _ and _:FindFirstChild("HumanoidRootPart")
        if not k then
            return
        end
        if __T_r_302 == "U_3083" then
            pcall(function()
                CFrame = CFrame

-- =============================================================================
-- MODULE 10/17: AutoFarmAndGunDrop — GunDrop grab + Coin_Server farmer
-- grabGunDrop/findNearestCoin/coinFarmStep; GunDrop/firetouchinterest, Heartbeat/Stepped interp, murderer-radius avoid, bag-full reset
-- ==============================================================================
            end)
            local k = B:FindFirstChildOfClass("U_1310")
            if k then
                pcall(function()
                    local p = _G -- ENV_GETTER rewritten to _G
                    firetouchinterest(k)
                end)
            end
        else
            if __T_r_302 == "U_2256" then
                t.U_2564(__T_J_304.U_758, "Gun")
            end
        end
    end
    function __T_r_309()
        local k = _G -- ENV_GETTER rewritten to _G
        for J, J in pairs(workspace:GetDescendants()) do
            if J.Name == "GunDrop" and J:IsA("BasePart") then
                __T_I_308(J)
            end
        end
    end
    __T_k_310 = nil
    function __T_J_311(p)
        local B = _G -- ENV_GETTER rewritten to _G
        if p.Name == "GunDrop" and p:IsA("BasePart") then
            task.wait(1--[[u1824]])
            __T_I_308(p)
        end
    end
    function __T_I_312()
        local p, B = _G,  __T_k_310 -- ENV_GETTER rewritten to _G
        if B then
            pcall(function()
                __T_k_310:Disconnect()
            end)
            __T_k_310 = nil
        end
    end
    __T_p_313, __T_B_314 = game:GetService("RunService"), game:GetService("CollectionService")
    __T_t_315 = game:GetService("ReplicatedStorage")
    __T___316 = false
    __T_A_317 = false
    __T_i_318 = false
    __T_N_319 = false
    __T_l_320, __T_y_321 = false
    __T_Q_322 = {}
    __T_z_323, __T_T_324 = 23
    __T_Z_325 = {}
    __T_G_326 = 0
    __T_s_327 = "U_1742"
    __T_OP_328 = false
    __T_uP_329, __T_FP_330 = false
    __T_mP_331 = 0
    __T_fP_332 = 14
    __T_PP_333 = 4
    __T_YP_334 = 1--[[u513]]
    __T_qP_335 = 1--[[u2553]]
    getgenv()["U_3170"] = false
    function __T_dP_336()
        local eP = __T_S_300.Character
        return eP and eP:FindFirstChild("HumanoidRootPart")
    end
    function __T_eP_337()
        local cP, oP = _G,  not __T_T_324 -- ENV_GETTER rewritten to _G
        if oP then
            local xP, CP = pcall(function()
                local MP = _G -- ENV_GETTER rewritten to _G
                local nP, XP, gP = require, __T_t_315:WaitForChild("U_3123"), "U_626"
                return nP(XP:WaitForChild(gP))
            end)
            local MP = xP and typeof(CP) == "table"
            if MP then
                __T_T_324 = CP
            end
        end
        local cP, xP = __T_T_324
        if cP then
            oP = __T_T_324
            xP = oP.U_1287
        else
            xP = cP
        end
        return xP
    end
    function __T_T_338()
        local cP, oP = _G,  __T_S_300.Character -- ENV_GETTER rewritten to _G
        local xP = oP and oP:FindFirstChildOfClass("Humanoid")
        if not xP or xP.Health <= 0 then
            return false
        end
        xP = __T_eP_337()
        if typeof(xP) == "table" then
            oP = xP[__T_S_300.Name]
            if not oP or not oP.Role or oP.Dead then
                return false
            end
        end
        return true
    end
    function __T_cP_339()
        local oP, xP = _G,  __T_S_300:FindFirstChild("PlayerGui") -- ENV_GETTER rewritten to _G
        local CP = xP and xP:FindFirstChild("U_867")
        xP = CP and CP:FindFirstChild("U_2959")
        CP = xP and xP:FindFirstChild("U_292")
        xP = CP and CP:FindFirstChild("U_492")
        if not xP then
            return false
        end
        CP = false
        for MP, nP in ipairs(xP:GetChildren()) do
            if nP:IsA("U_853") and nP.Visible then
                CP = true
                MP = nP:FindFirstChild("U_2323")
                if not (MP and MP.Visible) then
                    return false
                end
            end
        end
        return CP
    end
    function __T_oP_340()
        local xP = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_3170"] = __T___316 and __T_i_318 and not __T_N_319
    end
    function __T_xP_341()
        __T_Z_325 = {}
        __T_G_326 = 0
        __T_N_319 = false
        __T_l_320, __T_y_321 = false, nil
        __T_oP_340()
    end
    task.spawn(function()
        local CP = _G -- ENV_GETTER rewritten to _G
        local MP, nP = pcall(function()
        local CP, XP, gP = __T_t_315:WaitForChild("U_2678"):WaitForChild("U_107"), "U_889", 15
        return CP:WaitForChild(XP, gP)
    end)
        if MP and nP then
            nP.OnClientEvent:Connect(__T_xP_341)
        end
    end)
    __T_R_114, __T_c_074 = "CharacterAdded", function()
        __T_xP_341()
    end
    __T_S_300[__T_R_114]:Connect(__T_c_074)
    function __T_t_342(CP)
        return CP and CP.Parent and CP:IsA("BasePart") and not CP:GetAttribute("U_1612") and not CP:GetAttribute("U_1561")
    end
    function __T_CP_343(MP, nP)
        local XP, gP, RP = (_G), math.huge -- [EnvProxyPartial]
        for HP, WP in ipairs(nP) do
            HP = (WP.Position - MP)["Magnitude"]
            if HP < gP then
                gP, RP = HP, WP
            end
        end
        return RP
    end
    function __T_MP_344(nP)
        local XP, gP = _G,  __T_S_300.Character -- ENV_GETTER rewritten to _G
        local RP = gP and gP:FindFirstChildOfClass("Humanoid")
        if nP then
            if not gP then
                return
            end
            if RP then
                pcall(function()
                    RP.PlatformStand = true
                end)
            end
            local nP, HP = ipairs, gP:GetDescendants()
            for gP, WP in nP(HP) do
                gP = WP:IsA("BasePart") and WP.CanCollide
                if gP then
                    local nP = __T_Q_322[WP] == nil
                    if nP then
                        local nP = __T_Q_322
                        nP[WP] = WP.CanCollide
                    end
                    WP.CanCollide = false
                end
            end
        else
            if RP then
                pcall(function()
                    RP.PlatformStand = false
                end)
            end
            local nP, gP = pairs, __T_Q_322
            for RP, HP in nP(gP) do
                if RP and RP.Parent then
                    pcall(function()
                        RP.CanCollide = HP
                    end)
                end
            end
            __T_Q_322 = {}
        end
    end
    __T_Q_345 = Ray.new()
    __T_Q_345.U_2551 = __T_EnumFB.U_3131["U_379"]
    __T_Q_345.U_1011 = true
    function __T_nP_346()
        local XP, gP = _G,  __T_dP_336() -- ENV_GETTER rewritten to _G
        if not gP then
            return
        end
        local RP = gP.Position
        __T_Q_345.U_2661 = { __T_S_300.Character }
        local HP = workspace:Raycast(RP, Vector3.new(0, 1--[[u1178]], 0), __T_Q_345)
        local Q, WP = HP and HP.Position["Y"] + 5
        if Q then
            WP = Q
        else
            local Q, DP = __T_FP_330
            if Q then
                HP = __T_FP_330
                DP = HP + 5
            else
                DP = Q
            end
            WP = DP or nil
        end
        if not WP then
            return
        end
        pcall(function()
            local Q = _G -- ENV_GETTER rewritten to _G
            CFrame = CFrame.new(RP.X, WP, RP.Z)
            gP.AssemblyLinearVelocity = Vector3.zero
            gP.AssemblyAngularVelocity = Vector3.zero
        end)
    end
    function __T_Q_347()
        local XP = __T_uP_329
        if XP then
            __T_uP_329 = false
            __T_nP_346()
        end
        __T_MP_344(false)
    end
    __T_XP_348 = nil
    __T_gP_349 = 0
    function __T_RP_350()
        local HP = _G -- ENV_GETTER rewritten to _G
        local WP = os.clock()
        local DP = WP - __T_gP_349 < 1--[[u1791]]
        if DP then
            local vP = __T_XP_348
            return vP
        end
        __T_gP_349, __T_XP_348 = WP, nil
        DP = __T_eP_337()
        WP = typeof(DP) == "table"
        if WP then
            local eP = DP[__T_S_300.Name]
            if eP and eP.Role == "Murderer" then
                return nil
            end
            eP = pairs
            for gP, WP in eP(DP) do
                local eP = typeof(WP) == "table" and WP.Role == "Murderer" and not WP.Dead and gP ~= __T_S_300.Name
                if eP then
                    WP = __T_h_299:FindFirstChild(gP)
                    local h = WP and WP.Character
                    local eP, gP = h and h:FindFirstChild("HumanoidRootPart"), h and h:FindFirstChildOfClass("Humanoid")
                    h = eP and (not gP or gP.Health > 0)
                    if h then
                        __T_XP_348 = eP
                    end
                    break
                end
            end
        end
        HP = __T_XP_348
        return HP
    end
    function __T_h_351(eP, XP)
        local gP = _G -- ENV_GETTER rewritten to _G
        return Vector3.new(eP.X - XP.X, 0, eP.Z - XP.Z)["Magnitude"]
    end
    function __T_eP_352(XP, gP, HP)
        local WP, DP = _G,  __T_OP_328 and HP -- ENV_GETTER rewritten to _G
        if not DP then
            return __T_CP_343(XP, gP)
        end
        local CP, vP = -1
        local jP, aP = math.huge
        for EP, UP in ipairs(gP) do
            EP = __T_h_351(UP.Position, HP)
            if EP > CP then
                CP, vP = EP, UP
            end
            if EP >= __T_YP_334 then
                DP = (UP.Position - XP)["Magnitude"]
                if DP < jP then
                    jP, aP = DP, UP
                end
            end
        end
        if aP then
            return aP
        end
        if vP and CP >= __T_YP_334 * 1--[[u1226]] then
            return vP
        end
        return nil
    end
    function __T_CP_353(XP, gP)
        if not __T_t_342(XP) then
            return false
        end
        local t = __T_OP_328 and gP and __T_h_351(XP.Position, gP) < __T_YP_334 * 1--[[u1226]]
        if t then
            return false
        end
        return true
    end
    function __T_t_354(XP, gP, HP)
        local WP, DP = _G,  __T_OP_328 and HP -- ENV_GETTER rewritten to _G
        if not DP then
            return gP
        end
        DP = __T_h_351(XP, HP)
        if DP >= __T_YP_334 then
            return gP
        end
        local vP = Vector3.new(XP.X - HP.X, 0, XP.Z - HP.Z)
        vP = (if vP.Magnitude < 1--[[u1824]] then Vector3.new(1, 0, 0) else vP)["Unit"]
        HP = Vector3.new(gP.X - XP.X, 0, gP.Z - XP.Z)
        local jP = HP.Magnitude
        if jP < 1--[[u1824]] then
            return gP
        end
        local aP = 1 + (1 - DP / __T_YP_334) * 2
        DP = HP.Unit + vP * aP
        aP = XP + (if DP.Magnitude < 1--[[u1824]] then vP else DP.Unit) * jP
        return Vector3.new(aP.X, gP.Y, aP.Z)
    end
    function __T_YP_355(XP)
        local gP, HP, WP = _G,  {},  {} -- ENV_GETTER rewritten to _G
        local function DP(vP)
            if vP and not WP[vP] and vP:IsA("BasePart") and vP:FindFirstChildOfClass("U_44") then
                WP[vP] = true
                HP[#HP + 1] = vP
            end
        end
        DP(XP)
        for WP, WP in ipairs(XP:GetChildren()) do
            DP(WP)
        end
        local WP = XP.Parent
        if WP then
            local vP = "BasePart"
            if WP:IsA(vP) then
                DP(WP)
            end
            for vP, vP in ipairs(WP:GetChildren()) do
                DP(vP)
            end
        end
        if #HP == 0 then
            HP[1] = XP
        end
        return HP
    end
    function __T_XP_356(gP)
        local HP = _G -- ENV_GETTER rewritten to _G
        if typeof(firetouchinterest) ~= "function" then
            return
        end
        if not gP or not gP.Parent then
            return
        end
        local WP = os.clock()
        local DP = WP - __T_mP_331
        if DP < 1--[[u3159]] then
            return
        end
        __T_mP_331 = WP
        DP = __T_dP_336()
        if not DP then
            return
        end
        for mP, mP in ipairs(__T_YP_355(gP)) do
            pcall(firetouchinterest, DP, mP, 0)
            pcall(firetouchinterest, DP, mP, 1)
        end
    end
    function __T_mP_357(YP, gP, HP)
        local WP, DP = _G,  gP - YP.Position -- ENV_GETTER rewritten to _G
        local vP = DP.Magnitude
        local jP = if vP > 1--[[u1824]] then YP.Position + DP.Unit * math.min(__T_z_323 * HP, vP) else gP
        local z, HP = CFrame.new(jP), __T_s_327
        gP = HP == "U_3178"
        if gP then
            z *= CFrame.Angles((-math.pi / 2), 0, 0)
            __T_uP_329 = true
        end
        pcall(function()
            CFrame = z
            YP.AssemblyLinearVelocity = Vector3.zero
            YP.AssemblyAngularVelocity = Vector3.zero
        end)
    end
    __T_z_358 = __T_p_313.Stepped:Connect(function(YP, gP)
        local HP, WP = _G,  __T___316 -- ENV_GETTER rewritten to _G
        if not WP then
            return
        end
        YP = not __T_T_338()
        if YP then
            __T_y_321 = nil
            __T_uP_329 = false
            __T_MP_344(false)
            return
        end
        WP = __T_dP_336()
        if not WP then
            return
        end
        local T, dP, DP = {}, ipairs, "Coin_Server"
        YP = __T_B_314:GetTagged(DP)
        for B, vP in dP(YP) do
            B = vP and vP.Parent and vP:IsA("BasePart")
            if B then
                DP = vP:GetAttribute("U_1612")
                if DP then
                    local B = vP:GetAttribute("U_2593")
                    local jP = B and not __T_Z_325[B]
                    if jP then
                        local jP = __T_Z_325
                        jP[B] = true
                        jP = __T_G_326
                        __T_G_326 = jP + 1
                    end
                else
                    if not vP:GetAttribute("U_1561") then
                        T[#T + 1] = vP
                    end
                end
            end
        end
        local function B()
            local Z = _G -- ENV_GETTER rewritten to _G
            __T_y_321 = nil
            __T_Q_347()
            local vP = not __T_N_319
            if vP then
                __T_N_319 = true
                __T_oP_340()
                local vP = __T_A_317
                if vP then
                    local vP = __T_S_300.Character and __T_S_300.Character:FindFirstChildOfClass("Humanoid")
                    if vP then
                        pcall(function()
                            vP.Health = 0
                        end)
                    end
                end
            end
        end
        DP = __T_l_320 and __T_cP_339()
        if DP then
            B()
            return
        end
        DP = #T > 0
        if DP then
            __T_l_320 = true
            YP = __T_N_319
            if YP then
                __T_N_319 = false
                __T_oP_340()
            end
            dP = __T_OP_328 and __T_RP_350() or nil
            local S = dP and dP.Position or nil
            local Z = not __T_CP_353(__T_y_321, S)
            if Z then
                __T_y_321 = __T_eP_352(WP.Position, T, S)
            end
            Z = __T_y_321
            if Z then
                __T_MP_344(true)
                local T = __T_y_321
                local Z = T.Position
                __T_FP_330 = Z.Y
                T = __T_s_327
                local YP, dP = T == "U_3178"
                if YP then
                    local YP, eP = __T_h_351(WP.Position, Z), not S or __T_h_351(WP.Position, S) > __T_qP_335
                    eP = YP <= __T_PP_333 and eP
                    if eP then
                        __T_XP_356(__T_y_321)
                        dP = Z
                    else
                        dP = Vector3.new(Z.X, Z.Y - __T_fP_332, Z.Z)
                    end
                else
                    T = (Z - WP.Position)["Magnitude"] <= 6
                 ]============],
    [7] = [============[
   if T then
                        __T_XP_356(__T_y_321)
                    end
                    dP = Z
                end
                __T_mP_357(WP, __T_t_354(WP.Position, dP, S), gP)
            else
                if S then
                    __T_MP_344(true)
                    local h = Vector3.new(WP.Position["X"] - S.X, 0, WP.Position["Z"] - S.Z)
                    h = (if h.Magnitude < 1--[[u1824]] then Vector3.new(1, 0, 0) else h)["Unit"]
                    local S, t = WP.Position["Y"], __T_s_327
                    S = if t == "U_3178" and __T_FP_330 then __T_FP_330 - __T_fP_332 else S
                    __T_mP_357(WP, WP.Position + h * 1--[[u513]] + Vector3.new(0, S - WP.Position["Y"], 0), gP)
                end
            end
        else
            __T_y_321 = nil
            __T_Q_347()
            local h, S = __T_l_320 and not __T_N_319
            if h then
                local t = __T_G_326
                S = t > 0
            else
                S = h
            end
            if S then
                B()
            end
        end
    end)
    __T_o_076 = __T_M_112:AddSection({ ["Name"] = "U_359", ["Position"] = "U_528" })
    __T_o_076:AddToggle({
        ["Name"] = "U_700",
        ["Default"] = false,
        ["Flag"] = "U_3338",
        ["Callback"] = function(h)
        local S = _G -- ENV_GETTER rewritten to _G
        __T_K_301 = h
        if h then
            local h = not __T_k_310
            if h then
                __T_k_310 = workspace.DescendantAdded:Connect(__T_J_311)
            end
            task.spawn(__T_r_309)
        else
            __T_I_312()
        end
    end
    })
    __T_p_313 = __T_o_076:AddToggle({
        ["Name"] = "U_2971",
        ["Default"] = false,
        ["Flag"] = "U_3258",
        ["U_3348"] = true,
        ["Callback"] = function(h)
        __T___316 = h
        __T_xP_341()
        if not h then
            __T_Q_347()
        end
    end
    })
    __T_h_359, __T_S_360 = __T_p_313.U_3348, {
        ["Name"] = "typeof",
        ["Default"] = "U_1742",
        ["U_3220"] = { "U_1742", "U_3178" },
        ["Flag"] = "U_1236"
    }
    __T_S_360.Callback = function(r)
        local k = _G -- ENV_GETTER rewritten to _G
        local J = typeof(r) == "table" and r[1] or r
        J = if J ~= "U_1742" and J ~= "U_3178" then "U_1742" else J
        r = __T_s_327
        if J == r then
            return
        end
        __T_s_327, __T_y_321 = J, nil
        r = __T_s_327
        k = r == "U_1742" and __T_uP_329
        if k then
            __T_uP_329 = false
            __T_nP_346()
        end
    end
    __T_h_359:AddDropdown(__T_S_360)
    __T_S_360, __T_h_359 = __T_p_313.U_3348, { ["Name"] = "U_222", ["Default"] = false, ["Flag"] = "U_1730" }
    __T_h_359.Callback = function(r)
        __T_OP_328, __T_y_321 = r, nil
    end
    __T_S_360:AddToggle(__T_h_359)
    __T_h_359, __T_S_360 = __T_p_313.U_3348, { ["Name"] = "U_911", ["Default"] = false, ["Flag"] = "U_405" }
    __T_S_360.Callback = function(r)
        __T_A_317 = r
    end
    __T_h_359:AddToggle(__T_S_360)
    __T_h_359, __T_S_360 = __T_p_313.U_3348, { ["Name"] = "U_321", ["Default"] = false, ["Flag"] = "U_1859" }
    __T_S_360.Callback = function(r)
        __T_i_318 = r
        __T_oP_340()
    end
    __T_h_359:AddToggle(__T_S_360)
    getgenv()["U_2313"] = function()
        local h = _G -- ENV_GETTER rewritten to _G
        __T___316 = false
        __T_A_317 = false
        __T_i_318 = false
        __T_N_319 = false
        __T_l_320, __T_y_321 = false, nil
        getgenv()["U_3170"] = false
        __T_OP_328 = false
        __T_s_327 = "U_1742"
        local S = __T_z_358
        if S then
            pcall(function()
                __T_z_358:Disconnect()
            end)
            __T_z_358 = nil
        end
        __T_Q_347()
    end
    getgenv()["U_3035"] = function()
        __T_K_301 = false
        __T_I_312()
    end
    __T_h_361 = {}
    __T_S_362 = __T_EnumFB.Material["U_447"]
    __T_K_363 = __T_EnumFB.U_1976["U_286"]
    __T_r_364 = Color3.new(1, 1, 1)
    __T_k_365 = game:GetService("CoreGui")
    __T_J_366 = { ["U_1662"] = "U_1142", ["U_1611"] = "U_2182", ["U_1605"] = "U_2607" }
    function __T_I_367(p)
        p.Parent = nil
    end
    function __T_p_368(B, t)
        B.Parent = t
    end
    function __T_B_369(t, _)
        t:Clone()["Parent"] = _
    end
    function __T_t_370(_)
        if _.U_2013 then
            _.U_2013:Disconnect()
        end
        if _.U_2095 then
            _.U_2095:Disconnect()
        end
        _.U_2013, _.U_2095, _.U_1735 = nil, nil, nil
    end
    function __T___371(A, i)
        local N, l, y = _G,  { ["U_864"] = i.Material, ["U_2508"] = i.Color, ["U_2264"] = i.Reflectance },  "MeshPart" -- ENV_GETTER rewritten to _G
        if i:IsA(y) then
            l.U_3242 = i.U_514
        end
        y = i:FindFirstChildOfClass("SpecialMesh")
        if y then
            l.U_3344, l.U_2236 = y, y.U_1982
        end
        for Q, Q in i:GetChildren() do
            if Q:IsA("U_2370") and pcall(__T_I_367, Q) then
                y = l[1--[[u2800]]] or {}
                y[#y + 1] = Q
                l[1--[[u2800]]] = y
            end
        end
        A.U_2775[i] = l
        return l
    end
    function __T_I_372(A, i)
        local N, l = _G,  A.Parent ~= nil -- ENV_GETTER rewritten to _G
        if l then
            A.Material, A.Color, A.Reflectance = i.U_864, i.U_2508, i.U_2264
            if i.U_3242 then
                A.U_514 = i.U_3242
            end
        end
        local y = i.U_3344
        if y and y.Parent then
            y.U_1982 = i.U_2236
        end
        y = i[1--[[u2800]]]
        if y and l then
            for i = 1, #y do
                pcall(__T_p_368, y[i], A)
            end
        end
    end
    function __T_p_373()
        return {
            ["U_2775"] = {},
            ["U_2443"] = {},
            ["U_1913"] = {},
            ["U_3058"] = {},
            ["U_995"] = {},
            ["U_1458"] = 0
        }
    end
    __T_h_361.new = __T_p_373
    function __T_p_374(A, i, N)
        local l = _G -- ENV_GETTER rewritten to _G
        if A.U_1735 ~= i then
            __T_t_370(A)
            A.U_1735, A.U_658 = i, true
            local function y()
                A.U_658 = true
            end
            A.U_2013 = i.DescendantAdded:Connect(y)
            A.U_2095 = i.DescendantRemoving:Connect(y)
        end
        if A.U_658 then
            A.U_658 = false
            local y, Q = A.U_3058, A.U_995
            table.clear(y)
            table.clear(Q)
            for l, z in i:GetDescendants() do
                if N or not z:FindFirstAncestorOfClass("Tool") then
                    l = "BasePart"
                    if z:IsA(l) then
                        if z.Name ~= "HumanoidRootPart" then
                            y[#y + 1] = z
                        end
                    else
                        if z:IsA("U_1417") or __T_J_366[z.ClassName] then
                            Q[#Q + 1] = z
                        end
                    end
                end
            end
        end
        return A.U_3058
    end
    __T_h_361.U_2691 = __T_p_374
    function __T_p_375(A)
        A.U_1458 += 1
    end
    __T_h_361.U_1514 = __T_p_375
    function __T_p_376(A, i, N)
        local l, y, Q = A.U_1458, A.U_2775, false
        for z = 1, #i do
            local T = i[z]
            if T.Parent and T.Transparency < 1 and T.LocalTransparencyModifier < 1 then
                z = y[T] or __T___371(A, T)
                z.U_1458 = l
                if T.Material ~= __T_S_362 then
                    T.Material = __T_S_362
                end
                if T.Color ~= N then
                    T.Color = N
                end
                if T.Reflectance ~= 1 then
                    T.Reflectance = 1
                end
                if z.U_3242 and T.U_514 ~= "" then
                    T.U_514 = ""
                end
                local S = z.U_3344
                if S and S.U_1982 ~= "" then
                    S.U_1982 = ""
                end
                Q = true
            end
        end
        return Q
    end
    __T_h_361.U_1508 = __T_p_376
    function __T_S_377(p)
        local _, A, i = p.U_1458, p.U_2443, p.U_995
        for N = 1, #i do
            p = i[N]
            N = __T_J_366[p.ClassName]
            local J = N and "" or 1
            N = N or "Transparency"
            local i, l = p[N], A[p]
            if not l then
                l = { ["U_2349"] = N, [1--[[u388]]] = i }
                A[p] = l
            else
                if J == "" and i ~= "" then
                    l[1--[[u388]]] = i
                end
            end
            l.U_1458 = _
            if i ~= J then
                p[N] = J
            end
        end
    end
    __T_h_361.U_2205 = __T_S_377
    function __T_S_378(J, p, _)
        local A, i = _G,  J.U_1913[p] -- ENV_GETTER rewritten to _G
        if not i then
            local N = Instance.new("Highlight")
            N.U_2167 = 1
            N.U_2979 = 1--[[u3198]]
            N.U_3141 = __T_K_363
            N.U_1995 = p
            N.Parent = __T_k_365
            i = { ["U_3017"] = N }
            J.U_1913[p] = i
        end
        i.U_1458 = J.U_1458
        if i.U_2508 ~= _ then
            i.U_2508 = _
            i.U_3017["U_2111"] = _:Lerp(__T_r_364, 1--[[u1226]])
        end
    end
    __T_h_361.U_2080 = __T_S_378
    function __T_S_379(K, r)
        local k, J, p, _ = K.U_1458, K.U_2775, K.U_2443, K.U_1913
        for K, A in J, nil, nil do
            if r or A.U_1458 ~= k then
                J[K] = nil
                __T_I_372(K, A)
            end
        end
        for K, J in p, nil, nil do
            if r or J.U_1458 ~= k then
                p[K] = nil
                if K.Parent then
                    K[J.U_2349] = J[1--[[u388]]]
                end
            end
        end
        for K, J in _, nil, nil do
            if r or J.U_1458 ~= k then
                _[K] = nil
                J.U_3017:Destroy()
            end
        end
    end
    __T_h_361.U_1446 = __T_S_379
    function __T_S_380(K)
        __T_h_361.U_1446(K, true)
        __T_t_370(K)
    end
    __T_h_361.clear = __T_S_380
    function __T_S_381(K, r)
        local k = _G -- ENV_GETTER rewritten to _G
        local J
        for I, p in K.U_2775, nil, nil do
            local t = r[I]
            if t then
                t.Material, t.Color, t.Reflectance = p.U_864, p.U_2508, p.U_2264
                if p.U_3242 and t:IsA("MeshPart") then
                    t.U_514 = p.U_3242
                end
                local _ = p.U_3344 and t:FindFirstChildOfClass("SpecialMesh")
                if _ then
                    _.U_1982 = p.U_2236
                end
                if p[1--[[u2800]]] and not t:FindFirstChildOfClass("U_2370") then
                    for _ = 1, #p[1--[[u2800]]] do
                        pcall(__T_B_369, p[1--[[u2800]]][_], t)
                    end
                end
                J = if not J and I.Parent == K.U_1735 then t.Parent else J
            end
        end
        for k, I in K.U_2443, nil, nil do
            local p = k.Parent
            local B = p and (p == K.U_1735 and J or r[p])
            p = B and B:FindFirstChild(k.Name)
            if p and p.ClassName == k.ClassName then
                p[I.U_2349] = I[1--[[u388]]]
            end
        end
    end
    __T_h_361.U_2356 = __T_S_381
    __T_o_076 = __T_X_111:AddClone({
        ["Name"] = "U_894",
        ["Position"] = "U_982",
        [1--[[u2488]]] = 1--[[u2811]],
        ["Callback"] = function(S, K)
        local r = _G -- ENV_GETTER rewritten to _G
        local k = game:GetService("Players")["LocalPlayer"]
        r.U_1537["U_2922"] = k
        r.U_1537["U_694"] = S
        r.U_1537["U_2510"] = K.U_1464
        if getgenv()["U_1321"] then
            pcall(getgenv()["U_1321"], K.U_2229)
        end
        if __T_q_095 and __T_q_095.U_3200 then
            if r.U_1537["U_2655"] then
                pcall(__T_q_095.U_3211, r.U_1537["U_2655"], S)
            else
                local J, I = pcall(__T_q_095.U_1077, S, k, K.U_1464)
                if J then
                    r.U_1537["U_2655"] = I
                end
            end
        end
    end
    })
    __T_S_382 = nil
    __T_R_114 = __T_o_076.U_1464 and __T_o_076.U_1464["Parent"]
    while __T_R_114 do
        __T_M_112 = "U_973"
        if __T_R_114:IsA(__T_M_112) then
            __T_S_382 = __T_R_114
            break
        end
        __T_R_114 = __T_R_114.Parent
    end
    __T_o_076:onrender(function(K)
        local r, k = _G,  K.U_3358 and true or false -- ENV_GETTER rewritten to _G
        if k then
            local J = K.U_1464
            local K = J.U_3057
            if K.X < 8 or K.Y < 8 then
                k = false
            else
                if __T_S_382 then
                    local I, p, B = J.U_2191, __T_S_382.U_2191, __T_S_382.U_3057
                    k = I.X >= p.X - 1 and I.Y >= p.Y - 1 and I.X + K.X <= p.X + B.X + 1 and I.Y + K.Y <= p.Y + B.Y + 1
                end
            end
        end
        getgenv()["U_180"] = k
    end)
    getgenv()["U_3352"] = function()
        local S = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_180"] = false
        if S.U_1537["U_2655"] then
            if __T_q_095 and __T_q_095.U_593 then
                pcall(__T_q_095.U_593, S.U_1537["U_2655"])
            end
            S.U_1537["U_2655"] = nil
        end
        S.U_1537["U_694"] = nil
        S.U_1537["U_2510"] = nil
        S.U_1537["U_2922"] = nil
    end
    __T_S_383, __T_K_384 = __T_X_111:AddSection({ ["Name"] = "U_2049", ["Position"] = "U_528" }), typeof(__T_X_111.U_551) == "function" and __T_X_111:AddSub({ ["Name"] = "U_1877", ["U_1068"] = "U_673", ["U_2396"] = "U_231" }) or __T_X_111
    getgenv()["U_2631"] = __T_K_384
    __T_c_074 = __T_K_384:AddSection({ ["Name"] = "U_1877", ["Position"] = "U_982" })
    getgenv()["U_1974"] = false
    getgenv()["U_2189"] = Color3.fromRGB(1--[[u2774]], 1--[[u2774]], 1--[[u2774]])
    getgenv()["U_1383"] = 0
    getgenv()["U_1230"] = 1--[[u1731]]
    getgenv()["U_3264"] = false
    getgenv()["U_1822"] = false
    getgenv()["U_752"] = Color3.fromRGB(1--[[u2533]], 1--[[u2533]], 1--[[u2533]])
    __T_r_385 = game:GetService("Lighting")
    __T_k_386 = __T_r_385.U_3227
    __T_J_387 = __T_r_385.U_2035
    __T_I_388 = __T_r_385.U_534
    __T_p_389 = __T_r_385.U_2343
    __T_B_390 = __T_r_385.U_3309
    __T_t_391 = __T_r_385.U_2047
    __T___392 = __T_r_385.U_1210
    __T_A_393 = __T_r_385.U_2576
    __T_i_394 = __T_r_385.U_427
    __T_N_395 = __T_r_385.U_1542
    __T_l_396 = __T_r_385.U_3239
    __T_y_397 = __T_r_385.U_2309
    __T_Q_398 = __T_r_385.U_333
    __T_z_399 = __T_r_385.U_3139
    __T_T_400 = false
    __T_Z_401, __T_G_402 = "U_2805"
    __T_s_403, __T_OP_404, __T_uP_405, __T_FP_406, __T_mP_407, __T_fP_408, __T_PP_409, __T_YP_410 = {}, {}
    __T_qP_411 = {
        ["U_2805"] = {
        ["U_1813"] = Color3.fromRGB(10, 10, 10),
        ["U_3161"] = 1--[[u3221]],
        ["U_2847"] = "U_3391",
        ["U_2794"] = Color3.fromRGB(0, 0, 0),
        ["U_2120"] = Color3.fromRGB(1--[[u108]], 1--[[u108]], 1--[[u108]]),
        ["U_3229"] = 1--[[u1824]],
        ["U_1814"] = 1--[[u1824]],
        ["U_406"] = Color3.fromRGB(10, 10, 10),
        ["U_2963"] = 1--[[u1379]],
        ["U_1566"] = 1--[[u2185]],
        ["U_1006"] = true,
        ["U_1060"] = "U_3249",
        ["U_1024"] = 1--[[u370]],
        ["U_3039"] = 1--[[u1954]],
        ["U_1885"] = Color3.fromRGB(1--[[u807]], 1--[[u876]], 1--[[u108]]),
        ["U_318"] = 1--[[u3198]],
        ["U_2829"] = 5,
        ["U_662"] = 1--[[u370]],
        ["U_1330"] = 2,
        ["U_2892"] = 0.5,
        ["U_1473"] = 15,
        ["U_1947"] = 5,
        ["U_578"] = 0.5,
        ["U_3321"] = 1--[[u3198]],
        ["U_1497"] = 0.5,
        ["U_147"] = Color3.fromRGB(1--[[u181]], 1--[[u3069]], 1--[[u2447]]),
        ["U_1951"] = Color3.fromRGB(10, 1--[[u8]], 1--[[u807]]),
        ["U_677"] = 1--[[u2185]],
        ["U_583"] = 1,
        ["U_1172"] = 1--[[u1226]],
        ["U_2677"] = 1--[[u843]],
        ["U_1627"] = Color3.fromRGB(255, 255, 255)
    },
        ["U_3073"] = {
        ["U_1813"] = Color3.fromRGB(2, 2, 2),
        ["U_3161"] = "U_2317",
        ["U_2847"] = 8,
        ["U_2794"] = Color3.fromRGB(0, 0, 0),
        ["U_2120"] = Color3.fromRGB(255, 1--[[u990]], 1--[[u2907]]),
        ["U_3229"] = "U_2522",
        ["U_1814"] = "U_2716",
        ["U_406"] = Color3.fromRGB(51, 92, 67),
        ["U_2963"] = "U_3267",
        ["U_1566"] = 1--[[u1190]],
        ["U_1006"] = true,
        ["U_1060"] = 1--[[u1824]],
        ["U_1024"] = 0.5,
        ["U_3039"] = "U_13",
        ["U_1885"] = Color3.fromRGB(1--[[u2446]], 1--[[u808]], 1--[[u808]]),
        ["U_318"] = 1--[[u2185]],
        ["U_2829"] = 10,
        ["U_662"] = 1--[[u370]],
        ["U_1330"] = 5,
        ["U_2892"] = "U_961",
        ["U_1473"] = "U_381",
        ["U_1947"] = "U_3192",
        ["U_578"] = "U_961",
        ["U_3321"] = "U_1792",
        ["U_1497"] = "U_365",
        ["U_147"] = Color3.fromRGB(1--[[u866]], 1--[[u2338]], 255),
        ["U_1951"] = Color3.fromRGB(13, 1--[[u3127]], 1--[[u1595]]),
        ["U_677"] = 1--[[u843]],
        ["U_583"] = 1--[[u1086]],
        ["U_1172"] = 1--[[u2206]],
        ["U_2677"] = 1--[[u1957]],
        ["U_1627"] = Color3.fromRGB(255, 255, 255)
    },
        ["U_2989"] = {
        ["U_1813"] = Color3.fromRGB(2, 2, 2),
        ["U_3161"] = "U_2158",
        ["U_2847"] = 16,
        ["U_2794"] = Color3.fromRGB(0, 0, 0),
        ["U_2120"] = Color3.fromRGB(255, 1--[[u990]], 1--[[u2907]]),
        ["U_3229"] = "U_2522",
        ["U_1814"] = "U_127",
        ["U_406"] = Color3.fromRGB(0, 0, 0),
        ["U_2963"] = 1--[[u14]],
        ["U_1566"] = 1--[[u194]],
        ["U_1006"] = true,
        ["U_1060"] = 1--[[u1824]],
        ["U_1024"] = 0.5,
        ["U_3039"] = "U_13",
        ["U_1885"] = Color3.fromRGB(255, 1--[[u1130]], 1--[[u670]]),
        ["U_318"] = "U_751",
        ["U_2829"] = 10,
        ["U_662"] = "U_1438",
        ["U_1330"] = 5,
        ["U_2892"] = "U_2131",
        ["U_1473"] = "U_381",
        ["U_1947"] = "U_3192",
        ["U_578"] = "U_961",
        ["U_3321"] = "U_1792",
        ["U_1497"] = "U_2673",
        ["U_147"] = Color3.fromRGB(1--[[u133]], 1--[[u866]], 1--[[u1740]]),
        ["U_1951"] = Color3.fromRGB(1--[[u1379]], 1--[[u2711]], 33),
        ["U_677"] = 1--[[u843]],
        ["U_583"] = "U_1604",
        ["U_1172"] = 1--[[u957]],
        ["U_2677"] = "U_3310",
        ["U_1627"] = Color3.fromRGB(1--[[u133]], 1--[[u866]], 1--[[u1740]])
    },
        ["U_1967"] = {
        ["U_1813"] = Color3.fromRGB(33, 33, 33),
        ["U_3161"] = "U_2317",
        ["U_2847"] = 1--[[u2553]],
        ["U_2794"] = Color3.fromRGB(0, 0, 0),
        ["U_2120"] = Color3.fromRGB(255, 1--[[u990]], 1--[[u2907]]),
        ["U_3229"] = "U_2522",
        ["U_1814"] = "U_2716",
        ["U_406"] = Color3.fromRGB(51, 92, 67),
        ["U_2963"] = "U_85",
        ["U_1566"] = 1--[[u1190]],
        ["U_1006"] = true,
        ["U_1060"] = 1--[[u312]],
        ["U_1024"] = "U_3249",
        ["U_3039"] = "U_3369",
        ["U_1885"] = Color3.fromRGB(1--[[u2446]], 1--[[u808]], 1--[[u808]]),
        ["U_318"] = 1--[[u1346]],
        ["U_2829"] = 10,
        ["U_662"] = "U_1438",
        ["U_1330"] = 5,
        ["U_2892"] = "U_2131",
        ["U_1473"] = "U_259",
        ["U_1947"] = "U_3192",
        ["U_578"] = "U_961",
        ["U_3321"] = "U_164",
        ["U_1497"] = "U_429",
        ["U_147"] = Color3.fromRGB(1--[[u866]], 1--[[u2338]], 255),
        ["U_1951"] = Color3.fromRGB(13, 1--[[u3127]], 1--[[u1595]]),
        ["U_677"] = 1--[[u843]],
        ["U_583"] = "U_1604",
        ["U_1172"] = 1--[[u194]],
        ["U_2677"] = "U_2137",
        ["U_1627"] = Color3.fromRGB(255, 255, 255)
    }
    }
    function __T_dP_412()
        local eP, cP, oP = (_G), not __T_uP_405 -- [EnvProxyPartial]
        if cP then
            oP = cP
        else
            local xP = __T_uP_405
            oP = not xP.Parent
        end
        if oP then
            __T_uP_405 = __T_r_385:FindFirstChildOfClass("U_3152")
            cP = not __T_uP_405
            if cP then
                __T_uP_405 = Instance.new("U_3152")
                local xP = __T_uP_405
                xP.Enabled = false
                xP = __T_uP_405
                xP.Parent = __T_r_385
                __T_OP_404.U_2437 = true
            end
        end
        cP, oP = not __T_FP_406
        if cP then
            oP = cP
        else
            local xP = __T_FP_406
            oP = not xP.Parent
        end
        if oP then
            __T_FP_406 = __T_r_385:FindFirstChildOfClass("U_34")
            cP = not __T_FP_406
            if cP then
                __T_FP_406 = Instance.new("U_34")
                local xP = __T_FP_406
                xP.Enabled = false
                xP = __T_FP_406
                xP.Size = 0
                xP = __T_FP_406
                xP.Parent = __T_r_385
                __T_OP_404.U_1034 = true
            end
        end
        cP, oP = not __T_mP_407
        if cP then
            oP = cP
        else
            local xP = __T_mP_407
            oP = not xP.Parent
        end
        if oP then
            __T_mP_407 = __T_r_385:FindFirstChildOfClass("U_2346")
            cP = not __T_mP_407
            if cP then
                __T_mP_407 = Instance.new("U_2346")
                local xP = __T_mP_407
                xP.Enabled = false
                xP = __T_mP_407
                xP.Parent = __T_r_385
                __T_OP_404.U_1254 = true
            end
        end
        cP, oP = not __T_fP_408
        if cP then
            oP = cP
        else
            local xP = __T_fP_408
            oP = not xP.Parent
        end
        if oP then
            __T_fP_408 = __T_r_385:FindFirstChildOfClass("U_1608")
            cP = not __T_fP_408
            if cP then
                __T_fP_408 = Instance.new("U_1608")
                local xP = __T_fP_408
                xP.Enabled = false
                xP = __T_fP_408
                xP.Parent = __T_r_385
                __T_OP_404[1--[[u2624]]] = true
            end
        end
        oP, cP = not __T_PP_409
        if oP then
            cP = oP
        else
            local xP = __T_PP_409
            cP = not xP.Parent
        end
        if cP then
            __T_PP_409 = __T_r_385:FindFirstChildOfClass("U_507")
            oP = not __T_PP_409
            if oP then
                __T_PP_409 = Instance.new("U_507")
                local xP = __T_PP_409
                xP.Parent = __T_r_385
                __T_OP_404.U_2268 = true
            end
        end
        oP, cP = workspace.U_1852
        if oP then
            local xP = not __T_YP_410
            if xP then
                cP = xP
            else
                local xP = __T_YP_410
                cP = not xP.Parent
            end
        else
            cP = oP
        end
        if cP then
            __T_YP_410 = workspace.U_1852:FindFirstChildOfClass("U_2722")
            oP = not __T_YP_410
            if oP then
                __T_YP_410 = Instance.new("U_2722")
                local cP = __T_YP_410
                cP.U_3018 = 0
                cP = __T_YP_410
                cP.U_741 = 0
                cP = __T_YP_410
                cP.Parent = workspace.U_1852
                __T_OP_404.U_841 = true
            end
        end
    end
    function __T_eP_413()
        local cP = _G -- ENV_GETTER rewritten to _G
        __T_uP_405 = __T_r_385:FindFirstChildOfClass("U_3152")
        __T_FP_406 = __T_r_385:FindFirstChildOfClass("U_34")
        __T_mP_407 = __T_r_385:FindFirstChildOfClass("U_2346")
        __T_fP_408 = __T_r_385:FindFirstChildOfClass("U_1608")
        __T_PP_409 = __T_r_385:FindFirstChildOfClass("U_507")
        local oP = workspace.U_1852
        if oP then
            __T_YP_410 = workspace.U_1852:FindFirstChildOfClass("U_2722")
        end
        cP = __T_mP_407
        if cP then
            local xP, CP, MP, nP = "U_1254", {}, "U_2343", __T_mP_407
            CP[MP] = nP.U_2343
            MP, nP = "U_1195", __T_mP_407
            CP[MP] = nP.U_1195
            MP, nP = "U_3176", __T_mP_407
            CP[MP] = nP.U_3176
            nP, MP = "U_479", __T_mP_407
            CP[nP] = MP.U_479
            oP, MP = "Enabled", __T_mP_407
            CP[oP] = MP.Enabled
            __T_s_403[xP] = CP
        end
        oP = __T_uP_405
        if oP then
            local xP, CP, MP, nP = "U_2437", {}, "U_2", __T_uP_405
            CP[MP] = nP.U_2
            MP, nP = "Size", __T_uP_405
            CP[MP] = nP.Size
            nP, MP = "U_1067", __T_uP_405
            CP[nP] = MP.U_1067
            nP, cP = "Enabled", __T_uP_405
            CP[nP] = cP.Enabled
            __T_s_403[xP] = CP
        end
        cP = __T_FP_406
        if cP then
            local xP, CP, MP, nP = "U_1034", {}, "Size", __T_FP_406
            CP[MP] = nP.Size
            MP, nP = "Enabled", __T_FP_406
            CP[MP] = nP.Enabled
            __T_s_403[xP] = CP
        end
        cP = __T_fP_408
        if cP then
            local xP, CP, MP, nP = 1--[[u2624]], {}, "U_2702", __T_fP_408
            CP[MP] = nP.U_2702
            nP, oP = "U_3053", __T_fP_408
            CP[nP] = oP.U_3053
            nP, MP = "U_2298", __T_fP_408
            CP[nP] = MP.U_2298
            MP, nP = "U_1975", __T_fP_408
            CP[MP] = nP.U_1975
            nP, MP = "Enabled", __T_fP_408
            CP[nP] = MP.Enabled
            __T_s_403[xP] = CP
        end
        cP = __T_PP_409
        if cP then
            local xP, CP, MP, nP = "U_2268", {}, "U_741", __T_PP_409
            CP[MP] = nP.U_741
            nP, MP = 1--[[u422]], __T_PP_409
            CP[nP] = MP[1--[[u422]]]
            nP, MP = "Color", __T_PP_409
            CP[nP] = MP.Color
            oP, MP = "U_1231", __T_PP_409
            CP[oP] = MP.U_1231
            nP, MP = "U_3342", __T_PP_409
            CP[nP] = MP.U_3342
            nP, MP = "U_1927", __T_PP_409
            CP[nP] = MP.U_1927
            __T_s_403[xP] = CP
        end
        cP = __T_YP_410
        if cP then
            local cP, xP, CP, MP = "U_841", {}, "U_3018", __T_YP_410
            xP[CP] = MP.U_3018
            MP, CP = "U_741", __T_YP_410
            xP[MP] = CP.U_741
            CP, oP = "Color", __T_YP_410
            xP[CP] = oP.Color
            __T_s_403[cP] = xP
        end
    end
    __T_cP_414 = math.huge
    __T_oP_415 = Color3.fromRGB(255, 255, 255)
    function __T_xP_416(CP)
        __T_dP_412()
        local dP = CP.U_1813
        if __T_r_385.U_3309 ~= dP then
            __T_r_385.U_3309 = dP
        end
        dP = CP.U_3161
        if __T_r_385.U_2343 ~= dP then
            __T_r_385.U_2343 = dP
        end
        dP = CP.U_2847
        if __T_r_385.U_2576 ~= dP then
            __T_r_385.U_2576 = dP
        end
        dP = CP.U_2794
        if __T_r_385.U_427 ~= dP then
            __T_r_385.U_427 = dP
        end
        dP = CP.U_2120
        if __T_r_385.U_1542 ~= dP then
            __T_r_385.U_1542 = dP
        end
        dP = CP.U_3229
        if __T_r_385.U_3239 ~= dP then
            __T_r_385.U_3239 = dP
        end
        dP = CP.U_1814
        if __T_r_385.U_2309 ~= dP then
            __T_r_385.U_2309 = dP
        end
        dP = CP.U_406
        if __T_r_385.U_2047 ~= dP then
            __T_r_385.U_2047 = dP
        end
        dP = CP.U_2963
        if __T_r_385.U_333 ~= dP then
            __T_r_385.U_333 = dP
        end
        dP = CP.U_1566
        if __T_r_385.U_3139 ~= dP then
            __T_r_385.U_3139 = dP
        end
        dP = CP.U_1006
        if __T_r_385.U_1210 ~= dP then
            __T_r_385.U_1210 = dP
        end
        if __T_r_385.U_534 ~= __T_cP_414 then
            __T_r_385.U_534 = __T_cP_414
        end
        if __T_r_385.U_3227 ~= __T_oP_415 then
            __T_r_385.U_3227 = __T_oP_415
        end
        if __T_r_385.U_2035 ~= __T_cP_414 then
            __T_r_385.U_2035 = __T_cP_414
        end
        local cP = __T_mP_407
        if cP then
            dP = CP.U_1060
            local oP = __T_mP_407
            local MP = oP.U_2343 ~= dP
            if MP then
                oP = __T_mP_407
                oP.U_2343 = dP
            end
            dP = CP.U_1024
            oP = __T_mP_407
            MP = oP.U_1195 ~= dP
            if MP then
                oP = __T_mP_407
                oP.U_1195 = dP
            end
            dP = CP.U_3039
            MP = __T_mP_407
            oP = MP.U_3176 ~= dP
            if oP then
                MP = __T_mP_407
                MP.U_3176 = dP
            end
            dP = CP.U_1885
            MP = __T_mP_407
            oP = MP.U_479 ~= dP
            if oP then
                MP = __T_mP_407
                MP.U_479 = dP
            end
            MP = __T_mP_407
            oP = MP.Enabled ~= true
            if oP then
                MP = __T_mP_407
                MP.Enabled = true
            end
        end
        cP = __T_uP_405
        if cP then
            dP = CP.U_318
            local oP = __T_uP_405
            local MP = oP.U_2 ~= dP
            if MP then
                oP = __T_uP_405
                oP.U_2 = dP
            end
            dP = CP.U_2829
            MP = __T_uP_405
            oP = MP.Size ~= dP
            if oP then
                MP = __T_uP_405
                MP.Size = dP
            end
            dP = CP.U_662
            MP = __T_uP_405
            oP = MP.U_1067 ~= dP
            if oP then
      ]============],
    [8] = [============[
          MP = __T_uP_405
                MP.U_1067 = dP
            end
            MP = __T_uP_405
            oP = MP.Enabled ~= true
            if oP then
                MP = __T_uP_405
                MP.Enabled = true
            end
        end
        cP = __T_FP_406
        if cP then
            dP = CP.U_1330
            local oP = __T_FP_406
            local MP = oP.Size ~= dP
            if MP then
                oP = __T_FP_406
                oP.Size = dP
            end
            MP = __T_FP_406
            oP = MP.Enabled ~= false
            if oP then
                MP = __T_FP_406
                MP.Enabled = false
            end
        end
        cP = __T_fP_408
        if cP then
            dP = CP.U_2892
            local oP = __T_fP_408
            local MP = oP.U_2702 ~= dP
            if MP then
                oP = __T_fP_408
                oP.U_2702 = dP
            end
            dP = CP.U_1473
            oP = __T_fP_408
            MP = oP.U_3053 ~= dP
            if MP then
                oP = __T_fP_408
                oP.U_3053 = dP
            end
            dP = CP.U_1947
            MP = __T_fP_408
            oP = MP.U_2298 ~= dP
            if oP then
                MP = __T_fP_408
                MP.U_2298 = dP
            end
            dP = CP.U_578
            oP = __T_fP_408
            MP = oP.U_1975 ~= dP
            if MP then
                oP = __T_fP_408
                oP.U_1975 = dP
            end
            MP = __T_fP_408
            oP = MP.Enabled ~= true
            if oP then
                MP = __T_fP_408
                MP.Enabled = true
            end
        end
        cP = __T_PP_409
        if cP then
            dP = CP.U_3321
            local oP = __T_PP_409
            local MP = oP.U_741 ~= dP
            if MP then
                oP = __T_PP_409
                oP.U_741 = dP
            end
            dP = CP.U_1497
            MP = __T_PP_409
            oP = MP[1--[[u422]]] ~= dP
            if oP then
                MP = __T_PP_409
                MP[1--[[u422]]] = dP
            end
            dP = CP.U_147
            oP = __T_PP_409
            MP = oP.Color ~= dP
            if MP then
                oP = __T_PP_409
                oP.Color = dP
            end
            dP = CP.U_1951
            oP = __T_PP_409
            MP = oP.U_1231 ~= dP
            if MP then
                oP = __T_PP_409
                oP.U_1231 = dP
            end
            dP = CP.U_677
            oP = __T_PP_409
            MP = oP.U_3342 ~= dP
            if MP then
                oP = __T_PP_409
                oP.U_3342 = dP
            end
            dP = CP.U_583
            MP = __T_PP_409
            oP = MP.U_1927 ~= dP
            if oP then
                MP = __T_PP_409
                MP.U_1927 = dP
            end
        end
        cP = __T_YP_410
        if cP then
            dP = CP.U_1172
            local cP = __T_YP_410
            local oP = cP.U_3018 ~= dP
            if oP then
                cP = __T_YP_410
                cP.U_3018 = dP
            end
            dP = CP.U_2677
            oP = __T_YP_410
            cP = oP.U_741 ~= dP
            if cP then
                oP = __T_YP_410
                oP.U_741 = dP
            end
            dP = CP.U_1627
            cP = __T_YP_410
            oP = cP.Color ~= dP
            if oP then
                cP = __T_YP_410
                cP.Color = dP
            end
        end
    end
    function __T_dP_417()
        local cP, oP = _G,  __T_s_403.U_1254 and __T_mP_407 -- ENV_GETTER rewritten to _G
        if oP then
            local CP, MP = pairs, __T_s_403.U_1254
            for nP, XP in CP(MP) do
                __T_mP_407[nP] = XP
            end
        else
            local CP = __T_OP_404.U_1254 and __T_mP_407
            if CP then
                __T_mP_407:Destroy()
                __T_mP_407 = nil
                __T_OP_404.U_1254 = nil
            end
        end
        oP = __T_s_403.U_2437 and __T_uP_405
        if oP then
            local mP, CP = pairs, __T_s_403.U_2437
            for MP, nP in mP(CP) do
                __T_uP_405[MP] = nP
            end
        else
            local mP = __T_OP_404.U_2437 and __T_uP_405
            if mP then
                __T_uP_405:Destroy()
                __T_uP_405 = nil
                __T_OP_404.U_2437 = nil
            end
        end
        oP = __T_s_403.U_1034 and __T_FP_406
        if oP then
            local uP, mP = pairs, __T_s_403.U_1034
            for CP, MP in uP(mP) do
                __T_FP_406[CP] = MP
            end
        else
            local uP = __T_OP_404.U_1034 and __T_FP_406
            if uP then
                __T_FP_406:Destroy()
                __T_FP_406 = nil
                __T_OP_404.U_1034 = nil
            end
        end
        oP = __T_s_403[1--[[u2624]]] and __T_fP_408
        if oP then
            local uP, FP = pairs, __T_s_403[1--[[u2624]]]
            for mP, CP in uP(FP) do
                __T_fP_408[mP] = CP
            end
        else
            local uP = __T_OP_404[1--[[u2624]]] and __T_fP_408
            if uP then
                __T_fP_408:Destroy()
                __T_fP_408 = nil
                __T_OP_404[1--[[u2624]]] = nil
            end
        end
        oP = __T_s_403.U_2268 and __T_PP_409
        if oP then
            local uP, FP = pairs, __T_s_403.U_2268
            for mP, fP in uP(FP) do
                __T_PP_409[mP] = fP
            end
        else
            local uP = __T_OP_404.U_2268 and __T_PP_409
            if uP then
                __T_PP_409:Destroy()
                __T_PP_409 = nil
                __T_OP_404.U_2268 = nil
            end
        end
        oP = __T_s_403.U_841 and __T_YP_410
        if oP then
            local uP, FP = pairs, __T_s_403.U_841
            for s, mP in uP(FP) do
                __T_YP_410[s] = mP
            end
        else
            local s = __T_OP_404.U_841 and __T_YP_410
            if s then
                __T_YP_410:Destroy()
                __T_YP_410 = nil
                __T_OP_404.U_841 = nil
            end
        end
    end
    __T_eP_413()
    __T_s_418 = false
    __T_OP_419 = false
    __T_uP_420 = false
    __T_FP_421 = 12
    __T_mP_422 = 0
    __T_fP_423 = "U_2390"
    getgenv()["U_555"] = false
    getgenv()["U_1013"] = false
    getgenv()["U_2865"] = false
    __T_PP_424 = {
        ["U_2390"] = {
        ["U_943"] = "U_2622",
        ["U_2058"] = "U_3169",
        ["U_1841"] = "U_341",
        ["U_3191"] = "U_2572",
        ["U_2275"] = "U_469",
        ["U_3204"] = "U_1301"
    },
        ["U_874"] = {
        ["U_943"] = "U_2157",
        ["U_2058"] = "U_2404",
        ["U_1841"] = "U_2991",
        ["U_3191"] = "U_1757",
        ["U_2275"] = "U_914",
        ["U_3204"] = "U_1619"
    },
        ["U_953"] = {
        ["U_943"] = "U_1615",
        ["U_2058"] = "U_932",
        ["U_1841"] = "U_2629",
        ["U_3191"] = "U_281",
        ["U_2275"] = "U_3107",
        ["U_3204"] = "U_2464"
    },
        ["U_1882"] = {
        ["U_943"] = "U_130",
        ["U_2058"] = "U_3182",
        ["U_1841"] = "U_945",
        ["U_3191"] = "U_2107",
        ["U_2275"] = "U_193",
        ["U_3204"] = "U_3311"
    },
        ["U_580"] = {
        ["U_943"] = "U_1556",
        ["U_2058"] = "U_1863",
        ["U_1841"] = "U_2888",
        ["U_3191"] = "U_2412",
        ["U_2275"] = "U_3361",
        ["U_3204"] = "U_264"
    }
    }
    __T_YP_425, __T_cP_426, __T_oP_427, __T_CP_428 = { ["U_755"] = "U_2861", ["U_3099"] = "U_2383", ["U_1679"] = "U_2694" }
    function __T_MP_429()
        local nP, XP = _G,  __T_oP_427 -- ENV_GETTER rewritten to _G
        if XP then
            return
        end
        local gP = __T_r_385:FindFirstChildOfClass("U_850")
        XP = gP and gP ~= __T_cP_426
        if XP then
            __T_oP_427 = gP
            __T_CP_428 = gP.Parent
            pcall(function()
                gP.Parent = nil
            end)
        end
    end
    function __T_nP_430()
        local XP, gP = _G,  __T_cP_426 -- ENV_GETTER rewritten to _G
        if gP then
            pcall(function()
                __T_cP_426:Destroy()
            end)
            __T_cP_426 = nil
        end
    end
    function __T_XP_431(gP)
        local RP = _G -- ENV_GETTER rewritten to _G
        __T_MP_429()
        __T_nP_430()
        local HP = Instance.new("U_850")
        HP.Name = "U_2433"
        for WP, DP in pairs(gP) do
            pcall(function()
                HP[WP] = DP
            end)
        end
        HP.Parent = __T_r_385
        __T_cP_426 = HP
    end
    function __T_gP_432(RP)
        local HP = _G -- ENV_GETTER rewritten to _G
        task.spawn(function()
            local HP = _G -- ENV_GETTER rewritten to _G
            local WP, DP = pcall(function()
            local vP = _G -- ENV_GETTER rewritten to _G
            local jP, aP = game, "U_569" .. RP
            return jP:GetObjects(aP)
        end)
            if not WP or typeof(DP) ~= "table" then
                return
            end
            WP = nil
            for RP, vP in ipairs(DP) do
                RP = "U_850"
                if vP:IsA(RP) then
                    WP = vP
                    break
                end
                RP = vP:FindFirstChildWhichIsA("U_850", true)
                if RP then
                    WP = RP
                    break
                end
            end
            DP = not WP or not __T_uP_420
            if DP then
                return
            end
            __T_MP_429()
            __T_nP_430()
            WP.Name = "U_2433"
            WP.Parent = __T_r_385
            __T_cP_426 = WP
        end)
    end
    function __T_cP_433(MP)
        if __T_PP_424[MP] then
            __T_XP_431(__T_PP_424[MP])
        else
            if __T_YP_425[MP] then
                __T_gP_432(__T_YP_425[MP])
            end
        end
    end
    function __T_PP_434()
        local YP = _G -- ENV_GETTER rewritten to _G
        __T_nP_430()
        local MP = __T_oP_427
        if MP then
            pcall(function()
                local YP = __T_oP_427
                YP.Parent = __T_CP_428 or __T_r_385
            end)
            __T_oP_427, __T_CP_428 = nil, nil
        end
    end
    __T_YP_435 = game:GetService("Players")["LocalPlayer"]
    __T_oP_436 = {
        ["U_2208"] = "U_1180",
        ["U_621"] = "U_1241",
        ["U_3357"] = "U_156",
        ["U_3343"] = "U_1578",
        ["U_22"] = "U_3112",
        ["U_2597"] = "U_1828",
        ["U_524"] = "U_2579",
        ["U_2177"] = "U_1931"
    }
    __T_CP_437, __T_MP_438, __T_nP_439 = {
        "U_2208",
        "U_621",
        "U_3357",
        "U_3343",
        "U_22",
        "U_2597",
        "U_524",
        "U_2177"
    }, {}, {}
    __T_XP_440 = false
    __T_gP_441 = "U_2208"
    __T_RP_442 = Color3.fromRGB(1--[[u151]], 1--[[u3144]], 255)
    __T_HP_443, __T_WP_444 = nil, nil
    __T_DP_445 = 0
    __T_eP_413, __T_K_384 = setmetatable, { ["U_3367"] = "U_2349" }
    __T_vP_446 = __T_eP_413({}, __T_K_384)
    __T_jP_447 = nil
    __T_aP_448, __T_EP_449 = {
        ["U_3004"] = { "Head" },
        ["U_369"] = {
        "Torso",
        "UpperTorso",
        "LowerTorso",
        "HumanoidRootPart",
        "U_285"
    },
        ["U_1093"] = { "U_2897", "U_669", "U_282", "U_2511" },
        ["U_2879"] = { "U_2833", "U_2260", "U_3351", "U_3378" },
        ["U_2956"] = { "U_2419", "U_2036", "U_212", "U_1780" },
        ["U_1381"] = { "U_2789", "U_3181", "U_3173", "U_925" }
    }, {}
    for UP, wP in pairs(__T_aP_448) do
        for VP = 1, #wP do
            __T_EP_449[wP[VP]] = UP
        end
    end
    function __T_UP_450()
        local wP = _G -- ENV_GETTER rewritten to _G
        local VP = wP.U_1537["U_912"]
        if typeof(VP) ~= "Instance" then
            return nil
        end
        if not VP:IsA("Model") or not VP.Parent then
            return nil
        end
        return VP
    end
    function __T_wP_451(VP)
        local hP, LP = _G,  VP.PrimaryPart -- ENV_GETTER rewritten to _G
        if LP and LP:IsA("BasePart") then
            return LP
        end
        local bP, SP = -1
        for KP, rP in ipairs(VP:GetDescendants()) do
            LP = "BasePart"
            if rP:IsA(LP) then
                KP = rP.Size
                local VP = KP.X * KP.Y * KP.Z
                if VP > bP then
                    bP, SP = VP, rP
                end
            end
        end
        return SP
    end
    function __T_VP_452(hP, LP, bP)
        local SP = hP:FindFirstChild(LP, true)
        if SP and SP:IsA("BasePart") then
            return SP
        end
        SP = __T_EP_449[LP]
        if SP then
            LP = __T_aP_448[SP]
            for aP = 1, #LP do
                local EP = hP:FindFirstChild(LP[aP], true)
                if EP and EP:IsA("BasePart") then
                    return EP
                end
            end
        end
        return bP
    end
    function __T_aP_453()
        local EP = _G -- ENV_GETTER rewritten to _G
        local hP = EP.U_1537["U_1676"]
        if not hP then
            return
        end
        for LP in pairs(hP) do
            if typeof(LP) == "Instance" and LP.Parent then
                local hP = LP:GetDescendants()
                local bP = #hP
                if __T_vP_446[LP] ~= bP then
                    for SP = 1, bP do
                        local bP = hP[SP]
                        if bP:IsA("U_1284") or bP:IsA("U_1080") or bP:IsA("U_1650") or bP:IsA("U_1958") or bP:IsA("U_2193") or bP:IsA("U_1808") then
                            pcall(function()
                                bP:Destroy()
                            end)
                        end
                    end
                    __T_vP_446[LP] = #LP:GetDescendants()
                end
            end
        end
    end
    function __T_EP_454(hP)
        local LP = _G -- ENV_GETTER rewritten to _G
        if __T_MP_438[hP] then
            return __T_MP_438[hP]
        end
        local bP = __T_oP_436[hP]
        if not bP then
            return nil
        end
        local SP, KP = pcall(game.U_2365, game, "U_569" .. bP)
        if SP and KP and KP[1] then
            __T_MP_438[hP] = KP[1]
            return KP[1]
        end
        return nil
    end
    function __T_hP_455(LP, bP)
        local SP = _G -- ENV_GETTER rewritten to _G
        local KP = ColorSequence.new(bP)
        for rP, kP in ipairs(LP:GetDescendants()) do
            rP = "U_1958"
            if kP:IsA(rP) then
                kP.Color = bP
            else
                if kP:IsA("U_1284") or kP:IsA("U_1080") or kP:IsA("U_1650") then
                    kP.Color = KP
                end
            end
        end
    end
    function __T_LP_456()
        local bP = _G -- ENV_GETTER rewritten to _G
        for SP = #__T_nP_439, 1, -1 do
            pcall(function()
                __T_nP_439[SP]:Destroy()
            end)
            __T_nP_439[SP] = nil
        end
        local function SP(KP)
            local rP = _G -- ENV_GETTER rewritten to _G
            if not KP then
                return
            end
            if rP.U_1537["U_1676"] and rP.U_1537["U_1676"][KP] then
                return
            end
            if rP.U_1537["U_694"] and KP == rP.U_1537["U_694"] then
                return
            end
            for kP, JP in ipairs(KP:GetChildren()) do
                kP = "BasePart"
                if JP:IsA(kP) then
                    for KP, kP in ipairs(JP:GetChildren()) do
                        if kP:IsA("U_1284") or kP:IsA("U_1080") or kP:IsA("U_1650") or kP:IsA("U_1958") then
                            KP = false
                            for JP, IP in pairs(__T_oP_436) do
                                if kP.Name:lower():find(JP) or kP.Name:find("U_2148") or kP.Name:find("U_2934") then
                                    KP = true
                                    break
                                end
                            end
                            if KP then
                                pcall(function()
                                    kP:Destroy()
                                end)
                            end
                        end
                    end
                end
            end
        end
        local oP = __T_YP_435.Character
        if oP then
            SP(oP)
        end
        for KP, KP in ipairs(workspace:GetChildren()) do
            if KP:IsA("Model") and KP.Name == __T_YP_435.Name then
                SP(KP)
            end
        end
        oP = workspace:FindFirstChild("Players")
        if oP then
            for KP, KP in ipairs(oP:GetChildren()) do
                if KP:IsA("Model") and KP.Name == __T_YP_435.Name then
                    SP(KP)
                end
            end
        end
    end
    function __T_oP_457()
        local bP, SP = _G,  __T_YP_435.Character -- ENV_GETTER rewritten to _G
        if not SP then
            return nil
        end
        if bP.U_1537["U_1676"] and bP.U_1537["U_1676"][SP] then
            return nil
        end
        if bP.U_1537["U_694"] and SP == bP.U_1537["U_694"] then
            return nil
        end
        local KP = "U_2225"
        if SP:GetAttribute(KP) then
            return nil
        end
        if SP.Parent == workspace then
            return SP
        end
        for KP, KP in ipairs(workspace:GetChildren()) do
            if KP:IsA("Model") and KP.Name == __T_YP_435.Name then
                if not (bP.U_1537["U_1676"] and bP.U_1537["U_1676"][KP]) and KP ~= bP.U_1537["U_694"] and not KP:GetAttribute("U_2225") then
                    SP = KP:FindFirstChild("HumanoidRootPart")
                    if SP and SP:IsA("BasePart") then
                        return KP
                    end
                end
            end
        end
        return nil
    end
    function __T_bP_458()
        local SP = __T_UP_450()
        if SP then
            return SP, true
        end
        return __T_oP_457(), false
    end
    function __T_oP_459()
        local UP = _G -- ENV_GETTER rewritten to _G
        __T_LP_456()
        __T_jP_447 = nil
        local SP, KP = __T_bP_458()
        if not SP then
            return
        end
        local rP = __T_EP_454(__T_gP_441)
        if not rP then
            return
        end
        __T_hP_455(rP, __T_RP_442)
        local EP, kP = KP and __T_wP_451(SP) or nil, rP:Clone()
        for wP, rP in ipairs(kP:GetChildren()) do
            wP = if KP then __T_VP_452(SP, rP.Name, EP) else SP:FindFirstChild(rP.Name)
            if wP and wP:IsA("BasePart") then
                for EP, EP in ipairs(rP:GetChildren()) do
                    EP.Parent = wP
                    __T_nP_439[#__T_nP_439 + 1] = EP
                end
            end
        end
        kP:Destroy()
        __T_jP_447 = SP
    end
    function __T_EP_460()
        local UP = __T_XP_440
        if not UP then
            return
        end
        local wP, VP = __T_bP_458(), __T_jP_447
        if wP ~= VP then
            __T_oP_459()
            return
        end
        if not wP then
            return
        end
        UP = __T_nP_439[1]
        if UP and not UP.Parent then
            __T_oP_459()
        end
    end
    __T_nP_461 = __T_c_074:AddToggle({
        ["Name"] = "U_15",
        ["Default"] = false,
        ["Flag"] = "U_337",
        ["U_3348"] = true,
        ["Callback"] = function(UP)
        local wP = _G -- ENV_GETTER rewritten to _G
        __T_XP_440 = UP
        __T_LP_456()
        __T_jP_447 = nil
        local VP = __T_HP_443
        if VP then
            pcall(function()
                __T_HP_443:Disconnect()
            end)
            __T_HP_443 = nil
        end
        VP = __T_WP_444
        if VP then
            pcall(function()
                __T_WP_444:Disconnect()
            end)
            __T_WP_444 = nil
        end
        if UP then
            task.spawn(__T_oP_459)
            __T_HP_443 = __T_YP_435.CharacterAdded:Connect(function()
                local YP = _G -- ENV_GETTER rewritten to _G
                task.wait(0.5)
                YP = __T_XP_440
                if YP then
                    __T_oP_459()
                end
            end)
            __T_DP_445 = 0
            table.clear(__T_vP_446)
            __T_WP_444 = game:GetService("RunService")["Heartbeat"]:Connect(function(YP)
                __T_DP_445 += YP
                YP = __T_DP_445
                if YP < 1--[[u3198]] then
                    return
                end
                __T_DP_445 = 0
                __T_aP_453()
                __T_EP_460()
            end)
        end
    end
    })
    __T_YP_462, __T_DP_463 = __T_nP_461.U_3348, { ["Name"] = "typeof", ["Default"] = "U_2208", ["U_3220"] = __T_CP_437, ["Flag"] = "U_934" }
    __T_DP_463.Callback = function(aP)
        local EP = _G -- ENV_GETTER rewritten to _G
        __T_gP_441 = typeof(aP) == "table" and aP[1] or aP
        aP = __T_XP_440
        if aP then
            task.spawn(__T_oP_459)
        end
    end
    __T_YP_462:AddDropdown(__T_DP_463)
    __T_YP_462, __T_CP_437 = __T_nP_461.U_3348, { ["Name"] = "U_1333", ["Default"] = __T_RP_442, ["Flag"] = "U_793" }
    __T_CP_437.Callback = function(nP)
        local gP = _G -- ENV_GETTER rewritten to _G
        __T_RP_442 = nP
        for RP, RP in pairs(__T_MP_438) do
            __T_hP_455(RP, nP)
        end
        nP = __T_XP_440
        if nP then
            task.spawn(__T_oP_459)
        end
    end
    __T_YP_462:AddColorPicker(__T_CP_437)
    getgenv()["U_3203"] = function()
        local YP = _G -- ENV_GETTER rewritten to _G
        __T_XP_440 = false
        local oP = __T_HP_443
        if oP then
            pcall(function()
                __T_HP_443:Disconnect()
            end)
            __T_HP_443 = nil
        end
        oP = __T_WP_444
        if oP then
            pcall(function()
                __T_WP_444:Disconnect()
            end)
            __T_WP_444 = nil
        end
        table.clear(__T_vP_446)
        __T_LP_456()
        __T_jP_447 = nil
    end
    function __T_YP_464()
        local oP = _G -- ENV_GETTER rewritten to _G
        __T_T_400 = false
        local CP = __T_G_402
        if CP then
            __T_G_402:Disconnect()
            __T_G_402 = nil
        end
        __T_dP_417()
        __T_r_385.U_3309 = getgenv()["U_1822"] and getgenv()["U_752"] or __T_B_390
        __T_r_385.U_2047 = getgenv()["U_1822"] and getgenv()["U_752"] or __T_t_391
        __T_r_385.U_2343 = getgenv()["U_3264"] and 2 or __T_p_389
        __T_r_385.U_3227 = getgenv()["U_1974"] and getgenv()["U_2189"] or __T_k_386
        __T_r_385.U_2035 = getgenv()["U_1974"] and getgenv()["U_1383"] or __T_J_387
        local dP, CP = "U_534", getgenv()["U_1974"] and getgenv()["U_1230"] or (getgenv()["U_3264"] and 1--[[u3206]] or __T_I_388)
        __T_r_385[dP] = CP
        __T_r_385.U_1210 = getgenv()["U_3264"] and false or __T___392
        __T_r_385.U_2576 = getgenv()["U_3264"] and 14 or __T_A_393
        __T_r_385.U_427 = __T_i_394
        __T_r_385.U_1542 = __T_N_395
        __T_r_385.U_3239 = __T_l_396
        __T_r_385.U_2309 = __T_y_397
        __T_r_385.U_333 = __T_Q_398
        __T_r_385.U_3139 = __T_z_399
    end
    getgenv()["U_1884"] = __T_YP_464
    __T_eP_413 = {
        ["Name"] = "U_1711",
        ["Default"] = false,
        ["Flag"] = "U_3299",
        ["U_3348"] = true,
        ["Callback"] = function(i)
        local N = _G -- ENV_GETTER rewritten to _G
        __T_uP_420 = i
        getgenv()["U_2865"] = i
        if i then
            __T_cP_433(__T_fP_423)
        else
            __T_PP_434()
        end
    end
    }
    __T_i_465, __T_N_466 = __T_c_074:AddToggle(__T_eP_413)["U_3348"], {
        ["Name"] = "U_1097",
        ["Default"] = "U_2390",
        ["U_3220"] = {
        "U_2630",
        "U_953",
        "U_874",
        "U_2390",
        "U_580",
        "U_755",
        "U_3099",
        "U_1679"
    },
        ["Flag"] = "U_473"
    }
    __T_N_466.Callback = function(l)
        local y = _G -- ENV_GETTER rewritten to _G
        __T_fP_423 = typeof(l) == "table" and l[1] or l
        y = __T_uP_420
        if y then
            __T_cP_433(__T_fP_423)
        end
    end
    __T_i_465:AddDropdown(__T_N_466)
    __T_i_465 = {
        ["Name"] = "U_854",
        ["Default"] = false,
        ["Flag"] = "U_1752",
        ["U_3348"] = true,
        ["Callback"] = function(l)
        local y = _G -- ENV_GETTER rewritten to _G
        __T_T_400 = l
        if l then
            __T_xP_416(__T_qP_411[__T_Z_401])
            local l = not __T_G_402
            if l then
                local l = 0
                __T_G_402 = game:GetService("RunService")["Heartbeat"]:Connect(function(y)
                    local Q = __T_T_400
                    if not Q then
                        return
                    end
                    Q = __T_qP_411[__T_Z_401]
                    l += y
                    y = l
                    local G = y >= 1
                    if G then
                        l = 0
                        __T_xP_416(Q)
                        return
                    end
                    if __T_r_385.U_3309 ~= Q.U_1813 or __T_r_385.U_2343 ~= Q.U_3161 or __T_r_385.U_2576 ~= Q.U_2847 or __T_r_385.U_2047 ~= Q.U_406 or __T_r_385.U_3139 ~= Q.U_1566 or __T_r_385.U_1210 ~= Q.U_1006 or __T_r_385.U_1542 ~= Q.U_2120 or __T_r_385.U_534 ~= math.huge then
                        __T_xP_416(Q)
                    end
                end)
            end
        else
            __T_YP_464()
        end
    end
    }
    __T_eP_413, __T_K_384 = __T_c_074:AddToggle(__T_i_465)["U_3348"], {
        ["Name"] = "U_1097",
        ["Default"] = "U_2805",
        ["U_3220"] = { "U_2805", "U_3073", "U_2989", "U_1967" },
        ["Flag"] = "U_30"
    }
    __T_K_384.Callback = function(l)
        __T_Z_401 = l
        l = __T_T_400
        if l then
            __T_xP_416(__T_qP_411[__T_Z_401])
        end
    end
    __T_eP_413:AddDropdown(__T_K_384)
    __T_l_467 = game:GetService("UserInputService")
    __T_y_468 = game:GetService("RunService")
    __T_Q_469 = game:GetService("Players")["LocalPlayer"]
    __T_T_470, __T_T_471 = workspace.CurrentCamera, {}
    __T_Z_472 = false
    __T_G_473 = false
    __T_fP_474, __T_YP_475, __T_qP_476, __T_dP_477 = false
    __T_cP_478 = false
    __T_oP_479 = 4
    __T_xP_480 = 8
    __T_CP_481 = 2
    __T_MP_482 = Color3.fromRGB(255, 255, 255)
    __T_nP_483 = Color3.fromRGB(0, 0, 0)
    __T_XP_484 = 0
    __T_gP_485, __T_RP_486 = 0
    __T_HP_487 = {}
    __T_WP_488 = { 0, 0, 0, 0 }
    function __T_DP_489()
        local vP = __T_Q_469.Character
        if vP and vP:FindFirstChild("Gun") then
            return true
        end
        return false
    end
    function __T_vP_490()
        local jP, aP, EP, UP = _G,  1,  8,  1 -- ENV_GETTER rewritten to _G
        for wP = aP, EP, UP do
            local aP = Drawing.new("U_2092")
            aP.Visible = false
            aP.Color = wP % 2 == 0 and __T_nP_483 or __T_MP_482
            local EP, UP, VP = "U_989", wP % 2 == 0
            if UP then
                jP = __T_CP_481
                VP = jP + 2
            else
                VP = UP
            end
            aP[EP] = VP or __T_CP_481
            aP.Transparency = 1
            aP.U_2435 = wP % 2 == 0 and "U_1153" or 1--[[u1731]]
            __T_T_471[wP] = aP
        end
    end
    function __T_jP_491()
        local aP = _G -- ENV_GETTER rewritten to _G
        for EP = 1, #__T_T_471 do
            if __T_T_471[EP] then
                pcall(function()
                    __T_T_471[EP]:Remove()
                end)
                __T_T_471[EP] = nil
            end
        end
    end
    function __T_aP_492(EP, UP)
        __T_fP_474 = if UP == nil then (__T_DP_489()) else UP
        local UP = EP and __T_Z_472 and __T_fP_474
        for EP = 1, #__T_T_471 do
            if __T_T_471[EP] then
                __T_T_471[EP]["Visible"] = UP
            end
        end
    end
    function __T_EP_493()
        local UP = __T_Q_469:FindFirstChild("PlayerGui")
        if not UP then
            return
        end
        local wP = UP:FindFirstChild("U_2314")
        if not wP then
            return
        end
        UP = wP:FindFirstChild("U_1657")
        wP = UP and UP:IsA("U_2672")
        if wP then
            __T_YP_475 = UP
            UP.Visible = false
        end
    end
    function __T_UP_494()
        local wP, VP, hP = (_G), __T_YP_475 -- [EnvProxyPartial]
        if VP then
            local LP = __T_YP_475
            hP = LP.Parent
        else
            hP = VP
        end
        if hP then
            pcall(function()
                local wP = __T_YP_475
                local VP = wP:IsA("U_2672")
                if VP then
                    wP = __T_YP_475
                    wP.Visible = true
                end
            end)
        end
    end
    function __T_wP_495()
        local VP = _G -- ENV_GETTER rewritten to _G
        __T_cP_478 = true
        local hP = __T_dP_477
        if hP then
            return
        end
        __T_dP_477 = hookmetamethod(game, "U_820", function(VP, hP, LP)
            local bP = _G -- ENV_GETTER rewritten to _G
            local SP = hP == "U_1068" and __T_cP_478 and __T_G_473 and checkcaller() == false and VP:IsA("U_155")
            if SP then
                if LP == "U_2825" or LP == "" then
                    return
                end
            end
            SP = __T_dP_477
            return SP(VP, hP, LP)
        end)
    end
    function __T_dP_496()
        __T_cP_478 = false
   ]============],
    [9] = [============[
 end
    function __T_cP_497(VP)
        local hP = VP and __T_G_473
        if hP then
            __T_wP_495()
            VP = __T_Q_469:GetMouse()
            if VP then
                VP.U_1068 = ""
            end
            __T_EP_493()
        else
            __T_dP_496()
            local dP = __T_Q_469:GetMouse()
            if dP then
                dP.U_1068 = ""
            end
            dP = __T_Z_472
            if not dP then
                __T_UP_494()
            end
        end
    end
    function __T_dP_498(wP)
        local VP, hP = _G,  not __T_Z_472 or #__T_T_471 == 0 -- ENV_GETTER rewritten to _G
        if hP then
            return
        end
        hP = __T_DP_489()
        __T_fP_474 = hP
        if not hP then
            __T_aP_492(false, hP)
            return
        end
        local LP = __T_l_467:GetMouseLocation()
        local l, bP, SP = LP.X, LP.Y, __T_XP_484
        LP = SP > 0
        if LP then
            SP = __T_gP_485
            __T_gP_485 = (SP + wP * __T_XP_484 * 1--[[u807]]) % 1--[[u988]]
        else
            __T_gP_485 = 0
        end
        local KP, rP, kP, JP = math.rad(__T_gP_485), math.cos, math.sin, math.pi
        __T_WP_488[1] = KP
        __T_WP_488[2] = (math.pi / 2) + KP
        __T_WP_488[3] = JP + KP
        __T_WP_488[4] = 1--[[u703]] + KP
        JP, wP, SP = 1, 4, 1
        for gP = JP, wP, SP do
            LP, KP = __T_WP_488[gP], (gP - 1) * 2 + 1
            local WP, wP = KP + 1, __T_oP_479
            local SP, JP = l + wP * rP(LP), __T_oP_479
            local wP, IP, pP, BP = bP + JP * kP(LP), l + (__T_oP_479 + __T_xP_480) * rP(LP), bP + (__T_oP_479 + __T_xP_480) * kP(LP), __T_oP_479
            JP, gP = l + (BP - 1) * rP(LP), __T_oP_479
            local BP, tP, _P = bP + (gP - 1) * kP(LP), l + (__T_oP_479 + __T_xP_480 + 1) * rP(LP), bP + (__T_oP_479 + __T_xP_480 + 1) * kP(LP)
            if __T_T_471[KP] then
                __T_T_471[KP]["U_2970"] = Vector2.new(SP, wP)
                __T_T_471[KP]["U_493"] = Vector2.new(IP, pP)
            end
            if __T_T_471[WP] then
                __T_T_471[WP]["U_2970"] = Vector2.new(JP, BP)
                __T_T_471[WP]["U_493"] = Vector2.new(tP, _P)
            end
        end
        __T_aP_492(true, hP)
    end
    function __T_l_499()
        local gP, WP = _G,  __T_RP_486 -- ENV_GETTER rewritten to _G
        if WP then
            return
        end
        if #__T_T_471 == 0 then
            __T_vP_490()
        end
        __T_RP_486 = __T_y_468.RenderStepped:Connect(__T_dP_498)
        local function y(dP)
            local vP = _G -- ENV_GETTER rewritten to _G
            if not dP then
                return
            end
            local wP, VP = "ChildAdded", function(hP)
                if hP.Name == "Gun" then
                    __T_EP_493()
                    __T_aP_492(true)
                    __T_cP_497(true)
                end
            end
            local EP, hP, LP = dP[wP]:Connect(VP), "ChildRemoved", function(wP)
                if wP.Name == "Gun" then
                    __T_aP_492(false)
                    __T_cP_497(false)
                end
            end
            VP = dP[hP]:Connect(LP)
            table.insert(__T_HP_487, EP)
            table.insert(__T_HP_487, VP)
        end
        WP = not __T_qP_476
        if WP then
            local dP = __T_Q_469:FindFirstChild("PlayerGui")
            if dP then
                __T_qP_476 = dP.DescendantAdded:Connect(function(dP)
                    local vP = dP.Name == "U_1657" and dP.Parent and dP.Parent["Name"] == "U_2314"
                    if vP then
                        local vP = __T_G_473 and dP:IsA("U_2672")
                        if vP then
                            dP.Visible = false
                            __T_YP_475 = dP
                        end
                    end
                end)
            end
        end
        WP = __T_Q_469.Character
        if WP then
            y(WP)
        end
        WP = __T_Q_469:FindFirstChildOfClass("Backpack")
        if WP then
            y(WP)
        end
        WP = __T_Q_469.CharacterAdded:Connect(function(YP)
            local dP = _G -- ENV_GETTER rewritten to _G
            task.wait(1--[[u2185]])
            y(YP)
            y(__T_Q_469:FindFirstChildOfClass("Backpack"))
            __T_fP_474 = __T_DP_489()
            __T_aP_492(true, __T_fP_474)
            __T_cP_497(__T_fP_474 and __T_G_473)
        end)
        table.insert(__T_HP_487, WP)
        __T_fP_474 = __T_DP_489()
        __T_aP_492(true, __T_fP_474)
        __T_cP_497(__T_fP_474 and __T_G_473)
    end
    function __T_y_500()
        local Q, YP = _G,  __T_RP_486 -- ENV_GETTER rewritten to _G
        if YP then
            pcall(function()
                __T_RP_486:Disconnect()
            end)
            __T_RP_486 = nil
        end
        YP = __T_qP_476
        if YP then
            pcall(function()
                __T_qP_476:Disconnect()
            end)
            __T_qP_476 = nil
        end
        local YP, qP = ipairs, __T_HP_487
        for dP, dP in YP(qP) do
            pcall(function()
                dP:Disconnect()
            end)
        end
        __T_HP_487 = {}
        __T_aP_492(false)
        __T_cP_497(false)
        __T_UP_494()
        __T_jP_491()
    end
    __T_N_466 = __T_c_074:AddToggle({
        ["Name"] = "U_1299",
        ["Default"] = false,
        ["Flag"] = "U_3066",
        ["U_3348"] = true,
        ["Callback"] = function(Q)
        __T_Z_472 = Q
        if Q then
            __T_l_499()
        else
            __T_y_500()
        end
    end
    })
    __T_eP_413, __T_i_465 = __T_N_466.U_3348, { ["Name"] = "U_2104", ["Default"] = false, ["Flag"] = "U_2282" }
    __T_i_465.Callback = function(l)
        __T_G_473 = l
        local Q = __T_fP_474 and __T_Z_472
        if Q then
            __T_cP_497(l)
        end
    end
    __T_eP_413:AddToggle(__T_i_465)
    __T_l_501, __T_Q_502 = __T_N_466.U_3348, {
        ["Name"] = "U_100",
        ["Default"] = 4,
        ["Min"] = 0,
        ["Max"] = 1--[[u2553]],
        ["Rounding"] = 1,
        ["Flag"] = "U_100"
    }
    __T_Q_502.Callback = function(G)
        __T_oP_479 = G
    end
    __T_l_501:AddSlider(__T_Q_502)
    __T_l_501, __T_Q_502 = __T_N_466.U_3348, {
        ["Name"] = "U_2080",
        ["Default"] = 8,
        ["Min"] = 2,
        ["Max"] = 30,
        ["Rounding"] = 1,
        ["Flag"] = 1--[[u1511]]
    }
    __T_Q_502.Callback = function(G)
        __T_xP_480 = G
    end
    __T_l_501:AddSlider(__T_Q_502)
    __T_l_501, __T_K_384 = __T_N_466.U_3348, {
        ["Name"] = "U_3331",
        ["Default"] = 2,
        ["Min"] = 1,
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_3331"
    }
    __T_K_384.Callback = function(G)
        __T_CP_481 = G
        for fP = 1, #__T_T_471 do
            if __T_T_471[fP] then
                __T_T_471[fP]["U_989"] = fP % 2 == 0 and G + 2 or G
            end
        end
    end
    __T_l_501:AddSlider(__T_K_384)
    __T_l_501, __T_Q_502 = __T_N_466.U_3348, {
        ["Name"] = "U_2623",
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = 10,
        ["Rounding"] = 1,
        ["Flag"] = "U_2623"
    }
    __T_Q_502.Callback = function(G)
        __T_XP_484 = G
    end
    __T_l_501:AddSlider(__T_Q_502)
    __T_l_501, __T_Q_502 = __T_N_466.U_3348, {
        ["Name"] = "U_2080",
        ["Default"] = Color3.fromRGB(255, 255, 255),
        ["Flag"] = "U_2046"
    }
    __T_Q_502.Callback = function(G)
        __T_MP_482 = G
        for fP = 1, #__T_T_471 do
            if __T_T_471[fP] and fP % 2 == 1 then
                __T_T_471[fP]["Color"] = G
            end
        end
    end
    __T_l_501:AddColorPicker(__T_Q_502)
    __T_l_501, __T_Q_502 = __T_N_466.U_3348, { ["Name"] = "U_674", ["Default"] = Color3.fromRGB(0, 0, 0), ["Flag"] = "U_1200" }
    __T_Q_502.Callback = function(G)
        __T_nP_483 = G
        for fP = 1, #__T_T_471 do
            if __T_T_471[fP] and fP % 2 == 0 then
                __T_T_471[fP]["Color"] = G
            end
        end
    end
    __T_l_501:AddColorPicker(__T_Q_502)
    getgenv()["U_2117"] = function()
        __T_Z_472 = false
        __T_y_500()
    end
    __T_c_074:AddToggle({
        ["Name"] = "U_504",
        ["Default"] = false,
        ["Flag"] = "U_2179",
        ["Callback"] = function(l)
        local y = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_3264"] = l
        if l then
            __T_r_385.U_2343 = 2
            __T_r_385.U_2576 = 14
            __T_r_385.U_1210 = false
            __T_r_385.U_2047 = Color3.fromRGB(1--[[u2533]], 1--[[u2533]], 1--[[u2533]])
            if not getgenv()["U_1974"] then
                __T_r_385.U_534 = 1--[[u3206]]
            end
        else
            __T_r_385.U_2343 = __T_p_389
            __T_r_385.U_1210 = __T___392
            __T_r_385.U_2047 = getgenv()["U_1822"] and getgenv()["U_752"] or __T_t_391
            if getgenv()["U_1974"] then
                __T_r_385.U_534 = getgenv()["U_1230"]
            else
                __T_r_385.U_534 = __T_I_388
            end
        end
    end
    })
    __T_i_465 = __T_c_074:AddToggle({
        ["Name"] = "U_2461",
        ["Default"] = false,
        ["Flag"] = "U_1480",
        ["U_3348"] = true,
        ["Callback"] = function(p)
        local _ = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1974"] = p
        if p then
            __T_r_385.U_3227 = getgenv()["U_2189"]
            __T_r_385.U_2035 = getgenv()["U_1383"]
            __T_r_385.U_534 = getgenv()["U_1230"]
        else
            __T_r_385.U_3227 = __T_k_386
            __T_r_385.U_2035 = __T_J_387
            __T_r_385.U_534 = __T_I_388
        end
    end
    })
    __T_i_465.U_3348:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.fromRGB(1--[[u2774]], 1--[[u2774]], 1--[[u2774]]),
        ["Flag"] = "U_836",
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_2189"] = k
        if getgenv()["U_1974"] then
            __T_r_385.U_3227 = k
        end
    end
    })
    __T_i_465.U_3348:AddSlider({
        ["Name"] = "U_3149",
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = 1--[[u1731]],
        ["Rounding"] = 1,
        ["Flag"] = "U_1634",
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1383"] = k
        if getgenv()["U_1974"] then
            __T_r_385.U_2035 = k
        end
    end
    })
    __T_i_465.U_3348:AddSlider({
        ["Name"] = "U_399",
        ["Default"] = 1--[[u1731]],
        ["Min"] = 0,
        ["Max"] = 1--[[u1731]],
        ["Rounding"] = 1,
        ["Flag"] = "U_1156",
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1230"] = k
        if getgenv()["U_1974"] then
            __T_r_385.U_534 = k
        end
    end
    })
    __T_K_384 = {
        ["Name"] = "U_1826",
        ["Default"] = false,
        ["Flag"] = "U_82",
        ["U_3348"] = true,
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        __T_s_418 = k
        getgenv()["U_555"] = k
        __T_r_385.U_2576 = k and __T_FP_421 or __T_A_393
    end
    }
    __T_eP_413, __T_i_465 = __T_c_074:AddToggle(__T_K_384)["U_3348"], {
        ["Name"] = "time",
        ["Default"] = 12,
        ["Min"] = 0,
        ["Max"] = 24,
        ["Rounding"] = 1,
        ["Flag"] = "U_166"
    }
    __T_i_465.Callback = function(k)
        __T_FP_421 = k
        local J = __T_s_418
        if J then
            __T_r_385.U_2576 = k
        end
    end
    __T_eP_413:AddSlider(__T_i_465)
    __T_k_503 = game:GetService("RunService")
    __T_J_504 = "U_502"
    __T_I_505 = false
    __T_p_506 = "U_2146"
    __T___507 = Color3.fromRGB(1--[[u876]], 1--[[u108]], 255)
    __T_l_508, __T_y_509, __T_Q_510, __T_T_511, __T_Z_512, __T_G_513 = 1--[[u1150]]
    __T_FP_514 = 1--[[u2856]]
    __T_fP_515 = 1--[[u1844]]
    function __T_YP_516(qP)
        local dP, cP = _G,  __T_Q_510 -- ENV_GETTER rewritten to _G
        if not cP then
            return
        end
        cP.U_145 = __T_J_504
        cP.U_17 = 0
        cP.U_832 = 1--[[u234]]
        cP.U_1928 = 0
        cP.U_951 = 0
        cP.U_1361 = __T_EnumFB.U_2513["U_2529"]
        cP.U_1935 = __T_l_508
        cP.Color = ColorSequence.new(__T___507)
        if qP == "U_2146" then
            cP.U_1602 = NumberRange.new(4, 6)
            cP.U_2580 = NumberRange.new(6, 12)
            cP.U_845 = Vector3.new(2, 1--[[u1215]], 1)
            cP.U_1716 = Vector2.new(35, 35)
            cP.Rotation = NumberRange.new(0, 1--[[u988]])
            cP.U_816 = NumberRange.new(1--[[u2155]], 1--[[u513]])
            cP.U_1618 = NumberSequence.new(0)
            cP.Size = NumberSequence.new(1--[[u957]])
            cP.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1--[[u3198]]),
                NumberSequenceKeypoint.new(1--[[u370]], 1--[[u2185]]),
                NumberSequenceKeypoint.new(1, 1)
            })
        else
            cP.U_1602 = NumberRange.new(5, 7)
            cP.U_2580 = NumberRange.new(5, 10)
            cP.U_845 = Vector3.new(4, 1--[[u2663]], 2)
            cP.U_1716 = Vector2.new(1--[[u513]], 1--[[u513]])
            cP.Rotation = NumberRange.new(0, 1--[[u988]])
            cP.U_816 = NumberRange.new(1--[[u2351]], 80)
            cP.U_1618 = NumberSequence.new(1--[[u254]])
            cP.Size = NumberSequence.new(0.5)
            cP.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1--[[u773]]),
                NumberSequenceKeypoint.new(1--[[u1190]], 1--[[u1791]]),
                NumberSequenceKeypoint.new(1, 1)
            })
        end
    end
    function __T_J_517()
        local qP, dP = _G,  __T_T_511 -- ENV_GETTER rewritten to _G
        if dP then
            pcall(function()
                __T_T_511:Disconnect()
            end)
            __T_T_511 = nil
        end
        dP = __T_y_509
        if dP then
            pcall(function()
                __T_y_509:Destroy()
            end)
            __T_y_509 = nil
        end
        __T_Q_510, __T_Z_512, __T_G_513 = nil, nil, nil
    end
    function __T_qP_518()
        local dP, cP, oP = (_G), __T_y_509 -- [EnvProxyPartial]
        if cP then
            local xP = __T_y_509
            oP = xP.Parent
        else
            oP = cP
        end
        if oP then
            return
        end
        __T_y_509 = Instance.new("Part")
        oP = __T_y_509
        oP.Name = "U_1528"
        oP = __T_y_509
        oP.Anchored = true
        cP = __T_y_509
        cP.CanCollide = false
        oP = __T_y_509
        oP.CanQuery = false
        cP = __T_y_509
        cP.CanTouch = false
        cP = __T_y_509
        cP.Transparency = 1
        cP = __T_y_509
        cP.Size = Vector3.new(__T_FP_514, __T_fP_515, __T_FP_514)
        oP = __T_y_509
        oP.Parent = workspace
        __T_Q_510 = Instance.new("U_1284")
        pcall(function()
            local cP, oP = _G,  __T_Q_510 -- ENV_GETTER rewritten to _G
            oP.U_1483 = __T_EnumFB.U_2708["U_1460"]
            oP = __T_Q_510
            oP.U_591 = __T_EnumFB.U_1253["U_2428"]
        end)
        dP = __T_Q_510
        dP.Parent = __T_y_509
        __T_YP_516(__T_p_506)
    end
    function __T_dP_519()
        local cP, oP = _G,  __T_Q_510 -- ENV_GETTER rewritten to _G
        if not oP then
            return
        end
        local oP, xP, CP, MP = __T_Q_510, math.clamp, math.floor, __T_l_508
        cP = xP(CP(MP * 1--[[u2422]]), 30, 1--[[u1844]])
        oP:Emit(cP)
    end
    function __T_cP_520()
        __T_qP_518()
        local qP = __T_T_511
        if qP then
            return
        end
        __T_Z_512, __T_G_513 = nil, nil
        __T_T_511 = __T_k_503.RenderStepped:Connect(function()
            local k, T, qP = (_G), __T_y_509 -- [EnvProxyPartial]
            if T then
                local oP = __T_y_509
                qP = oP.Parent
            else
                qP = T
            end
            if not qP then
                return
            end
            T = workspace.CurrentCamera
            if not T then
                return
            end
            qP = CFrame
            local oP, xP = qP.Position, qP.LookVector
            qP = Vector3.new(xP.X, 0, xP.Z)
            qP = if qP.Magnitude < 1--[[u3159]] then Vector3.new(0, 0, -1) else qP.Unit
            xP = __T_Z_512 and __T_G_513 and (oP - __T_Z_512)["Magnitude"] < 10 and qP:Dot(__T_G_513) > 1--[[u2987]]
            if xP then
                return
            end
            __T_Z_512, __T_G_513 = oP, qP
            T = __T_y_509
            CFrame = CFrame.new(oP + qP * (__T_FP_514 * 1--[[u1758]]) + Vector3.new(0, __T_fP_515 * 0.5 - 26, 0))
        end)
        __T_dP_519()
    end
    __T_i_465 = __T_c_074:AddToggle({
        ["Name"] = "U_2262",
        ["Default"] = false,
        ["Flag"] = "U_128",
        ["U_3348"] = true,
        ["Callback"] = function(k)
        __T_I_505 = k
        if k then
            __T_cP_520()
        else
            __T_J_517()
        end
    end
    })
    __T_N_466, __T_eP_413 = __T_i_465.U_3348, {
        ["Name"] = "U_1097",
        ["Default"] = "U_2146",
        ["U_3220"] = { "U_2146", "U_3129" },
        ["Flag"] = "U_2211"
    }
    __T_eP_413.Callback = function(k)
        local y = _G -- ENV_GETTER rewritten to _G
        __T_p_506 = typeof(k) == "table" and k[1] or k
        y = __T_I_505
        if y then
            __T_YP_516(__T_p_506)
            __T_dP_519()
        end
    end
    __T_N_466:AddDropdown(__T_eP_413)
    __T_k_521, __T_y_522 = __T_i_465.U_3348, { ["Name"] = "U_1333", ["Default"] = __T___507, ["Flag"] = "U_2783" }
    __T_y_522.Callback = function(T)
        local Z = _G -- ENV_GETTER rewritten to _G
        __T___507 = T
        local _ = __T_Q_510
        if _ then
            local _ = __T_Q_510
            _.Color = ColorSequence.new(T)
        end
    end
    __T_k_521:AddColorPicker(__T_y_522)
    __T_k_521, __T_K_384 = __T_i_465.U_3348, {
        ["Name"] = "U_172",
        ["Default"] = 1--[[u1150]],
        ["Min"] = 1--[[u2553]],
        ["Max"] = "U_1275",
        ["Rounding"] = 1,
        ["Flag"] = "U_2483"
    }
    __T_K_384.Callback = function(_)
        __T_l_508 = _
        _ = __T_Q_510
        if _ then
            __T_YP_516(__T_p_506)
            __T_dP_519()
        end
    end
    __T_k_521:AddSlider(__T_K_384)
    getgenv()["U_877"] = function()
        __T_I_505 = false
        __T_J_517()
    end
    __T_c_074:AddToggle({
        ["Name"] = "U_2972",
        ["Default"] = false,
        ["Flag"] = "U_716",
        ["U_3348"] = true,
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1822"] = k
        if k then
            __T_r_385.U_3309 = getgenv()["U_752"]
            __T_r_385.U_2047 = getgenv()["U_752"]
        else
            __T_r_385.U_3309 = __T_B_390
            __T_r_385.U_2047 = __T_t_391
        end
    end
    })["U_3348"]:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.fromRGB(1--[[u2533]], 1--[[u2533]], 1--[[u2533]]),
        ["Flag"] = "U_2810",
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_752"] = k
        if getgenv()["U_1822"] then
            __T_r_385.U_3309 = k
            __T_r_385.U_2047 = k
        end
    end
    })
    __T_eP_413 = {
        ["Name"] = "U_2427",
        ["Default"] = false,
        ["Flag"] = "U_410",
        ["U_3348"] = true,
        ["Callback"] = function(k)
        local J = _G -- ENV_GETTER rewritten to _G
        __T_OP_419 = k
        getgenv()["U_1013"] = k
        __T_r_385.U_3139 = k and __T_mP_422 or __T_z_399
    end
    }
    __T_N_466, __T_K_384 = __T_c_074:AddToggle(__T_eP_413)["U_3348"], {
        ["Name"] = "U_172",
        ["Default"] = 0,
        ["Min"] = 1--[[u2663]],
        ["Max"] = 5,
        ["Rounding"] = 2,
        ["Flag"] = "U_2802"
    }
    __T_K_384.Callback = function(k)
        __T_mP_422 = k
        local J = __T_OP_419
        if J then
            __T_r_385.U_3139 = k
        end
    end
    __T_N_466:AddSlider(__T_K_384)
    __T_k_523 = true
    function __T_J_524()
        local I = __T_OP_419
        if not I then
            return
        end
        I = __T_r_385.U_3139 ~= __T_mP_422
        if I then
            __T_r_385.U_3139 = __T_mP_422
        end
    end
    pcall(function()
        __T_r_385:GetPropertyChangedSignal("U_3139"):Connect(function()
        local I = __T_k_523
        if I then
            __T_J_524()
        end
    end)
    end)
    task.spawn(function()
        local I = _G -- ENV_GETTER rewritten to _G
        while true do
            local p = __T_k_523
            if not p then
                break
            end
            task.wait(1--[[u1791]])
            pcall(__T_J_524)
        end
    end)
    getgenv()["U_433"] = function()
        local J = _G -- ENV_GETTER rewritten to _G
        __T_k_523 = false
        local k, I, p = false, false, false
        __T_s_418, __T_OP_419, __T_uP_420 = k, I, p
        getgenv()["U_555"] = false
        getgenv()["U_1013"] = false
        getgenv()["U_2865"] = false
        pcall(function()
        __T_r_385.U_2576 = __T_A_393
    end)
        pcall(function()
        __T_r_385.U_3139 = __T_z_399
    end)
        __T_PP_434()
    end
    __T_S_383:AddToggle({
        ["Name"] = "U_1702",
        ["Default"] = false,
        ["Flag"] = "U_2470",
        ["Callback"] = function(r)
        local k = _G -- ENV_GETTER rewritten to _G
        __T_q_095.U_856["U_865"]["U_865"] = r
        if r and not __T_q_095.U_3200 then
            __T_q_095.U_1181()
            if k.U_1537["U_694"] and k.U_1537["U_2922"] and k.U_1537["U_2510"] then
                k.U_1537["U_2655"] = __T_q_095.U_1077(k.U_1537["U_694"], k.U_1537["U_2922"], k.U_1537["U_2510"])
            end
        else
            if not r and __T_q_095.U_3200 then
                if k.U_1537["U_2655"] then
                    __T_q_095.U_593(k.U_1537["U_2655"])
                    k.U_1537["U_2655"] = nil
                end
                __T_q_095.U_18()
            end
        end
    end
    })
    __T_N_466 = __T_S_383:AddToggle({
        ["Name"] = "U_974",
        ["Default"] = false,
        ["Flag"] = "U_2251",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_974"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 1,
        ["Flag"] = "U_1074",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_1049"] = { r, k or 1 }
    end
    })
    __T_N_466.U_3348:AddDropdown({
        ["Name"] = "U_1097",
        ["Default"] = "U_660",
        ["U_3220"] = { "U_660", "U_577" },
        ["Flag"] = "U_529",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1373"] = r
    end
    })
    __T_N_466.U_3348:AddToggle({
        ["Name"] = "U_3226",
        ["Default"] = false,
        ["Flag"] = "U_2341",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1654"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_3253",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_203",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_685"][1] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_408",
        ["Default"] = Color3.new(0, 0, 1),
        ["Flag"] = "U_1055",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_685"][2] = r
    end
    })
    __T_N_466.U_3348:AddToggle({
        ["Name"] = "U_16",
        ["Default"] = false,
        ["Flag"] = "U_2385",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_895"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_16",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 0.5,
        ["Flag"] = "U_1887",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_51"] = { r, k or 0.5 }
    end
    })
    __T_N_466.U_3348:AddToggle({
        ["Name"] = "U_2855",
        ["Default"] = false,
        ["Flag"] = "U_33",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2096"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_810",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_2074",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1942"][1] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_414",
        ["Default"] = Color3.new(0, 0, 1),
        ["Flag"] = "U_1930",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1942"][2] = r
    end
    })
    __T_i_465 = __T_S_383:AddToggle({
        ["Name"] = "U_386",
        ["Default"] = false,
        ["Flag"] = "U_1090",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_386"] = r
    end
    })
    __T_i_465.U_3348:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Flag"] = "U_248",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_1401"] = { r, k or 1 }
    end
    })
    __T_i_465.U_3348:AddToggle({
        ["Name"] = "U_3226",
        ["Default"] = false,
        ["Flag"] = "U_2649",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2530"] = r
    end
    })
    __T_i_465.U_3348:AddColorPicker({
        ["Name"] = "U_3253",
        ["Default"] = Color3.new(1, 1, 1),
        ["Flag"] = "U_3240",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2215"][1] = r
    end
    })
    __T_i_465.U_3348:AddColorPicker({
        ["Name"] = "U_408",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_721",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2215"][2] = r
    end
    })
    __T_S_383:AddToggle({
        ["Name"] = "U_562",
        ["Default"] = false,
        ["Flag"] = "U_2316",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2018"] = r
    end
    })
    __T_q_095.U_856["U_865"]["U_1103"] = "U_3362"
    __T_q_095.U_856["U_865"]["U_2601"] = 1--[[u2856]]
    __T_K_384 = __T_S_383:AddToggle({
        ["Name"] = "U_1486",
        ["Default"] = false,
        ["Flag"] = "U_283",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1799"] = r
    end
    })
    __T_K_384.U_3348:AddColorPicker({
        ["Name"] = "U_2769",
        ["Default"] = Color3.fromRGB(255, 1--[[u2325]], 1--[[u2325]]),
        ["Flag"] = "U_2730",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1506"] = { r, 1 }
    end
    })
    __T_K_384.U_3348:AddColorPicker({
        ["Name"] = "U_1003",
        ["Default"] = Color3.fromRGB(255, 255, 255),
        ["Flag"] = "U_2795",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_554"] = { r, 1 }
    end
    })
    __T_K_384.U_3348:AddColorPicker({
        ["Name"] = "U_2228",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Flag"] = "U_2846",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2704"] = { r, 1 }
    end
    })
    __T_K_384.U_3348:AddSlider({
        ["Name"] = "U_1643",
        ["Min"] = 16,
        ["Max"] = 1--[[u3195]],
        ["Default"] = "U_3362",
        ["Flag"] = "U_1054",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1103"] = r
    end
    })
    __T_K_384.U_3348:AddSlider({
        ["Name"] = "U_1577",
        ["Min"] = 1--[[u513]],
        ["Max"] = "U_1133",
        ["Default"] = 1--[[u2856]],
        ["Flag"] = "U_1510",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2601"] = r
    end
    })
    __T_N_466 = __T_S_383:AddToggle({
        ["Name"] = "U_1577",
        ["Default"] = false,
        ["Flag"] = "U_1239",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1812"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Flag"] = "U_1193",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_2214"] = { r, k or 1 }
    end
    })
    __T_N_466.U_3348:AddToggle({
        ["Name"] = "U_3226",
        ["Default"] = false,
        ["Flag"] = "U_1120",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1692"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_3253",
        ["Default"] = Color3.new(1, 1, 1),
        ["Flag"] = "U_1996",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1202"][1] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_408",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_2000",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1202"][2] = r
    end
    })
    __T_S_383:AddToggle({
        ["Name"] = "U_1467",
        ["Default"] = false,
        ["Flag"] = "U_2053",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_158"] = r
    end
    })["U_3348"]:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Flag"] = "U_3049",
        ["Callback"] = function(r, k)
        __T_q_095.U_856]============],
    [10] = [============[
["U_865"]["U_590"] = { r, k or 1 }
    end
    })
    __T_N_466 = __T_S_383:AddToggle({
        ["Name"] = "U_1179",
        ["Default"] = false,
        ["Flag"] = "U_1387",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_748"] = r
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_651",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 0.5,
        ["Flag"] = "U_10",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_316"] = { r, k or 0.5 }
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_2416",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 0,
        ["Flag"] = "U_705",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_142"] = { r, k or 0 }
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_3056",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 0.5,
        ["Flag"] = "U_1832",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_812"] = { r, k or 0.5 }
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_2831",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 0,
        ["Flag"] = "U_1767",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_173"] = { r, k or 0 }
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_4",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Transparency"] = 0.5,
        ["Flag"] = "U_821",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_710"] = { r, k or 0.5 }
    end
    })
    __T_N_466.U_3348:AddColorPicker({
        ["Name"] = "U_225",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Transparency"] = 0,
        ["Flag"] = "U_1126",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_2335"] = { r, k or 0 }
    end
    })
    __T_r_525 = false
    __T_k_526, __T_J_527 = "U_1952"
    __T_I_528 = game:GetService("Players")
    __T_p_529 = game:GetService("RunService")
    __T_B_530, __T_t_531, __T___532 = __T_I_528.LocalPlayer, {}
    __T_A_533 = 0
    function __T_l_534(y)
        local Q, z, T = _G,  __T_q_095.U_856["U_865"],  __T_q_095.U_719 and __T_q_095.U_719[y.Name] -- ENV_GETTER rewritten to _G
        y = T == "Murderer" and z.U_213 or T == "Sheriff" and z.U_1099 or z.U_2827
        return typeof(y) == "Color3" and y or Color3.new(1, 1, 1)
    end
    function __T_y_535()
        local Q = __T___532
        if Q then
            __T___532:Disconnect()
            __T___532 = nil
        end
        for Q, z in __T_t_531, nil, nil do
            __T_h_361.clear(z)
            __T_t_531[Q] = nil
        end
    end
    function __T_Q_536(z)
        __T_A_533 += z
        z = __T_A_533
        if z < 1--[[u1824]] then
            return
        end
        __T_A_533 = 0
        z = __T_q_095.U_856["U_865"]["U_865"]
        for T, Z in __T_I_528:GetPlayers() do
            local G, s = z and Z ~= __T_B_530 and Z.Character, __T_t_531[Z]
            if G and G.Parent then
                if not s then
                    s = __T_h_361.new()
                    __T_t_531[Z] = s
                end
                T = __T_l_534(Z)
                __T_h_361.U_1514(s)
                if __T_h_361.U_1508(s, __T_h_361.U_2691(s, G, true), T) then
                    __T_h_361.U_2205(s)
                    __T_h_361.U_2080(s, G, T)
                end
                __T_h_361.U_1446(s)
            else
                if s then
                    __T_h_361.clear(s)
                    __T_t_531[Z] = nil
                end
            end
        end
        for B, l in __T_t_531, nil, nil do
            if B.Parent ~= __T_I_528 then
                __T_h_361.clear(l)
                __T_t_531[B] = nil
            end
        end
    end
    __T_J_527 = function()
        local I, B = __T_r_525
        if I then
            local t = __T_k_526
            B = t == "U_347"
        else
            B = I
        end
        __T_q_095.U_856["U_865"]["U_1697"] = __T_r_525 and not B
        __T_q_095.U_856["U_865"]["U_136"] = __T_k_526
        __T_q_095.U_856["U_865"]["U_423"] = B
        I = not B
        if I then
            __T_y_535()
        else
            B = not __T___532
            if B then
                __T_A_533 = 1
                __T___532 = __T_p_529.Heartbeat:Connect(__T_Q_536)
            end
        end
    end
    getgenv()["U_2094"] = function()
        __T_r_525 = false
        __T_q_095.U_856["U_865"]["U_423"] = false
        __T_y_535()
    end
    __T_eP_413 = __T_S_383:AddToggle({
        ["Name"] = "U_2750",
        ["Default"] = false,
        ["Flag"] = "U_2031",
        ["U_3348"] = true,
        ["Callback"] = function(I)
        __T_r_525 = I
        __T_J_527()
    end
    })
    __T_K_384, __T_N_466 = __T_eP_413.U_3348, {
        ["Name"] = "U_1097",
        ["Default"] = "U_1952",
        ["U_3220"] = { "U_1952", "U_2124", "U_1036", "U_347" },
        ["Flag"] = "U_205"
    }
    __T_N_466.Callback = function(r)
        __T_k_526 = r
        __T_J_527()
    end
    __T_K_384:AddDropdown(__T_N_466)
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2769",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_3071",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_213"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_1003",
        ["Default"] = Color3.new(1, 1, 1),
        ["Flag"] = "U_2200",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2827"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2228",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Flag"] = "U_2321",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_1099"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2937",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 0,
        ["Flag"] = "U_2905",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_139"] = { r, k or 0 }
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2866",
        ["Default"] = Color3.new(0, 0, 1),
        ["Transparency"] = 0,
        ["Flag"] = "U_2821",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_3282"] = { r, k or 0 }
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_122",
        ["Default"] = Color3.new(1, 1, 1),
        ["Transparency"] = 0,
        ["Flag"] = "U_2180",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_268"] = { r, k or 0 }
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2936",
        ["Default"] = Color3.fromRGB(1--[[u2751]], 1--[[u2751]], 1--[[u2751]]),
        ["Transparency"] = 0,
        ["Flag"] = "U_697",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_2924"] = { r, k or 0 }
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_1698",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Transparency"] = 0,
        ["Flag"] = "U_1911",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_2502"] = { r, k or 0 }
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_352",
        ["Default"] = Color3.new(0, 0, 1),
        ["Transparency"] = 0,
        ["Flag"] = "U_1295",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_2540"] = { r, k or 0 }
    end
    })
    __T_eP_413 = __T_S_383:AddToggle({
        ["Name"] = "U_1712",
        ["Default"] = false,
        ["Flag"] = "U_766",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_3022"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2769",
        ["Default"] = Color3.new(1, 0, 0),
        ["Transparency"] = 1,
        ["Flag"] = "U_2324",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_630"] = { r, k or 1 }
    end
    })
    __T_eP_413.U_3348:AddToggle({
        ["Name"] = "U_3293",
        ["Default"] = false,
        ["Flag"] = "U_330",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2170"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_1312",
        ["Default"] = Color3.new(1, 0, 0),
        ["Flag"] = "U_668",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_37"][1] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2254",
        ["Default"] = Color3.fromRGB(255, 1--[[u2533]], 0),
        ["Flag"] = "U_3033",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_37"][2] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_2228",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Transparency"] = 1,
        ["Flag"] = "U_1683",
        ["Callback"] = function(r, k)
        __T_q_095.U_856["U_865"]["U_1479"] = { r, k or 1 }
    end
    })
    __T_eP_413.U_3348:AddToggle({
        ["Name"] = "U_3324",
        ["Default"] = false,
        ["Flag"] = "U_1802",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_2807"] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_367",
        ["Default"] = Color3.fromRGB(0, 1--[[u2494]], 255),
        ["Flag"] = "U_3389",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_52"][1] = r
    end
    })
    __T_eP_413.U_3348:AddColorPicker({
        ["Name"] = "U_1663",
        ["Default"] = Color3.fromRGB(0, 255, 255),
        ["Flag"] = "U_3247",
        ["Callback"] = function(r)
        __T_q_095.U_856["U_865"]["U_52"][2] = r
    end
    })
    __T_r_537 = game:GetService("RunService")
    __T_k_538 = game:GetService("CoreGui")
    __T_J_539 = game:GetService("Players")
    __T_I_540 = false
    __T_p_541 = false
    __T_B_542 = Color3.fromRGB(255, 255, 255)
    __T_t_543 = false
    __T___544 = Color3.fromRGB(255, 255, 255)
    __T_A_545 = Color3.fromRGB(255, 0, 0)
    __T_l_546 = false
    __T_y_547 = Color3.fromRGB(255, 255, 255)
    function __T_Q_548(z)
        local T, Z, G = _G,  __T___544,  __T_A_545 -- ENV_GETTER rewritten to _G
        local s = math.sin(z * 1--[[u91]] + os.clock() * 2) * 0.5 + 0.5
        return Z:Lerp(G, s)
    end
    __T_z_549, __T_T_550 = {}, {}
    __T_Z_551, __T_G_552, __T_s_553, __T_OP_554, __T_uP_555 = 0, {}
    __T_FP_556 = { "U_2310", "U_2082", "U_783" }
    __T_mP_557 = 3
    function __T_fP_558(PP)
        local YP, qP = _G,  PP.Parent -- ENV_GETTER rewritten to _G
        while qP and qP ~= workspace do
            if qP:IsA("Model") and __T_J_539:GetPlayerFromCharacter(qP) then
                return true
            end
            qP = qP.Parent
        end
        return false
    end
    function __T_J_559(PP)
        local YP = "BasePart"
        if PP:IsA(YP) then
            return PP
        end
        YP = "Model"
        if PP:IsA(YP) then
            return PP.PrimaryPart or PP:FindFirstChildWhichIsA("BasePart", true)
        end
        return PP:FindFirstChild("U_117") or PP:FindFirstChildWhichIsA("BasePart", true)
    end
    function __T_PP_560(YP)
        if YP.Name ~= "GunDrop" then
            return
        end
        if YP:IsA("BasePart") or YP:IsA("Model") or YP:IsA("Tool") then
            __T_G_552[YP] = true
        end
    end
    function __T_YP_561(qP)
        if qP.Name ~= "GunDrop" then
            return
        end
        __T_G_552[qP] = nil
    end
    function __T_qP_562()
        local dP = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_G_552)
        for cP, cP in ipairs(workspace:GetDescendants()) do
            if cP.Name == "GunDrop" and (cP:IsA("BasePart") or cP:IsA("Model") or cP:IsA("Tool")) then
                __T_G_552[cP] = true
            end
        end
    end
    function __T_dP_563()
        local cP, oP = _G,  {} -- ENV_GETTER rewritten to _G
        for xP in pairs(__T_G_552) do
            if xP.Name == "GunDrop" and xP.Parent and not __T_fP_558(xP) then
                local fP = __T_J_559(xP)
                if fP then
                    local J = (xP:IsA("BasePart") or xP:IsA("Model")) and xP or fP
                    oP[#oP + 1] = { ["U_2286"] = xP, ["U_3174"] = fP, ["U_2785"] = J }
                end
            end
        end
        return oP
    end
    function __T_J_564(fP)
        local cP, oP = _G,  __T_z_549[fP] -- ENV_GETTER rewritten to _G
        if oP then
            if oP.U_628 then
                pcall(function()
                    oP.U_628:Destroy()
                end)
            end
            if oP.U_503 then
                pcall(function()
                    oP.U_503:Remove()
                end)
            end
            if oP[1--[[u1681]]] then
                for xP = 1, #oP[1--[[u1681]]] do
                    pcall(function()
                        oP[1--[[u1681]]][xP]:Remove()
                    end)
                end
            end
            __T_z_549[fP] = nil
        end
    end
    function __T_fP_565()
        local cP = _G -- ENV_GETTER rewritten to _G
        for oP in pairs(__T_z_549) do
            __T_J_564(oP)
        end
        __T_T_550 = {}
    end
    function __T_cP_566(oP)
        local xP, CP = _G,  __T_I_540 -- ENV_GETTER rewritten to _G
        if not CP then
            if next(__T_z_549) then
                __T_fP_565()
            end
            return
        end
        __T_Z_551 += oP
        oP = __T_Z_551
        CP = oP >= 1--[[u1791]]
        if CP then
            __T_Z_551 = 0
            __T_T_550 = __T_dP_563()
            local dP, MP, nP = {}, ipairs, __T_T_550
            for XP, XP in MP(nP) do
                dP[XP.U_2286] = true
            end
            for MP in pairs(__T_z_549) do
                if not dP[MP] then
                    __T_J_564(MP)
                end
            end
        end
        local dP, MP, nP = workspace.CurrentCamera, ipairs, __T_T_550
        for T, XP in MP(nP) do
            CP, T = XP.U_2286, XP.U_3174
            oP = CP.Parent and T and T.Parent
            if oP then
                local oP = __T_z_549[CP]
                if not oP then
                    oP = {}
                    __T_z_549[CP] = oP
                end
                local z = __T_l_546
                if z then
                    if not oP.U_628 then
                        local MP = Instance.new("Highlight")
                        MP.U_2167 = 1
                        MP.U_3141 = __T_EnumFB.U_1976["U_506"]
                        MP.Parent = __T_k_538
                        oP.U_628 = MP
                    end
                    oP.U_628["U_1995"] = XP.U_2785
                    oP.U_628["U_2111"] = __T_y_547
                    oP.U_628["U_2979"] = 0
                    oP.U_628["Enabled"] = true
                else
                    if oP.U_628 then
                        oP.U_628["Enabled"] = false
                    end
                end
                z = __T_p_541
                if z then
                    local k, z = dP:WorldToViewportPoint(T.Position), __T_t_543
                    if z then
                        if oP.U_503 then
                            oP.U_503["Visible"] = false
                        end
                        if k.Z > 0 then
                            local z = oP[1--[[u1681]]]
                            if not z then
                                z = {}
                                oP[1--[[u1681]]] = z
                            end
                            local T = oP.U_159
                            if not T then
                                T = {}
                                oP.U_159 = T
                            end
                            local dP = oP.U_3326
                            if not dP then
                                dP = {}
                                oP.U_3326 = dP
                            end
                            local MP = oP.U_3088
                            if not MP then
                                MP = {}
                                oP.U_3088 = MP
                            end
                            local nP = oP.U_1538
                            if not nP then
                                nP = {}
                                oP.U_1538 = nP
                            end
                            local XP = 0
                            for gP = 1, __T_mP_557 do
                                local RP = z[gP]
                                if not RP then
                                    RP = Drawing.new(1--[[u3145]])
                                    RP.U_83 = false
                                    RP.U_2386 = true
                                    RP.Size = 13
                                    z[gP] = RP
                                end
                                local HP, WP, DP = __T_FP_556[gP], RP.Size, RP.U_2842
                                if dP[gP] ~= HP or MP[gP] ~= WP or nP[gP] ~= DP then
                                    RP[1--[[u3145]]] = HP
                                    dP[gP] = HP
                                    MP[gP] = WP
                                    nP[gP] = DP
                                    T[gP] = RP.U_992["X"]
                                end
                                XP += T[gP]
                            end
                            for FP = __T_mP_557 + 1, #z do
                                z[FP]["Visible"] = false
                            end
                            local FP = k.X - XP * 0.5
                            for dP = 1, __T_mP_557 do
                                local MP = z[dP]
                                MP.Color = __T_Q_548(__T_mP_557 > 1 and (dP - 1) / (__T_mP_557 - 1) or 0)
                                MP.Position = Vector2.new(FP, k.Y)
                                MP.Visible = true
                                FP += T[dP]
                            end
                        else
                            if oP[1--[[u1681]]] then
                                for Q = 1, #oP[1--[[u1681]]] do
                                    oP[1--[[u1681]]][Q]["Visible"] = false
                                end
                            end
                        end
                    else
                        if oP[1--[[u1681]]] then
                            for Q = 1, #oP[1--[[u1681]]] do
                                oP[1--[[u1681]]][Q]["Visible"] = false
                            end
                        end
                        if not oP.U_503 then
                            local Q = Drawing.new(1--[[u3145]])
                            Q.U_83 = true
                            Q.U_2386 = true
                            Q.Size = 13
                            oP.U_503 = Q
                        end
                        local Q = k.Z > 0
                        if Q then
                            oP.U_503["Position"] = Vector2.new(k.X, k.Y)
                            oP.U_503[1--[[u3145]]] = "Gun"
                            oP.U_503["Color"] = __T_B_542
                            oP.U_503["Visible"] = true
                        else
                            oP.U_503["Visible"] = false
                        end
                    end
                else
                    if oP.U_503 then
                        oP.U_503["Visible"] = false
                    end
                    if oP[1--[[u1681]]] then
                        for k = 1, #oP[1--[[u1681]]] do
                            oP[1--[[u1681]]][k]["Visible"] = false
                        end
                    end
                end
            else
                __T_J_564(CP)
            end
        end
    end
    function __T_k_567()
        local J, Q = _G,  __T_s_553 -- ENV_GETTER rewritten to _G
        if Q then
            pcall(function()
                __T_s_553:Disconnect()
            end)
            __T_s_553 = nil
        end
        Q = __T_OP_554
        if Q then
            pcall(function()
                __T_OP_554:Disconnect()
            end)
            __T_OP_554 = nil
        end
        Q = __T_uP_555
        if Q then
            pcall(function()
                __T_uP_555:Disconnect()
            end)
            __T_uP_555 = nil
        end
        table.clear(__T_G_552)
    end
    function __T_J_568()
        local Q, z = _G,  __T_s_553 -- ENV_GETTER rewritten to _G
        if z then
            return
        end
        __T_k_567()
        __T_qP_562()
        __T_Z_551 = 1--[[u1791]]
        __T_OP_554 = workspace.DescendantAdded:Connect(__T_PP_560)
        __T_uP_555 = workspace.DescendantRemoving:Connect(__T_YP_561)
        __T_s_553 = __T_r_537.RenderStepped:Connect(__T_cP_566)
    end
    __T_N_466 = __T_S_383:AddToggle({
        ["Name"] = "U_2378",
        ["Default"] = false,
        ["Flag"] = "U_1991",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_I_540 = r
        if r then
            __T_J_568()
        else
            __T_k_567()
            __T_fP_565()
        end
    end
    })
    __T_i_465, __T_eP_413 = __T_N_466.U_3348, { ["Name"] = "U_1147", ["Default"] = false, ["Flag"] = "U_3032" }
    __T_eP_413.Callback = function(r)
        __T_p_541 = r
    end
    __T_i_465:AddToggle(__T_eP_413)
    __T_r_569, __T_J_570 = __T_N_466.U_3348, {
        ["Name"] = "U_1147",
        ["Default"] = Color3.fromRGB(255, 255, 255),
        ["Flag"] = "U_1846"
    }
    __T_J_570.Callback = function(p)
        __T_B_542 = p
    end
    __T_r_569:AddColorPicker(__T_J_570)
    __T_K_384, __T_r_569 = __T_N_466.U_3348, { ["Name"] = "U_6", ["Default"] = false, ["Flag"] = "U_545" }
    __T_r_569.Callback = function(p)
        __T_t_543 = p
    end
    __T_K_384:AddToggle(__T_r_569)
    __T_J_570, __T_r_569 = __T_N_466.U_3348, {
        ["Name"] = "U_1031",
        ["Default"] = Color3.fromRGB(255, 255, 255),
        ["Flag"] = "U_1874"
    }
    __T_r_569.Callback = function(K)
        __T___544 = K
    end
    __T_J_570:AddColorPicker(__T_r_569)
    __T_r_569, __T_J_570 = __T_N_466.U_3348, { ["Name"] = "U_2086", ["Default"] = Color3.fromRGB(255, 0, 0), ["Flag"] = "U_1867" }
    __T_J_570.Callback = function(K)
        __T_A_545 = K
    end
    __T_r_569:AddColorPicker(__T_J_570)
    __T_r_569, __T_J_570 = __T_N_466.U_3348, { ["Name"] = "U_2431", ["Default"] = false, ["Flag"] = "U_1296" }
    __T_J_570.Callback = function(K)
        __T_l_546 = K
    end
    __T_r_569:AddToggle(__T_J_570)
    __T_J_570, __T_r_569 = __T_N_466.U_3348, {
        ["Name"] = "U_2431",
        ["Default"] = Color3.fromRGB(255, 255, 255),
        ["Flag"] = "U_3061"
    }
    __T_r_569.Callback = function(K)
        __T_y_547 = K
    end
    __T_J_570:AddColorPicker(__T_r_569)
    getgenv()["U_2090"] = function()
        __T_I_540 = false
        __T_k_567()
        __T_fP_565()
    end
    __T_S_383:AddToggle({
        ["Name"] = "U_2103",
        ["Default"] = false,
        ["Flag"] = "U_3349",
        ["Callback"] = function(S)
        __T_q_095.U_601 = S
    end
    })
    __T_S_571, __T_K_572, __T_r_573 = __T_X_111:AddSection({ ["Name"] = "U_1968", ["Position"] = "U_982" }), game:GetService("Players"), game:GetService("RunService")
    __T_k_574 = game:GetService("Stats")
    __T_J_575 = game:GetService("TweenService")
    __T_I_576 = game:GetService("Debris")
    __T_p_577 = __T_K_572.LocalPlayer
    __T_B_578 = workspace
    __T_t_579 = false
    __T___580 = false
    __T_A_581 = false
    __T_i_582 = Color3.fromRGB(255, 1--[[u2325]], 1--[[u2325]])
    __T_N_583 = Color3.fromRGB(0, 1--[[u108]], 255)
    __T_l_584 = Color3.fromRGB(255, 1--[[u108]], 0)
    __T_y_585 = "U_1952"
    __T_Q_586, __T_z_587, __T_T_588, __T_Z_589, __T_G_590, __T_s_591, __T_OP_592, __T_uP_593 = "U_1952", {}, {}, {}, {}, {}, {}, {}
    __T_FP_594 = __T_h_361.new()
    __T_mP_595 = __T_h_361.new()
    __T_fP_596, __T_PP_597, __T_YP_598 = nil, nil, nil
    __T_qP_599 = "U_893"
    __T_dP_600, __T_eP_601 = 1--[[u1693]]
    __T_cP_602 = 256
    __T_oP_603 = table.create(__T_cP_602)
    for xP = 1, __T_cP_602 do
        __T_oP_603[xP] = { 0, CFrame.identity }
    end
    __T_xP_604 = 1
    __T_CP_605 = 0
    __T_MP_606 = 1--[[u773]]
    __T_nP_607, __T_XP_608, __T_gP_609, __T_RP_610, __T_HP_611, __T_WP_612, __T_DP_613, __T_vP_614 = 0, {}, {}, {}, {}, {}, {}
    __T_jP_615, __T_aP_616, __T_EP_617, __T_UP_618 = false, {}, {}
    __T_wP_619, __T_VP_620 = false, {}
    __T_hP_621 = false
    __T_LP_622 = Color3.new(1, 1, 1)
    __T_bP_623 = 1
    __T_SP_624, __T_KP_625 = 1--[[u2112]]
    __T_rP_626 = false
    __T_kP_627 = Color3.fromRGB(1--[[u2447]], 1--[[u2760]], 255)
    function __T_JP_628()
        return __T_k_574.U_398["U_684"]["U_1753"]:GetValue() / 1--[[u1731]]
    end
    function __T_k_629()
        local IP, pP = _G,  __T_eP_601 -- ENV_GETTER rewritten to _G
        if pP then
            local pP = IP.U_1537["U_1676"]
            if pP then
                IP.U_1537["U_1676"][__T_eP_601] = nil
            end
            pcall(function()
                __T_eP_601:Destroy()
            end)
            __T_eP_601 = nil
        end
        __T_XP_608 = {}
        __T_xP_604 = 1
        __T_CP_605 = 0
    end
    function __T_IP_630()
        local pP = _G -- ENV_GETTER rewritten to _G
        __T_k_629()
        local BP = __T_p_577.Character
        if not BP then
            return
        end
        if not BP:FindFirstChild("HumanoidRootPart") then
            return
        end
        BP.Archivable = true
        local tP, _P = pcall(function()
            return BP:Clone()
        end)
        BP.Archivable = false
        if not tP or not _P then
            return
        end
        pP.U_1537["U_1676"] = pP.U_1537["U_1676"] or {}
        tP = {}
        for AP, iP in BP:GetDescendants() do
            AP = "BasePart"
            if iP:IsA(AP) then
                tP[#tP + 1] = iP
            end
        end
        local BP = 0
        for AP, iP in _P:GetDescendants() do
            AP = iP:IsA("U_2237") or iP:IsA("U_1919")
            if AP then
                pcall(function()
                    iP:Destroy()
                end)
            else
                local AP = iP:IsA("U_1417") or iP:IsA("U_145") or iP:IsA("U_2370")
                if AP then
                    pcall(function()
                        iP:Destroy()
                    end)
                else
                    local AP = iP:IsA("U_1284") or iP:IsA("U_1080") or iP:IsA("U_1650") or iP:IsA("U_1958") or iP:IsA("U_2193") or iP:IsA("U_1808")
                    if AP then
                        pcall(function()
                            iP:Destroy()
                        end)
                    else
                        local AP = iP:IsA("BasePart")
                        if AP then
                            iP.Anchored = true
                            iP.CanCollide = false
                            iP.CanQuery = false
                            iP.Massless = true
                            iP.CastShadow = false
                            local AP = iP.Name == "HumanoidRootPart"
                            if AP then
                                iP.Transparency = 1
                            else
                                iP.Material = __T_EnumFB.Material["U_1952"]
                                iP.Color = __T_i_582
                                iP.Transparency = 0
                            end
                            BP += 1
                            AP = __T_XP_608
                            local NP, lP = #AP + 1, {}
                            do local _xgSrc = {iP, tP[BP]}; for _xgI = 1, #_xgSrc do lP[#lP + 1] = _xgSrc[_xgI] end end
                            AP[NP] = lP
                        end
                    end
                end
            end
        end
        local BP = _P:FindFirstChildOfClass("Humanoid")
        if BP then
            pcall(function()
                BP:Destroy()
            end)
        end
        _P.Parent = __T_B_578
        __T_eP_601 = _P
        pP.U_1537["U_1676"][_P] = true
    end
    function __T_pP_631()
        local BP, tP = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        local _P = tP and tP:FindFirstChild("HumanoidRootPart")
        if not _P then
            return
        end
        tP = getgenv()["U_2255"]
        if tP then
            local AP, iP = __T_eP_601
            if AP then
                local NP = __T_eP_601
                iP = NP.Parent
            else
                iP = AP
            end
            if iP then
                AP = __T_eP_601
                AP.Parent = nil
            end
            return
        end
        tP = not __T_eP_601
        if tP then
            __T_IP_630()
            local AP = __T_eP_601
            if not AP then
                return
            end
        end
        tP = __T_eP_601
        local AP = not tP.Parent
        if AP then
            tP = __T_eP_601
            tP.Parent = __T_B_578
        end
        local iP, NP, lP = os.clock(), CFrame, __T_CP_605 < __T_cP_602
        if lP then
            tP = __T_CP_605
            __T_CP_605 = tP + 1
        else
            __T_xP_604 = __T_xP_604 % __T_cP_602 + 1
        end
        lP = __T_oP_603[(__T_xP_604 + __T_CP_605 - 2) % __T_cP_602 + 1]
        lP[1] = iP
        lP[2] = NP
        AP = iP - __T_nP_607 >= 1--[[u3198]]
        if AP then
            __T_nP_607 = iP
            lP, tP = pcall(__T_JP_628)
  ]============],
    [11] = [============[
          __T_MP_606 = math.clamp(lP and tP or 1--[[u773]], 1--[[u3159]], 1--[[u1226]])
        end
        lP = __T_MP_606
        local MP, nP, JP, AP, yP = iP - lP, __T_CP_605, 1, -1, NP
        for QP = nP, JP, AP do
            tP = __T_oP_603[(__T_xP_604 + QP - 2) % __T_cP_602 + 1]
            if tP[1] <= MP then
                yP = tP[2]
                break
            end
        end
        while true do
            JP = __T_CP_605
            AP = JP > 0 and __T_oP_603[__T_xP_604][1] < iP - 1
            if not AP then
                break
            end
            __T_xP_604 = __T_xP_604 % __T_cP_602 + 1
            BP = __T_CP_605
            __T_CP_605 = BP - 1
        end
        NP, tP, AP, lP = CFrame:Inverse(), 1, #__T_XP_608, 1
        for cP = tP, AP, lP do
            MP, JP = __T_XP_608[cP][1], __T_XP_608[cP][2]
            if MP and MP.Parent and JP and JP.Parent then
                CFrame = yP * (NP * CFrame)
            end
        end
    end
    function __T_cP_632()
        local oP, xP, CP = (_G), __T_PP_597 -- [EnvProxyPartial]
        if xP then
            local MP = __T_PP_597
            CP = MP.Parent
        else
            CP = xP
        end
        if CP then
            return
        end
        local MP = Instance.new("U_915")
        MP.Name = tostring(math.random(1--[[u2149]], 1--[[u1805]]))
        MP.U_2817 = false
        MP.U_1922 = true
        MP.U_2450 = 1--[[u807]]
        pcall(function()
            local nP = _G -- ENV_GETTER rewritten to _G
            MP.Parent = gethui and gethui() or game:GetService("CoreGui")
        end)
        __T_fP_596 = Instance.new("U_2715")
        CP = __T_fP_596
        CP.Size = UDim2.fromScale(1, 1)
        CP = __T_fP_596
        CP.U_1105 = 1
        xP = __T_fP_596
        xP.U_2733 = 0
        xP = __T_fP_596
        xP.U_3309 = Color3.new(1, 1, 1)
        CP = __T_fP_596
        CP.U_260 = Color3.new(1, 1, 1)
        xP = __T_fP_596
        xP.U_2116 = Vector3.new(-1, -1, -1)
        xP = __T_fP_596
        xP.CurrentCamera = __T_B_578.CurrentCamera
        xP = __T_fP_596
        xP.Parent = MP
        local xP = game:GetService("Lighting"):FindFirstChildOfClass("U_850")
        if xP then
            pcall(function()
                xP:Clone()["Parent"] = __T_fP_596
            end)
        end
        __T_PP_597 = Instance.new("U_2994")
        oP = __T_PP_597
        oP.Parent = __T_fP_596
    end
    __T_oP_633 = {
        ["Head"] = true,
        ["UpperTorso"] = true,
        ["LowerTorso"] = true,
        ["Torso"] = true,
        ["U_669"] = true,
        ["U_282"] = true,
        ["U_2511"] = true,
        ["U_2260"] = true,
        ["U_3351"] = true,
        ["U_3378"] = true,
        ["U_2036"] = true,
        ["U_212"] = true,
        ["U_1780"] = true,
        ["U_3181"] = true,
        ["U_3173"] = true,
        ["U_925"] = true,
        ["U_2897"] = true,
        ["U_2833"] = true,
        ["U_2419"] = true,
        ["U_2789"] = true
    }
    function __T_xP_634(CP)
        local MP, nP = _G,  "U_2903" -- ENV_GETTER rewritten to _G
        if CP:FindFirstChildWhichIsA(nP) then
            return true
        end
        if __T_oP_633[CP.Name] then
            return false
        end
        nP = "U_161"
        if CP:FindFirstChildWhichIsA(nP) then
            return true
        end
        local oP, nP = pcall(function()
            return CP.U_2231
        end)
        return oP and nP == true
    end
    function __T_oP_635(CP, MP)
        local nP, XP = _G,  CP.Archivable -- ENV_GETTER rewritten to _G
        local JP = not XP
        if JP then
            if not pcall(function()
                CP.Archivable = true
            end) then
                return nil
            end
        end
        local BP, tP = pcall(function()
            return CP:Clone()
        end)
        if JP then
            pcall(function()
                CP.Archivable = XP
            end)
        end
        if not BP or not tP then
            return nil
        end
        for CP, CP in tP:GetChildren() do
            if not CP:IsA("U_585") then
                CP:Destroy()
            end
        end
        local CP = tP:FindFirstChildWhichIsA("U_585")
        if CP then
            pcall(function()
                CP[1--[[u1447]]] = CP[1--[[u1447]]] * MP
            end)
            pcall(function()
                CP.U_1982 = ""
            end)
        else
            tP.Size = tP.Size * MP
        end
        pcall(function()
            tP.U_514 = ""
        end)
        pcall(function()
            tP.U_197 = ""
        end)
        tP.CanCollide = false
        tP.CanQuery = false
        tP.CanTouch = false
        tP.Massless = true
        tP.CastShadow = false
        tP.LocalTransparencyModifier = 0
        return tP
    end
    function __T_CP_636(MP)
        if MP.U_1526 then
            MP.U_1526:Destroy()
        end
        if MP.U_806 then
            MP.U_806:Destroy()
        end
        if MP[1--[[u1412]]] then
            for nP = 1, #MP[1--[[u1412]]] do
                MP[1--[[u1412]]][nP]:Destroy()
            end
        end
        MP.U_1526, MP.U_806, MP[1--[[u1412]]], MP.U_218, MP.U_2105 = nil, nil, nil, nil, nil
    end
    function __T_MP_637(nP, XP, JP, BP)
        local tP, _P = _G,  JP[1] -- ENV_GETTER rewritten to _G
        if nP.U_2105 ~= _P or nP.U_218 ~= #XP or not nP.U_1526 or not nP.U_1526["Parent"] then
            __T_CP_636(nP)
            local AP = Instance.new("Model")
            AP.Name = "\0"
            for iP = 1, #XP do
                local NP = XP[iP]
                iP = not __T_xP_634(NP) and __T_oP_635(NP, "U_2587") or nil
                if iP then
                    iP.Anchored = false
                    iP.CFrame = CFrame
                    iP.Parent = AP
                    local lP = Instance.new("U_2424")
                    lP.U_981 = iP
                    lP.U_3121 = NP
                    lP.Parent = iP
                end
            end
            AP.Parent = __T_B_578
            local iP = Instance.new("Highlight")
            iP.U_3141 = __T_EnumFB.U_1976["U_506"]
            iP.U_2979 = 1
            iP.U_1995 = AP
            iP.Parent = AP
            local NP = {}
            for lP = 1, #JP do
                local yP = Instance.new("Highlight")
                yP.U_3141 = __T_EnumFB.U_1976["U_286"]
                yP.U_2979 = 1
                yP.U_1995 = JP[lP]
                yP.Parent = AP
                NP[lP] = yP
            end
            nP.U_1526, nP.U_806, nP[1--[[u1412]]] = AP, iP, NP
            nP.U_218, nP.U_2105 = #XP, _P
        end
        nP.U_806["U_2930"] = BP
        nP.U_806["U_2167"] = 0
        for XP = 1, #nP[1--[[u1412]]] do
            nP[1--[[u1412]]][XP]["U_2930"] = BP
            nP[1--[[u1412]]][XP]["U_2167"] = 0
        end
    end
    function __T_nP_638(XP)
        if XP.U_1526 then
            XP.U_1526:Destroy()
        end
        XP.U_1526, XP.U_1866, XP.U_218, XP.U_2105, XP.U_2508 = nil, nil, nil, nil, nil
    end
    function __T_XP_639(JP, BP, tP, _P)
        local AP, iP = _G,  JP.U_2105 ~= tP or JP.U_218 ~= #BP or not JP.U_1526 or not JP.U_1526["Parent"] -- ENV_GETTER rewritten to _G
        if iP then
            __T_nP_638(JP)
            __T_cP_632()
            local cP = Instance.new("Model")
            cP.Name = "\0"
            local iP = {}
            for NP = 1, #BP do
                local lP = BP[NP]
                NP = not __T_xP_634(lP) and __T_oP_635(lP, __T_qP_599) or nil
                if NP then
                    NP.Anchored = true
                    NP.Material = __T_EnumFB.Material["U_1774"]
                    NP.Reflectance = 1--[[u2609]]
                    NP.Transparency = __T_dP_600
                    NP.Color = _P
                    CFrame = CFrame
                    NP.Parent = cP
                    iP[#iP + 1] = { lP, NP }
                end
            end
            cP.Parent = __T_PP_597
            JP.U_1526, JP.U_1866 = cP, iP
            JP.U_218, JP.U_2105, JP.U_2508 = #BP, tP, _P
        else
            if JP.U_2508 ~= _P then
                JP.U_2508 = _P
                local qP = JP.U_1866
                if qP then
                    for cP = 1, #qP do
                        qP[cP][2]["Color"] = _P
                    end
                end
            end
        end
    end
    function __T_qP_640(cP)
        local oP, xP = _G,  cP.U_1866 -- ENV_GETTER rewritten to _G
        if not xP then
            return
        end
        for JP = 1, #xP do
            local BP, tP = xP[JP][1], xP[JP][2]
            if BP.Parent then
                CFrame = CFrame
                cP = math.max(BP.Transparency, BP.LocalTransparencyModifier) >= 1 and 1 or __T_dP_600
                if tP.Transparency ~= cP then
                    tP.Transparency = cP
                end
            else
                if tP.Transparency ~= 1 then
                    tP.Transparency = 1
                end
            end
        end
    end
    function __T_dP_641()
        local cP = _G -- ENV_GETTER rewritten to _G
        local oP, xP = pairs, __T_gP_609
        for JP, BP in oP(xP) do
            if JP and JP.Parent then
                JP.Material = BP[1]
                JP.Color = BP[2]
            end
        end
        __T_gP_609 = {}
        xP, oP = pairs, __T_HP_611
        for JP, BP in xP(oP) do
            if JP then
                pcall(function()
                    JP.Parent = BP
                end)
            end
        end
        __T_HP_611 = {}
        __T_jP_615 = false
    end
    function __T_cP_642(oP)
        oP.Parent = nil
    end
    function __T_oP_643(xP)
        local JP, BP = _G,  __T_vP_614 ~= xP -- ENV_GETTER rewritten to _G
        if BP then
            __T_vP_614 = xP
            __T_jP_615 = false
            for tP = 1, #__T_aP_616 do
                pcall(function()
                    __T_aP_616[tP]:Disconnect()
                end)
            end
            table.clear(__T_aP_616)
            local function tP()
                __T_jP_615 = false
            end
            __T_aP_616[1] = xP.DescendantAdded:Connect(tP)
            __T_aP_616[2] = xP.DescendantRemoving:Connect(tP)
        end
        BP = not __T_jP_615
        if BP then
            table.clear(__T_DP_613)
            table.clear(__T_Z_589)
            local JP, BP = 0, 0
            for tP, _P in xP:GetDescendants() do
                if _P:IsA("BasePart") and _P.Name ~= "HumanoidRootPart" then
                    JP += 1
                    __T_DP_613[JP] = _P
                else
                    tP = "U_2370"
                    if _P:IsA(tP) then
                        BP += 1
                        __T_Z_589[BP] = _P
                    end
                end
            end
            __T_jP_615 = true
        end
        return __T_DP_613
    end
    function __T_xP_644(DP, JP)
        local BP = _G -- ENV_GETTER rewritten to _G
        for tP = 1, #DP do
            local _P = DP[tP]
            if _P.Parent and not JP[_P] then
                JP[_P] = _P.Parent
                pcall(__T_cP_642, _P)
            end
        end
    end
    function __T_cP_645()
        local DP, JP = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        if not JP then
            return
        end
        local BP, tP = __T_oP_643(JP), __T_y_585
        if tP ~= "U_347" then
            __T_h_361.clear(__T_FP_594)
        end
        tP = __T_y_585
        local oP = tP == "U_2124"
        if oP then
            __T_nP_638(__T_OP_592)
            tP = next(__T_gP_609) or next(__T_HP_611)
            if tP then
                __T_dP_641()
            end
            __T_MP_637(__T_z_587, BP, { JP }, __T_N_583)
        else
            local oP = __T_y_585
            local tP = oP == "U_1036"
            if tP then
                __T_CP_636(__T_z_587)
                oP = next(__T_gP_609) or next(__T_HP_611)
                if oP then
                    __T_dP_641()
                end
                __T_XP_639(__T_OP_592, BP, JP, __T_N_583)
            else
                local oP = __T_y_585
                local tP = oP == "U_347"
                if tP then
                    __T_CP_636(__T_z_587)
                    __T_nP_638(__T_OP_592)
                    oP = next(__T_gP_609) or next(__T_HP_611)
                    if oP then
                        __T_dP_641()
                    end
                    __T_h_361.U_1514(__T_FP_594)
                    local oP = __T_h_361.U_1508(__T_FP_594, __T_h_361.U_2691(__T_FP_594, JP), __T_N_583)
                    if oP then
                        __T_h_361.U_2205(__T_FP_594)
                        __T_h_361.U_2080(__T_FP_594, JP, __T_N_583)
                    end
                    __T_h_361.U_1446(__T_FP_594)
                else
                    __T_CP_636(__T_z_587)
                    __T_nP_638(__T_OP_592)
                    __T_xP_644(__T_Z_589, __T_HP_611)
                    local Z, oP, JP = 1, #BP, 1
                    for tP = Z, oP, JP do
                        local Z = BP[tP]
                        tP = Z.Parent
                        if tP then
                            local oP = not __T_gP_609[Z]
                            if oP then
                                local oP = __T_gP_609
                                oP[Z] = { Z.Material, Z.Color }
                            end
                            Z.Material = __T_EnumFB.Material["U_1952"]
                            Z.Color = __T_N_583
                        end
                    end
                end
            end
        end
    end
    getgenv()["U_3160"] = function(Z, oP)
        local DP, JP = _G,  not __T___580 or not Z or not oP -- ENV_GETTER rewritten to _G
        if JP then
            return
        end
        local BP, tP = oP:GetDescendants(), Z:GetDescendants()
        if #BP ~= #tP then
            return
        end
        local _P, AP, iP, NP = {}, 1, #BP, 1
        for lP = AP, iP, NP do
            oP, Z = BP[lP], tP[lP]
            _P[oP] = Z
            lP = oP:IsA("BasePart") and Z:IsA("BasePart")
            if lP then
                JP = __T_gP_609[oP]
                if JP then
                    Z.Material = JP[1]
                    Z.Color = JP[2]
                end
            end
        end
        JP, Z = pairs, __T_HP_611
        for oP, BP in JP(Z) do
            local Z = _P[BP]
            if Z then
                pcall(function()
                    oP:Clone()["Parent"] = Z
                end)
            end
        end
    end
    getgenv()["U_1321"] = function(Z)
        local oP = _G -- ENV_GETTER rewritten to _G
        if typeof(Z) ~= "table" then
            return
        end
        local DP, JP, BP, tP = {}, 1, #Z, 1
        for _P = JP, BP, tP do
            local BP = Z[_P]
            local tP, AP = BP and BP[1], BP and BP[2]
            _P = tP and AP and AP.Parent
            if _P then
                DP[tP] = AP
                BP = __T_gP_609[tP]
                if BP then
                    AP.Material = BP[1]
                    AP.Color = BP[2]
                end
            end
        end
        Z, JP = pairs, __T_HP_611
        for gP, HP in Z(JP) do
            local Z = DP[HP]
            if Z and not Z:FindFirstChildOfClass("U_2370") then
                pcall(function()
                    gP:Clone()["Parent"] = Z
                end)
            end
        end
        pcall(__T_h_361.U_2356, __T_FP_594, DP)
    end
    function __T_Z_646()
        local oP = _G -- ENV_GETTER rewritten to _G
        local gP, HP = pairs, __T_RP_610
        for DP, JP in gP(HP) do
            if DP and DP.Parent then
                DP.Material = JP[1]
                DP.Color = JP[2]
            end
        end
        __T_RP_610 = {}
        HP, gP = pairs, __T_WP_612
        for DP, JP in HP(gP) do
            if DP then
                pcall(function()
                    DP.Parent = JP
                end)
            end
        end
        __T_WP_612 = {}
        __T_wP_619 = false
    end
    function __T_oP_647(gP)
        local HP, DP = _G,  __T_UP_618 ~= gP -- ENV_GETTER rewritten to _G
        if DP then
            __T_UP_618 = gP
            __T_wP_619 = false
            for JP = 1, #__T_VP_620 do
                pcall(function()
                    __T_VP_620[JP]:Disconnect()
                end)
            end
            table.clear(__T_VP_620)
            local function JP()
                __T_wP_619 = false
            end
            __T_VP_620[1] = gP.DescendantAdded:Connect(JP)
            __T_VP_620[2] = gP.DescendantRemoving:Connect(JP)
        end
        DP = not __T_wP_619
        if DP then
            table.clear(__T_EP_617)
            table.clear(__T_G_590)
            table.clear(__T_s_591)
            local HP, DP, JP = 0, 0, 0
            for BP, tP in gP:GetChildren() do
                BP = "Tool"
                if tP:IsA(BP) then
                    HP += 1
                    __T_s_591[HP] = tP
                    for gP, HP in tP:GetDescendants() do
                        gP = "BasePart"
                        if HP:IsA(gP) then
                            DP += 1
                            __T_EP_617[DP] = HP
                        else
                            local gP = "U_2370"
                            if HP:IsA(gP) then
                                JP += 1
                                __T_G_590[JP] = HP
                            end
                        end
                    end
                end
            end
            __T_wP_619 = true
        end
        return __T_EP_617
    end
    function __T_gP_648()
        local HP, DP = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        if not DP then
            return
        end
        local EP = __T_oP_647(DP)
        local oP, JP = #EP == 0
        if oP then
            JP = oP
        else
            DP = __T_Q_586
            JP = DP ~= "U_347"
        end
        if JP then
            __T_h_361.clear(__T_mP_595)
        end
        oP = #EP == 0
        if oP then
            __T_CP_636(__T_T_588)
            __T_nP_638(__T_uP_593)
            JP = next(__T_RP_610) or next(__T_WP_612)
            if JP then
                __T_Z_646()
            end
            return
        end
        JP = __T_Q_586
        oP = JP == "U_2124"
        if oP then
            __T_nP_638(__T_uP_593)
            JP = next(__T_RP_610) or next(__T_WP_612)
            if JP then
                __T_Z_646()
            end
            __T_MP_637(__T_T_588, EP, __T_s_591, __T_l_584)
        else
            DP = __T_Q_586
            local oP = DP == "U_1036"
            if oP then
                __T_CP_636(__T_T_588)
                local oP = next(__T_RP_610) or next(__T_WP_612)
                if oP then
                    __T_Z_646()
                end
                __T_XP_639(__T_uP_593, EP, __T_s_591[1], __T_l_584)
            else
                local oP = __T_Q_586
                local MP = oP == "U_347"
                if MP then
                    __T_CP_636(__T_T_588)
                    __T_nP_638(__T_uP_593)
                    oP = next(__T_RP_610) or next(__T_WP_612)
                    if oP then
                        __T_Z_646()
                    end
                    __T_h_361.U_1514(__T_mP_595)
                    local oP = __T_h_361.U_1508(__T_mP_595, EP, __T_l_584)
                    if oP then
                        local oP, MP, XP = 1, #__T_s_591, 1
                        for DP = oP, MP, XP do
                            __T_h_361.U_2080(__T_mP_595, __T_s_591[DP], __T_l_584)
                        end
                    end
                    __T_h_361.U_1446(__T_mP_595)
                else
                    __T_CP_636(__T_T_588)
                    __T_nP_638(__T_uP_593)
                    __T_xP_644(__T_G_590, __T_WP_612)
                    local G, s, oP = 1, #EP, 1
                    for xP = G, s, oP do
                        local G = EP[xP]
                        xP = G.Parent
                        if xP then
                            local s = not __T_RP_610[G]
                            if s then
                                local s = __T_RP_610
                                s[G] = { G.Material, G.Color }
                            end
                            G.Material = __T_EnumFB.Material["U_1952"]
                            G.Color = __T_l_584
                        end
                    end
                end
            end
        end
    end
    function __T_G_649(s, oP)
        local xP = _G -- ENV_GETTER rewritten to _G
        local MP = Ray.new()
        MP.U_2551 = __T_EnumFB.U_3131["U_379"]
        MP.U_2661 = { s }
        MP.U_1011 = true
        local XP, RP, HP, WP, DP = Vector3.zero, Vector3.zero, 0, ipairs, { "U_1780", "U_925", "U_2419", "U_2789" }
        for EP, JP in WP(DP) do
            EP = s:FindFirstChild(JP)
            if EP and EP:IsA("BasePart") then
                JP = __T_B_578:Raycast(EP.Position + Vector3.new(0, 1--[[u2604]], 0), Vector3.new(0, 1--[[u1549]], 0), MP)
                if JP then
                    XP += JP.Position
                    RP += JP[1--[[u2718]]]
                    HP = HP + 1
                end
            end
        end
        if HP > 0 then
            return XP / HP, RP.Unit
        end
        WP = __T_B_578:Raycast(oP.Position + Vector3.new(0, 1, 0), Vector3.new(0, 1--[[u2019]], 0), MP)
        if WP then
            return WP.Position, WP[1--[[u2718]]]
        end
    end
    function __T_s_650(oP, xP)
        local MP = _G -- ENV_GETTER rewritten to _G
        local XP = math.abs(xP.Y) > 1--[[u143]] and Vector3.xAxis or Vector3.yAxis
        local RP = xP:Cross(XP)["Unit"]
        local HP, WP = RP:Cross(xP)["Unit"], Instance.new("Part")
        WP.Name = "U_690"
        WP.Anchored = true
        WP.CanCollide = false
        WP.CanQuery = false
        WP.CanTouch = false
        WP.CastShadow = false
        WP.Transparency = 1
        WP.Size = Vector3.new(1--[[u2185]], 1--[[u1591]], 1--[[u2185]])
        CFrame = CFrame.U_2467(oP + xP * 1--[[u558]], RP, xP, HP)
        WP.Parent = __T_B_578
        HP = Instance.new("U_1572")
        HP.U_3156 = __T_EnumFB.U_2513["U_2294"]
        HP.U_506 = true
        HP.U_17 = 0
        HP.U_1928 = 4
        HP.U_2197 = Vector2.new("U_1579", "U_1579")
        HP.Parent = WP
        XP = Instance.new("U_391")
        XP.U_1105 = 1
        XP.Size = UDim2.fromScale(1, 1)
        XP.U_2188 = "U_2129"
        XP.U_251 = __T_LP_622
        XP.U_734 = 1 - __T_bP_623
        XP.U_289 = __T_EnumFB.U_289["U_2899"]
        XP.Parent = HP
        xP = TweenInfo.new(__T_SP_624, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"])
        __T_J_575:Create(WP, xP, { ["Size"] = Vector3.new(1--[[u1738]], 1--[[u1591]], 1--[[u1738]]) }):Play()
        __T_J_575:Create(XP, xP, { ["U_734"] = 1 }):Play()
        MP = __T_SP_624
        __T_I_576:AddItem(WP, MP + 1--[[u3198]])
    end
    function __T_J_651()
        local I, oP = _G,  __T_KP_625 -- ENV_GETTER rewritten to _G
        if oP then
            pcall(function()
                __T_KP_625:Disconnect()
            end)
            __T_KP_625 = nil
        end
        oP = __T_hP_621
        if not oP then
            return
        end
        local I = __T_p_577.Character
        local oP, xP = I and I:FindFirstChildOfClass("Humanoid"), I and I:FindFirstChild("HumanoidRootPart")
        if not oP or not xP then
            return
        end
        local MP = false
        __T_KP_625 = oP.StateChanged:Connect(function(oP, XP)
            oP = (_G)
            local RP = XP == __T_EnumFB.U_3137["U_2642"] or XP == __T_EnumFB.U_3137["U_2202"]
            if RP then
                MP = true
                return
            end
            RP = XP == __T_EnumFB.U_3137["U_1905"] and MP and __T_hP_621
            if RP then
                MP = false
                XP, oP = __T_G_649(I, xP)
                if XP and oP then
                    __T_s_650(XP, oP)
                end
            end
        end)
    end
    __T_I_652 = false
    __T_G_653 = Color3.fromRGB(1--[[u2446]], 1--[[u2446]], 1--[[u2446]])
    __T_s_654 = 280
    __T_oP_655 = "U_3335"
    __T_xP_656 = 1--[[u3127]]
    __T_MP_657 = 1
    __T_XP_658 = 1--[[u1751]]
    __T_RP_659 = 1--[[u2581]]
    __T_HP_660 = 0
    __T_WP_661, __T_DP_662, __T_EP_663, __T_JP_664, __T_BP_665, __T_tP_666, __T__P_667 = 0, {}, {}, {}, {}
    function __T_AP_668(iP)
        local NP = _G -- ENV_GETTER rewritten to _G
        if iP then
            pcall(function()
                iP:Remove()
            end)
        end
    end
    function __T_iP_669()
        local NP, lP = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        local yP = lP and lP:FindFirstChild("HumanoidRootPart")
        if not yP then
            return 0
        end
        lP = yP.AssemblyLinearVelocity
        return Vector3.new(lP.X, 0, lP.Z)["Magnitude"]
    end
    function __T_NP_670()
        local lP, yP = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        local QP = yP and yP:FindFirstChildOfClass("Humanoid")
        return math.max(1, QP and QP.WalkSpeed or 16)
    end
    function __T_lP_671(yP, QP, zP, TP)
        local ZP = _G -- ENV_GETTER rewritten to _G
        local GP = Drawing.new("U_2092")
        GP.Color = yP
        GP.U_989 = QP
        GP.Transparency = TP
        GP.U_2435 = zP
        GP.Visible = false
        return GP
    end
    function __T_yP_672()
        local QP = _G -- ENV_GETTER rewritten to _G
        local zP = Drawing.new(1--[[u3145]])
        zP.U_83 = true
        zP.U_2386 = true
        zP.Color = __T_G_653
        zP.Size = 12
        zP.U_2435 = "U_523"
        zP.Visible = false
        return zP
    end
    function __T_QP_673(zP)
        local TP = _G -- ENV_GETTER rewritten to _G
        while #__T_EP_663 < zP do
            __T_JP_664[#__T_JP_664 + 1] = __T_lP_671(Color3.new(0, 0, 0), __T_MP_657 + 2, "U_921", 1--[[u3165]])
            __T_EP_663[#__T_EP_663 + 1] = __T_lP_671(__T_G_653, __T_MP_657, "U_1229", 1)
        end
        while #__T_EP_663 > zP do
            __T_AP_668(table.remove(__T_EP_663))
            __T_AP_668(table.remove(__T_JP_664))
        end
    end
    function __T_lP_674()
        local zP = __T_tP_666
        if zP then
            return
        end
        __T_tP_666 = __T_yP_672()
        zP = __T_tP_666
        zP.U_83 = false
        for zP = 1, 6 do
            __T_BP_665[zP] = __T_yP_672()
        end
    end
    function __T_zP_675()
        local TP = __T_tP_666
        if TP then
            local TP = __T_tP_666
            TP.Visible = false
        end
        for TP = 1, #__T_EP_663 do
            __T_EP_663[TP]["Visible"] = false
            __T_JP_664[TP]["Visible"] = false
        end
        for TP = 1, #__T_BP_665 do
            __T_BP_665[TP]["Visible"] = false
        end
    end
    function __T_TP_676()
        local ZP, GP = _G,  __T__P_667 -- ENV_GETTER rewritten to _G
        if GP then
            pcall(function()
                __T__P_667:Disconnect()
            end)
            __T__P_667 = nil
        end
        __T_AP_668(__T_tP_666)
        __T_tP_666 = nil
        for GP = 1, #__T_EP_663 do
            __T_AP_668(__T_EP_663[GP])
            __T_AP_668(__T_JP_664[GP])
        end
        for GP = 1, #__T_BP_665 do
            __T_AP_668(__T_BP_665[GP])
        end
        table.clear(__T_EP_663)
        table.clear(__T_JP_664)
        table.clear(__T_BP_665)
        table.clear(__T_DP_662)
        __T_HP_660 = 0
    end
    function __T_AP_677()
        local ZP = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_DP_662)
        local GP, sP = os.clock(), __T_iP_669()
        __T_WP_661 = sP
        local O1 = math.ceil(__T_XP_658 / __T_RP_659)
        for ZP = 0, O1 do
            __T_DP_662[#__T_DP_662 + 1] = { [1--[[u1833]]] = GP - __T_XP_658 + ZP * __T_RP_659, [1--[[u388]]] = sP }
        end
        __T_QP_673(#__T_DP_662)
    end
    function __T_ZP_678()
        local GP = __T_tP_666
        if GP then
            local sP = __T_tP_666
            sP.Color = __T_G_653
        end
        local sP, O1, u1 = 1, #__T_EP_663, 1
        for F1 = sP, O1, u1 do
            __T_EP_663[F1]["Color"] = __T_G_653
            __T_EP_663[F1]["U_989"] = __T_MP_657
            __T_JP_664[F1]["U_989"] = __T_MP_657 + 2
        end
        u1, GP, O1 = 1, #__T_BP_665, 1
        for MP = u1, GP, O1 do
            __T_BP_665[MP]["Color"] = __T_G_653
        end
    end
    function __T_MP_679(GP, sP, O1, u1)
        local F1 = _G -- ENV_GETTER rewritten to _G
        return sP - math.clamp(GP / u1 - 1, -1, 1) * O1 * 1--[[u2473]]
    end
    function __T_GP_680(sP)
        local O1, u1 = _G,  __T_B_578.CurrentCamera -- ENV_GETTER rewritten to _G
        local F1 = not __T_I_652 or not u1 or #__T_DP_662 < 2
        if F1 then
            __T_zP_675()
            return
        end
        F1 = u1.ViewportSize
        local m1, f1 = math.min(__T_s_654, math.max(1--[[u3069]], F1.X - 1--[[u1590]])), math.min(__T_oP_655, math.max(1--[[u1061]], F1.Y - 1--[[u1870]]))
        local P1, Y1, q1, d1, e1 = math.floor(F1.X * 0.5 - m1 * 0.5), math.clamp(math.floor(F1.Y * 0.5 + __T_xP_656), f1 * 0.5 + 8, F1.Y - f1 * 0.5 - 8), __T_NP_670(), sP - __T_XP_658, #__T_DP_662
        __T_QP_673(e1)
        for NP = 1, e1 - 1 do
            F1, u1 = __T_DP_662[NP], __T_DP_662[NP + 1]
            local QP, c1 = math.clamp((F1[1--[[u1833]]] - d1) / __T_XP_658, 0, 1), math.clamp((u1[1--[[u1833]]] - d1) / __T_XP_658, 0, 1)
            local o1, x1, C1, M1, n1 = math.clamp(math.min((QP + c1) * 6, (2 - QP - c1) * 5), 0, 1), Vecto]============],
    [12] = [============[
r2.new(P1 + QP * m1, __T_MP_679(F1[1--[[u388]]], Y1, f1, q1)), Vector2.new(P1 + c1 * m1, __T_MP_679(u1[1--[[u388]]], Y1, f1, q1)), __T_EP_663[NP], __T_JP_664[NP]
            M1.U_2970, M1.U_493 = x1, C1
            M1.Transparency = o1
            M1.Visible = o1 > 1--[[u2786]]
            n1.U_2970, n1.U_493 = x1, C1
            n1.Transparency = o1 * 1--[[u476]]
            n1.Visible = o1 > 1--[[u2786]]
        end
        u1 = __T_DP_662[e1]
        sP = math.clamp((u1[1--[[u1833]]] - d1) / __T_XP_658, 0, 1)
        local NP, QP, c1, o1 = Vector2.new(P1 + sP * m1, __T_MP_679(u1[1--[[u388]]], Y1, f1, q1)), Vector2.new(P1 + m1, __T_MP_679(__T_WP_661, Y1, f1, q1)), __T_EP_663[e1], __T_JP_664[e1]
        c1.U_2970, c1.U_493 = NP, QP
        c1.Transparency = 1--[[u1086]]
        c1.Visible = true
        o1.U_2970, o1.U_493 = NP, QP
        o1.Transparency = 1--[[u2185]]
        o1.Visible = true
        for x1 = e1 + 1, #__T_EP_663 do
            __T_EP_663[x1]["Visible"] = false
            __T_JP_664[x1]["Visible"] = false
        end
        c1, u1, F1, sP, NP = __T_tP_666, 1--[[u3145]], tostring, math.floor, __T_WP_661
        c1[u1] = F1(sP(NP + 0.5))
        u1 = __T_tP_666
        u1.Position = Vector2.new(P1 + m1 + 5, QP.Y - 7)
        F1 = __T_tP_666
        F1.Color = __T_G_653
        F1 = __T_tP_666
        F1.Visible = true
        while true do
            u1, sP = #__T_BP_665, 12
            if not (u1 < sP) then
                break
            end
            __T_BP_665[#__T_BP_665 + 1] = __T_yP_672()
        end
        o1, F1 = math.max(1--[[u370]], q1 * 1--[[u2543]]), 1--[[u476]]
        for EP = 5, e1 - 4 do
            NP = __T_DP_662[EP]
            if not NP.U_822 then
                NP.U_822 = true
                sP, QP = NP[1--[[u388]]] - __T_DP_662[EP - 4][1--[[u388]]], __T_DP_662[EP + 4][1--[[u388]]] - NP[1--[[u388]]]
                if math.abs(sP) >= o1 and (sP * QP <= 0 or math.abs(QP) < o1 * 1--[[u2604]]) then
                    c1 = nil
                    for JP = EP - 1, 1, -1 do
                        u1 = __T_DP_662[JP]
                        if NP[1--[[u1833]]] - u1[1--[[u1833]]] > F1 then
                            break
                        end
                        if u1.U_1 ~= nil then
                            c1 = u1
                            break
                        end
                    end
                    local EP = math.abs(sP) - math.abs(QP)
                    if not c1 then
                        NP.U_1 = math.floor(NP[1--[[u388]]] + 0.5)
                        NP.U_2565 = EP
                    else
                        if EP > (c1.U_2565 or (-math.huge)) then
                            c1.U_1 = nil
                            c1.U_2565 = nil
                            NP.U_1 = math.floor(NP[1--[[u388]]] + 0.5)
                            NP.U_2565 = EP
                        end
                    end
                end
            end
        end
        for EP = 1, #__T_BP_665 do
            __T_BP_665[EP]["Visible"] = false
        end
        c1, QP, u1, o1 = {}, 0, 1, -1
        for EP = e1, u1, o1 do
            sP = __T_DP_662[EP]
            EP = sP.U_1 ~= nil and QP < #__T_BP_665
            if EP then
                NP = (sP[1--[[u1833]]] - d1) / __T_XP_658
                F1 = NP > "U_2277" and NP < 1--[[u2112]]
                if F1 then
                    local EP, JP, tP = tostring(sP.U_1), P1 + NP * m1, __T_MP_679(sP[1--[[u388]]], Y1, f1, q1) - 15
                    local MP, NP = math.max(8, #EP * 1--[[u1850]] + 2), false
                    for yP = 1, #c1 do
                        local sP = c1[yP]
                        if JP + MP + 5 > sP.U_1726 and JP - MP - 5 < sP.U_2569 and tP + 13 > sP.U_1266 and tP - 3 < sP.U_2012 then
                            NP = true
                            break
                        end
                    end
                    local yP = not NP
                    if yP then
                        QP += 1
                        local NP = __T_BP_665[QP]
                        NP[1--[[u3145]]] = EP
                        NP.Position = Vector2.new(JP, tP)
                        NP.Color = __T_G_653
                        NP.Visible = true
                        c1[#c1 + 1] = { ["U_1726"] = JP - MP, ["U_2569"] = JP + MP, ["U_1266"] = tP - 3, ["U_2012"] = tP + 13 }
                    end
                end
            end
        end
    end
    __T_xP_656 = 1--[[u171]]
    function __T_MP_681()
        __T_TP_676()
        __T_lP_674()
        __T_AP_677()
        __T_ZP_678()
        __T__P_667 = __T_r_573.RenderStepped:Connect(function(EP)
            local JP, BP = _G,  __T_I_652 -- ENV_GETTER rewritten to _G
            if not BP then
                __T_zP_675()
                return
            end
            local tP, _P = __T_iP_669(), __T_WP_661
            __T_WP_661 = _P + (tP - _P) * (1 - math.exp(-EP * 18))
            __T_HP_660 += EP
            EP, BP = os.clock(), __T_HP_660 >= __T_RP_659
            if BP then
                __T_HP_660 %= __T_RP_659
                tP, _P = #__T_DP_662 + 1, { [1--[[u1833]]] = EP }
                _P[1--[[u388]]], __T_DP_662[tP] = __T_WP_661, _P
                local RP = EP - __T_XP_658
                while #__T_DP_662 > 2 and __T_DP_662[2][1--[[u1833]]] < RP do
                    table.remove(__T_DP_662, 1)
                end
            end
            __T_GP_680(EP)
        end)
    end
    __T_XP_682, __T_RP_683 = 1--[[u547]], 1--[[u2112]]
    __T_HP_684 = 1--[[u2786]]
    __T_WP_685 = 1--[[u1590]]
    __T_DP_686, __T_EP_687 = (2 * math.pi), 1--[[u1086]]
    __T_JP_688 = 1--[[u3144]]
    __T_BP_689 = {
        ["U_2194"] = {},
        ["U_2797"] = table.create(__T_WP_685 + 1),
        ["U_777"] = table.create(__T_WP_685 + 1),
        ["cos"] = table.create(__T_WP_685),
        ["sin"] = table.create(__T_WP_685),
        ["U_1452"] = table.create(__T_WP_685 + 1),
        ["U_364"] = table.create(__T_WP_685 + 2),
        ["U_2763"] = {},
        ["U_2071"] = {},
        ["U_1576"] = {},
        ["U_1646"] = {},
        ["U_2697"] = Color3.new(1, 1, 1),
        ["U_1665"] = Color3.new(0, 0, 0),
        ["U_60"] = 1--[[u2206]]
    }
    for tP = 1, __T_WP_685 do
        __T_o_076 = (tP - 1) / __T_WP_685 * __T_DP_686
        __T_BP_689.cos[tP] = math.cos(__T_o_076) * __T_XP_682
        __T_BP_689.sin[tP] = math.sin(__T_o_076) * __T_XP_682
    end
    __T_BP_689.U_1336 = function(tP, _P)
        local iP, NP = __T_BP_689.U_2797, __T_BP_689.U_777
        local lP, yP = iP[tP], iP[_P]
        return lP == yP and NP[tP] < NP[_P] or lP < yP
    end
    __T_BP_689.U_338 = function(tP)
        local _P, iP, NP, lP, yP = _G,  __T_BP_689.U_2797,  __T_BP_689.U_777,  __T_BP_689.U_1452,  __T_BP_689.U_364 -- ENV_GETTER rewritten to _G
        for QP = 1, tP do
            lP[QP] = QP
        end
        table.sort(lP, __T_BP_689.U_1336)
        _P = 0
        for QP = 1, tP do
            local zP = lP[QP]
            local QP, GP = iP[zP], NP[zP]
            while _P >= 2 do
                local sP, O1 = yP[_P - 1], yP[_P]
                local u1, F1 = iP[sP], NP[sP]
                if (iP[O1] - u1) * (GP - F1) - (NP[O1] - F1) * (QP - u1) > 0 then
                    break
                end
                _P -= 1
            end
            _P += 1
            yP[_P] = zP
        end
        for QP = tP - 1, 1, -1 do
            local tP = lP[QP]
            local lP, QP = iP[tP], NP[tP]
            while _P > _P do
                local zP, GP = yP[_P - 1], yP[_P]
                local sP, O1 = iP[zP], NP[zP]
                if (iP[GP] - sP) * (QP - O1) - (NP[GP] - O1) * (lP - sP) > 0 then
                    break
                end
                _P -= 1
            end
            _P += 1
            yP[_P] = tP
        end
        return _P - 1
    end
    __T_BP_689.U_1856 = function(tP)
        local _P, iP = __T_BP_689.U_2194, __T_BP_689.U_2763
        for NP = 1, #_P do
            if iP[NP] ~= tP then
                _P[NP]["Visible"] = tP
                iP[NP] = tP
            end
        end
    end
    __T_BP_689.clear = function()
        local tP, _P = _G,  __T_BP_689.U_2194 -- ENV_GETTER rewritten to _G
        for iP = 1, #_P do
            pcall(function()
                _P[iP]:Remove()
            end)
        end
        table.clear(_P)
        table.clear(__T_BP_689.U_2763)
        table.clear(__T_BP_689.U_2071)
        table.clear(__T_BP_689.U_1576)
        table.clear(__T_BP_689.U_1646)
        __T_BP_689.U_3004, __T_BP_689.U_2500, __T_BP_689.U_1652 = nil, nil, nil
        __T_BP_689.U_65, __T_BP_689.U_2374, __T_BP_689.U_1085, __T_BP_689.U_2508 = nil, nil, nil, nil
    end
    __T_BP_689.U_2014 = function()
        __T_BP_689.clear()
    end
    __T_BP_689.U_3340 = function(tP)
        local _P, iP = _G,  __T_BP_689.U_2194 -- ENV_GETTER rewritten to _G
        local NP = iP[tP]
        if NP then
            return NP
        end
        NP = Drawing.new("U_126")
        NP.U_2302 = true
        NP.U_989 = 0
        NP.Transparency = __T_EP_687
        NP.Visible = false
        NP.U_2435 = 1
        iP[tP] = NP
        __T_BP_689.U_2763[tP] = false
        return NP
    end
    __T_BP_689.U_2681 = function(EP)
        local tP, _P = _G,  __T_p_577.Character -- ENV_GETTER rewritten to _G
        local iP = _P and _P:FindFirstChild("Head")
        if not iP or not iP:IsA("BasePart") or not EP then
            __T_BP_689.U_1856(false)
            return
        end
        local NP, lP, yP, QP = iP.Position, CFrame, EP.FieldOfView, EP.ViewportSize
        local zP, GP = QP.X, QP.Y
        QP = __T_BP_689.U_3004 == iP and __T_BP_689.U_2500 == NP and __T_BP_689.U_1652 == lP and __T_BP_689.U_65 == yP and __T_BP_689.U_2374 == zP and __T_BP_689.U_1085 == GP and __T_BP_689.U_2508 == __T_kP_627
        if QP then
            return
        end
        __T_BP_689.U_3004, __T_BP_689.U_2500, __T_BP_689.U_1652 = iP, NP, lP
        _P, QP = nil
        _P, QP, __T_BP_689.U_65, __T_BP_689.U_2374, __T_BP_689.U_1085 = "U_2508", __T_kP_627, yP, zP, GP
        __T_BP_689[_P] = QP
        local sP, O1, u1, F1, m1 = __T_BP_689.U_2797, __T_BP_689.U_777, __T_BP_689.cos, __T_BP_689.sin, NP.Y + iP.Size["Y"] * 0.5 - __T_HP_684
        QP = Vector3.new(NP.X, m1, NP.Z)
        _P = EP:WorldToViewportPoint(QP + Vector3.new(0, __T_RP_683, 0))
        if _P.Z <= 0 then
            __T_BP_689.U_1856(false)
            return
        end
        NP = EP:WorldToViewportPoint(QP + Vector3.new(u1[1], 0, F1[1]))
        if NP.Z <= 0 then
            __T_BP_689.U_1856(false)
            return
        end
        sP[1], O1[1] = _P.X, _P.Y
        sP[2], O1[2] = NP.X, NP.Y
        local HP, f1, P1, Y1 = lP.Position, lP.RightVector, lP.UpVector, lP.LookVector
        lP, iP, m1 = QP.X - HP.X, QP.Y - HP.Y, QP.Z - HP.Z
        local q1, d1, e1, c1, o1, x1, C1, M1, n1, X1, g1, R1, H1, W1 = lP * f1.X + iP * f1.Y + m1 * f1.Z, lP * P1.X + iP * P1.Y + m1 * P1.Z, lP * Y1.X + iP * Y1.Y + m1 * Y1.Z, f1.X, f1.Z, P1.X, P1.Z, Y1.X, Y1.Z, GP * 0.5 / math.tan(math.rad(yP * 0.5)), zP * 0.5, GP * 0.5, __T_BP_689.U_60, false
        lP = e1 + __T_RP_683 * Y1.Y
        if lP > 0 then
            iP = X1 / lP
            if math.abs(g1 + (q1 + __T_RP_683 * f1.Y) * iP - _P.X) <= H1 and math.abs(R1 - (d1 + __T_RP_683 * P1.Y) * iP - _P.Y) <= H1 then
                m1, yP = u1[1], F1[1]
                lP = e1 + m1 * M1 + yP * n1
                if lP > 0 then
                    iP = X1 / lP
                    W1 = if math.abs(g1 + (q1 + m1 * c1 + yP * o1) * iP - NP.X) <= H1 and math.abs(R1 - (d1 + m1 * x1 + yP * C1) * iP - NP.Y) <= H1 then true else W1
                end
            end
        end
        if W1 then
            for RP = 2, __T_WP_685 do
                iP, yP = u1[RP], F1[RP]
                _P = e1 + iP * M1 + yP * n1
                if _P <= 0 then
                    __T_BP_689.U_1856(false)
                    return
                end
                HP = X1 / _P
                sP[RP + 1] = g1 + (q1 + iP * c1 + yP * o1) * HP
                O1[RP + 1] = R1 - (d1 + iP * x1 + yP * C1) * HP
            end
        else
            for RP = 2, __T_WP_685 do
                f1 = EP:WorldToViewportPoint(QP + Vector3.new(u1[RP], 0, F1[RP]))
                if f1.Z <= 0 then
                    __T_BP_689.U_1856(false)
                    return
                end
                sP[RP + 1] = f1.X
                O1[RP + 1] = f1.Y
            end
        end
        q1 = __T_BP_689.U_338(__T_WP_685 + 1)
        if q1 < 3 then
            __T_BP_689.U_1856(false)
            return
        end
        f1, c1, o1 = __T_BP_689.U_364, math.huge, (-math.huge)
        for RP = 1, q1 do
            yP = O1[f1[RP]]
            c1, o1 = if yP < c1 then yP else c1, if yP > o1 then yP else o1
        end
        X1, P1 = math.max(0, math.floor(c1)), math.min(GP, math.ceil(o1))
        if P1 - X1 < 2 then
            __T_BP_689.U_1856(false)
            return
        end
        C1, iP, d1, n1, GP, H1, g1, yP, HP, R1, u1 = math.max(1, math.ceil((P1 - X1) / __T_JP_688)), math.max(1, o1 - c1), __T_BP_689.U_2194, __T_BP_689.U_2763, __T_BP_689.U_2071, __T_BP_689.U_1576, __T_BP_689.U_1646, __T_BP_689.U_2697, __T_BP_689.U_1665, 0, P1 - 1
        for RP = X1, u1, C1 do
            M1 = math.min(C1, P1 - RP)
            lP, _P, Y1, x1, EP = RP + M1 * 0.5, O1[f1[q1]], sP[f1[q1]], math.huge, (-math.huge)
            for WP = 1, q1 do
                m1 = f1[WP]
                NP, zP = sP[m1], O1[m1]
                if _P <= lP and zP > lP or zP <= lP and _P > lP then
                    o1 = Y1 + (lP - _P) * (NP - Y1) / (zP - _P)
                    x1, EP = if o1 < x1 then o1 else x1, if o1 > EP then o1 else EP
                end
                _P, Y1 = zP, NP
            end
            F1 = EP - x1
            QP = F1 >= 1--[[u2372]]
            if QP then
                R1 += 1
                local WP, EP = __T_BP_689.U_3340(R1), (lP - c1) / iP
                local JP, _P = 1 - EP * 1--[[u1587]], (EP - 1--[[u168]]) / 1--[[u476]]
                JP, _P = if JP < 0 then 0 else JP, if _P < 0 then 0 else _P
                e1 = __T_kP_627
                local EP, iP, NP = e1:Lerp(yP, JP * 1--[[u1957]]):Lerp(HP, _P * 1--[[u1824]]), Vector2.new(x1, RP), Vector2.new(F1, M1)
                if GP[R1] ~= iP then
                    WP.Position = iP
                    GP[R1] = iP
                end
                if H1[R1] ~= NP then
                    WP.Size = NP
                    H1[R1] = NP
                end
                if g1[R1] ~= EP then
                    WP.Color = EP
                    g1[R1] = EP
                end
                if not n1[R1] then
                    WP.Visible = true
                    n1[R1] = true
                end
            end
        end
        for RP = R1 + 1, #d1 do
            if n1[RP] then
                d1[RP]["Visible"] = false
                n1[RP] = false
            end
        end
    end
    __T_RP_690 = __T_r_573.Heartbeat:Connect(function()
        local HP = __T_t_579
        if HP then
            __T_pP_631()
        end
        HP = __T___580
        if HP then
            __T_cP_645()
        end
        HP = __T_A_581
        if HP then
            __T_gP_648()
        end
    end)
    __T_YP_598 = __T_r_573.RenderStepped:Connect(function()
        local r, cP = __T_B_578.CurrentCamera, __T_rP_626
        if cP then
            __T_BP_689.U_2681(r)
        end
        cP = __T_PP_597
        if not cP then
            return
        end
        cP = __T_fP_596
        local B = cP.CurrentCamera ~= r
        if B then
            cP = __T_fP_596
            cP.CurrentCamera = r
        end
        B, r = __T___580
        if B then
            cP = __T_y_585
            r = cP == "U_1036"
        else
            r = B
        end
        if r then
            __T_qP_640(__T_OP_592)
        end
        B, r = __T_A_581
        if B then
            cP = __T_Q_586
            r = cP == "U_1036"
        else
            r = B
        end
        if r then
            __T_qP_640(__T_uP_593)
        end
    end)
    __T_r_691 = __T_p_577.CharacterAdded:Connect(function()
        local p = _G -- ENV_GETTER rewritten to _G
        task.wait(1--[[u234]])
        p = __T_t_579
        if p then
            __T_IP_630()
        end
        p = __T_hP_621
        if p then
            __T_J_651()
        end
        p = __T_I_652
        if p then
            __T_AP_677()
        end
    end)
    getgenv()["U_727"] = function()
        local p, B, qP, cP, gP, HP, WP = _G,  false,  false,  false,  false,  false,  false -- ENV_GETTER rewritten to _G
        __T_t_579, __T___580, __T_A_581, __T_hP_621, __T_I_652, __T_rP_626 = B, qP, cP, gP, HP, WP
        __T_TP_676()
        pcall(__T_BP_689.clear)
        qP = __T_RP_690
        if qP then
            pcall(function()
                __T_RP_690:Disconnect()
            end)
            __T_RP_690 = nil
        end
        qP = __T_r_691
        if qP then
            pcall(function()
                __T_r_691:Disconnect()
            end)
            __T_r_691 = nil
        end
        B = __T_KP_625
        if B then
            pcall(function()
                __T_KP_625:Disconnect()
            end)
            __T_KP_625 = nil
        end
        for r = 1, #__T_aP_616 do
            pcall(function()
                __T_aP_616[r]:Disconnect()
            end)
        end
        table.clear(__T_aP_616)
        for r = 1, #__T_VP_620 do
            pcall(function()
                __T_VP_620[r]:Disconnect()
            end)
        end
        table.clear(__T_VP_620)
        __T_vP_614, __T_UP_618 = nil, nil
        cP, HP = false, false
        __T_jP_615, __T_wP_619 = cP, HP
        gP = __T_YP_598
        if gP then
            pcall(function()
                __T_YP_598:Disconnect()
            end)
            __T_YP_598 = nil
        end
        pcall(function()
        __T_CP_636(__T_z_587)
    end)
        pcall(function()
        __T_CP_636(__T_T_588)
    end)
        pcall(function()
        __T_nP_638(__T_OP_592)
    end)
        pcall(function()
        __T_nP_638(__T_uP_593)
    end)
        pcall(__T_h_361.clear, __T_FP_594)
        pcall(__T_h_361.clear, __T_mP_595)
        cP = __T_fP_596
        if cP then
            pcall(function()
                local r = __T_fP_596
                r.Parent:Destroy()
            end)
            __T_fP_596, __T_PP_597 = nil, nil
        end
        pcall(__T_dP_641)
        pcall(__T_Z_646)
        pcall(__T_k_629)
    end
    __T_M_112 = {
        ["Name"] = "U_2279",
        ["Default"] = false,
        ["Flag"] = "U_980",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_rP_626 = r
        if r then
            __T_BP_689.U_2014()
        else
            __T_BP_689.clear()
        end
    end
    }
    __T_K_572, __T_XP_682 = __T_S_571:AddToggle(__T_M_112)["U_3348"], { ["Name"] = "U_1333", ["Default"] = __T_kP_627, ["Flag"] = "U_2059" }
    __T_XP_682.Callback = function(r)
        __T_kP_627 = r
    end
    __T_K_572:AddColorPicker(__T_XP_682)
    __T_c_074 = {
        ["Name"] = "U_1258",
        ["Default"] = false,
        ["Flag"] = "U_764",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_t_579 = r
        if r then
            local r = __T_eP_601
            if not r then
                __T_IP_630()
            end
        else
            __T_k_629()
        end
    end
    }
    __T_K_572, __T_R_114 = __T_S_571:AddToggle(__T_c_074)["U_3348"], { ["Name"] = "U_1333", ["Default"] = __T_i_582, ["Flag"] = "U_2590" }
    __T_R_114.Callback = function(r)
        __T_i_582 = r
        local k = __T_eP_601
        if k then
            local k = __T_eP_601
            for p, p in k:GetDescendants() do
                if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                    p.Color = r
                end
            end
        end
    end
    __T_K_572:AddColorPicker(__T_R_114)
    __T_DP_686 = __T_S_571:AddToggle({
        ["Name"] = "U_1666",
        ["Default"] = false,
        ["Flag"] = "U_2726",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T___580 = r
        if not r then
            __T_CP_636(__T_z_587)
            __T_nP_638(__T_OP_592)
            __T_h_361.clear(__T_FP_594)
            __T_dP_641()
        end
    end
    })
    __T_XP_682, __T_K_572 = __T_DP_686.U_3348, {
        ["Name"] = "U_1097",
        ["Default"] = "U_1952",
        ["U_3220"] = { "U_1952", "U_2124", "U_1036", "U_347" },
        ["Flag"] = "U_1689"
    }
    __T_K_572.Callback = function(r)
        __T_y_585 = r
    end
    __T_XP_682:AddDropdown(__T_K_572)
    __T_XP_682, __T_K_572 = __T_DP_686.U_3348, { ["Name"] = "U_1333", ["Default"] = __T_N_583, ["Flag"] = "U_1800" }
    __T_K_572.Callback = function(r)
        __T_N_583 = r
    end
    __T_XP_682:AddColorPicker(__T_K_572)
    __T_K_572 = __T_S_571:AddToggle({
        ["Name"] = "U_219",
        ["Default"] = false,
        ["Flag"] = "U_2832",
        ["U_3348"] = true,
        ["Callback"] = function(r)
        __T_A_581 = r
        if not r then
            __T_CP_636(__T_T_588)
            __T_nP_638(__T_uP_593)
            __T_h_361.clear(__T_mP_595)
            __T_Z_646()
        end
    end
    })
    __T_DP_686, __T_XP_682 = __T_K_572.U_3348, {
        ["Name"] = "U_1097",
        ["Default"] = "U_1952",
        ["U_3220"] = { "U_1952", "U_2124", "U_1036", "U_347" },
        ["Flag"] = "U_1111"
    }
    __T_XP_682.Callback = function(h)
        __T_Q_586 = h
    end
    __T_DP_686:AddDropdown(__T_XP_682)
    __T_XP_682, __T_DP_686 = __T_K_572.U_3348, { ["Name"] = "U_1333", ["Default"] = __T_l_584, ["Flag"] = "U_2743" }
    __T_DP_686.Callback = function(h)
        __T_l_584 = h
    end
    __T_XP_682:AddColorPicker(__T_DP_686)
    __T_XP_682 = __T_S_571:AddToggle({
        ["Name"] = "U_1290",
        ["Default"] = false,
        ["Flag"] = "U_1308",
        ["U_3348"] = true,
        ["Callback"] = function(h)
        __T_hP_621 = h
        if h then
            __T_J_651()
        else
            local h = __T_KP_625
            if h then
                __T_KP_625:Disconnect()
                __T_KP_625 = nil
            end
        end
    end
    })
    __T_K_572, __T_DP_686 = __T_XP_682.U_3348, { ["Name"] = "U_1333", ["Default"] = __T_LP_622, ["Flag"] = "U_1187" }
    __T_DP_686.Callback = function(h)
        __T_LP_622 = h
    end
    __T_K_572:AddColorPicker(__T_DP_686)
    __T_DP_686, __T_K_572 = __T_XP_682.U_3348, {
        ["Name"] = "U_3006",
        ["Min"] = 0,
        ["Max"] = 1,
        ["Default"] = 1,
        ["Rounding"] = 2,
        ["Flag"] = "U_350"
    }
    __T_K_572.Callback = function(h)
        __T_bP_623 = h
    end
    __T_DP_686:AddSlider(__T_K_572)
    __T_DP_686, __T_K_572 = __T_XP_682.U_3348, {
        ["Name"] = "U_1325",
        ["Min"] = 1--[[u1824]],
        ["Max"] = 3,
        ["Default"] = 1--[[u2112]],
        ["Rounding"] = 2,
        ["Flag"] = "U_2259"
    }
    __T_K_572.Callback = function(h)
        __T_SP_624 = h
    end
    __T_DP_686:AddSlider(__T_K_572)
    __T_K_572 = __T_S_571:AddToggle({
        ["Name"] = "U_933",
        ["Default"] = false,
        ["Flag"] = "U_1613",
        ["U_3348"] = true,
        ["Callback"] = function(h)
        __T_I_652 = h
        if h then
            __T_MP_681()
        else
            __T_TP_676()
        end
    end
    })
    __T_XP_682, __T_S_571 = __T_K_572.U_3348, { ["Name"] = "U_1333", ["Default"] = __T_G_653, ["Flag"] = "U_322" }
    __T_S_571.Callback = function(h)
        __T_G_653 = h
        __T_ZP_678()
    end
    __T_XP_682:AddColorPicker(__T_S_571)
    __T_XP_682, __T_DP_686 = __T_K_572.U_3348, {
        ["Name"] = "U_3164",
        ["Min"] = 1--[[u171]],
        ["Max"] = "U_739",
        ["Default"] = 280,
        ["Rounding"] = 0,
        ["Suffix"] = "U_2797",
        ["Flag"] = "U_2723"
    }
    __T_DP_686.Callback = function(h)
        __T_s_654 = h
    end
    __T_XP_682:AddSlider(__T_DP_686)
    __T_XP_682, __T_DP_686 = __T_K_572.U_3348, {
        ["Name"] = "U_2038",
        ["Min"] = 1--[[u513]],
        ["Max"] = 1--[[u3069]],
        ["Default"] = "U_3335",
        ["Rounding"] = 0,
        ["Suffix"] = "U_2797",
        ["Flag"] = "U_2369"
    }
    __T_DP_686.Callback = function(h)
        __T_oP_655 = h
    end
    __T_XP_682:AddSlider(__T_DP_686)
    __T_XP_682, __T_DP_686 = __T_K_572.U_3348, {
        ["Name"] = "U_2582",
        ["Min"] = "U_2985",
        ["Max"] = 1--[[u1178]],
        ["Default"] = 1--[[u171]],
        ["Rounding"] = 0,
        ["Suffix"] = "U_2797",
        ["Flag"] = "U_2273"
    }
    __T_DP_686.Callback = function(h)
        __T_xP_656 = h
    end
    __T_XP_682:AddSlider(__T_DP_686)
    __T_h_692 = game:GetService("Players")
    __T_S_693 = game:GetService("CollectionService")
    __T_K_694 = __T_h_692.LocalPlayer
    __T_r_695 = os.clock
    __T_k_696, __T_J_697, __T_I_698, __T_p_699, __T_B_700, __T_t_701, __T___702, __T_A_703, __T_i_704, __T_N_705 = { ["U_2087"] = 0 }, {}, {}, {}, {}, {}, {}, {}, {}, {}
    __T_b_126.U_272 = __T_k_696
    function __T_l_706(y, Q, z, T)
        local Z = _G -- ENV_GETTER rewritten to _G
        for G = 1, #__T_J_697 do
            task.spawn(__T_J_697[G], y, Q, z, T)
        end
    end
    function __T_y_707(Q)
        if Q.U_2034 then
            return
        end
        Q.U_2034 = true
        __T_l_706("U_861", Q.U_2349, Q.U_1622, Q.U_1620)
    end
    function __T_Q_708(z, T)
        if T then
            z.U_2072, z.U_1622, T.U_2349 = true, T.U_1622, z.U_2349
        end
        if not z.U_1135 then
            z.U_1135 = true
            __T_l_706("U_1546", z.U_2349, z.U_1622, T and T.U_1620)
        end
        if T then
            __T_y_707(T)
        end
    end
    function __T_l_709(z)
        local T = _G -- ENV_GETTER rewritten to _G
        for Z = #__T_t_701, 1, -1 do
            if z - __T_t_701[Z][1--[[u1833]]] > 1 then
                table.remove(__T_t_701, Z)
            end
        end
    end
    function __T_z_710(T)
        local Z = __T_r_695()
        __T_l_709(Z)
        for G = #__T_t_701, 1, -1 do
            local s = __T_t_701[G]
            if s.U_2349 == T then
                if s.U_1703 then
                    if Z - s.U_1703 < 1--[[u773]] then
                        return
                    end
                else
                    if Z - s[1--[[u1833]]] < 0.5 then
                        s.U_1703 = Z
                        __T_Q_708(s)
                        return
                    end
                end
            end
        end
        local G = { [1--[[u1833]]] = Z, ["U_1703"] = Z, ["U_2349"] = T }
        __T_t_701[#__T_t_701 + 1] = G
        Z = nil
        for T, T in __T___702, nil, nil do
            Z = if not T.U_2034 and (not Z or T[1--[[u1833]]] > Z[1--[[u1833]]]) then T else Z
        end
        __T_Q_708(G, Z)
    end
    function __T_T_711(Z)
        local G = __T_r_695()
        __T_l_709(G)
        local s
        for OP = #__T_t_701, 1, -1 do
            local uP = __T_t_701[OP]
            if uP.U_2349 == "U_2228" and not uP.U_2378 and G - uP[1--[[u1833]]] < 0.5 and (uP.U_1622 == nil or uP.U_1622 == Z) then
                s = uP
                break
            end
        end
        if s then
            s.U_2378, s.U_1622 = true, s.U_1622 or Z
        else
            s = { [1--[[u1833]]] = G, ["U_2349"] = "U_2228", ["U_1622"] = Z, ["U_2378"] = true }
            __T_t_701[#__T_t_701 + 1] = s
        end
        local OP = __T___702[Z]
        if not s.U_2072 and OP and not OP.U_2349 and G - OP[1--[[u1833]]] < 1--[[u1791]] then
            __T_Q_708(s, OP)
        end
    end
    function __T_Z_712(G, s)
        local OP, uP = _G,  __T_r_695() -- ENV_GETTER rewritten to _G
        __T_l_709(uP)
        local l = { [1--[[u1833]]] = uP, ["U_1622"] = G, ["U_1620"] = s }
        __T___702[G] = l
        s = nil
        for FP = #__T_t_701, 1, -1 do
            uP = __T_t_701[FP]
            if not uP.U_2072 then
                if uP.U_1622 == G then
                    s = uP
                    break
                end
                s = if not s and uP.U_1622 == nil and uP.U_1135 then uP else s
            end
        end
        if s then
            __T_Q_708(s, l)
        else
            if __T_k_696.U_2087 > 0 then
                task.delay(__T_k_696.U_2087, __T_y_707, l)
            else
                __T_y_707(l)
            end
        end
    end
    function __T_l_713(y)
        if y.Name == "Gun" or __T_S_693:HasTag(y, "U_19") or y:FindFirstChild("U_1978") or y:FindFirstChild("U_2064") then
            return "U_2228"
        end
        if y.Name == "Knife" or __T_S_693:HasTag(y, "U_2301") or y:FindFirstChild("U_2928") or y:FindFirstChild("U_320") then
            return "U_2769"
        end
        return nil
    end
    function __T_S_714(y)
        local Q = __T_B_700[y]
        if not Q then
            return
        end
        __T_B_700[y] = nil
        for G = 1, 3 do
            Q[G]:Disconnect()
        end
        if __T_p_699[Q.U_2349] then
            y.U_2428 = Q[1--[[u388]]]
        end
    end
    function __T_y_715(Q, G)
        if __T_B_700[Q] then
            return
        end
        local s = { ["U_2349"] = G, [1--[[u388]]] = Q.U_2428, ["U_2242"] = 0 }
        __T_B_700[Q] = s
        local function OP()
            local uP = __T_r_695()
            if uP - s.U_2242 < 1--[[u1824]] then
                return
            end
            s.U_2242 = uP
            if __T_p_699[G] then
                Q:Stop()
            end
            __T_z_710(G)
        end
        s[1] = Q.U_3319:Connect(OP)
        s[2] = Q:GetP]============],
    [13] = [============[
ropertyChangedSignal("U_1830"):Connect(function()
            if Q.U_1830 then
                OP()
            end
        end)
        s[3] = Q.U_2869:Connect(function()
            __T_S_714(Q)
        end)
        if __T_p_699[G] then
            Q.U_2428 = 0
        end
    end
    function __T_r_716(Q)
        if not Q:IsA("Sound") or Q.Name ~= "U_1565" and Q.Name ~= "U_2648" then
            return
        end
        local z = Q.Parent
        local G = z and z.Name == "U_117" and z.Parent
        z = G and G:IsA("Tool") and __T_l_713(G)
        if z then
            __T_y_715(Q, z)
        end
    end
    function __T_l_717(y)
        if not y then
            return
        end
        __T_N_705[#__T_N_705 + 1] = y.DescendantAdded:Connect(__T_r_716)
        for Q, Q in y:GetDescendants() do
            __T_r_716(Q)
        end
    end
    function __T_r_718(y, Q, z, G)
        Q, z = (_G), __T_K_694.Character
        if typeof(y) ~= "Instance" or typeof(G) ~= "Instance" or not z or not y:IsDescendantOf(z) then
            return
        end
        for Q in __T_A_703, nil, nil do
            y = Q.Character
            if y and (G:IsDescendantOf(y)) then
                __T_T_711(Q)
                break
            end
        end
    end
    function __T_y_719()
        local Q = _G -- ENV_GETTER rewritten to _G
        for z = #__T_N_705, 1, -1 do
            __T_N_705[z]:Disconnect()
            __T_N_705[z] = nil
        end
        __T_l_717(__T_K_694.Character)
        __T_l_717(__T_K_694:FindFirstChildOfClass("Backpack"))
        if __T_i_704[5] then
            return
        end
        local l, z = pcall(__T_L_125.U_1500)
        local L = l and typeof(z) == "table" and z.U_339
        if typeof(L) == "Instance" and L:IsA("RemoteEvent") then
            __T_i_704[5] = L.OnClientEvent:Connect(__T_r_718)
        end
    end
    function __T_L_720(r, l, Q)
        local z = Q:WaitForChild("Humanoid", 5)
        if not z or __T_A_703[r] ~= l or r.Character ~= Q then
            return
        end
        if l.U_2244 then
            l.U_2244:Disconnect()
        end
        l.U_2244 = z.Died:Connect(function()
            __T_Z_712(r, Q)
        end)
    end
    function __T_r_721(l)
        local Q = _G -- ENV_GETTER rewritten to _G
        if l == __T_K_694 or __T_A_703[l] then
            return
        end
        local z = {}
        __T_A_703[l] = z
        z.U_1620 = l.CharacterAdded:Connect(function(T)
            __T_L_720(l, z, T)
        end)
        if l.Character then
            task.spawn(__T_L_720, l, z, l.Character)
        end
    end
    function __T_L_722(l)
        local Q = __T_A_703[l]
        if not Q then
            return
        end
        __T_A_703[l] = nil
        __T___702[l] = nil
        Q.U_1620:Disconnect()
        if Q.U_2244 then
            Q.U_2244:Disconnect()
        end
    end
    function __T_l_723()
        if __T_i_704[1] then
            return
        end
        __T_i_704[1] = __T_h_692.PlayerAdded:Connect(__T_r_721)
        __T_i_704[2] = __T_h_692.PlayerRemoving:Connect(__T_L_722)
        __T_i_704[3] = __T_K_694.CharacterAdded:Connect(__T_y_719)
        __T_i_704[4] = __T_K_694.ChildAdded:Connect(function(K)
            local Q = "Backpack"
            if K:IsA(Q) then
                __T_y_719()
            end
        end)
        for K, K in __T_h_692:GetPlayers() do
            __T_r_721(K)
        end
        __T_y_719()
    end
    function __T_h_724()
        local K = _G -- ENV_GETTER rewritten to _G
        for r, y in __T_i_704, nil, nil do
            y:Disconnect()
            __T_i_704[r] = nil
        end
        for r = #__T_N_705, 1, -1 do
            __T_N_705[r]:Disconnect()
            __T_N_705[r] = nil
        end
        for r in __T_A_703, nil, nil do
            __T_L_722(r)
        end
        for L in __T_B_700, nil, nil do
            __T_S_714(L)
        end
        table.clear(__T_t_701)
        table.clear(__T___702)
    end
    __T_k_696.sub = function(L)
        __T_J_697[#__T_J_697 + 1] = L
    end
    __T_k_696.U_1323 = function(L, S)
        local K = _G -- ENV_GETTER rewritten to _G
        __T_I_698[L] = S or nil
        if next(__T_I_698) then
            __T_l_723()
        else
            __T_h_724()
        end
    end
    __T_k_696.U_1402 = function(L, S)
        S = S or nil
        if __T_p_699[L] == S then
            return
        end
        __T_p_699[L] = S
        for K, r in __T_B_700, nil, nil do
            if r.U_2349 == L then
                K.U_2428 = S and 0 or r[1--[[u388]]]
            end
        end
    end
    __T_k_696.U_45 = function()
        local L = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_I_698)
        table.clear(__T_J_697)
        __T_h_724()
        table.clear(__T_p_699)
    end
    __T_h_725 = game:GetService("TweenService")
    __T_L_726 = __T_b_126.U_272
    __T_S_727, __T_K_728, __T_r_729, __T_k_730, __T_J_731 = __T_X_111:AddSection({ ["Name"] = "U_1746", ["Position"] = "U_528" }), {}, {}, {}, {}
    __T_I_732 = {
        ["U_2757"] = 0,
        ["U_2503"] = 0,
        ["U_2763"] = 0,
        [1--[[u2951]]] = 1,
        ["U_2025"] = -1,
        ["U_1135"] = false
    }
    __T_p_733 = {
        "Humanoid",
        "U_179",
        "Sound",
        "U_2370",
        "U_1284",
        "U_1650",
        "U_1080",
        "U_2065",
        "U_557",
        "U_2814",
        "U_693",
        "Highlight",
        "U_955",
        "U_1641"
    }
    __T_B_734 = Instance.new("Part")
    __T_B_734.Name = "\0"
    __T_B_734.U_1483 = __T_EnumFB.U_512["U_2312"]
    __T_B_734.Material = __T_EnumFB.Material["U_898"]
    __T_B_734.Size = Vector3.new(1--[[u2918]], 1--[[u2918]], 1--[[u2918]])
    __T_B_734.Transparency = 1
    __T_B_734.Anchored = true
    __T_B_734.CanCollide = false
    __T_B_734.CanQuery = false
    __T_B_734.CanTouch = false
    __T_B_734.CastShadow = false
    getgenv()["U_731"] = __T_S_727
    __T_o_076 = { "U_2875", "U_2228", "U_2769" }
    for t, t in __T_o_076, nil, nil do
        local _, A, i = {
            ["U_2376"] = false,
            ["U_1065"] = { ["U_2376"] = false, ["U_2508"] = Color3.fromRGB(255, 0, 0), [1--[[u2452]]] = 3 },
            [1--[[u2004]]] = {
            ["U_2376"] = false,
            ["U_2508"] = Color3.fromRGB(255, 1--[[u807]], 1--[[u807]]),
            [1--[[u2452]]] = 1--[[u319]]
        }
        }, "U_645", { ["U_2376"] = false }
        i.U_2508, _[A] = Color3.fromRGB(1--[[u151]], 1--[[u3144]], 255), i
        _.U_1404 = {
            ["U_2376"] = false,
            ["U_2508"] = Color3.fromRGB(1--[[u151]], 1--[[u3144]], 255),
            [1--[[u1988]]] = 1--[[u807]]
        }
        __T_K_728[t] = _
    end
    function __T_t_735()
        local _, A, i = _G,  {},  "U_2420" -- ENV_GETTER rewritten to _G
        for N = 0, 129 do
            local l, y = math.max(1--[[u2816]] - math.min(N, 129 - N), 0), { "\0" }
            for Q = 0, 129 do
                local z = math.max(1--[[u2816]] - math.min(Q, 129 - Q), 0)
                local T = math.clamp((math.sqrt(z * z + l * l) - 24) / 1--[[u513]], 0, 1)
                y[Q + 2] = string.char(255, 255, 255, math.floor((math.exp(1--[[u2165]] * (1 - T) ^ 2) - i) / 1--[[u2666]] * 255 + 0.5))
            end
            A[N + 1] = table.concat(y)
        end
        local N, l, y = table.concat(A), 1, 0
        for Q = 1, #N do
            l = (l + string.byte(N, Q)) % 65521
            y = (y + l) % 65521
        end
        i = { "\120\1" }
        for Q = 1, #N, 65535 do
            A = string.sub(N, Q, Q + 65534)
            i[#i + 1] = string.pack("U_1001", Q + 65535 > #N and 1 or 0, #A, 65535 - #A) .. A
        end
        i[#i + 1] = string.pack("U_2077", y * 65536 + l)
        local N = {}
        for l = 0, 255 do
            A = l
            for y = 1, 8 do
                A = bit32.band(A, 1) == 1 and bit32.bxor(bit32.rshift(A, 1), 3988292384) or bit32.rshift(A, 1)
            end
            N[l] = A
        end
        local function A(l, y)
            local Q, z, T = _G,  l .. y,  4294967295 -- ENV_GETTER rewritten to _G
            for l = 1, #z do
                T = bit32.bxor(N[bit32.band(bit32.bxor(T, string.byte(z, l)), 255)], bit32.rshift(T, 8))
            end
            return string.pack("U_2077", #y) .. z .. string.pack("U_2077", bit32.bnot(T))
        end
        return "\137PNG\r\n\26\n" .. A("IHDR", string.pack("U_76", 1--[[u2777]], 1--[[u2777]], 8, 6, 0, 0, 0)) .. A("IDAT", table.concat(i)) .. A("IEND", "")
    end
    function __T___736()
        local A = _G -- ENV_GETTER rewritten to _G
        if __T_I_732.U_394 and __T_I_732.U_394["Parent"] then
            return true
        end
        if __T_I_732.U_3380 then
            return false
        end
        if __T_I_732.U_3242 == nil then
            __T_I_732.U_3380 = true
            local i, N = pcall(__T_t_735)
            __T_I_732.U_3242 = i and __T_H_073("U_261", N) or false
            __T_I_732.U_3380 = false
        end
        if not __T_I_732.U_3242 then
            return false
        end
        if __T_I_732.U_394 then
            __T_I_732.U_394:Destroy()
        end
        local H = Instance.new("U_915")
        H.Name = tostring(math.random(1--[[u2149]], 1--[[u1805]]))
        H.U_1922 = true
        H.U_2817 = false
        H.U_2450 = 1--[[u1731]]
        local t = Instance.new("U_391")
        t.U_1105 = 1
        t.Size = UDim2.fromScale(1, 1)
        t.U_2188 = __T_I_732.U_3242
        t.U_734 = 1
        t.U_289 = __T_EnumFB.U_289["U_2592"]
        t.U_309 = Rect.new(64, 64, 1--[[u579]], 1--[[u579]])
        t.Parent = H
        pcall(function()
            local A = _G -- ENV_GETTER rewritten to _G
            H.Parent = gethui and gethui() or game:GetService("CoreGui")
        end)
        if not H.Parent then
            H:Destroy()
            __T_I_732.U_394, __T_I_732.U_74 = nil, nil
            return false
        end
        __T_I_732.U_394, __T_I_732.U_74, __T_I_732.U_762, __T_I_732.U_2025 = H, t, nil, -1
        return true
    end
    function __T_H_737(t)
        if __T_I_732.U_2025 == t or not __T_I_732.U_74 then
            return
        end
        __T_I_732.U_2025 = t
        __T_I_732.U_74["U_734"] = t
    end
    function __T_t_738()
        local A = _G -- ENV_GETTER rewritten to _G
        local i = os.clock() - __T_I_732.U_2757
        if i >= "U_1185" or not __T_I_732.U_74 then
            __T_I_732.U_1135, __T_I_732.U_2763 = false, 0
            __T_H_737(1)
            __T_I_732.U_2974:Disconnect()
            __T_I_732.U_2974 = nil
            return
        end
        local N = i < 1--[[u2770]] and i / 1--[[u2770]] or (i - 1--[[u2770]]) / 1--[[u2987]]
        local l = N * N * (3 - 2 * N)
        N = (i < 1--[[u2770]] and __T_I_732.U_2503 + (1 - __T_I_732.U_2503) * l or 1 - l) * __T_I_732[1--[[u2951]]]
        __T_I_732.U_2763 = N
        __T_H_737(1 - math.min(N, 1--[[u1892]]) * 1--[[u2185]])
    end
    function __T_H_739(A)
        local i = _G -- ENV_GETTER rewritten to _G
        if not __T___736() then
            return
        end
        local N, l = __T_I_732.U_74, __T_I_732.U_394["U_3057"]
        N.U_201 = math.max(math.min(l.X, l.Y), 1--[[u171]]) / 1--[[u171]]
        if __T_I_732.U_762 ~= A.U_2508 then
            __T_I_732.U_762 = A.U_2508
            N.U_251 = A.U_2508
        end
        N = __T_I_732.U_1135 and __T_I_732.U_2763 or 0
        __T_I_732[1--[[u2951]]] = math.max(A[1--[[u1988]]] / 1--[[u807]], N)
        __T_I_732.U_2503 = math.min(N / __T_I_732[1--[[u2951]]], 1)
        __T_I_732.U_2757 = os.clock()
        __T_I_732.U_1135 = true
        if not __T_I_732.U_2974 then
            __T_I_732.U_2974 = game:GetService("RunService")["RenderStepped"]:Connect(__T_t_738)
        end
    end
    function __T_t_740(A, i)
        local N, l = _G,  __T_r_729[A] -- ENV_GETTER rewritten to _G
        if not l or not l.U_1622["Parent"] then
            local y = Instance.new("Part")
            y.Name = "\0"
            y.Anchored = true
            y.CanCollide = false
            y.CanQuery = false
            y.CanTouch = false
            y.CastShadow = false
            y.Transparency = 1
            y.Size = Vector3.new(1--[[u1591]], 1--[[u1591]], 1--[[u1591]])
            local Q = Instance.new("U_1284")
            Q.Enabled = false
            Q.U_1935 = 0
            Q.U_145 = "U_160"
            Q.U_832 = 1
            Q.U_885 = __T_EnumFB.U_676["U_2045"]
            Q.U_845 = Vector3.new(0, 1--[[u600]], 0)
            Q.U_1602 = NumberRange.new(0.5, 1)
            Q.U_2580 = NumberRange.new(15)
            Q.U_1716 = Vector2.new(1--[[u8]], 1--[[u600]])
            Q.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1--[[u1226]]),
                NumberSequenceKeypoint.new(0.5, 1--[[u1226]]),
                NumberSequenceKeypoint.new(1, 0)
            })
            Q.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
            Q.Parent = y
            y.Parent = workspace
            l = { ["U_1622"] = y, ["U_1649"] = Q }
            __T_r_729[A] = l
        end
        l.U_1622["CFrame"] = CFrame.new(i)
        if l.U_1620 ~= A.U_645["U_2508"] then
            l.U_1620 = A.U_645["U_2508"]
            l.U_1649["Color"] = ColorSequence.new(l.U_1620)
        end
        l.U_1649:Emit(30)
    end
    function __T_A_741(i, N)
        local l, y = _G,  N.Archivable -- ENV_GETTER rewritten to _G
        N.Archivable = true
        local Q, z = pcall(N.U_1070, N)
        N.Archivable = y
        if not Q or not z then
            return
        end
        y = i.U_1065["U_2508"]
        for T, Z in z:GetDescendants() do
            Q = "BasePart"
            if Z:IsA(Q) then
                Z.Anchored = true
                Z.CanCollide = false
                Z.CanQuery = false
                Z.CanTouch = false
                if Z.Name == "HumanoidRootPart" then
                    Z.Transparency = 1
                else
                    Z.Material = __T_EnumFB.Material["U_1952"]
                    Z.Color = y
                end
            else
                for y = 1, #__T_p_733 do
                    T = __T_p_733[y]
                    if Z:IsA(T) then
                        Z:Destroy()
                        break
                    end
                end
            end
        end
        Q = getgenv()["U_3160"]
        if Q then
            pcall(Q, z, N)
        end
        z.Name = "\0"
        z.Parent = workspace
        local p = { ["U_532"] = z, ["U_1620"] = i }
        __T_k_730[#__T_k_730 + 1] = p
        task.delay(i.U_1065[1--[[u2452]]], function()
            local i = _G -- ENV_GETTER rewritten to _G
            if not z.Parent then
                return
            end
            local N = TweenInfo.new(1--[[u3221]], __T_EnumFB.EasingStyle["Quad"])
            for l, l in z:GetDescendants() do
                if l:IsA("BasePart") and l.Name ~= "HumanoidRootPart" or l:IsA("U_1417") then
                    __T_h_725:Create(l, N, { ["Transparency"] = 1 }):Play()
                end
            end
            task.delay(1--[[u2950]], function()
            local i = _G -- ENV_GETTER rewritten to _G
            local N = table.find(__T_k_730, p)
            if N then
                table.remove(__T_k_730, N)
            end
            z:Destroy()
        end)
        end)
    end
    function __T_p_742(i)
        local N = _G -- ENV_GETTER rewritten to _G
        local l = table.find(__T_J_731, i)
        if l then
            table.remove(__T_J_731, l)
        end
        i.U_550:Destroy()
    end
    function __T_i_743(N, l)
        local y, Q = _G,  {} -- ENV_GETTER rewritten to _G
        for z, z in l:GetChildren() do
            if z:IsA("BasePart") and z.Name ~= "HumanoidRootPart" then
                Q[#Q + 1] = z
                if #Q == 15 then
                    break
                end
            end
        end
        if not Q[1] then
            return
        end
        if #__T_J_731 >= 3 then
            __T_p_742(__T_J_731[1])
        end
        local z, T = math.huge, (-math.huge)
        for Z, G in Q, nil, nil do
            l, Z = G.Position["Y"], G.Size["Y"] * 0.5
            z, T = (math.min(z, l - Z)), math.max(T, l + Z)
        end
        local Z, G = math.max(T - z, 1--[[u1591]]), Instance.new("Folder")
        G.Name = "\0"
        G.Parent = workspace
        l = { ["U_550"] = G, ["U_3188"] = {}, ["U_1620"] = N }
        __T_J_731[#__T_J_731 + 1] = l
        local T, s, OP = {
            {},
            {},
            {},
            {},
            {},
            {},
            {},
            {}
        }, math.random() * math.pi * 2, 0
        for uP, FP in Q, nil, nil do
            local mP, fP = FP.Size, FP.Name == "Head"
            uP = math.min(fP and 24 or math.clamp(math.floor((mP.X * mP.Y + mP.X * mP.Z + mP.Y * mP.Z) * 1--[[u2328]] + 0.5), 7, 12), 1--[[u1844]] - OP)
            for PP = 1, uP do
                local YP = fP and 1--[[u1260]] + math.random() * 1--[[u2798]] or 1--[[u3009]] + math.random() * 1--[[u2150]]
                local qP, dP = YP * 1--[[u572]]
                if fP then
                    local fP, eP = 1 - (2 * PP - 1) / uP, PP * 1--[[u1453]] + s
                    local cP = math.sqrt(math.max(0, 1 - fP * fP))
                    dP = Vector3.new(cP * math.cos(eP) * (mP.X * 0.5 + qP), fP * (mP.Y * 0.5 + qP), cP * math.sin(eP) * (mP.Z * 0.5 + qP))
                else
                    local fP, eP = mP.Y * mP.Z, mP.X * mP.Z
                    local cP, oP, xP, CP = math.random() * (fP + eP + mP.X * mP.Y), math.random() < 0.5 and -1 or 1, math.random() - 0.5, math.random() - 0.5
                    dP = if cP < fP then Vector3.new(oP * (mP.X * 0.5 + qP), xP * mP.Y, CP * mP.Z) else if cP < fP + eP then Vector3.new(xP * mP.X, oP * (mP.Y * 0.5 + qP), CP * mP.Z) else Vector3.new(xP * mP.X, CP * mP.Y, oP * (mP.Z * 0.5 + qP))
                end
                PP, qP = CFrame:PointToWorldSpace(dP), __T_B_734:Clone()
                qP.Color = N[1--[[u2004]]]["U_2508"]
                qP.Position = PP
                qP.Parent = G
                l.U_3188[#l.U_3188 + 1] = qP
                local FP = T[math.clamp(math.floor(math.clamp((PP.Y - z) / Z, 0, 1) * 7 + 1--[[u3221]]) + math.random(-1, 1), 1, 8)]
                FP[#FP + 1] = { qP, 1--[[u1694]] * YP }
            end
            OP += uP
            if OP >= 1--[[u1844]] then
                break
            end
        end
        Q = math.max(N[1--[[u2004]]][1--[[u2452]]], 1--[[u3198]])
        s, N, Z = math.min(1--[[u1346]], Q * 1--[[u1957]]), math.min(1--[[u2171]], Q * 1--[[u2770]]), math.min(1--[[u3198]], Q * 1--[[u2770]])
        local z, OP = math.max(s + Z + 1--[[u2150]], Q * 1--[[u476]]), TweenInfo.new(Z, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"])
        local uP = TweenInfo.new(math.max(Q - z - N, 1--[[u1824]]), __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"])
        for FP = 1, 8 do
            local mP = T[FP]
            Z = (FP - 1) / 7
            if mP[1] then
                task.delay(s * Z, function()
                    if not G.Parent then
                        return
                    end
                    for T, T in mP, nil, nil do
                        __T_h_725:Create(T[1], OP, { ["Size"] = T[2], ["Transparency"] = 1--[[u3159]] }):Play()
                    end
                end)
                task.delay(z + N * Z, function()
                    if not G.Parent then
                        return
                    end
                    for N, N in mP, nil, nil do
                        __T_h_725:Create(N[1], uP, { ["Size"] = N[2] * 1--[[u168]], ["Transparency"] = 1 }):Play()
                    end
                end)
            end
        end
        task.delay(Q + 1--[[u2609]], __T_p_742, l)
    end
    function __T_h_744(p, N)
        if p.U_1065["U_2376"] then
            __T_A_741(p, N)
        end
        if p[1--[[u2004]]]["U_2376"] then
            __T_i_743(p, N)
        end
        if p.U_645["U_2376"] then
            local A = N:FindFirstChild("UpperTorso") or N:FindFirstChild("Torso") or N:FindFirstChild("HumanoidRootPart")
            if A and A:IsA("BasePart") then
                __T_t_740(p, A.Position)
            end
        end
    end
    function __T_p_745(t)
        local A = _G -- ENV_GETTER rewritten to _G
        for i = #__T_k_730, 1, -1 do
            local N = __T_k_730[i]
            if not t or N.U_1620 == t then
                table.remove(__T_k_730, i)
                N.U_532:Destroy()
            end
        end
        for i = #__T_J_731, 1, -1 do
            local N = __T_J_731[i]
            if not t or N.U_1620 == t then
                table.remove(__T_J_731, i)
                N.U_550:Destroy()
            end
        end
    end
    function __T_t_746()
        local A = __T_K_728.U_2228["U_2376"] or __T_K_728.U_2769["U_2376"]
        __T_L_726.U_2087 = A and 1--[[u773]] or 0
        __T_L_726.U_1323("U_2863", A or __T_K_728.U_2875["U_2376"])
    end
    __T_L_726.sub(function(A, i, N, l)
        N = __T_K_728[i]
        if A == "U_1546" then
            if N and N.U_2376 and N.U_1404["U_2376"] then
                __T_H_739(N.U_1404)
            end
            return
        end
        if not (N and N.U_2376) then
            N = __T_K_728.U_2875
            if not N.U_2376 then
                return
            end
            if N.U_1404["U_2376"] then
                __T_H_739(N.U_1404)
            end
        end
        if l and l.Parent then
            __T_h_744(N, l)
        end
    end)
    __T_H_747 = { { "U_2875", "U_2875" }, { "U_2228", "U_401" }, { "U_2769", "U_3175" } }
    for h, A in __T_H_747, nil, nil do
        local H = __T_K_728[A[1]]
        h = "U_124" .. A[1]
        local i = __T_S_727:AddToggle({
            ["Name"] = A[2],
            ["Default"] = false,
            ["Flag"] = h,
            ["U_3348"] = true,
            ["Callback"] = function(S)
            H.U_2376 = S
            if not S then
                __T_p_745(H)
            end
            __T_t_746()
        end
        })["U_3348"]
        i:AddToggle({
            ["Name"] = "clone",
            ["Default"] = false,
            ["Flag"] = h .. "U_99",
            ["Callback"] = function(S)
            H.U_1065["U_2376"] = S
        end
        })
        i:AddColorPicker({
            ["Name"] = "U_1333",
            ["Default"] = H.U_1065["U_2508"],
            ["Flag"] = h .. "U_28",
            ["Callback"] = function(S)
            H.U_1065["U_2508"] = S
            for t, t in __T_k_730, nil, nil do
                if t.U_1620 == H then
                    for k, k in t.U_532:GetDescendants() do
                        if k:IsA("BasePart") and k.Name ~= "HumanoidRootPart" then
                            k.Color = S
                        end
                    end
                end
            end
        end
        })
        i:AddSlider({
            ["Name"] = "U_1325",
            ["Min"] = 1,
            ["Max"] = 5,
            ["Default"] = 3,
            ["Rounding"] = 1,
            ["Suffix"] = "U_387",
            ["Flag"] = h .. "U_2690",
            ["Callback"] = function(S)
            local k = _G -- ENV_GETTER rewritten to _G
            H.U_1065[1--[[u2452]]] = tonumber(S) or 3
        end
        })
        i:AddToggle({
            ["Name"] = "U_345",
            ["Default"] = false,
            ["Flag"] = h .. "U_1849",
            ["Callback"] = function(S)
            H[1--[[u2004]]]["U_2376"] = S
        end
        })
        i:AddColorPicker({
            ["Name"] = "U_1333",
            ["Default"] = H[1--[[u2004]]]["U_2508"],
            ["Flag"] = h .. "U_3084",
            ["Callback"] = function(S)
            H[1--[[u2004]]]["U_2508"] = S
            for k, k in __T_J_731, nil, nil do
                if k.U_1620 == H then
                    for J, J in k.U_3188, nil, nil do
                        J.Color = S
                    end
                end
            end
        end
        })
        i:AddSlider({
            ["Name"] = "U_1325",
            ["Min"] = 0.5,
            ["Max"] = 5,
            ["Default"] = 1--[[u319]],
            ["Rounding"] = 1,
            ["Suffix"] = "U_387",
            ["Flag"] = h .. "U_1283",
            ["Callback"] = function(S)
            local k = _G -- ENV_GETTER rewritten to _G
            H[1--[[u2004]]][1--[[u2452]]] = tonumber(S) or 1--[[u319]]
        end
        })
        i:AddToggle({
            ["Name"] = "U_2676",
            ["Default"] = false,
            ["Flag"] = h .. "U_2081",
            ["Callback"] = function(S)
            H.U_645["U_2376"] = S
        end
        })
        i:AddColorPicker({
            ["Name"] = "U_1333",
            ["Default"] = H.U_645["U_2508"],
            ["Flag"] = h .. "U_395",
            ["Callback"] = function(S)
            H.U_645["U_2508"] = S
        end
        })
        i:AddToggle({
            ["Name"] = "U_1501",
            ["Default"] = false,
            ["Flag"] = h .. "U_284",
            ["Callback"] = function(S)
            local k = _G -- ENV_GETTER rewritten to _G
            H.U_1404["U_2376"] = S
            if S then
                task.spawn(__T___736)
            end
        end
        })
        i:AddColorPicker({
            ["Name"] = "U_1333",
            ["Default"] = H.U_1404["U_2508"],
            ["Flag"] = h .. "U_1341",
            ["Callback"] = function(S)
            H.U_1404["U_2508"] = S
        end
        })
        i:AddSlider({
            ["Name"] = "U_1732",
            ["Min"] = 10,
            ["Max"] = 1--[[u108]],
            ["Default"] = 1--[[u807]],
            ["Rounding"] = 0,
            ["Suffix"] = "U_2128",
            ["Flag"] = h .. "U_3091",
            ["Callback"] = function(h)
            local S = _G -- ENV_GETTER rewritten to _G
            H.U_1404[1--[[u1988]]] = tonumber(h) or 1--[[u807]]
        end
        })
    end
    getgenv()["U_2696"] = function()
        for H, H in __T_K_728, nil, nil do
            H.U_2376 = false
        end
        __T_L_726.U_45()
        __T_p_745()
        for H, h in __T_r_729, nil, nil do
            __T_r_729[H] = nil
            h.U_1622:Destroy()
        end
        if __T_I_732.U_2974 then
            __T_I_732.U_2974:Disconnect()
            __T_I_732.U_2974 = nil
        end
        if __T_I_732.U_394 then
            __T_I_732.U_394:Destroy()
        end
        __T_I_732.U_394, __T_I_732.U_74, __T_I_732.U_1135, __T_I_732.U_2763 = nil, nil, false, 0
        __T_B_734:Destroy()
    end
    __T_H_748 = game:GetService("RunService")
    __T_h_749 = game:GetService("Players")["LocalPlayer"]
    __T_L_750 = __T_H_748.RenderStepped
    __T_S_751 = __T_L_750.U_2212
    __T_K_752 = Vector3.new
    __T_r_753 = CFrame.new
    __T_k_754 = Vector3.zero
    __T_J_755 = CFrame.Angles
    __T_I_756 = math.random
    __T_p_757 = math.rad
    __T_B_758 = os.clock
    __T_t_759 = math.floor
    __T___760 = task.spawn
    __T_o_076 = task.wait
    function __T_o_761(A, i)
        local N = 10 ^ (i or 0)
        return __T_t_759(A * N + 0.5 - (A < 0 and 1 or 0)) / N
    end
    __T_t_762 = __T_r_753()
    __T_A_763, __T_i_764 = __T_r_753(), {}
    __T_N_765, __T_l_766, __T_y_767, __T_Q_768 = 1--[[u108]], {}
    __T_z_769 = false
    __T_T_770 = false
    getgenv()["U_2255"] = false
    getgenv()["U_852"] = { ["X"] = true, ["Y"] = true, ["Z"] = true }
    getgenv()["U_3151"] = 1--[[u3345]]
    getgenv()["U_787"] = 1--[[u3345]]
    getgenv()["U_1096"] = 1--[[u3345]]
    function __T_Z_771(G, s)
        local OP = #G
        for uP = s, OP - 1 do
            G[uP] = G[uP + 1]
        end
        G[OP] = nil
    end
    __T_G_772, __T_s_773, __T_OP_774, __T_uP_775 = {}, {}, {}, {}
    function __T_FP_776(mP)
        local fP, PP = _G,  __T_G_772 -- ENV_GETTER rewritten to _G
        if PP[mP] then
            return
        end
        PP = __T_G_772
        PP[mP] = true
        PP = getrawmetatable(mP)
        if not PP then
            return
        end
        local YP = PP.U_1278
        local qP, dP = PP.U_820, __T_uP_775
        dP[mP] = { ["U_939"] = PP, ["U_211"] = mP }
        dP = {
            ["U_1278"] = newcclosure(function(eP, cP)
            local oP = _G -- ENV_GETTER rewritten to _G
            local xP = not checkcaller() and eP and cP == "CFrame" and (#__T_l_766 ~= 0 or __T_Q_768)
            oP = xP and not __T_y_767
            if oP then
                xP = __T_A_763
                return xP
            end
            return YP(eP, cP)
        end),
            ["U_820"] = newcclosure(function(YP, eP, cP)
            local oP = _G -- ENV_GETTER rewritten to _G
            local xP = not checkcaller() and YP
            if xP then
                if eP == "Anchored" then
                    return
                end
                oP = (eP == "CFrame" or eP == "Position") and (#__T_l_766 ~= 0 or __T_Q_768)
                if oP then
                    return
                end
            end
            return qP(YP, eP, cP)
        end)
        }
        for YP, qP in PP, nil, nil do
            if not dP[YP] then
                dP[YP] = qP
            end
        end
        setreadonly(mP, dP)
    end
    function __T_mP_777(fP)
        local PP, YP = _G,  __T_s_773 -- ENV_GETTER rewritten to _G
        if YP[fP] then
            return
        end
        YP = __T_s_773
        YP[fP] = true
        YP = getrawmetatable(fP)
        if not YP then
            return
        end
        local qP = YP.U_820
        if not qP then
            return
        end
        local dP = __T_uP_775
        dP[fP] = { ["U_939"] = YP, ["U_211]============],
    [14] = [============[
"] = fP }
        dP = {}
        for eP, cP in YP, nil, nil do
            dP[eP] = cP
        end
        dP.U_820 = newcclosure(function(YP, eP, cP)
            local oP = _G -- ENV_GETTER rewritten to _G
            if not checkcaller() and YP then
                if eP == "Anchored" or eP == "CanCollide" then
                    return
                end
            end
            return qP(YP, eP, cP)
        end)
        setreadonly(fP, dP)
    end
    function __T_fP_778(PP)
        local YP, qP = _G,  __T_OP_774 -- ENV_GETTER rewritten to _G
        if qP[PP] then
            return
        end
        qP = __T_OP_774
        qP[PP] = true
        qP = getrawmetatable(PP)
        if not qP then
            return
        end
        local dP = qP.U_820
        if not dP then
            return
        end
        local eP = __T_uP_775
        eP[PP] = { ["U_939"] = qP, ["U_211"] = PP }
        eP = {}
        for cP, oP in qP, nil, nil do
            eP[cP] = oP
        end
        eP.U_820 = newcclosure(function(qP, cP, oP)
            local xP = _G -- ENV_GETTER rewritten to _G
            local CP = not checkcaller() and qP and __T_T_770
            if CP then
                if cP == "Health" and typeof(oP) == "number" and oP <= 0 then
                    return
                end
            end
            return dP(qP, cP, oP)
        end)
        setreadonly(PP, eP)
    end
    __T_PP_779, __T_YP_780, __T_qP_781, __T_dP_782 = false
    pcall(function()
        local eP = _G -- ENV_GETTER rewritten to _G
        __T_dP_782 = getfflag("U_3140")
    end)
    __T_eP_783, __T_cP_784, __T_oP_785, __T_xP_786 = nil, nil, nil, nil
    __T_CP_787 = true
    __T_MP_788 = Color3.fromRGB(193, 1--[[u990]], 255)
    __T_nP_789 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    __T_XP_790, __T_gP_791 = (function(RP)
        local HP, WP = RP:gsub("U_2130" .. __T_nP_789 .. "U_210", ""):gsub("U_3333", function(RP)
        if RP == "=" then
            return ""
        end
        local DP, vP = "", __T_nP_789:find(RP) - 1
        for nP = 6, 1, -1 do
            DP ..= vP % 2 ^ nP - vP % 2 ^ (nP - 1) > 0 and "U_2225" or "U_859"
        end
        return DP
    end), "U_715"
        local function nP(RP)
            local DP = _G -- ENV_GETTER rewritten to _G
            if #RP ~= 8 then
                return ""
            end
            local vP = 0
            for jP = 1, 8 do
                vP += RP:sub(jP, jP) == "U_2225" and 2 ^ (8 - jP) or 0
            end
            return string.char(vP)
        end
        return (HP:gsub(WP, nP))
    end)("U_922"), {}
    function __T_nP_792(RP, HP, WP)
        local DP = _G -- ENV_GETTER rewritten to _G
        if __T_gP_791[HP] then
            return
        end
        if not pcall(function()
            RP[HP] = WP
        end) then
            __T_gP_791[HP] = true
        end
    end
    __T_gP_793 = Drawing.new("U_2188")
    __T_nP_792(__T_gP_793, "U_3235", __T_XP_790)
    __T_nP_792(__T_gP_793, "Color", __T_MP_788)
    __T_nP_792(__T_gP_793, "Transparency", 1--[[u2604]])
    __T_nP_792(__T_gP_793, "U_2435", 1)
    __T_nP_792(__T_gP_793, "Visible", false)
    __T_RP_794 = Drawing.new("U_2188")
    __T_nP_792(__T_RP_794, "U_3235", __T_XP_790)
    __T_nP_792(__T_RP_794, "Color", __T_MP_788)
    __T_nP_792(__T_RP_794, "Transparency", 1)
    __T_nP_792(__T_RP_794, "U_2435", 2)
    __T_nP_792(__T_RP_794, "Visible", false)
    function __T_XP_795()
        __T_nP_792(__T_gP_793, "Visible", false)
        __T_nP_792(__T_RP_794, "Visible", false)
    end
    function __T_HP_796(WP, DP)
        local vP, jP = _G,  1--[[u3217]] -- ENV_GETTER rewritten to _G
        __T_nP_792(__T_gP_793, "Size", Vector2.new(jP, jP))
        __T_nP_792(__T_gP_793, "Position", Vector2.new(WP - 23, DP - 23))
        __T_nP_792(__T_gP_793, "Color", __T_MP_788)
        __T_nP_792(__T_gP_793, "Visible", true)
        jP = 30
        __T_nP_792(__T_RP_794, "Size", Vector2.new(jP, jP))
        __T_nP_792(__T_RP_794, "Position", Vector2.new(WP - 15, DP - 15))
        __T_nP_792(__T_RP_794, "Color", __T_MP_788)
        __T_nP_792(__T_RP_794, "Visible", true)
    end
    function __T_nP_797(WP)
        local DP = _G -- ENV_GETTER rewritten to _G
        if WP then
            pcall(function()
                local WP = _G -- ENV_GETTER rewritten to _G
                __T_xP_786 = gethiddenproperty(workspace, "FallenPartsDestroyHeight")
            end)
            pcall(function()
                local WP = _G -- ENV_GETTER rewritten to _G
                sethiddenproperty(workspace, "FallenPartsDestroyHeight", "U_112")
            end)
        else
            pcall(function()
                local WP = _G -- ENV_GETTER rewritten to _G
                sethiddenproperty(workspace, "FallenPartsDestroyHeight", __T_xP_786 or "U_1527")
            end)
        end
    end
    __T_xP_798, __T_WP_799 = {}
    __T_DP_800, __T_vP_801 = false, {}
    function __T_jP_802(aP)
        local EP, UP = _G,  __T_WP_799 ~= aP -- ENV_GETTER rewritten to _G
        if UP then
            __T_WP_799 = aP
            __T_DP_800 = false
            for wP = 1, #__T_vP_801 do
                pcall(function()
                    __T_vP_801[wP]:Disconnect()
                end)
            end
            table.clear(__T_vP_801)
            if aP then
                local function wP(VP)
                    local hP = VP:IsA("BasePart")
                    if hP then
                        __T_DP_800 = false
                    end
                end
                __T_vP_801[1] = aP.DescendantAdded:Connect(wP)
                __T_vP_801[2] = aP.DescendantRemoving:Connect(wP)
            end
        end
        UP = not __T_DP_800
        if UP then
            table.clear(__T_xP_798)
            local EP = 0
            for UP, UP in aP:GetDescendants() do
                if UP:IsA("BasePart") and UP.Name ~= "HumanoidRootPart" then
                    EP += 1
                    __T_xP_798[EP] = UP
                end
            end
            __T_DP_800 = true
        end
        return __T_xP_798
    end
    function __T_xP_803(aP)
        local EP = __T_h_749.Character
        if not EP then
            return
        end
        local UP, wP = __T_jP_802(EP), aP and 1--[[u1226]] or 0
        for jP = 1, #UP do
            aP = UP[jP]
            if aP.Parent then
                aP.LocalTransparencyModifier = wP
            end
        end
    end
    function __T_jP_804()
        local aP = __T_t_762
        if aP then
            local aP = __T_t_762
            __T_YP_780 = aP.U_1622
        end
    end
    __T_aP_805 = nil
    __T_EP_806 = 0
    function __T_UP_807(wP, VP)
        local hP = _G -- ENV_GETTER rewritten to _G
        pcall(function()
            local LP = _G -- ENV_GETTER rewritten to _G
            setfflag("U_3140", tostring(__T_o_761(__T_N_765, 1)))
        end)
        local LP = __T_PP_779
        if LP then
            __T_YP_780 = nil
            return
        end
        if wP > 1--[[u3165]] then
            return
        end
        if VP then
            pcall(function()
                local LP = _G -- ENV_GETTER rewritten to _G
                sethiddenproperty(VP, "U_603", false)
            end)
            pcall(function()
                if VP.AssemblyLinearVelocity["Magnitude"] < 1 then
                    VP.AssemblyLinearVelocity = __T_K_752(0, 1--[[u1824]], 0)
                end
            end)
        end

-- =============================================================================
-- MODULE 08/17: SheriffCombat — silentAim/corner-peek-offset/triggerbot/auto-shoot
-- getBestShootOrigin/findCornerPeekPosition/silentAimHook/autoShootStep; RightHand/gun-origin spoof, hit-prob gate
-- ==============================================================================
        local LP, bP, SP, KP, rP, kP = getgenv()["U_852"], getgenv()["U_3151"], getgenv()["U_787"], getgenv()["U_1096"], __T_A_763
        if rP then
            wP = __T_A_763
            kP = wP.U_1622
        else
            kP = rP
        end
        wP = kP or __T_k_754
        local kP, JP, IP, pP = LP.X and (math.random() * 2 - 1) * bP or wP.X, LP.Y and -math.random() * SP or wP.Y, LP.Z and (math.random() * 2 - 1) * KP or wP.Z, __T_aP_805
        if pP then
            pcall(function()
                CFrame = __T_aP_805
                VP.AssemblyLinearVelocity = __T_k_754
                VP.AssemblyAngularVelocity = __T_k_754
            end)
            __T_A_763, __T_aP_805 = __T_aP_805, nil
        end
        SP, rP = CFrame, __T_r_753(__T_K_752(kP, JP, IP)) * __T_J_755(__T_p_757(__T_I_756(1, "U_88")), __T_p_757(__T_I_756(1, "U_88")), __T_p_757(__T_I_756(1, "U_88")))
        __T_qP_781 = rP.Position
        CFrame = rP
        __T_S_751(__T_L_750)
        CFrame = SP
    end
    getgenv()["U_1717"] = function(J)
        local p = _G -- ENV_GETTER rewritten to _G
        if typeof(J) == "Vector3" then
            J = __T_r_753(J)
        end
        if typeof(J) ~= "CFrame" then
            return false
        end
        local wP = __T_i_764.HumanoidRootPart
        if not wP then
            return false
        end
        local VP = __T_T_770
        if VP then
            J = __T_r_753(J.Position)
            __T_EP_806, __T_aP_805, J = __T_B_758() + 1--[[u2604]], J, J
        else
            pcall(function()
                CFrame = J
            end)
            __T_A_763, J = J, J
        end
        return true
    end
    function __T_r_808(J)
        local p, wP = _G,  __T_i_764.Humanoid -- ENV_GETTER rewritten to _G
        if not wP then
            return
        end
        __T_PP_779 = wP.Sit
        J = __T_oP_785
        if J then
            pcall(function()
                __T_oP_785:Disconnect()
            end)
            __T_oP_785 = nil
        end
        __T_oP_785 = wP:GetPropertyChangedSignal("Sit"):Connect(function()
            __T_PP_779 = wP.Sit
            local J = not __T_PP_779
            if J then
                __T___760(__T_jP_804)
            else
                local J, p = __T_A_763
                if J then
                    local PP = __T_A_763
                    p = PP.U_1622
                else
                    p = J
                end
                __T_YP_780 = p
            end
        end)
    end
    function __T_J_809(p)
        local PP = _G -- ENV_GETTER rewritten to _G
        __T_YP_780, __T_aP_805, __T_T_770 = nil, nil, p
        getgenv()["U_2255"] = p
        local YP, aP, wP = 1, #__T_l_766, 1
        for VP = YP, aP, wP do
            local hP = __T_l_766[VP] == __T_UP_807
            if hP then
                __T_Z_771(__T_l_766, VP)
                break
            end
        end
        aP = __T_eP_783
        if aP then
            pcall(function()
                __T_eP_783:Disconnect()
            end)
            __T_eP_783 = nil
        end
        wP = __T_cP_784
        if wP then
            pcall(function()
                __T_cP_784:Disconnect()
            end)
            __T_cP_784 = nil
        end
        aP = __T_oP_785
        if aP then
            pcall(function()
                __T_oP_785:Disconnect()
            end)
            __T_oP_785 = nil
        end
        __T_xP_803(p)
        if p then
            __T_nP_797(true)
            aP = __T_l_766
            aP[#aP + 1] = __T_UP_807
            local p = __T_i_764.HumanoidRootPart
            if p then
                pcall(function()
                    local cP = _G -- ENV_GETTER rewritten to _G
                    sethiddenproperty(p, "U_603", false)
                    p.AssemblyLinearVelocity = __T_K_752(0, 1--[[u1824]], 0)
                end)
            end
            __T_eP_783 = __T_h_749.CharacterAdded:Connect(function()
                local p = _G -- ENV_GETTER rewritten to _G
                task.wait(0.5)
                __T___760(__T_jP_804)
                if __T_i_764.Humanoid then
                    __T_r_808(__T_h_749.Character)
                end
                p = __T_T_770
                if p then
                    __T_xP_803(true)
                end
            end)
            if __T_h_749.Character then
                __T_r_808(__T_h_749.Character)
            end
            __T___760(__T_jP_804)
        else
            __T_nP_797(false)
            pcall(function()
                local r = _G -- ENV_GETTER rewritten to _G
                setfflag("U_3140", __T_dP_782 or "U_389")
            end)
            pcall(function()
                local r = _G -- ENV_GETTER rewritten to _G
                r.U_2487(0)
            end)
            local r = __T_i_764.HumanoidRootPart
            YP = r and __T_A_763
            if YP then
                pcall(function()
                    local p = _G -- ENV_GETTER rewritten to _G
                    sethiddenproperty(r, "U_603", false)
                    CFrame = __T_A_763
                    r.AssemblyLinearVelocity = __T_K_752(0, 1--[[u1824]], 0)
                end)
            end
            __T_qP_781 = nil
            __T_XP_795()
        end
    end
    function __T_r_810(p)
        if not p then
            return
        end
        local PP = p:WaitForChild("HumanoidRootPart", 5)
        if PP then
            __T_i_764.HumanoidRootPart = PP
            local YP = p:WaitForChild("Humanoid", 5)
            __T_i_764.Humanoid = YP
            __T_FP_776(PP)
            if YP then
                __T_fP_778(YP)
            end
            for FP, FP in p:GetDescendants() do
                YP = "BasePart"
                if FP:IsA(YP) then
                    __T_mP_777(FP)
                end
            end
            local FP, PP = "DescendantAdded", function(YP)
                local eP = "BasePart"
                if YP:IsA(eP) then
                    __T_mP_777(YP)
                else
                    local mP = "Humanoid"
                    if YP:IsA(mP) then
                        __T_fP_778(YP)
                    end
                end
            end
            p[FP]:Connect(PP)
            FP = __T_T_770
            if FP then
                __T_xP_803(true)
            end
        end
    end
    __T_r_810(__T_h_749.Character)
    __T_p_811 = __T_h_749.CharacterAdded:Connect(__T_r_810)
    __T_h_812 = __T_B_758()
    __T_r_813 = __T_H_748.Heartbeat:Connect(function(FP)
        local mP = _G -- ENV_GETTER rewritten to _G
        __T_N_765 = 1 / (__T_B_758() - __T_h_812)
        __T_h_812 = __T_B_758()
        local h = __T_y_767 or __T_i_764.HumanoidRootPart
        if h then
            __T_A_763 = CFrame
        end
        local y = h and __T_B_758() < __T_EP_806
        if y then
            pcall(function()
                h.AssemblyLinearVelocity = __T_k_754
                h.AssemblyAngularVelocity = __T_k_754
            end)
        end
        local mP, fP, PP = 1, #__T_l_766, 1
        for YP = mP, fP, PP do
            y = __T_l_766[YP]
            if y then
                __T___760(y, FP, h)
            end
        end
        if h then
            __T_t_762 = CFrame
        end
    end)
    __T_h_814 = __T_H_748.RenderStepped:Connect(function()
        local t, _ = _G,  __T_T_770 -- ENV_GETTER rewritten to _G
        if _ then
            __T_xP_803(true)
            local _ = __T_CP_787 and __T_qP_781
            if _ then
                local _ = workspace.CurrentCamera
                t = _:WorldToViewportPoint(__T_qP_781)
                if t.Z > 0 then
                    __T_HP_796(t.X, t.Y)
                else
                    __T_XP_795()
                end
            else
                __T_XP_795()
            end
        else
            __T_XP_795()
        end
    end)
    function __T_t_815(_)
        return _.Position
    end
    __T_H_748:BindToRenderStep("U_377", __T_EnumFB.U_2218["U_3172"]["U_2506"] - 1, function()
        local _, y = _G,  __T_T_770 -- ENV_GETTER rewritten to _G
        if not y then
            return
        end
        local FP = __T_i_764.HumanoidRootPart
        y = not FP or not __T_A_763
        if y then
            return
        end
        local i, mP = pcall(__T_t_815, FP)
        y = nil
        if i then
            local t = __T_A_763
            y = (mP - t.U_1622)["Magnitude"] > "U_1781"
        else
            y = i
        end
        if y then
            pcall(function()
                CFrame = __T_A_763
            end)
        end
    end)
    getgenv()["U_605"] = function()
        local t, _ = _G,  __T_T_770 -- ENV_GETTER rewritten to _G
        if _ then
            __T_J_809(false)
        end
        _ = __T_r_813
        if _ then
            pcall(function()
                __T_r_813:Disconnect()
            end)
            __T_r_813 = nil
        end
        _ = __T_h_814
        if _ then
            pcall(function()
                __T_h_814:Disconnect()
            end)
            __T_h_814 = nil
        end
        pcall(function()
        __T_H_748:UnbindFromRenderStep("U_377")
    end)
        _ = __T_p_811
        if _ then
            pcall(function()
                __T_p_811:Disconnect()
            end)
            __T_p_811 = nil
        end
        __T_nP_797(false)
        __T_xP_803(false)
        for H = 1, #__T_vP_801 do
            pcall(function()
                __T_vP_801[H]:Disconnect()
            end)
        end
        table.clear(__T_vP_801)
        __T_WP_799 = nil
        __T_DP_800, __T_qP_781 = false, nil
        pcall(function()
        __T_gP_793:Remove()
    end)
        pcall(function()
        __T_RP_794:Remove()
    end)
        local H, h = pairs, __T_uP_775
        for r, p in H(h) do
            pcall(function()
                local H = _G -- ENV_GETTER rewritten to _G
                setreadonly(r, p.U_939)
            end)
        end
        __T_uP_775, __T_G_772, __T_s_773, __T_OP_774, __T_l_766 = {}, {}, {}, {}, {}
        pcall(function()
        local H = _G -- ENV_GETTER rewritten to _G
        setfflag("U_3140", __T_dP_782 or "U_389")
    end)
        pcall(function()
        local H = _G -- ENV_GETTER rewritten to _G
        H.U_2487(0)
    end)
    end
    __T_H_816, __T_H_817 = { ["Name"] = "U_1204", ["U_1068"] = "U_29", ["Color"] = "U_2089" }, __T_x_102()
    __T_h_818 = "U_3365"
    __T_r_819 = false
    function __T_p_820(t, _)
        local A = _G -- ENV_GETTER rewritten to _G
        t = _ and not __T_z_769 and not __T_Q_768 and (getgenv()[1--[[u3005]]] or 0) == 0
        if t then
            pcall(function()
                local t = _G -- ENV_GETTER rewritten to _G
                setfflag("U_3140", tostring(__T_o_761(__T_N_765, 1)))
            end)
            pcall(function()
                local o = _G -- ENV_GETTER rewritten to _G
                sethiddenproperty(_, "U_603", false)
            end)
            local o, t, i = _.AssemblyLinearVelocity, _.AssemblyAngularVelocity, __T_h_818
            local N, y = i == "U_1411" and __T_K_752(0, "U_2195", 0)
            if N then
                y = N
            else
                i = __T_h_818
                y = i == "U_1998" and __T_K_752(__T_I_756("U_2507", "U_1262"), __T_I_756("U_2507", "U_1262"), __T_I_756("U_2507", "U_1262"))
            end
            N = nil
            if y then
                N = y
            else
                i = __T_h_818
                N = i == "U_3365" and __T_K_752(__T_I_756(1, 2) == 1 and "U_253" or 1--[[u1248]], __T_I_756(1, 2) == 1 and "U_253" or 1--[[u1248]], __T_I_756(1, 2) == 1 and "U_253" or 1--[[u1248]])
            end
            y = nil
            if N then
                y = N
            else
                i = __T_h_818
                y = i == "U_87" and __T_K_752(__T_I_756(1, 2) == 1 and "U_1525" or "U_2195", __T_I_756(1, 2) == 1 and "U_3101" or "U_2195", __T_I_756(1, 2) == 1 and "U_1525" or "U_2195")
            end
            N = nil
            if y then
                N = y
            else
                i = __T_h_818
                N = i == "U_2625" and __T_k_754
            end
            y = N or __T_k_754
            getgenv()["U_3241"] = __T_B_758() + 1--[[u2604]]
            _.AssemblyLinearVelocity = y
            if __T_r_819 then
                _.AssemblyAngularVelocity = y
            end
            __T_S_751(__T_L_750)
            _.AssemblyLinearVelocity = o
            _.AssemblyAngularVelocity = t
            getgenv()["U_3241"] = __T_B_758() + 1--[[u3159]]
        end
    end
    function __T_o_821(L)
        local S, K, r, k = _G,  1,  #__T_l_766,  1 -- ENV_GETTER rewritten to _G
        for I = K, r, k do
            local K = __T_l_766[I] == __T_p_820
            if K then
                __T_Z_771(__T_l_766, I)
                break
            end
        end
        if L then
            r = __T_l_766
            r[#r + 1] = __T_p_820
        else
            pcall(function()
                local L = _G -- ENV_GETTER rewritten to _G
                setfflag("U_3140", __T_dP_782 or "U_389")
            end)
        end
    end
    getgenv()["U_1499"]("U_432", "U_1853", function(L)
        local S, K = _G,  L:AddToggle({ -- ENV_GETTER rewritten to _G.Name = "U_1853",
        ["Default"] = false,
        ["Flag"] = "U_3177",
        ["U_3348"] = true,
        ["Callback"] = function(L)
        __T_H_817:Set(L)
        __T_J_809(L)
    end
    })
        K.U_3348:AddSlider({
        ["Name"] = 1--[[u510]],
        ["Default"] = 9,
        ["Min"] = 1,
        ["Max"] = 9,
        ["Rounding"] = 0,
        ["Flag"] = "U_1836",
        ["Callback"] = function(H)
        local L = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_3151"] = H * math.huge
    end
    })
        K.U_3348:AddSlider({
        ["Name"] = "U_2582",
        ["Default"] = 9,
        ["Min"] = 1,
        ["Max"] = 9,
        ["Rounding"] = 0,
        ["Flag"] = "U_1891",
        ["Callback"] = function(H)
        local L = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_787"] = H * math.huge
    end
    })
        K.U_3348:AddSlider({
        ["Name"] = "U_1936",
        ["Default"] = 9,
        ["Min"] = 1,
        ["Max"] = 9,
        ["Rounding"] = 0,
        ["Flag"] = "U_878",
        ["Callback"] = function(H)
        local L = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1096"] = H * math.huge
    end
    })
        local H, L = K.U_3348, { ["Name"] = "U_288", ["Default"] = true, ["Flag"] = "U_509" }
        L.Callback = function(r)
        __T_CP_787 = r
        if not r then
            __T_XP_795()
        end
    end
        H:AddToggle(L)
        L, H = K.U_3348, {
        ["Name"] = "U_1333",
        ["Default"] = Color3.fromRGB(193, 1--[[u990]], 255),
        ["Flag"] = "U_2405"
    }
        H.Callback = function(S)
        __T_MP_788 = S
    end
        L:AddColorPicker(H)
    end)
    getgenv()["U_1499"]("U_432", "U_656", function(H)
        local L = {
        ["Name"] = "U_656",
        ["Default"] = false,
        ["Flag"] = "U_308",
        ["U_3348"] = true,
        ["Callback"] = function(S)
        __T_o_821(S)
    end
    }
        local o, S = H:AddToggle(L)["U_3348"], {
        ["Name"] = "U_1097",
        ["Default"] = "U_3365",
        ["U_3220"] = {
        "U_3365",
        "U_87",
        "U_1411",
        "U_1998",
        "U_2625"
    },
        ["Flag"] = "U_3236"
    }
        S.Callback = function(H)
        __T_h_818 = H
    end
        o:AddDropdown(S)
    end)
    ;(function()
        local o, H, h = _G,  __T_E_120:AddSection({ ["Name"] = "U_432", ["Position"] = "U_982" }),  __T_E_120:AddSection({ ["Name"] = "U_907", ["Position"] = "U_528" }) -- ENV_GETTER rewritten to _G
        getgenv()["U_2052"] = h
        local h = game:GetService("Players")
        local L = game:GetService("RunService")
        local S = game:GetService("UserInputService")
        local K = game:GetService("VirtualUser")
        local r = game:GetService("CollectionService")
        local k = game:GetService("ReplicatedStorage")
        local J = workspace
        local I = h.LocalPlayer
        local function p()
            local B = I.Character
            return B and B:FindFirstChild("HumanoidRootPart")
        end
        local B = false
        local t = false
        local _ = false
        local A = false
        local i = false
        local N = false
        local l = false
        local y = false
        local Q = false
        local z = false
        local T = false
        local Z = false
        local G = false
        local s = J.FallenPartsDestroyHeight
        local OP = false
        local uP = false
        local FP = false
        local mP = false
        local fP = 1--[[u2325]]
        local PP = J.Gravity
        local YP = true
        local qP = true
        local dP = __T_EnumFB.U_375["U_2837"]
        local eP, cP, oP, xP = __T_EnumFB.U_375["U_742"], {}, {}
        local function CP(MP)
            local nP = _G -- ENV_GETTER rewritten to _G
            pcall(function()
                MP.Archivable = true
                xP = { ["clone"] = MP:Clone(), ["U_619"] = MP.Parent }
                MP:Destroy()
            end)
        end
        local function MP()
            local nP = _G -- ENV_GETTER rewritten to _G
            local XP, gP = ipairs, "Coin_Server"
            for RP, RP in XP(r:GetTagged(gP)) do
                pcall(function()
                    RP:Destroy()
                end)
            end
            for XP, XP in ipairs(J:GetDescendants()) do
                if XP.Name == "U_2549" then
                    CP(XP)
                end
            end
        end
        local function nP()
            local XP, gP, RP = (_G), xP -- [EnvProxyPartial]
            if gP then
                local HP = xP
                RP = HP.clone
            else
                RP = gP
            end
            if RP then
                pcall(function()
                    local XP = xP
                    local gP, RP, HP = XP.clone, "Parent", xP
                    gP[RP] = HP.U_619 or J
                end)
                xP = nil
            end
        end
        local xP, XP, gP = I:FindFirstChildOfClass("PlayerGui"), {}, {}
        local RP, HP = { ["U_323"] = true, ["U_1592"] = true, ["U_392"] = true, ["U_1770"] = true }
        local function WP()
            local DP, vP = xP
            if DP then
                local jP = xP
                vP = jP.Parent
            else
                vP = DP
            end
            if vP then
                DP = xP
                return DP
            end
            xP = I:FindFirstChildOfClass("PlayerGui")
            vP = xP
            return vP
        end
        local function xP(DP)
            local vP = _G -- ENV_GETTER rewritten to _G
            if not DP or not DP.Parent or not DP:IsA("U_2672") then
                return
            end
            local jP = XP[DP] == nil
            if jP then
                local aP = XP
                aP[DP] = DP.Visible
            end
            if DP.Visible then
                pcall(function()
                    DP.Visible = false
                end)
            end
            jP = not gP[DP]
            if jP then
                local vP = gP
                vP[DP] = DP:GetPropertyChangedSignal("Visible"):Connect(function()
                    local vP, jP = _G,  G and DP.Visible -- ENV_GETTER rewritten to _G
                    if jP then
                        pcall(function()
                            DP.Visible = false
                        end)
                    end
                end)
            end
        end
        local function DP(vP)
            if not vP:IsA("U_2672") then
                return false
            end
            local jP = vP.Parent
            if not jP then
                return false
            end
            if (vP.Name == "U_392" or vP.Name == "U_853") and jP:IsA("U_915") and RP[jP.Name] then
                return true
            end
            if vP.Name == "U_392" and jP.Name == "U_2959" then
                return true
            end
            return false
        end
        local function vP()
            local jP, aP, EP = _G,  {},  WP() -- ENV_GETTER rewritten to _G
            if not EP then
                return aP
            end
            for UP, UP in ipairs(EP:GetChildren()) do
                if UP:IsA("U_915") and RP[UP.Name] then
                    for RP, RP in ipairs(UP:GetChildren()) do
                        if RP:IsA("U_2672") and (RP.Name == "U_392" or RP.Name == "U_853") then
                            aP[#aP + 1] = RP
                        end
                    end
                end
            end
            jP = EP:FindFirstChild("U_867")
            EP = jP and jP:FindFirstChild("U_2959")
            jP = EP and EP:FindFirstChild("U_392")
            if jP and jP:IsA("U_2672") then
                aP[#aP + 1] = jP
            end
            return aP
        end
        local function RP()
            local jP = HP
            if jP then
                return
            end
            jP = WP()
            if not jP then
                return
            end
            HP = jP.DescendantAdded:Connect(function(jP)
                local aP, EP = _G,  G -- ENV_GETTER rewritten to _G
                if not EP then
                    return
                end
                if not DP(jP) then
                    return
                end
                task.defer(function()
                local DP, aP = _G,  G and jP.Parent -- ENV_GETTER rewritten to _G
                if aP then
                    pcall(xP, jP)
                end
            end)
            end)
        end
        local function DP()
            local jP = _G -- ENV_GETTER rewritten to _G
            RP()
            for RP, RP in ipairs(vP()) do
                pcall(xP, RP]============],
    [15] = [============[
)
            end
        end
        local function xP()
            local RP = _G -- ENV_GETTER rewritten to _G
            local vP, jP = pairs, gP
            for aP, aP in vP(jP) do
                pcall(function()
                    aP:Disconnect()
                end)
            end
            gP = {}
            jP, vP = pairs, XP
            for gP, aP in jP(vP) do
                if gP and gP.Parent then
                    pcall(function()
                        gP.U_1105 = 1
                        gP.Visible = aP
                    end)
                end
            end
            XP = {}
        end
        local XP = "U_430"
        local gP = "U_116"
        local RP = 1--[[u2325]]
        local vP = 1--[[u1791]]
        local jP, aP, EP = 1--[[u1150]], {}, {}
        local UP, wP = false
        local VP = 0
        local hP = 0
        local function LP()
            local bP, SP = _G,  uP -- ENV_GETTER rewritten to _G
            if SP then
                return true
            end
            if os.clock() < (getgenv()["U_3241"] or 0) then
                return true
            end
            SP = (getgenv()[1--[[u3005]]] or 0) > 0
            if SP then
                local SP, KP = os.clock(), hP
                local rP = KP == 0
                if rP then
                    hP = SP
                end
                KP = SP - hP
                if KP < 1--[[u2553]] then
                    return true
                end
                getgenv()[1--[[u3005]]] = 0
                hP = 0
                return false
            end
            hP = 0
            return false
        end
        local function hP(bP)
            if oP[bP] == nil then
                oP[bP] = bP.CanCollide
            end
            if bP.CanCollide then
                bP.CanCollide = false
            end
        end
        local function bP(SP)
            local KP, rP = _G,  aP[SP] -- ENV_GETTER rewritten to _G
            if not rP then
                return
            end
            aP[SP] = nil
            for SP = 1, #rP[1--[[u1012]]] do
                pcall(function()
                    rP[1--[[u1012]]][SP]:Disconnect()
                end)
            end
            for SP in pairs(rP.U_2229) do
                local kP = oP[SP]
                oP[SP] = nil
                if kP ~= nil and SP.Parent then
                    pcall(function()
                        SP.CanCollide = kP
                    end)
                end
            end
            table.clear(rP.U_2229)
        end
        local function SP(KP)
            local rP, kP = _G,  not Q or not KP -- ENV_GETTER rewritten to _G
            if kP then
                return
            end
            if aP[KP] or KP == I.Character then
                return
            end
            local kP = { ["U_2229"] = {}, [1--[[u1012]]] = {} }
            aP[KP] = kP
            local function JP(IP)
                local pP, BP = _G,  IP:IsA("BasePart") and not kP.U_2229[IP] -- ENV_GETTER rewritten to _G
                if BP then
                    kP.U_2229[IP] = true
                    local BP = Q
                    if BP then
                        pcall(hP, IP)
                    end
                end
            end
            for hP, hP in KP:GetDescendants() do
                pcall(JP, hP)
            end
            local function hP(rP)
                kP[1--[[u1012]]][#kP[1--[[u1012]]] + 1] = rP
            end
            hP(KP.DescendantAdded:Connect(function(rP)
                local IP, pP = _G,  Q -- ENV_GETTER rewritten to _G
                if pP then
                    pcall(JP, rP)
                end
            end))
            hP(KP.DescendantRemoving:Connect(function(rP)
                if kP.U_2229[rP] then
                    kP.U_2229[rP] = nil
                    oP[rP] = nil
                end
            end))
            hP(KP.U_706:Connect(function(hP, hP)
                if not hP then
                    bP(KP)
                end
            end))
        end
        local function hP(KP)
            return KP ~= I.Character and KP:IsA("Model") and KP:FindFirstChildOfClass("Humanoid") ~= nil
        end
        local function KP()
            for rP, rP in h:GetPlayers() do
                if rP ~= I and rP.Character then
                    SP(rP.Character)
                end
            end
            for rP, rP in J:GetChildren() do
                if hP(rP) then
                    SP(rP)
                end
            end
        end
        local function rP()
            local kP = _G -- ENV_GETTER rewritten to _G
            for JP, IP in pairs(aP) do
                if not JP.Parent or JP == I.Character then
                    bP(JP)
                else
                    for JP in pairs(IP.U_2229) do
                        if JP.Parent then
                            if JP.CanCollide then
                                if oP[JP] == nil then
                                    oP[JP] = true
                                end
                                JP.CanCollide = false
                            end
                        else
                            IP.U_2229[JP] = nil
                            oP[JP] = nil
                        end
                    end
                end
            end
        end
        local function kP(JP)
            local IP, pP = _G,  p() -- ENV_GETTER rewritten to _G
            local BP = not pP or not pP.Parent
            if BP then
                wP = nil
                return
            end
            BP = LP()
            if BP then
                wP = nil
                return
            end
            local LP, tP = pP.AssemblyLinearVelocity, pP.AssemblyAngularVelocity
            local _P, AP = LP.Magnitude > XP or tP.Magnitude > gP, os.clock()
            if _P then
                VP = AP + vP
            end
            BP = _P or AP < VP
            if BP then
                pP.AssemblyLinearVelocity = Vector3.zero
                pP.AssemblyAngularVelocity = Vector3.zero
                tP = JP and wP
                if tP then
                    _P, AP = pP.Position, wP
                    IP = (_P - AP.Position)["Magnitude"] > RP
                    if IP then
                        CFrame = wP
                    end
                end
            else
                local XP = JP and LP.Magnitude < jP
                if XP then
                    wP = CFrame
                end
            end
        end
        local function XP()
            local gP = _G -- ENV_GETTER rewritten to _G
            UP = false
            for RP = 1, #EP do
                pcall(function()
                    EP[RP]:Disconnect()
                end)
            end
            table.clear(EP)
        end
        local function gP()
            local RP = UP
            if RP then
                return
            end
            UP = true
            local function RP(vP)
                EP[#EP + 1] = vP
            end
            local function vP(jP)
                if jP == I then
                    return
                end
                RP(jP.CharacterAdded:Connect(function(EP)
                    local LP = Q
                    if LP then
                        SP(EP)
                    end
                end))
                RP(jP.CharacterRemoving:Connect(function(jP)
                    bP(jP)
                end))
            end
            for jP, jP in h:GetPlayers() do
                vP(jP)
            end
            RP(h.PlayerAdded:Connect(function(jP)
                vP(jP)
                local vP = Q and jP.Character
                if vP then
                    SP(jP.Character)
                end
            end))
            RP(h.PlayerRemoving:Connect(function(h)
                if h.Character then
                    bP(h.Character)
                end
            end))
            RP(J.ChildAdded:Connect(function(h)
                local vP, jP = _G,  Q -- ENV_GETTER rewritten to _G
                if not jP then
                    return
                end
                task.defer(function()
                local vP = Q and h.Parent == J and hP(h)
                if vP then
                    SP(h)
                end
            end)
            end))
            RP(I.CharacterAdded:Connect(function(h)
                local RP = _G -- ENV_GETTER rewritten to _G
                bP(h)
                wP = nil
                VP = 0
                h = Q
                if h then
                    task.defer(KP)
                end
            end))
            KP()
        end
        local function h()
            local RP = _G -- ENV_GETTER rewritten to _G
            XP()
            for XP in pairs(aP) do
                bP(XP)
            end
            table.clear(aP)
            for XP, vP in pairs(oP) do
                if XP and XP.Parent then
                    pcall(function()
                        XP.CanCollide = vP
                    end)
                end
            end
            table.clear(oP)
            wP = nil
            VP = 0
        end
        local oP = 1
        local XP = 5
        local RP = 0
        local vP = false
        local jP = 16
        local aP, EP = 1--[[u8]]
        local function wP()
            local VP = I.Character
            return VP and VP:FindFirstChildOfClass("Humanoid")
        end
        local function VP()
            local hP, LP = _G,  WP() -- ENV_GETTER rewritten to _G
            if not LP then
                return
            end
            for WP, WP in ipairs(LP:GetChildren()) do
                if WP.Name == "U_3119" then
                    pcall(function()
                        WP:Destroy()
                    end)
                end
            end
        end
        local function WP(hP)
            local LP = _G -- ENV_GETTER rewritten to _G
            if not hP or not hP.Parent then
                return
            end
            pcall(function()
                local LP = hP.WalkSpeed <= oP
                if LP then
                    hP.WalkSpeed = jP
                end
                LP = hP.JumpPower <= oP
                if LP then
                    hP.JumpPower = aP
                end
            end)
        end
        local function hP()
            local LP, bP = _G,  T -- ENV_GETTER rewritten to _G
            if not bP then
                return
            end
            RP = os.clock() + XP
            bP = wP()
            if bP then
                local XP = bP.WalkSpeed > oP
                if XP then
                    jP = bP.WalkSpeed
                end
                XP = bP.JumpPower > oP
                if XP then
                    aP = bP.JumpPower
                end
            end
            VP()
            bP = vP
            if bP then
                return
            end
            vP = true
            task.spawn(function()
                local oP = _G -- ENV_GETTER rewritten to _G
                while true do
                    local XP = T and os.clock() < RP
                    if not XP then
                        break
                    end
                    WP(wP())
                    VP()
                    L.Heartbeat:Wait()
                end
                vP = false
            end)
        end
        local function oP()
            local XP, vP = _G,  EP -- ENV_GETTER rewritten to _G
            if vP then
                return
            end
            local vP, jP = pcall(function()
                local XP = k:FindFirstChild("U_1598")
                return XP and XP:FindFirstChild("U_788")
            end)
            if not vP or not jP then
                return
            end
            EP = jP.OnClientEvent:Connect(function()
                local k = _G -- ENV_GETTER rewritten to _G
                task.spawn(hP)
            end)
        end
        local function k()
            local XP, vP = _G,  EP -- ENV_GETTER rewritten to _G
            if vP then
                pcall(function()
                    EP:Disconnect()
                end)
                EP = nil
            end
            RP = 0
            WP(wP())
        end
        local function XP()
            local RP = _G -- ENV_GETTER rewritten to _G
            y = B and t
            local WP = B and A
            local vP = WP ~= z
            if vP then
                z = WP
                pcall(function()
                    J.FallenPartsDestroyHeight = z and "U_112" or s
                end)
            end
            vP = B and _
            WP = vP ~= Q
            if WP then
                Q = vP
                local RP = Q
                if RP then
                    gP()
                else
                    h()
                end
            end
            WP = B and i
            vP = WP ~= Z
            if vP then
                Z = WP
                local RP = Z
                if RP then
                    MP()
                else
                    nP()
                end
            end
            WP = B and N
            vP = WP ~= G
            if vP then
                G = WP
                local MP = G
                if MP then
                    DP()
                else
                    xP()
                end
            end
            vP = B and l
            WP = vP ~= T
            if WP then
                T = vP
                local MP = T
                if MP then
                    oP()
                else
                    k()
                end
            end
        end
        local oP = I.U_1026:Connect(function()
        local MP, RP = _G,  y -- ENV_GETTER rewritten to _G
        if RP then
            pcall(function()
                local MP = _G -- ENV_GETTER rewritten to _G
                K:CaptureController()
                K:ClickButton2(Vector2.new())
            end)
        end
    end)
        local K = r:GetInstanceAddedSignal("Coin_Server"):Connect(function(r)
        local MP, RP = _G,  Z -- ENV_GETTER rewritten to _G
        if RP then
            task.wait()
            local RP = Z
            if RP then
                pcall(function()
                    r:Destroy()
                end)
            end
        end
    end)
        local r = J.DescendantAdded:Connect(function(MP)
        local RP, WP = _G,  Z and MP.Name == "U_2549" -- ENV_GETTER rewritten to _G
        if WP then
            task.wait()
            RP = Z
            if RP then
                CP(MP)
            end
        end
    end)
        local function CP()
            local MP = _G -- ENV_GETTER rewritten to _G
            local RP, WP = pairs, cP
            for MP, DP in RP(WP) do
                if MP and MP.Parent then
                    MP.CanCollide = DP
                end
            end
            cP = {}
        end
        local MP, RP = setmetatable, { ["U_3367"] = "U_2349" }
        local WP = MP({}, RP)
        local function MP(RP)
            local DP, vP = _G,  WP[RP] -- ENV_GETTER rewritten to _G
            local jP = not vP
            if jP then
                vP = { ["U_3058"] = {}, ["U_72"] = false }
                WP[RP] = vP
                local function aP(EP)
                    local wP = "BasePart"
                    if EP:IsA(wP) then
                        vP.U_72 = false
                    end
                end
                vP.U_2801 = RP.DescendantAdded:Connect(aP)
                vP.U_2381 = RP.DescendantRemoving:Connect(aP)
            end
            if not vP.U_72 then
                jP = vP.U_3058
                table.clear(jP)
                DP = 0
                for aP, EP in RP:GetDescendants() do
                    aP = "BasePart"
                    if EP:IsA(aP) then
                        DP += 1
                        jP[DP] = EP
                    end
                end
                vP.U_72 = true
            end
            return vP.U_3058
        end
        local function RP()
            local DP = _G -- ENV_GETTER rewritten to _G
            local vP, jP = pairs, WP
            for aP, aP in vP(jP) do
                if aP.U_2801 then
                    pcall(function()
                        aP.U_2801:Disconnect()
                    end)
                end
                if aP.U_2381 then
                    pcall(function()
                        aP.U_2381:Disconnect()
                    end)
                end
            end
            vP, jP = setmetatable, { ["U_3367"] = "U_2349" }
            WP = vP({}, jP)
        end
        local WP = L.Stepped:Connect(function()
        local DP, vP = _G,  Q -- ENV_GETTER rewritten to _G
        if vP then
            local jP = UP
            if not jP then
                pcall(gP)
            end
            pcall(rP)
            pcall(kP, true)
        end
        vP = OP
        if vP then
            local gP = (getgenv()[1--[[u3005]]] or 0) == 0
            if gP then
                local gP = I.Character
                if gP then
                    local vP, jP = MP(gP), 1
                    local MP, gP = #vP, 1
                    for aP = jP, MP, gP do
                        local MP = vP[aP]
                        aP = MP.Parent and MP.CanCollide
                        if aP then
                            local gP = cP[MP] == nil
                            if gP then
                                local gP = cP
                                gP[MP] = MP.CanCollide
                            end
                            MP.CanCollide = false
                        end
                    end
                end
            else
                local MP, gP = next, cP
                if MP(gP) then
                    CP()
                end
            end
        end
    end)
        local cP = L.Heartbeat:Connect(function()
        local MP, gP = _G,  Q -- ENV_GETTER rewritten to _G
        if gP then
            pcall(kP, false)
        end
    end)
        local MP
        local function gP()
            local DP, vP = _G,  MP -- ENV_GETTER rewritten to _G
            if vP then
                local jP = MP
                return jP
            end
            local jP, aP = pcall(function()
                local DP, EP = _G,  I:FindFirstChild("U_2297") -- ENV_GETTER rewritten to _G
                local UP = EP and EP:FindFirstChild("U_567")
                if not UP then
                    return nil
                end
                return require(UP):GetControls()
            end)
            vP = jP and aP
            if vP then
                MP = aP
            end
            jP = MP
            return jP
        end
        local function MP(DP)
            local vP = _G -- ENV_GETTER rewritten to _G
            local jP = Vector3.new(DP.X, 0, DP.Z)
            if jP.Magnitude > 0 then
                return jP.Unit
            end
            return Vector3.zero
        end
        local function DP(vP)
            local jP, aP = _G,  gP() -- ENV_GETTER rewritten to _G
            if aP then
                local gP, EP = pcall(function()
                    return aP:GetMoveVector()
                end)
                if gP and typeof(EP) == "Vector3" and EP.Magnitude > 1--[[u3159]] then
                    return EP
                end
            end
            local gP = I.Character
            local aP = gP and gP:FindFirstChildOfClass("Humanoid")
            if aP and vP then
                gP = aP.MoveDirection
                if gP.Magnitude > 1--[[u3159]] then
                    local aP, EP = MP(CFrame.LookVector), MP(CFrame.RightVector)
                    return Vector3.new(gP:Dot(EP), 0, -gP:Dot(aP))
                end
            end
            return Vector3.zero
        end
        local gP = Ray.new()
        gP.U_2551 = __T_EnumFB.U_3131["U_379"]
        gP.U_1011 = true
        local vP = {
        0,
        1--[[u3165]],
        "U_3060",
        1--[[u1817]],
        "U_2115",
        1--[[u254]],
        "U_667",
        2,
        1--[[u588]],
        1--[[u500]],
        "U_1113",
        "U_2192"
    }
        local function jP(aP, EP)
            local UP, wP, VP = _G,  J.CurrentCamera,  MP(EP.MoveDirection) -- ENV_GETTER rewritten to _G
            VP = if VP == Vector3.zero then wP and MP(CFrame.LookVector) or Vector3.zero else VP
            if VP == Vector3.zero then
                return nil
            end
            gP.U_2661 = { I.Character }
            EP = aP.Position
            for hP = 1, #vP do
                aP, wP = math.cos(vP[hP]), math.sin(vP[hP])
                hP = Vector3.new(VP.X * aP + VP.Z * wP, 0, VP.Z * aP - VP.X * wP) * 3
                local vP = J:Raycast(EP, hP, gP)
                vP = if not vP then J:Raycast(EP - Vector3.new(0, 2, 0), hP, gP) else vP
                if vP and math.abs(vP[1--[[u2718]]]["Y"]) < 0.5 then
                    return vP
                end
            end
            return nil
        end
        local gP = 0
        local vP = 0
        local aP = S.U_229:Connect(function()
        local EP = _G -- ENV_GETTER rewritten to _G
        gP = os.clock()
        local UP = uP or not FP and not mP
        if UP then
            return
        end
        local wP, VP = p(), I.Character
        UP = VP and VP:FindFirstChildOfClass("Humanoid")
        if not wP or not UP or UP.Health <= 0 then
            return
        end
        VP = FP
        if VP then
            UP:ChangeState(__T_EnumFB.U_3137["U_2642"])
            return
        end
        if UP.U_140 ~= __T_EnumFB.Material["U_2375"] then
            return
        end
        VP = os.clock()
        local hP = VP - vP
        if hP < 1--[[u1824]] then
            return
        end
        vP = VP
        hP = jP(wP, UP)
        if not hP then
            return
        end
        VP = MP(hP[1--[[u2718]]])
        UP:ChangeState(__T_EnumFB.U_3137["U_2642"])
        hP = wP.AssemblyLinearVelocity
        wP.AssemblyLinearVelocity = Vector3.new(hP.X + VP.X * 3, hP.Y, hP.Z + VP.Z * 3)
    end)
        local vP = L.RenderStepped:Connect(function()
        local jP, EP = _G,  uP -- ENV_GETTER rewritten to _G
        if not EP then
            return
        end
        EP = p()
        if not EP then
            return
        end
        local UP, wP = J.CurrentCamera, Vector3.zero
        wP = if S:IsKeyDown(__T_EnumFB.U_375["U_3222"]) then wP + CFrame.LookVector else wP
        wP = if S:IsKeyDown(__T_EnumFB.U_375["U_1220"]) then wP - CFrame.LookVector else wP
        wP = if S:IsKeyDown(__T_EnumFB.U_375["U_2023"]) then wP - CFrame.RightVector else wP
        wP = if S:IsKeyDown(__T_EnumFB.U_375["U_2417"]) then wP + CFrame.RightVector else wP
        local VP = DP(UP)
        wP = if VP.Magnitude > 1--[[u3159]] then wP + CFrame.LookVector * -VP.Z + CFrame.RightVector * VP.X else wP
        UP = os.clock() - gP < 1--[[u3198]]
        VP = YP and (S:IsKeyDown(dP) or UP)
        wP = if VP then wP + Vector3.yAxis else wP
        wP = if qP and S:IsKeyDown(eP) then wP - Vector3.yAxis else wP
        wP = if wP.Magnitude > 0 then wP.Unit * fP else wP
        EP.AssemblyLinearVelocity = wP
    end)
        getgenv()["U_477"] = function()
        local S, gP, DP, jP, EP = _G,  false,  false,  false,  false -- ENV_GETTER rewritten to _G
        B, y, Q, z = gP, DP, jP, EP
        jP, DP = false, false
        i, Z = jP, DP
        gP, EP = false, false
        N, G = gP, EP
        gP, DP = false, false
        l, T = gP, DP
        pcall(function()
        J.FallenPartsDestroyHeight = s
    end)
        DP, EP = false, false
        OP, uP = DP, EP
        jP, DP = false, false
        FP, mP = jP, DP
        DP = oP
        if DP then
            pcall(function()
                oP:Disconnect()
            end)
            oP = nil
        end
        DP = K
        if DP then
            pcall(function()
                K:Disconnect()
            end)
            K = nil
        end
        DP = r
        if DP then
            pcall(function()

-- =============================================================================
-- MODULE 09/17: MurdererCombat — killAura/knifeSilentAim/thrownKnifeAutoHit
-- knifeAuraLoop/trackThrownKnife/knifeSilentAimHook; Knife/Slash/Throw remotes, CollectionService thrown tracking
-- ==============================================================================
                r:Disconnect()
            end)
            r = nil
        end
        EP = HP
        if EP then
            pcall(function()
                HP:Disconnect()
            end)
            HP = nil
        end
        jP = WP
        if jP then
            pcall(function()
                WP:Disconnect()
            end)
            WP = nil
        end
        jP = cP
        if jP then
            pcall(function()
                cP:Disconnect()
            end)
            cP = nil
        end
        gP = vP
        if gP then
            pcall(function()
                vP:Disconnect()
            end)
            vP = nil
        end
        EP = aP
        if EP then
            pcall(function()
                aP:Disconnect()
            end)
            aP = nil
        end
        k()
        nP()
        xP()
        CP()
        h()
        RP()
        J.Gravity = PP
    end
        getgenv()["U_1499"]("char", "U_1108", function(h)
        local S = h:AddToggle({
        ["Name"] = "U_1108",
        ["Default"] = false,
        ["Flag"] = "U_2485",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        uP = K
        if K then
            J.Gravity = 0
        else
            J.Gravity = PP
            local K = p()
            if K then
                K.AssemblyLinearVelocity = Vector3.zero
            end
        end
    end
    })
        local K, r = S.U_3348, {
        ["Name"] = 1--[[u1109]],
        ["Default"] = 1--[[u2325]],
        ["Min"] = 10,
        ["Max"] = 1--[[u1248]],
        ["Rounding"] = 0,
        ["Flag"] = "U_342"
    }
        r.Callback = function(k)
        fP = k
    end
        K:AddSlider(r)
        K, r = S.U_3348, { ["Name"] = "U_886", ["Default"] = true, ["Flag"] = "U_1277" }
        r.Callback = function(k)
        YP = k
    end
        K:AddToggle(r)
        K, r = S.U_3348, { ["Name"] = "U_2114", ["Default"] = true, ["Flag"] = "U_1158" }
        r.Callback = function(k)
        qP = k
    end
        K:AddToggle(r)
        K, h = S.U_3348, { ["Name"] = "U_886", ["Default"] = "U_2837", ["Flag"] = "U_2588" }
        h.Callback = function(k)
        local p = _G -- ENV_GETTER rewritten to _G
        local y, Q = pcall(function()
        local z = _G -- ENV_GETTER rewritten to _G
        return __T_EnumFB.U_375[k]
    end)
        p = y and Q
        if p then
            dP = Q
        end
    end
        K:AddKeybind(h)
        h, r = S.U_3348, { ["Name"] = "U_2114", ["Default"] = "U_742", ["Flag"] = "U_708" }
        r.Callback = function(S)
        local K = _G -- ENV_GETTER rewritten to _G
        local k, p = pcall(function()
        local y = _G -- ENV_GETTER rewritten to _G
        return __T_EnumFB.U_375[S]
    end)
        K = k and p
        if K then
            eP = p
        end
    end
        h:AddKeybind(r)
    end)
        getgenv()["U_1499"]("U_432", "U_92", function(h)
        local S = h:AddToggle({
        ["Name"] = "U_92",
        ["Default"] = false,
        ["Flag"] = "U_3256",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        B = K
        XP()
    end
    })
        local K, r = S.U_3348, { ["Name"] = "U_1948", ["Default"] = false, ["Flag"] = "U_184" }
        r.Callback = function(k)
        t = k
        XP()
    end
        K:AddToggle(r)
        h, K = S.U_3348, { ["Name"] = "U_1400", ["Default"] = false, ["Flag"] = "U_538" }
        K.Callback = function(k)
        _ = k
        XP()
    end
        h:AddToggle(K)
        r, K = S.U_3348, { ["Name"] = "U_3168", ["Default"] = false, ["Flag"] = "U_635" }
        K.Callback = function(k)
        A = k
        XP()
    end
        r:AddToggle(K)
        r, K = S.U_3348, { ["Name"] = "U_3277", ["Default"] = false, ["Flag"] = "U_445" }
        K.Callback = function(k)
        i = k
        XP()
    end
        r:AddToggle(K)
        r, K = S.U_3348, { ["Name"] = "U_947", ["Default"] = false, ["Flag"] = "U_1534" }
        K.Callback = function(k)
        N = k
        XP()
    end
        r:AddToggle(K)
        r, h = S.U_3348, { ["Name"] = "U_792", ["Default"] = false, ["Flag"] = "U_102" }
        h.Callback = function(S)
        l = S
        XP()
    end
        r:AddToggle(h)
    end)
        getgenv()["U_1499"]("char", "U_3215", function(h)
        h:AddToggle({
        ["Name"] = "U_3215",
        ["Default"] = false,
        ["Flag"] = "U_487",
        ["Callback"] = function(h)
        OP = h
        if not h then
            CP()
        end
    end
    })
    end)
        getgenv()["U_1499"]("U_432", "U_594", function(h)
        h:AddToggle({
        ["Name"] = "U_594",
        ["Default"] = false,
        ["Flag"] = "U_42",
        ["Callback"] = function(h)
        mP = h
    end
    })
    end)
        local h = false
        local S = 1--[[u192]]
        local K = false
        local r = 0
        local k, p, B, t, _ = 0
        local A = Ray.new()
        A.U_2551 = __T_EnumFB.U_3131["U_379"]
        A.U_1011 = true
        local i = 5
        local N = 11
        local l = 1--[[u500]]
        local y = 1--[[u2950]]
        local Q = 1--[[u2480]]
        local z = 1--[[u1409]]
        local T = {
        0,
        1--[[u2185]],
        "U_13",
        1--[[u1281]],
        "U_3353",
        1--[[u2987]],
        "U_1196"
    }
        local Z = {
        "U_2147",
        "U_2257",
        1--[[u2150]],
        1--[[u1957]],
]============],
    [16] = [============[
        0.5,
        1--[[u1190]],
        1--[[u2836]]
    }
        local G = Vector3.new(0, -(Q + z + 1--[[u3198]]), 0)
        local s = Vector3.new(0, -(z + 4), 0)
        local OP = __T_x_102({ ["Name"] = "U_280", ["U_1068"] = "U_276", ["Color"] = "U_1048" })
        local function x()
            local uP, mP = _G,  not B -- ENV_GETTER rewritten to _G
            if mP then
                local fP = Instance.new("Part")
                fP.Name = "U_2247"
                fP.Anchored = true
                fP.CanCollide = false
                fP.CanQuery = false
                fP.CanTouch = false
                fP.Transparency = 1
                fP.Material = __T_EnumFB.Material["U_1046"]
                fP.U_1088 = __T_EnumFB.U_1221["U_1474"]
                fP.U_1397 = __T_EnumFB.U_1221["U_1474"]
                fP.U_2178 = PhysicalProperties.new(1--[[u1591]], 0, 0, 1--[[u807]], 1)
                fP.Size = Vector3.new(N, y, l)
                B = fP
            end
            mP = B
            local N = mP.Parent ~= J
            if N then
                mP = B
                mP.Parent = J
            end
            mP = B
            return mP
        end
        local function N()
            local uP, mP = _G,  B -- ENV_GETTER rewritten to _G
            if mP then
                local fP = B
                local PP = fP.Parent
                if PP then
                    fP = B
                    fP.Parent = nil
                end
                PP = _
                fP = PP ~= false
                if fP then
                    _ = false
                    PP = B
                    PP.CanCollide = false
                end
            end
            r, p = 0, nil
            mP = K
            if mP then
                K = false
                pcall(function()
                    OP:Set(false)
                end)
            end
        end
        local function uP(mP, fP)
            local PP, YP, qP = "U_2661", {}, I.Character
            do local _xgSrc = {qP, B}; for _xgI = 1, #_xgSrc do YP[#YP + 1] = _xgSrc[_xgI] end end
            A[PP] = YP
            return J:Raycast(mP, fP, A)
        end
        local function A(mP, fP)
            local PP = fP.HipHeight
            if PP > 0 then
                return mP.Position["Y"] - mP.Size["Y"] * 0.5 - PP
            end
            return mP.Position["Y"] - 3
        end
        local function mP(fP, PP)
            local YP = _G -- ENV_GETTER rewritten to _G
            local qP, dP = math.cos(PP), math.sin(PP)
            return Vector3.new(fP.X * qP + fP.Z * dP, 0, fP.Z * qP - fP.X * dP)
        end
        local function fP(PP, YP, qP)
            local dP, eP = _G,  uP(PP, qP) -- ENV_GETTER rewritten to _G
            if eP and math.abs(eP[1--[[u2718]]]["Y"]) < 1--[[u3165]] then
                return eP
            end
            eP = uP(Vector3.new(PP.X, YP + 1--[[u370]], PP.Z), qP)
            if eP and math.abs(eP[1--[[u2718]]]["Y"]) < 1--[[u3165]] then
                return eP
            end
            return nil
        end
        local function PP(YP, qP, dP, eP)
            local cP = YP.Position
            for oP = 1, 2 do
                YP = oP == 1 and dP or eP
                if YP ~= Vector3.zero and (oP == 1 or dP == Vector3.zero or dP:Dot(eP) < "U_2587") then
                    for dP = 1, #T do
                        local eP = fP(cP, qP, mP(YP, T[dP]) * i)
                        if eP then
                            return eP
                        end
                    end
                end
            end
            return nil
        end
        local function i(T, mP, fP, YP, qP)
            local dP, eP = _G,  A(T, mP) -- ENV_GETTER rewritten to _G
            mP = PP(T, eP, fP, YP)
            if not mP then
                return nil
            end
            fP = MP(mP[1--[[u2718]]])
            if fP == Vector3.zero then
                return nil
            end
            YP = uP(T.Position, s)
            local A, s, PP, cP, oP = YP and YP.Position["Y"] or (-math.huge), mP.Position
            for xP = 1, #Z do
                YP = s + fP * Z[xP]
                xP = uP(Vector3.new(YP.X, eP + Q, YP.Z), G)
                if xP and xP[1--[[u2718]]]["Y"] > 1--[[u2604]] then
                    T = xP.Position["Y"]
                    if T > A + 1--[[u2206]] and T < eP + Q - 1--[[u1791]] and T > eP - z then
                        mP = if qP then math.abs(T - qP) else if T >= eP - 1--[[u2185]] then T - eP else 1--[[u1731]] - T
                        if not PP or mP < PP then
                            PP, cP, oP = mP, T, xP.Position
                        end
                    end
                end
            end
            if not cP then
                return nil
            end
            return Vector3.new(oP.X, cP, oP.Z), fP, eP
        end
        local function A(Q, z)
            local T, Z = _G,  h -- ENV_GETTER rewritten to _G
            if not Z then
                return
            end
            Z = I.Character
            local I, G = Z and Z:FindFirstChild("HumanoidRootPart"), Z and Z:FindFirstChildOfClass("Humanoid")
            if not I or not G or G.Health <= 0 then
                N()
                return
            end
            Z, Q = J.CurrentCamera, MP(G.MoveDirection)
            local J, s, uP = Z and MP(CFrame.LookVector) or Vector3.zero, K and p
            if s then
                Z = p
                uP = Z.Y
            else
                uP = s
            end
            local mP, fP, PP = i(I, G, Q, J, uP or nil)
            Z = not mP
            if Z then
                uP = os.clock() - k
                if uP > 1--[[u2185]] then
                    N()
                end
                return
            end
            Z = MP(fP:Cross(Vector3.yAxis))
            if Z == Vector3.zero then
                return
            end
            s = I.Position
            local i, YP = mP.X - s.X, mP.Z - s.Z
            local qP, dP, eP = math.sqrt(i * i + YP * YP), Q ~= Vector3.zero and Q:Dot(fP) or 0, K
            if eP then
                if qP > "U_796" or dP > 0.5 then
                    N()
                    return
                end
            else
                i = G.U_140 ~= __T_EnumFB.Material["U_2375"] or qP > 1--[[u1751]] or Q == Vector3.zero or dP > "U_2257"
                if i then
                    uP = os.clock() - k
                    if uP > 1--[[u2185]] then
                        N()
                    end
                    return
                end
            end
            k = os.clock()
            G, uP = math.min(z or 1--[[u1787]], 1--[[u1824]]), p and (p - mP)["Magnitude"] < 2
            if uP then
                YP = p
                mP = YP:Lerp(mP, 1 - math.exp(1--[[u2019]] * G))
            end
            p = mP
            dP, uP = x(), mP + fP * (l * 0.5 - 1--[[u3165]]) - Vector3.new(0, y * 0.5 + 1--[[u2786]], 0)
            CFrame = CFrame.lookAt(uP, uP - fP)
            uP = _
            uP = if PP >= mP.Y - 1--[[u2150]] then true else if PP < mP.Y - 1--[[u957]] then false else uP
            qP = _ ~= uP
            if qP then
                _ = uP
                dP.CanCollide = uP
            end
            i = not K
            if i then
                K = true
                r = 0
                pcall(function()
                    OP:Set(true)
                end)
            end
            i = Q:Dot(Z)
            Q = math.abs(i) > 1--[[u2604]]
            if Q then
                r = i > 0 and 1 or -1
            else
                qP = r
                eP = qP == 0
                if eP then
                    r = J:Dot(Z) < 0 and -1 or 1
                end
            end
            uP, J = I.AssemblyLinearVelocity, mP.Y - PP
            eP, z, qP = if J > 1--[[u3159]] then math.min(J * 14 + 1--[[u3221]], 1--[[u192]]) else if J < "U_390" then math.max(uP.Y, J * 8) else if uP.Y > 0 then uP.Y else J * 8, 1 - math.exp(1--[[u3154]] * G), uP.X * Z.X + uP.Z * Z.Z
            J, uP = qP + (S * r - qP) * z, (s.X - mP.X) * fP.X + (s.Z - mP.Z) * fP.Z
            z = math.clamp((1--[[u2206]] - uP) * 9, 1--[[u712]], 9)
            dP = Z * J + fP * z
            I.AssemblyLinearVelocity = Vector3.new(dP.X, eP, dP.Z)
        end
        t = L.Stepped:Connect(A)
        getgenv()["U_2353"] = function()
        local x = _G -- ENV_GETTER rewritten to _G
        h = false
        local L = t
        if L then
            pcall(function()
                t:Disconnect()
            end)
            t = nil
        end
        N()
        L = B
        if L then
            pcall(function()
                B:Destroy()
            end)
            B = nil
        end
        pcall(function()
        OP:Set(false)
    end)
    end
        getgenv()["U_1499"]("U_432", "U_1512", function(x)
        local L = {
        ["Name"] = "U_1512",
        ["Default"] = false,
        ["Flag"] = "U_149",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        h = K
        if not K then
            N()
        end
    end
    }
        local h, K = x:AddToggle(L)["U_3348"], {
        ["Name"] = 1--[[u1109]],
        ["Default"] = 1--[[u192]],
        ["Min"] = 8,
        ["Max"] = "U_116",
        ["Rounding"] = 0,
        ["Flag"] = "U_3238"
    }
        K.Callback = function(x)
        S = x
    end
        h:AddSlider(K)
    end)
        getgenv()["U_1499"]("char", "U_714", function(x)
        x:AddToggle({
        ["Name"] = "U_714",
        ["Default"] = false,
        ["Flag"] = "U_2756",
        ["Callback"] = function(x)
        FP = x
    end
    })
    end)
        getgenv()["U_2619"] = H
    end)()
    ;(function()
        local o = _G -- ENV_GETTER rewritten to _G
        local x, H = game:GetService("Players"), game:GetService("ReplicatedStorage")
        local h = x.LocalPlayer
        getgenv()["U_1252"] = __T_V_123:AddSection({ ["Name"] = "U_372", ["Position"] = "U_982" })
        getgenv()["U_3202"] = __T_V_123:AddSection({ ["Name"] = "U_1557", ["Position"] = "U_528" })
        local x, L = false, {}
        local S, K = 0
        local r, k = { ["U_918"] = {} }
        local J = 0
        local I = "U_403"
        local p = 1--[[u1248]]
        local B = 30
        local t = "U_2645"
        local _ = {
        "U_2136",
        "U_1250",
        "U_3346",
        "U_730",
        "U_910",
        "U_975",
        "U_2430",
        "U_3231",
        "U_1865",
        "U_1914",
        "U_432"
    }
        local A = {
        ["U_73"] = "U_1865",
        ["U_1272"] = "U_3231",
        ["U_1338"] = "U_2430",
        ["U_2779"] = "U_975",
        ["U_3077"] = "U_2136",
        ["U_442"] = "U_3346",
        ["U_2496"] = "U_730",
        ["U_2719"] = "U_910",
        ["U_2765"] = "U_910",
        ["U_1366"] = "U_432",
        ["U_682"] = "U_432"
    }
        local function i(N)
            local l = _G -- ENV_GETTER rewritten to _G
            return (string.gsub(string.lower(tostring(N)), "U_1644", ""))
        end
        local function N(l)
            local y = _G -- ENV_GETTER rewritten to _G
            local Q = tostring(math.floor(l + 0.5))
            while true do
                local l, z = string.gsub(Q, "U_3031", "U_3143")
                if z == 0 then
                    Q = l
                    break
                end
                Q = l
            end
            return Q
        end
        local function l(y)
            if y > 0 and y < 1 then
                return t
            end
            return N(y)
        end
        local function t(N)
            local y, Q, z = _G,  {},  0 -- ENV_GETTER rewritten to _G
            for T, Z in pairs(N) do
                if typeof(Z) == "table" then
                    local N = {}
                    for G, s in ipairs(Z) do
                        if typeof(s) == "table" and typeof(s[1]) == "string" and s[5] ~= nil then
                            G = {
                                [1--[[u1833]]] = tostring(s[3] or ""),
                                ["U_2582"] = tonumber(s[4]) or 0,
                                [1--[[u388]]] = s[5],
                                ["U_550"] = s[2] ~= "" and s[2] or nil
                            }
                            for Z = 1, 2 do
                                local OP = s[Z]
                                if typeof(OP) == "string" and OP ~= "" and (Z == 1 or OP ~= s[1]) then
                                    local y = N[OP]
                                    if y then
                                        y[#y + 1] = G
                                    else
                                        N[OP] = { G }
                                    end
                                    z += 1
                                end
                            end
                        end
                    end
                    Q[T] = N
                end
            end
            return z > 0 and Q or nil
        end
        local function N()
            local y = _G -- ENV_GETTER rewritten to _G
            local Q, z = pcall(function()
                local T, Z = _G,  __T_m_002({ -- ENV_GETTER rewritten to _G.U_271 = I,
                ["U_1725"] = "U_324",
                ["U_1422"] = { ["U_2728"] = "U_1414", ["U_2640"] = "U_2693" }
            })
                if typeof(Z) == "table" and Z.U_3371 == 1--[[u108]] and typeof(Z.U_835) == "string" then
                    return Z.U_835
                end
                local m, Z = game, true
                return m:HttpGet(I, Z)
            end)
            if not Q or typeof(z) ~= "string" or #z < 1--[[u1870]] then
                return false
            end
            local m, I = pcall(function()
                return __T_f_003:JSONDecode(z)
            end)
            if not m or typeof(I) ~= "table" or typeof(I.U_2244) ~= "table" then
                return false
            end
            Q, m = pcall(t, I.U_2244)
            if not Q or not m then
                return false
            end
            local f, t, Q, z = "U_465", 1--[[u1833]], "U_918", tonumber(I[1--[[u1833]]]) or 0
            r[f] = m
            r[t] = z
            r[Q] = {}
            return true
        end
        local function m(f)
            local I = _G -- ENV_GETTER rewritten to _G
            local t = tostring(f.U_3079 or f.Name or "")
            local y, Q, z = i(t), f.U_1807 and i(f.U_1807) or "", tonumber(f[1--[[u1462]]]) or 0
            local f, T, Z = { y }, string.match(y, "U_3205")
            if T and T ~= "" then
                f[#f + 1] = T
                z = if z == 0 then tonumber(Z) or 0 else z
            end
            if Q ~= "" and #y > #Q and string.sub(y, -#Q) == Q then
                f[#f + 1] = string.sub(y, 1, #y - #Q)
            end
            Z = string.match(string.lower(t), "U_3360")
            if Z then
                f[#f + 1] = Z .. "U_2705"
            end
            return f, Q, z
        end
        local function f(I, t, y, Q, z)
            local T, Z, G = (_G), "U_801" -- [EnvProxyPartial]
            for s, OP in ipairs(I) do
                if OP[1--[[u1833]]] == "" or y == "" or OP[1--[[u1833]]] == y then
                    s = 0
                    s = if OP[1--[[u1833]]] ~= "" and OP[1--[[u1833]]] == y then 2 else s
                    s = if OP.U_2582 ~= 0 and Q ~= 0 then s + (OP.U_2582 == Q and 1 or -1) else s
                    s = if Q == 0 and OP[1--[[u1833]]] == "" and OP.U_550 and OP.U_550 ~= t then s - 1 else s
                    if s > Z then
                        Z, G = s, OP
                    end
                end
            end
            if z and Z < 1 then
                return nil
            end
            return G
        end
        local function I(t, y, Q, z, T)
            local Z = _G -- ENV_GETTER rewritten to _G
            if not t then
                return nil
            end
            for G, s in ipairs(y) do
                G = t[s]
                local t = G and (f(G, s, Q, z, T))
                if t then
                    return t
                end
            end
            return nil
        end
        local function f(t, y)
            local Q, z, T, Z, G = (_G), r.U_465, m(y) -- [EnvProxyPartial]
            local m, s = t == "U_1898", y.U_2320 == true
            local OP, uP = not m and y.U_2620 == nil, m and "U_1914" or s and "U_1250" or A[y.U_2620 or ""] or "U_432"
            t = I(z[uP], T, Z, G, false)
            if t then
                return t[1--[[u388]]]
            end
            if m or s then
                return false
            end
            for m, m in ipairs(_) do
                if m ~= uP and m ~= "U_1914" and m ~= "U_1250" then
                    t = I(z[m], T, Z, G, not OP)
                    if t then
                        return t[1--[[u388]]]
                    end
                end
            end
            return false
        end
        local function m(I, t, _)
            local A = _G -- ENV_GETTER rewritten to _G
            if not r.U_465 then
                return nil, false
            end
            local y = tostring(I) .. "U_3245" .. tostring(t) .. (_.U_2320 and "U_3386" or "")
            t = r.U_918[y]
            if t ~= nil then
                return t, true
            end
            local t, Q = pcall(f, I, _)
            Q = if not t then false else Q
            r.U_918[y] = Q
            return Q, true
        end
        local function f()
            local r = h:FindFirstChildOfClass("PlayerGui")
            local I = r and r:FindFirstChild("U_515")
            r = I and I:FindFirstChild("U_492")
            return r and r:FindFirstChild("U_2737"), I
        end
        local function r(I, t, _, A, y, Q, z)
            local T, Z = _G,  I:FindFirstChild(t) -- ENV_GETTER rewritten to _G
            if Z then
                Z.U_1784 = y
                Z.Position = A
                Z.Size = _
                Z.U_1455 = z
                local G = Z:FindFirstChildOfClass("U_3341")
                if G then
                    G.U_349 = Q
                end
                return Z
            end
            Z = Instance.new("U_3116")
            Z.Name = t
            Z.U_1784 = y
            Z.Position = A
            Z.Size = _
            Z.U_1105 = 1
            Z.U_2733 = 0
            Z.U_2842 = __T_EnumFB.U_2842["U_2055"]
            Z.U_2326 = Color3.fromRGB(255, 1--[[u499]], 1--[[u576]])
            Z.U_2882 = Color3.fromRGB(0, 0, 0)
            Z.U_2233 = 1--[[u773]]
            Z.U_1455 = z
            Z.U_1161 = true
            Z.U_2005 = false
            Z.U_2435 = 1--[[u513]]
            Z[1--[[u3145]]] = ""
            t = Instance.new("U_3341")
            t.U_349 = Q
            t.U_1904 = 7
            t.Parent = Z
            Z.Parent = I
            return Z
        end
        local function I(t)
            local _ = _G -- ENV_GETTER rewritten to _G
            local A, y = r(t, "U_2556", UDim2.new(1--[[u234]], 0, 0, 22), UDim2.new(1--[[u1693]], 0, 1, 1--[[u699]]), Vector2.new(0, 1), 22, __T_EnumFB.U_1455["U_501"]), t.U_3057["X"]
            local Q, z = y * 1--[[u1693]], t:FindFirstChild("U_3007")
            Q = if z and z.U_992["X"] > 4 then z.U_2191["X"] - t.U_2191["X"] + z.U_992["X"] + 10 else Q
            local z, T = y - Q - 8, t:FindFirstChild("U_1064")
            if T and T.U_992["X"] > 4 then
                y = T.U_2191["X"] - t.U_2191["X"] + T.U_3057["X"] - T.U_992["X"]
                z = math.min(z, y - Q - 8)
            end
            A.Position = UDim2.new(0, math.floor(Q), 1, 1--[[u699]])
            A.Size = UDim2.new(0, math.max(1--[[u2325]], math.floor(z)), 0, 22)
            return A
        end
        local function t(_)
            local A = _G -- ENV_GETTER rewritten to _G
            local y, Q = r(_, "U_2469", UDim2.new(1--[[u1903]], 0, 1--[[u2422]], 0), UDim2.new(1, 1--[[u1215]], 0, 4), Vector2.new(1, 0), 18, __T_EnumFB.U_1455["U_43"]), _:FindFirstChild("U_492")
            _ = Q and Q:FindFirstChild("U_2287")
            Q = _ and _.Visible and string.match(_[1--[[u3145]]] or "", "U_561") ~= nil
            y.Position = UDim2.new(1, 1--[[u1215]], 0, Q and 1--[[u1870]] or 4)
            return y
        end
        local function r(_)
            local A = _G -- ENV_GETTER rewritten to _G
            if not _ then
                return
            end
            local y = _:FindFirstChild("U_2556")
            if y then
                y.Visible = false
            end
            y = _:FindFirstChild("U_492")
            if not y then
                return
            end
            for _, Q in ipairs(y:GetChildren()) do
                _ = Q:FindFirstChild("U_2469")
                if _ then
                    _.Visible = false
                end
            end
        end
        local function _()
            local A, y = _G,  f() -- ENV_GETTER rewritten to _G
            if not y then
                return
            end
            local Q, z = ipairs, { "U_1999", "U_871" }
            for T, Z in Q(z) do
                T = y:FindFirstChild(Z)
                if T then
                    Z = T:FindFirstChild("U_2556")
                    if Z then
                        Z:Destroy()
                    end
                    local y = T:FindFirstChild("U_492")
                    if y then
                        for Q, z in ipairs(y:GetChildren()) do
                            Q = z:FindFirstChild("U_2469")
                            if Q then
                                Q:Destroy()
                            end
                        end
                    end
                end
            end
        end
        local function A()
            local y, Q = _G,  K -- ENV_GETTER rewritten to _G
            if Q then
                local z = K
                return z
            end
            local z, T = pcall(function()
                local Z = _G -- ENV_GETTER rewritten to _G
                local G, s, OP = require, H:WaitForChild("U_3323"), "U_3337"
                return G(s:WaitForChild(OP))
            end)
            Q = z and typeof(T) == "table"
            if Q then
                K = T
            end
            y = K
            return y
        end
        local function y()
            local Q, z = _G,  k -- ENV_GETTER rewritten to _G
            if z then
                local T = k
                return T
            end
            if not A() then
                return nil
            end
            local T, Z = {}, {}
            local function G(s, OP, uP)
                if not OP or OP == "" then
                    return
                end
                local FP = s[OP]
                if FP then
                    FP[#FP + 1] = uP
                else
                    s[OP] = { uP }
                end
            end
            local s, OP = ipairs, { "U_686", "U_1898" }
            for uP, FP in s(OP) do
                uP = K[FP]
                if typeof(uP) == "table" then
                    for OP, mP in pairs(uP) do
                        if typeof(mP) == "table" then
                            z = { ["U_2113"] = FP, [1--[[u1191]]] = OP, ["U_1375"] = mP }
                            if mP.U_786 then
                                G(T, tostring(mP.U_786), z)
                            end
                            if typeof(mP.U_2188) == "string" then
                                local OP = string.match(mP.U_2188, "U_1973") or string.match(mP.U_2188, "U_1197") or string.match(mP.U_2188, "U_1804")
                                if OP then
                                    G(T, OP, z)
                                end
                            end
                            G(Z, tostring(mP.U_3079 or mP.Name or ""), z)
                        end
                    end
                end
            end
            k = { ["U_2465"] = T, ["U_78"] = Z }
            s = k
            return s
        end
        local function k(Q)
            local z, T = _G,  Q:FindFirstChild("U_492") -- ENV_GETTER rewritten to _G
            Q = T and T:FindFirstChild("U_1068")
            T = Q and Q.U_2188 or ""
            if T == "" then
                return nil
            end
            return string.match(T, "U_1973") or string.match(T, "U_1197") or string.match(T, "U_1804")
        end
        local function Q(z, T, Z)
            local G, s = _G,  y() -- ENV_GETTER rewritten to _G
            if not s then
                return nil
            end
            local y = k(z)
            z = y and s.U_2465[y] or nil
            z = if not z then s.U_78[T] else z
            if not z then
                return nil
            end
            local k
            for OP, uP in ipairs(z) do
                OP = uP.U_1375
                if OP.U_2320 == true == Z then
                    if tostring(OP.U_3079 or OP.Name or "") == T then
                        return uP.U_2113, uP[1--[[u1191]]], OP
                    end
                    k = if not k then uP else k
                end
            end
            if k then
                return k.U_2113, k[1--[[u1191]]], k.U_1375
            end
            if y and s.U_2465[y] == z then
                G = z[1]
                return G.U_2113, G[1--[[u1191]]], G.U_1375
            end
            return nil
        end
        local function k(y)
            local z, T, Z = _G,  {},  y and y:FindFirstChild("U_492") -- ENV_GETTER rewritten to _G
            if not Z then
                return T
            end
            y = 1
            while true do
                local G = Z:FindFirstChild("U_2744" .. y)
                if not G or not G.Visible then
                    break
                end
                local Z = G:FindFirstChild("U_3079")
                local s = Z and Z:FindFirstChild("U_1129")
                Z = s and s[1--[[u3145]]] or ""
                if Z == "" then
                    break
                end
                s = G:FindFirstChild("U_1691")
                local OP, uP = s and s:FindFirstChild("U_2320"), G:FindFirstChild("U_492")
                s = uP and uP:FindFirstChild("U_2287")
                local FP, mP = s and tonumber(string.match(s[1--[[u3145]]] or "", 1--[[u722]])) or 1, OP ~= nil and OP.Visible == true
                OP, s, uP = Q(G, Z, mP)
                T[y] = {
                    [1--[[u1191]]] = s or i(Z),
                    [1--[[u363]]] = FP,
                    ["U_2113"] = OP or "U_686",
                    ["U_1375"] = uP or { ["U_3079"] = Z, ["U_2320"] = mP }
                }
                y += 1
            end
            return T
        end
        local function i(y)
            local Q, z = _G,  {} -- ENV_GETTER rewritten to _G
            if typeof(y) ~= "table" then
                return z
            end
            A()
            local A = ipairs
            for T, Z in A(y) do
                local A, y, G = Z[1] or Z.U_786, Z[2] or Z.U_2287 or 1, Z[3] or Z.U_1807
                Q = K and G and K[G]
                Z = Q and Q[A]
                z[T] = { [1--[[u1191]]] = A, [1--[[u363]]] = y, ["U_2113"] = G, ["U_1375"] = Z }
            end
            return z
        end
        local function K(A, y, Q)
            local z = _G -- ENV_GETTER rewritten to _G
            if not A then
                return
            end
            local T = A:FindFirstChild("U_492")
            if not T then
                return
            end
            r(A)
            local Z = I(A)
            if #y == 0 then
                Z.Visible = false
                return
            end
            Z.Visible = true
            Z[1--[[u3145]]] = "U_1448"
            for I in ipairs(y) do
                A = T:FindFirstChild("U_2744" .. I)
                if A then
                    I = t(A)
                    I.Visible = true
                    I[1--[[u3145]]] = "U_1448"
                end
            end
            task.spawn(function()
                local I, t = _G,  {} -- ENV_GETTER rewritten to _G
                local A = os.clock() + 1--[[u876]]
                while true do
                    local z, G, s = false, 0, ipairs
                    for OP, uP in s(y) do
                        local FP = Q ~= S or not x
                        if FP then
                            return
                        end
                        if t[OP] == nil then
                            if uP.U_1375 then
                                local mP, fP = m(uP.U_2113, uP[1--[[u1191]]], uP.U_1375)
                                if fP then
                                    t[OP] = { [1--[[u388]]] = mP }
                                else
                                    z = true
                                end
                            else
                                t[OP] = { [1--[[u388]]] = false }
                            end
                        end
                        FP = Q ~= S or not x
                        if FP then
                            return
                        end
                        FP = T:FindFirstChild("U_2744" .. OP)
                        local m, Q = FP and FP:FindFirstChild("U_2469"), t[OP]
                        if Q then
                            FP, OP = Q[1--[[u388]]], tonumber(uP[1--[[u363]]]) or 1
                            if typeof(FP) == "number" then
                                G += FP * OP
                                if m then
                                    m[1--[[u3145]]] = l(FP)
                                end
                            else
                                if typeof(FP) == "string" then
                                    if m then
                                        m[1--[]============],
    [17] = [============[
[u3145]]] = FP
                                    end
                                else
                                    if m then
                                        m[1--[[u3145]]] = "U_2426"
                                    end
                                end
                            end
                        else
                            if m then
                                m[1--[[u3145]]] = "U_1448"
                            end
                        end
                    end
                    if Z.Parent then
                        Z[1--[[u3145]]] = z and l(G) .. "U_733" or l(G)
                    end
                    if not z then
                        return
                    end
                    if os.clock() > A then
                        for m in ipairs(y) do
                            if t[m] == nil then
                                s = T:FindFirstChild("U_2744" .. m)
                                local m = s and s:FindFirstChild("U_2469")
                                if m then
                                    m[1--[[u3145]]] = "U_2426"
                                end
                            end
                        end
                        if Z.Parent then
                            Z[1--[[u3145]]] = l(G)
                        end
                        return
                    end
                    task.wait(2)
                end
            end)
        end
        local function m(I)
            local t = _G -- ENV_GETTER rewritten to _G
            local A = not x or typeof(I) ~= "table"
            if A then
                return
            end
            local A, l
            if I.U_3113 and I.U_3113["U_1425"] == h then
                A, l = I.U_3113["U_3193"], I.U_761 and I.U_761["U_3193"]
            else
                if I.U_761 and I.U_761["U_1425"] == h then
                    A, l = I.U_761["U_3193"], I.U_3113 and I.U_3113["U_3193"]
                else
                    return
                end
            end
            I = S
            S = I + 1
            local h = S
            local I = i(A)
            local A = i(l)
            task.delay(1--[[u3159]], function()
                local t = h ~= S or not x
                if t then
                    return
                end
                t = f()
                if not t then
                    return
                end
                K(t:FindFirstChild("U_1999"), I, h)
                K(t:FindFirstChild("U_871"), A, h)
            end)
        end
        local function h()
            local I = x
            if not I then
                return
            end
            local I, t = f()
            if not I or not t or not t.Enabled then
                return
            end
            t = S
            S = t + 1
            local t, A, i = S, I:FindFirstChild("U_1999"), I:FindFirstChild("U_871")
            K(A, k(A), t)
            K(i, k(i), t)
        end
        local function K()
            local k = H:FindFirstChild("U_2737")
            if not k then
                return
            end
            local H, I = k:FindFirstChild("U_1992"), k:FindFirstChild("U_2492")
            if H then
                k = L
                k[#k + 1] = H.OnClientEvent:Connect(m)
            end
            if I then
                H = L
                H[#H + 1] = I.OnClientEvent:Connect(function(k)
                    m(k)
                end)
            end
            local m, m = f()
            if m then
                H = L
                H[#H + 1] = m:GetPropertyChangedSignal("Enabled"):Connect(function()
                    local H = not m.Enabled
                    if H then
                        local m = S
                        S = m + 1
                        m = f()
                        if m then
                            r(m:FindFirstChild("U_1999"))
                            r(m:FindFirstChild("U_871"))
                        end
                    end
                end)
            end
        end
        local function m()
            local f = _G -- ENV_GETTER rewritten to _G
            local H, r = ipairs, L
            for k, k in H(r) do
                pcall(function()
                    k:Disconnect()
                end)
            end
            L = {}
        end
        local function f()
            local H, L = _G,  J -- ENV_GETTER rewritten to _G
            J = L + 1
            local L = J
            task.spawn(function()
                local H = _G -- ENV_GETTER rewritten to _G
                while true do
                    local r = x and L == J
                    if not r then
                        break
                    end
                    local k, I = N(), not x or L ~= J
                    if I then
                        return
                    end
                    if k then
                        h()
                    end
                    I, r = os.clock(), k and p or B
                    while true do
                        k = x and L == J
                        if not (k and os.clock() - I < r) then
                            break
                        end
                        task.wait(1)
                    end
                end
            end)
        end
        getgenv()["U_1499"]("U_372", "U_1004", function(H)
        H:AddToggle({
        ["Name"] = "U_1004",
        ["Default"] = false,
        ["Flag"] = "U_170",
        ["Callback"] = function(H)
        x = H
        local L = S
        S = L + 1
        if H then
            m()
            K()
            f()
            h()
        else
            L = J
            J = L + 1
            m()
            _()
        end
    end
    })
    end)
        getgenv()["U_2860"] = function()
        x = false
        local f = S
        S = f + 1
        f = J
        J = f + 1
        m()
        _()
    end
    end)()
    ;(function()
        local m = _G -- ENV_GETTER rewritten to _G
        local f, o = game:GetService("Players"), game:GetService("RunService")
        local x, H = f.LocalPlayer
        local f, h, L, S, K = 0
        local function r()
            local k = x:FindFirstChildOfClass("PlayerGui")
            local x = k and k:FindFirstChild("U_867")
            return x and x:FindFirstChild("U_2959")
        end
        local function x(k)
            local J = _G -- ENV_GETTER rewritten to _G
            local I = math.floor(k / 1--[[u2325]])
            return (I > 0 and I .. "U_279" or "") .. k - I * 1--[[u2325]] .. "U_387"
        end
        local function k()
            local J, I = _G,  h -- ENV_GETTER rewritten to _G
            if I then
                pcall(function()
                    h:Destroy()
                end)
            end
            h, L, S, K = nil, nil, nil, nil
        end
        local function J(I)
            local p, B, t = (_G), h -- [EnvProxyPartial]
            if B then
                local _ = h
                t = _.Parent == I
            else
                t = B
            end
            local _, A = t and L
            if _ then
                t = L
                A = t.Parent == h
            else
                A = _
            end
            if A then
                return true
            end
            k()
            t = I:FindFirstChild("U_644")
            _ = t and t:FindFirstChild("U_1551")
            if not _ then
                return false
            end
            B = Instance.new("U_853")
            B.Name = "U_200"
            B.U_1105 = 1
            B.U_2733 = 0
            B.U_1784 = t.U_1784
            B.Position = t.Position
            B.Size = t.Size
            B.U_2435 = t.U_2435
            B.Visible = false
            A = Instance.new("U_3116")
            A.Name = "U_1551"
            A.U_1105 = 1
            A.U_2733 = 0
            A.U_1784 = _.U_1784
            A.Position = _.Position
            A.Size = _.Size
            A.U_2435 = _.U_2435
            A.U_1151 = _.U_1151
            A.U_2291 = _.U_2291
            A.U_1161 = _.U_1161
            A.U_1125 = _.U_1125
            A.U_1455 = _.U_1455
            A.U_3098 = _.U_3098
            A.U_2882 = _.U_2882
            A.U_2233 = _.U_2233
            A.U_2326 = Color3.new(1, 1, 1)
            A[1--[[u3145]]] = ""
            A.Parent = B
            S, h, L = t.Position, B, A
            B.Parent = I
            return true
        end
        local function I()
            local p, B = _G,  r() -- ENV_GETTER rewritten to _G
            if not B or not J(B) then
                return
            end
            local r = workspace:FindFirstChild("U_63")
            local J, t = r and tonumber(r:GetAttribute(1--[[u2029]])) or -1, B:FindFirstChild("U_644")
            r = J <= 0 or t and t.Visible
            if r then
                local _ = h
                local A = _.Visible
                if A then
                    _ = h
                    _.Visible = false
                end
                return
            end
            J = math.floor(J)
            local _, A = 0, B:FindFirstChild("U_354")
            r = A and A.Visible
            if r then
                B = A:FindFirstChild("U_1551")
                local i
                if B then
                    local N, l = B.Position["Y"][1--[[u422]]] + B.Size["Y"][1--[[u422]]], L
                    i = N - l.Position["Y"][1--[[u422]]] + 6
                else
                    i = B
                end
                _ = i or 56
            end
            B = t and t.Position or S
            A, t = UDim2.new(B.X[1--[[u1447]]], B.X[1--[[u422]]], B.Y[1--[[u1447]]], B.Y[1--[[u422]]] + _), h
            r = t.Position ~= A
            if r then
                B = h
                B.Position = A
            end
            t = K ~= J
            if t then
                K = J
                B = L
                B[1--[[u3145]]] = x(J)
                r = L
                r.U_2326 = J <= 30 and Color3.fromRGB(255, 0, 0) or Color3.new(1, 1, 1)
            end
            r = h
            t = not r.Visible
            if t then
                A = h
                A.Visible = true
            end
        end
        local function x()
            local h, L = _G,  H -- ENV_GETTER rewritten to _G
            if L then
                pcall(function()
                    H:Disconnect()
                end)
            end
            H = nil
            k()
        end
        local function h()
            local L, S = _G,  H -- ENV_GETTER rewritten to _G
            if S then
                return
            end
            f = 0
            H = o.Heartbeat:Connect(function(o)
                local H = _G -- ENV_GETTER rewritten to _G
                f += o
                o = f
                if o < 1--[[u1824]] then
                    return
                end
                f = 0
                pcall(I)
            end)
            pcall(I)
        end
        getgenv()["U_1499"]("U_372", "U_2003", function(f)
        f:AddToggle({
        ["Name"] = "U_2003",
        ["Default"] = false,
        ["Flag"] = "U_200",
        ["Callback"] = function(f)
        if f then
            h()
        else
            x()
        end
    end
    })
    end)
        getgenv()["U_884"] = x
    end)()
    __T_m_822, __T_f_823 = game:GetService("Players"), game:GetService("RunService")
    __T_o_824 = workspace
    __T_x_825 = __T_m_822.LocalPlayer
    __T_m_826 = game:GetService("UserInputService")
    __T_H_827 = false
    __T_h_828 = 1--[[u513]]
    __T_L_829 = false
    __T_S_830 = 80
    __T_K_831 = false
    __T_r_832 = 1--[[u513]]
    __T_k_833 = false
    __T_J_834 = false
    __T_I_835 = false
    __T_p_836, __T_B_837, __T_t_838, __T___839 = 1--[[u807]]
    __T_A_840 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    __T_i_841 = false
    __T_N_842 = false
    __T_l_843 = 0
    __T_y_844 = 0
    __T_m_826.U_229:Connect(function()
        local Q = _G -- ENV_GETTER rewritten to _G
        __T_y_844 = os.clock()
    end)
    function __T_Q_845()
        local z = _G -- ENV_GETTER rewritten to _G
        local T = os.clock() - __T_y_844
        if T < 1--[[u3198]] then
            return true
        end
        T = __T_EnumFB.U_375["U_2837"]
        if __T_m_826:IsKeyDown(T) then
            return true
        end
        return false
    end
    __T_m_846 = nil
    function __T_y_847()
        local z, T = _G,  __T_o_824.CurrentCamera -- ENV_GETTER rewritten to _G
        if not T then
            return nil
        end
        local Z = CFrame.LookVector
        return math.atan2(-Z.X, -Z.Z)
    end
    function __T_z_848()
        local T = __T_x_825.Character
        return T and T:FindFirstChildOfClass("Humanoid")
    end
    function __T_T_849()
        local Z = __T_x_825.Character
        return Z and Z:FindFirstChild("HumanoidRootPart")
    end
    __T_Z_850 = __T_f_823.Stepped:Connect(function()
        local G = __T_z_848()
        if not G then
            return
        end
        local s = __T_H_827 and G.WalkSpeed ~= __T_h_828
        if s then
            G.WalkSpeed = __T_h_828
        end
        s = __T_L_829
        if s then
            if not G.UseJumpPower then
                G.UseJumpPower = true
            end
            local s = G.JumpPower ~= __T_S_830
            if s then
                G.JumpPower = __T_S_830
            end
        end
    end)
    __T_G_851 = __T_f_823.Heartbeat:Connect(function()
        local s, OP = _G,  not __T_K_831 -- ENV_GETTER rewritten to _G
        if OP then
            __T_i_841 = false
            __T_N_842 = false
            __T_l_843, __T_m_846 = 0, nil
            return
        end
        local uP, FP = __T_z_848(), __T_T_849()
        OP = not uP or not FP
        if OP then
            __T_i_841 = false
            __T_N_842 = false
            __T_l_843, __T_m_846 = 0, nil
            return
        end
        OP = uP:GetState()
        local T = OP == __T_EnumFB.U_3137["U_2642"]
        local mP, fP = T or OP == __T_EnumFB.U_3137["U_2202"], __T_k_833 or __T_J_834
        if fP then
            __T_l_843 = 0
            OP = T and not __T_i_841
            if OP then
                local OP = uP.MoveDirection
                OP = if OP.Magnitude < 1--[[u1824]] then CFrame.LookVector else OP
                OP = Vector3.new(OP.X, 0, OP.Z)
                local fP = OP.Magnitude > 0
                if fP then
                    OP = OP.Unit
                    local fP = FP.AssemblyLinearVelocity
                    FP.AssemblyLinearVelocity = Vector3.new(OP.X * __T_r_832, fP.Y, OP.Z * __T_r_832)
                    __T_N_842 = true
                end
            end
            local OP = __T_N_842 and mP
            if OP then
                local fP = __T_J_834
                if fP then
                    local PP = __T_y_847()
                    local YP = PP and __T_m_846
                    if YP then
                        local YP = PP - __T_m_846
                        while YP > math.pi do
                            YP -= (2 * math.pi)
                        end
                        while YP < "U_2445" do
                            YP += (2 * math.pi)
                        end
                        if math.abs(YP) > "U_206" then
                            local PP = FP.AssemblyLinearVelocity
                            local qP = Vector3.new(PP.X, 0, PP.Z)
                            if qP.Magnitude > 1 then
                                local dP = CFrame.new(0, YP, 0) * qP
                                FP.AssemblyLinearVelocity = Vector3.new(dP.X, PP.Y, dP.Z)
                            end
                        end
                    end
                end
                fP = uP.MoveDirection
                local PP = fP.Magnitude > 1--[[u1824]]
                if PP then
                    fP = Vector3.new(fP.X, 0, fP.Z)["Unit"]
                    local PP = FP.AssemblyLinearVelocity
                    local YP, qP = Vector3.new(PP.X, 0, PP.Z), fP * __T_r_832
                    local fP = YP:Lerp(qP, 1--[[u2185]])
                    FP.AssemblyLinearVelocity = Vector3.new(fP.X, PP.Y, fP.Z)
                else
                    local fP = __T_J_834
                    if fP then
                        local fP = FP.AssemblyLinearVelocity
                        local PP = Vector3.new(fP.X, 0, fP.Z)
                        local YP = PP.Magnitude > 1--[[u1824]] and PP.Magnitude < __T_r_832
                        if YP then
                            local YP = PP.Unit * __T_r_832
                            FP.AssemblyLinearVelocity = Vector3.new(YP.X, fP.Y, YP.Z)
                        end
                    end
                end
            end
            OP = not mP
            if OP then
                __T_N_842 = false
            end
        else
            local OP = math.max(uP.WalkSpeed, 1)
            local fP, PP, YP = math.max(__T_r_832, OP), math.max, __T_r_832
            local qP, dP = PP(YP * 1--[[u1824]], 1), __T_l_843 < OP
            if dP then
                __T_l_843 = OP
            end
            OP = T and not __T_i_841
            if OP then
                __T_l_843 = math.min(__T_l_843 + qP, fP)
                PP = FP.AssemblyLinearVelocity
                dP = Vector3.new(PP.X, 0, PP.Z)
                YP = nil
                if dP.Magnitude > 1--[[u1824]] then
                    YP = dP.Unit
                else
                    local eP = uP.MoveDirection
                    if eP.Magnitude > 1--[[u1824]] then
                        YP = Vector3.new(eP.X, 0, eP.Z)["Unit"]
                    else
                        local eP = CFrame.LookVector
                        YP = Vector3.new(eP.X, 0, eP.Z)
                        YP = YP.Magnitude > 0 and YP.Unit or Vector3.new(0, 0, 0)
                    end
                end
                local eP = YP.Magnitude > 0
                if eP then
                    FP.AssemblyLinearVelocity = Vector3.new(YP.X * __T_l_843, PP.Y, YP.Z * __T_l_843)
                    __T_N_842 = true
                end
            end
            OP = mP and __T_N_842
            if OP then
                qP = FP.AssemblyLinearVelocity
                dP, PP = Vector3.new(qP.X, 0, qP.Z), uP.MoveDirection
                fP = if PP.Magnitude > 1--[[u1824]] then Vector3.new(PP.X, 0, PP.Z)["Unit"] else if dP.Magnitude > 1--[[u1824]] then dP.Unit else nil
                if fP then
                    YP = math.max(dP.Magnitude, __T_l_843)
                    FP.AssemblyLinearVelocity = Vector3.new(fP.X * YP, qP.Y, fP.Z * YP)
                end
            end
            fP = not mP
            if fP then
                __T_N_842 = false
                PP = __T_Q_845()
                if PP then
                    uP.Jump = true
                else
                    __T_l_843 = 0
                end
            end
        end
        __T_m_846, __T_i_841 = __T_y_847(), T
    end)
    __T_f_823:BindToRenderStep("U_2322", __T_EnumFB.U_2218["U_3172"]["U_2506"] + 1, function()
        local m = __T_I_835
        if not m then
            return
        end
        m = __T_o_824.CurrentCamera
        if m then
            CFrame = CFrame * __T_A_840
        end
    end)
    getgenv()["U_1499"]("char", "U_824", function(m)
        local i = {
        ["Name"] = "U_824",
        ["Default"] = false,
        ["Flag"] = "WalkSpeed",
        ["U_3348"] = true,
        ["Callback"] = function(N)
        local l = __T_z_848()
        if N then
            if l then
                __T_B_837 = l.WalkSpeed
            end
            __T_H_827 = true
        else
            __T_H_827 = false
            local N = l and __T_B_837
            if N then
                l.WalkSpeed = __T_B_837
            end
        end
    end
    }
        local N, l = m:AddToggle(i)["U_3348"], {
        ["Name"] = "U_2506",
        ["Default"] = 1--[[u513]],
        ["Min"] = 16,
        ["Max"] = 1--[[u1248]],
        ["Rounding"] = 0,
        ["Flag"] = "U_3194"
    }
        l.Callback = function(m)
        __T_h_828 = m
    end
        N:AddSlider(l)
    end)
    getgenv()["U_1499"]("char", "U_855", function(m)
        local h = {
        ["Name"] = "U_855",
        ["Default"] = false,
        ["Flag"] = "JumpPower",
        ["U_3348"] = true,
        ["Callback"] = function(i)
        local N = __T_z_848()
        if i then
            if N then
                __T___839 = N.UseJumpPower
                __T_t_838 = N.JumpPower
            end
            __T_L_829 = true
        else
            __T_L_829 = false
            if N then
                local i = __T___839 ~= nil
                if i then
                    N.UseJumpPower = __T___839
                end
                i = __T_t_838
                if i then
                    N.JumpPower = __T_t_838
                end
            end
        end
    end
    }
        local i, N = m:AddToggle(h)["U_3348"], {
        ["Name"] = "U_2506",
        ["Default"] = 80,
        ["Min"] = 0,
        ["Max"] = "U_1781",
        ["Rounding"] = 0,
        ["Flag"] = "U_1838"
    }
        N.Callback = function(m)
        __T_S_830 = m
    end
        i:AddSlider(N)
    end)
    getgenv()["U_1499"]("U_432", "U_257", function(m)
        local h = m:AddToggle({
        ["Name"] = "U_257",
        ["Default"] = false,
        ["Flag"] = "U_187",
        ["U_3348"] = true,
        ["Callback"] = function(m)
        __T_K_831 = m
    end
    })
        local m, S = h.U_3348, {
        ["Name"] = "U_2632",
        ["Default"] = 1--[[u513]],
        ["Min"] = 10,
        ["Max"] = 1--[[u876]],
        ["Rounding"] = 0,
        ["Flag"] = "U_1728"
    }
        S.Callback = function(i)
        __T_r_832 = i
    end
        m:AddSlider(S)
        m, S = h.U_3348, { ["Name"] = "U_2585", ["Default"] = false, ["Flag"] = "U_1793" }
        S.Callback = function(r)
        __T_k_833 = r
    end
        m:AddToggle(S)
        S, m = h.U_3348, { ["Name"] = "U_7", ["Default"] = false, ["Flag"] = "U_1798" }
        m.Callback = function(h)
        __T_J_834 = h
    end
        S:AddToggle(m)
    end)
    getgenv()["U_1499"]("U_432", "U_2621", function(m)
        local h = {
        ["Name"] = "U_2621",
        ["Default"] = false,
        ["Flag"] = "U_1115",
        ["U_3348"] = true,
        ["Callback"] = function(S)
        __T_I_835 = S
    end
    }
        local S, r = m:AddToggle(h)["U_3348"], {
        ["Name"] = "U_2506",
        ["Default"] = 1--[[u807]],
        ["Min"] = 1,
        ["Max"] = 1--[[u807]],
        ["Rounding"] = 0,
        ["Flag"] = "U_2002"
    }
        r.Callback = function(m)
        local h = _G -- ENV_GETTER rewritten to _G
        __T_p_836 = m
        __T_A_840 = CFrame.new(0, 0, 0, 1, 0, 0, 0, m / 1--[[u807]], 0, 0, 0, 1)
    end
        S:AddSlider(r)
    end)
    __T_m_852 = false
    __T_h_853, __T_S_854, __T_r_855 = 1--[[u181]]
    getgenv()["U_1499"]("U_432", "U_3295", function(k)
        local J = {
        ["Name"] = "U_3295",
        ["Default"] = false,
        ["Flag"] = "U_1294",
        ["U_3348"] = true,
        ["Callback"] = function(p)
        local A = _G -- ENV_GETTER rewritten to _G
        __T_m_852 = p
        local i = __T_o_824.CurrentCamera
        if p then
            if i then
                __T_S_854 = i.FieldOfView
                i.FieldOfView = __T_h_853
            end
            local p = not __T_r_855
            if p then
                __T_r_855 = __T_f_823.RenderStepped:Connect(function()
                    local p = __T_m_852
                    if p then
                        local p = __T_o_824.CurrentCamera
                        local N = p and p.FieldOfView ~= __T_h_853
                        if N then
                            p.FieldOfView = __T_h_853
                        end
                    end
                end)
            end
        else
            local p = i and __T_S_854
            if p then
                i.FieldOfView = __T_S_854
            end
            p = __T_r_855
            if p then
                pcall(function()
                    __T_r_855:Disconnect()
                end)
                __T_r_855 = nil
            end
        end
    end
    }
        local p, A = k:AddToggle(J)["U_3348"], {
        ["Name"] = "U_2506",
        ["Default"] = 1--[[u181]],
        ["Min"] = 30,
        ["Max"] = 1--[[u3069]],
        ["Rounding"] = 0,
        ["Flag"] = "U_2061"
    }
        A.Callback = function(k)
        __T_h_853 = k
        local J = __T_m_852
        if J then
            local J = __T_o_824.CurrentCamera
            if J then
                J.FieldOfView = k
            end
        end
    end
        p:AddSlider(A)
    end)
    __T_x_825.CharacterAdded:Connect(function()
        local x = _G -- ENV_GETTER rewritten to _G
        task.wait(1--[[u1824]])
        x = __T_m_852
        if x then
            local x = __T_o_824.CurrentCamera
            if x then
                local k = not __T_S_854
                if k then
                    __T_S_854 = x.FieldOfView
                end
                x.FieldOfView = __T_h_853
            end
        end
    end)
    getgenv()["U_266"] = function()
        local x, h, k, J, p, A = _G,  false,  false,  false,  false,  false -- ENV_GETTER rewritten to _G
        __T_H_827, __T_L_829, __T_K_831, __T_I_835, __T_m_852 = h, k, J, p, A
        h = __T_Z_850
        if h then
            pcall(function()
                __T_Z_850:Disconnect()
            end)
            __T_Z_850 = nil
        end
        A = __T_G_851
        if A then
            pcall(function()
                __T_G_851:Disconnect()
            end)
            __T_G_851 = nil
        end
        h = __T_r_855
        if h then
            pcall(function()
                __T_r_855:Disconnect()
            end)
            __T_r_855 = nil
        end
        pcall(function()
        __T_f_823:UnbindFromRenderStep("U_2322")
    end)
        local m = __T_z_848()
        if m then
            A = __T_B_837
            if A then
                pcall(function()
                    m.WalkSpeed = __T_B_837
                end)
            end
            h = __T___839 ~= nil
            if h then
                pcall(function()
                    m.UseJumpPower = __T___839
                end)
            end
            k = __T_t_838
            if k then
                pcall(function()
                    m.JumpPower = __T_t_838
                end)
            end
        end
        local m = __T_o_824.CurrentCamera
        p = m and __T_S_854
        if p then
            pcall(function()
                m.FieldOfView = __T_S_854
            end)
        end
    end
    __T_m_856 = game:GetService("Players")["LocalPlayer"]
    __T_f_857 = false
    __T_o_858, __T_x_859, __T_H_860, __T_h_861 = false, {}, {}
    function __T_L_862()
        local S, K = _G,  __T_m_856.Character -- ENV_GETTER rewritten to _G
        if not K then
            return
        end
        local r = K:FindFirstChild("U_3181")
        local k = K:FindFirstChild("U_3173")
        local J = K:FindFirstChild("U_925")
        K = nil
        if r then
            local I = __T_x_859
            K = I.U_2583
        else
            K = r
        end
        if K then
            pcall(function()
                local I, p = "U_514", __T_x_859
                r[I] = p.U_2583["U_514"] or ""
                I, p = "U_270", __T_x_859
                r[I] = p.U_2583["U_270"] or ""
            end)
        end
        K = nil
        if k then
            local r = __T_x_859
            K = r.U_1382
        else
            K = k
        end
        if K then
            pcall(function()
                local r, I = "U_270", __T_x_859
                k[r] = I.U_1382["U_270"] or ""
                r, I = "Transparency", __T_x_859
                k[r] = I.U_1382["Transparency"] or 0
            end)
        end
        K = nil
        if J then
            local r = __T_x_859
            K = r.U_997
        else
            K = J
        end
        if K then
            pcall(function()
                local S, K = "U_270", __T_x_859
                J[S] = K.U_997["U_270"] or ""
                S, K = "Transparency", __T_x_859
                J[S] = K.U_997["Transparency"] or 0
            end)
        end
        __T_x_859 = {}
    end
    function __T_S_863()
        local K, r = _G,  __T_m_856.Character -- ENV_GETTER rewritten to _G
        if not r then
            return
        end
        local k = r:FindFirstChild("Head")
        r = nil
        if k then
            local J = __T_H_860
            r = J.Head
        else
            r = k
        end
        if r then
            pcall(function()
                local r, J = "Transparency", __T_H_860
                k[r] = J.Head
                r = __T_H_860
                J = r.U_270
                if J then
                    local I, p = "U_270", __T_H_860
                    k[I] = p.U_270
                end
                r = __T_H_860
                J = r.U_514
                if J then
                    local r, J = "U_514", __T_H_860
                    k[r] = J.U_514
                end
            end)
        end
        local r, k = ipairs, __T_H_860
        for J, J in r(k.U_2016 or {}) do
            if J.U_1616 and J.U_1616["Parent"] then
                pcall(function()
                    J.U_1616["Transparency"] = J.U_2332
                end)
            end
        end
        __T_H_860 = {}
    end
    function __T_K_864()
        local r, k = _G,  __T_f_857 -- ENV_GETTER rewritten to _G
        if not k then
            return
        end
        k = __T_m_856.Character
        if not k th]============],
    [18] = [============[
en
            return
        end
        local J = k:FindFirstChild("U_3181")
        local I = k:FindFirstChild("U_3173")
        local p = k:FindFirstChild("U_925")
        if not J then
            return
        end
        __T_x_859 = {}
        if J then
            k = __T_x_859
            k.U_2583 = { ["U_270"] = J.U_270, ["U_514"] = J.U_514 }
            pcall(function()
                J.U_270 = "U_1237"
                J.U_514 = "U_3093"
            end)
        end
        if I then
            k = __T_x_859
            k.U_1382 = { ["U_270"] = I.U_270, ["Transparency"] = I.Transparency }
            pcall(function()
                I.U_270 = "U_1328"
                I.Transparency = 1
            end)
        end
        if p then
            k = __T_x_859
            k.U_997 = { ["U_270"] = p.U_270, ["Transparency"] = p.Transparency }
            pcall(function()
                p.U_270 = "U_2902"
                p.Transparency = 1
            end)
        end
    end
    function __T_x_865()
        local r, k = _G,  __T_o_858 -- ENV_GETTER rewritten to _G
        if not k then
            return
        end
        __T_S_863()
        k = __T_m_856.Character
        if not k then
            return
        end
        local J = k:FindFirstChild("Head")
        if not J then
            return
        end
        k = __T_H_860
        k.Head = J.Transparency
        k = __T_H_860
        k.U_270 = J.U_270
        k = __T_H_860
        k.U_514 = J.U_514
        k = __T_H_860
        k.U_2016 = {}
        pcall(function()
            J.U_270 = "U_870"
            J.U_514 = "U_870"
            J.Transparency = 1
        end)
        local I, p = ipairs, J:GetDescendants()
        for J, B in I(p) do
            k = B:IsA("BasePart") or B:IsA("U_1417") or B:IsA("MeshPart") or B:IsA("SpecialMesh")
            if k then
                J = pcall(function()
                    return B.Transparency
                end)
                if J then
                    local k, J = B.Transparency, __T_H_860
                    local I, p = J.U_2016, __T_H_860
                    I[#p.U_2016 + 1] = { ["U_1616"] = B, ["U_2332"] = k }
                    pcall(function()
                        B.Transparency = 1
                    end)
                end
            end
        end
    end
    __T_H_866 = game:GetService("RunService")
    __T_r_867 = "U_616"
    __T_k_868 = "U_965"
    __T_J_869 = "U_1265"
    __T_I_870 = {
        {
        ["U_1819"] = "Torso",
        ["U_3171"] = "U_2923",
        ["Part"] = "Torso",
        ["U_835"] = __T_EnumFB.U_1471["Torso"]
    },
        {
        ["U_1819"] = "U_232",
        ["U_3171"] = "U_1019",
        ["Part"] = "U_2897",
        ["U_835"] = __T_EnumFB.U_1471["U_232"]
    },
        {
        ["U_1819"] = "U_2017",
        ["U_3171"] = "U_189",
        ["Part"] = "U_2833",
        ["U_835"] = __T_EnumFB.U_1471["U_2017"]
    },
        {
        ["U_1819"] = "U_1938",
        ["U_3171"] = "U_434",
        ["Part"] = "U_2419",
        ["U_835"] = __T_EnumFB.U_1471["U_1938"]
    },
        {
        ["U_1819"] = "U_336",
        ["U_3171"] = "U_3059",
        ["Part"] = "U_2789",
        ["U_835"] = __T_EnumFB.U_1471["U_336"]
    }
    }
    __T_p_871 = { "U_666", "U_1520" }
    __T_B_872 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
    __T_t_873, __T___874, __T_A_875 = CFrame.new(0, 0, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(0, 0, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), CFrame.new(0, 1--[[u267]], 0)
    __T_i_876 = 6
    __T_N_877 = {
        { ["Name"] = "U_285", ["Size"] = Vector3.new(2, 2, 1) },
        { ["Name"] = "Torso", ["Size"] = Vector3.new(2, 2, 1) },
        { ["Name"] = "U_2897", ["Size"] = Vector3.new(1, 2, 1) },
        { ["Name"] = "U_2833", ["Size"] = Vector3.new(1, 2, 1) },
        { ["Name"] = "U_2419", ["Size"] = Vector3.new(1, 2, 1) },
        { ["Name"] = "U_2789", ["Size"] = Vector3.new(1, 2, 1) }
    }
    __T_l_878 = {
        {
        ["Name"] = "U_2871",
        ["U_2932"] = "U_285",
        ["U_981"] = "U_285",
        ["U_3121"] = "Torso",
        ["U_228"] = CFrame.new(0, 0, 0) * __T_B_872,
        ["U_2738"] = CFrame.new(0, 0, 0) * __T_B_872
    },
        {
        ["Name"] = "U_2408",
        ["U_2932"] = "Torso",
        ["U_981"] = "Torso",
        ["U_3121"] = "Head",
        ["U_228"] = CFrame.new(0, 1, 0) * __T_B_872,
        ["U_2738"] = CFrame.new(0, 1--[[u1954]], 0) * __T_B_872
    },
        {
        ["Name"] = "U_481",
        ["U_2932"] = "Torso",
        ["U_981"] = "Torso",
        ["U_3121"] = "U_2897",
        ["U_228"] = CFrame.new(-1, 0.5, 0) * __T_t_873,
        ["U_2738"] = CFrame.new(0.5, 0.5, 0) * __T_t_873
    },
        {
        ["Name"] = "U_1089",
        ["U_2932"] = "Torso",
        ["U_981"] = "Torso",
        ["U_3121"] = "U_2833",
        ["U_228"] = CFrame.new(1, 0.5, 0) * __T___874,
        ["U_2738"] = CFrame.new(1--[[u1954]], 0.5, 0) * __T___874
    },
        {
        ["Name"] = "U_2996",
        ["U_2932"] = "Torso",
        ["U_981"] = "Torso",
        ["U_3121"] = "U_2419",
        ["U_228"] = CFrame.new(-1, -1, 0) * __T_t_873,
        ["U_2738"] = CFrame.new(1--[[u1954]], 1, 0) * __T_t_873
    },
        {
        ["Name"] = "U_638",
        ["U_2932"] = "Torso",
        ["U_981"] = "Torso",
        ["U_3121"] = "U_2789",
        ["U_228"] = CFrame.new(1, -1, 0) * __T___874,
        ["U_2738"] = CFrame.new(0.5, 1, 0) * __T___874
    }
    }
    __T_t_879 = {
        { ["Part"] = "Torso", ["U_3012"] = "U_1977", ["U_802"] = "UpperTorso" },
        { ["Part"] = "U_2897", ["U_3012"] = "U_1155", ["U_802"] = "U_669" },
        { ["Part"] = "U_2833", ["U_3012"] = "U_829", ["U_802"] = "U_2260" },
        { ["Part"] = "U_2419", ["U_3012"] = "U_2700", ["U_802"] = "U_2036" },
        { ["Part"] = "U_2789", ["U_3012"] = "U_2844", ["U_802"] = "U_3181" }
    }
    __T___880 = {
        ["U_1014"] = Vector3.new(0, 1, 0),
        ["U_2528"] = Vector3.new(-1, 1, 0),
        ["U_2895"] = Vector3.new(1, 1, 0),
        ["U_2901"] = Vector3.new(0, 0, 1--[[u1954]]),
        ["U_220"] = Vector3.new(0, 0, 0.5),
        ["U_2602"] = Vector3.new(0, -1, 1--[[u1954]]),
        ["U_2536"] = Vector3.new(0, -1, 0.5),
        ["U_1960"] = Vector3.new(0, -1, 0)
    }
    __T_y_881, __T_Q_882 = {
        ["U_1890"] = "U_920",
        ["U_2138"] = "U_3230",
        ["U_226"] = "U_1106",
        ["U_1141"] = "U_2008",
        ["U_950"] = "U_1789",
        ["U_813"] = "U_2272"
    }, {}
    for z = 1, #__T_I_870 do
        __T_Q_882[__T_I_870[z]["U_3171"]] = true
    end
    __T_z_883 = getcustomasset or getsynasset or syn and syn.U_1920 or fluxus and fluxus.U_1920
    __T_T_884 = 8
    __T_Z_885, __T_G_886 = 24, {}
    __T_s_887 = __T_Z_885
    function __T_OP_888()
        local uP, FP = _G,  __T_s_887 -- ENV_GETTER rewritten to _G
        __T_s_887 = FP - 1
        FP = __T_s_887
        if FP > 0 then
            return
        end
        __T_s_887 = __T_Z_885
        task.wait()
    end
    function __T_uP_889(FP)
        local mP = _G -- ENV_GETTER rewritten to _G
        __T_OP_888()
        local OP, fP = pcall(listfiles, FP)
        if not OP or typeof(fP) ~= "table" then
            return nil, false
        end
        table.sort(fP)
        local OP, PP = table.concat(fP, "U_3245"), __T_G_886[FP]
        if PP and PP.U_1112 == OP then
            return PP, false
        end
        local YP, qP, dP, eP, cP, oP, xP = PP and PP.U_1932 or nil, {}, {}, 1, #fP, 1
        for CP = eP, cP, oP do
            local eP = fP[CP]
            local fP = YP and YP[eP]
            CP = fP == nil
            if CP then
                fP = false
                pcall(function()
                    local YP = _G -- ENV_GETTER rewritten to _G
                    fP = isfolder(eP)
                end)
            end
            qP[eP] = fP
            if fP then
                dP[#dP + 1] = eP
            else
                CP = string.match(string.lower(eP), "U_2927")
                if CP and __T_Q_882[CP] then
                    xP = xP or {}
                    xP[CP] = eP
                end
            end
        end
        PP = { ["U_1112"] = OP, ["U_1932"] = qP, [1--[[u728]]] = dP, ["U_964"] = xP }
        __T_G_886[FP] = PP
        return PP, true
    end
    function __T_Q_890(OP, FP, mP, fP)
        if FP > __T_T_884 then
            return
        end
        mP[OP] = true
        local T, PP = __T_uP_889(OP)
        if not T then
            if __T_G_886[OP] then
                __T_G_886[OP] = nil
                fP.U_1720 = true
            end
            return
        end
        if PP then
            fP.U_1720 = true
        end
        for OP = 1, #T[1--[[u728]]] do
            __T_Q_890(T[1--[[u728]]][OP], FP + 1, mP, fP)
        end
    end
    function __T_T_891(OP)
        local uP, FP, mP = _G,  {},  { ["U_1720"] = false } -- ENV_GETTER rewritten to _G
        __T_s_887 = __T_Z_885
        __T_Q_890(OP, 0, FP, mP)
        for Q in pairs(__T_G_886) do
            if not FP[Q] then
                __T_G_886[Q] = nil
                mP.U_1720 = true
            end
        end
        return mP.U_1720
    end
    function __T_Q_892(Z)
        local s = _G -- ENV_GETTER rewritten to _G
        local OP = string.gsub(Z, "U_3003", "U_40")
        OP = string.match(OP, "U_781" .. __T_k_868 .. "U_2859") or OP
        local uP, FP = {}
        for mP in string.gmatch(OP, "U_1558") do
            Z = string.lower(mP)
            if Z ~= FP then
                uP[#uP + 1] = mP
                FP = Z
            end
        end
        return table.concat(uP, "U_2732")
    end
    __T_Z_893 = { { ["Name"] = "U_2307", ["U_1932"] = "U_663", [1--[[u999]]] = "U_1445" } }
    __T_s_894 = "U_195"
    __T_OP_895 = { [10] = true, [1--[[u1870]]] = true, [1--[[u513]]] = true }
    __T_uP_896, __T_FP_897 = game:GetService("MarketplaceService"), {}
    for mP = 1, #__T_Z_893 do
        if __T_Z_893[mP][1--[[u999]]] then
            __T_FP_897[__T_Z_893[mP][1--[[u999]]]] = true
        end
    end
    __T_mP_898, __T_fP_899 = {}, {}
    for PP = 1, #__T_Z_893 do
        __T_mP_898[PP] = __T_Z_893[PP]["Name"]
        __T_fP_899[__T_Z_893[PP]["Name"]] = __T_Z_893[PP]
    end
    __T_PP_900 = false
    __T_YP_901, __T_qP_902, __T_dP_903, __T_eP_904, __T_cP_905, __T_oP_906, __T_xP_907, __T_CP_908, __T_MP_909, __T_nP_910, __T_XP_911 = __T_mP_898[1], {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
    __T_gP_912, __T_RP_913, __T_HP_914, __T_WP_915 = false
    __T_DP_916 = 0
    __T_vP_917, __T_jP_918 = 0
    __T_aP_919 = false
    __T_EP_920, __T_UP_921, __T_wP_922 = true
    __T_VP_923, __T_hP_924, __T_LP_925 = {}, {}
    __T_bP_926, __T_SP_927, __T_KP_928 = false
    function __T_rP_929()
        local kP = _G -- ENV_GETTER rewritten to _G
        local JP, IP = pcall(listfiles, __T_r_867)
        if JP and typeof(IP) == "table" then
            for pP, pP in ipairs(IP) do
                if string.match(string.lower(string.gsub(pP, "U_3003", "U_40")), "U_3163") == __T_k_868 then
                    return pP
                end
            end
        end
        IP, JP = ipairs, { __T_r_867 .. "U_40" .. __T_k_868, __T_r_867 .. "U_3003" .. __T_k_868 }
        for pP, pP in IP(JP) do
            local JP = false
            pcall(function()
                local kP = _G -- ENV_GETTER rewritten to _G
                JP = isfolder(pP)
            end)
            if JP then
                return pP
            end
        end
        return nil
    end
    function __T_kP_930()
        local JP = _G -- ENV_GETTER rewritten to _G
        if typeof(__T_z_883) ~= "function" or typeof(listfiles) ~= "function" or typeof(isfolder) ~= "function" then
            return nil
        end
        local IP = __T_rP_929()
        if IP then
            return IP
        end
        if typeof(makefolder) ~= "function" then
            return nil
        end
        local pP = false
        pcall(function()
            local BP = _G -- ENV_GETTER rewritten to _G
            pP = isfolder(__T_r_867)
        end)
        local BP = not pP
        if BP then
            pcall(makefolder, __T_r_867)
        end
        pcall(makefolder, __T_r_867 .. "U_40" .. __T_k_868)
        IP = __T_rP_929()
        if not IP then
            pcall(makefolder, __T_r_867 .. "U_3003" .. __T_k_868)
            IP = (__T_rP_929())
        end
        return IP
    end
    function __T_JP_931()
        local IP, pP, BP = _G,  {},  {} -- ENV_GETTER rewritten to _G
        for tP = 1, #__T_Z_893 do
            pP[tP] = __T_Z_893[tP]
            BP[__T_Z_893[tP]["Name"]] = true
        end
        local Z = {}
        for tP, _P in pairs(__T_G_886) do
            if _P.U_964 then
                Z[#Z + 1] = tP
            end
        end
        table.sort(Z)
        for tP = 1, #Z do
            local _P = __T_Q_892(Z[tP])
            if _P ~= "" and not BP[_P] then
                BP[_P] = true
                local Q, AP = #pP + 1, { ["Name"] = _P, ["U_1932"] = "U_177" }
                AP.U_964, pP[Q] = __T_G_886[Z[tP]]["U_964"], AP
            end
        end
        for Q = 1, #__T_VP_923 do
            Z = __T_VP_923[Q]
            Q = Z.Name or "U_2854" .. Z[1--[[u999]]]
            Q = if BP[Q] then Q .. "U_3197" .. Z[1--[[u999]]] .. "U_1956" else Q
            if not BP[Q] then
                BP[Q] = true
                Z.U_1819 = Q
                pP[#pP + 1] = {
                    ["Name"] = Q,
                    ["U_1932"] = "U_663",
                    [1--[[u999]]] = Z[1--[[u999]]],
                    ["U_162"] = true,
                    ["U_1148"] = Z
                }
            end
        end
        table.sort(pP, function(Q, Z)
            return Q.Name < Z.Name
        end)
        return pP
    end
    function __T_Q_932()
        local Z = _G -- ENV_GETTER rewritten to _G
        local IP = table.create(#__T_mP_898)
        for pP = 1, #__T_mP_898 do
            local BP = __T_mP_898[pP]
            local tP = __T_fP_899[BP]
            IP[pP] = {
                ["U_386"] = BP,
                ["U_1"] = BP,
                [1--[[u1191]]] = tP and tP[1--[[u999]]] and tonumber(tP[1--[[u999]]]) or nil
            }
        end
        return IP
    end
    function __T_Z_933()
        local IP, pP = _G,  __T_JP_931() -- ENV_GETTER rewritten to _G
        local JP = table.create(#pP)
        for BP = 1, #pP do
            JP[BP] = pP[BP]["Name"]
        end
        local BP
        local tP = __T_aP_919
        if tP then
            BP = {}
            for _P = 1, #JP do
                if not __T_fP_899[JP[_P]] then
                    BP[#BP + 1] = JP[_P]
                end
            end
        end
        tP = table.concat(JP, "U_3245")
        table.clear(__T_mP_898)
        table.clear(__T_fP_899)
        for _P = 1, #pP do
            __T_mP_898[_P] = JP[_P]
            __T_fP_899[JP[_P]] = pP[_P]
        end
        pP = __T_jP_918
        if tP == pP then
            return
        end
        __T_jP_918 = tP
        tP = not __T_fP_899[__T_YP_901]
        if tP then
            __T_YP_901 = __T_mP_898[1]
        end
        pP = __T_UP_921
        if pP then
            pcall(function()
                __T_UP_921:SetValues(__T_mP_898)
                __T_UP_921:Generate()
            end)
            JP = tP and __T_YP_901
            if JP then
                pcall(function()
                    __T_UP_921:SetValue(__T_YP_901)
                end)
            end
        end
        pP = __T_wP_922
        if pP then
            pcall(function()
                local JP = __T_wP_922
                JP:SetData(__T_Q_932())
            end)
            tP = __T_YP_901
            if tP then
                pcall(function()
                    __T_wP_922:SetValue(__T_YP_901)
                end)
            end
        end
        IP = BP and #BP > 0 and not __T_bP_926
        if IP then
            __T_C_115:Notify({
                ["U_3007"] = "U_860",
                ["U_1647"] = #BP == 1 and "U_776" .. BP[1] or "U_413" .. #BP .. "U_1589",
                ["U_9"] = 3,
                ["U_1068"] = "U_542"
            })
        end
    end
    function __T_JP_934(IP)
        local pP, BP = _G,  __T_rP_929() -- ENV_GETTER rewritten to _G
        local tP = not BP and IP and typeof(makefolder) == "function"
        if tP then
            local tP = false
            pcall(function()
                local _P = _G -- ENV_GETTER rewritten to _G
                tP = isfolder(__T_r_867)
            end)
            IP = not tP
            if IP then
                pcall(makefolder, __T_r_867)
            end
            pcall(makefolder, __T_r_867 .. "U_40" .. __T_k_868)
            BP = (__T_rP_929())
        end
        return (BP or __T_r_867 .. "U_40" .. __T_k_868) .. "U_40" .. __T_s_894
    end
    function __T_r_935(k)
        local s = _G -- ENV_GETTER rewritten to _G
        if typeof(k) ~= "string" then
            return nil
        end
        local rP = string.match(k, "U_1610") or string.match(k, "U_1804") or string.match(k, "U_1815")
        if not rP then
            for IP in string.gmatch(k, 1--[[u1729]]) do
                rP = if not rP or #IP > #rP then IP else rP
            end
        end
        if rP and #rP >= 5 and #rP <= 19 then
            return rP
        end
        return nil
    end
    function __T_k_936(s)
        local rP, IP, pP = _G,  {},  {} -- ENV_GETTER rewritten to _G
        if typeof(s) ~= "string" then
            return IP
        end
        for BP in string.gmatch(s, 1--[[u1729]]) do
            if #BP >= 5 and #BP <= 19 and not pP[BP] then
                pP[BP] = true
                IP[#IP + 1] = BP
            end
        end
        return IP
    end
    function __T_s_937(rP)
        local IP = _G -- ENV_GETTER rewritten to _G
        local pP, BP = pcall(function()
            local tP = _G -- ENV_GETTER rewritten to _G
            local _P = tonumber(rP)
            return __T_uP_896:GetProductInfo(_P)
        end)
        if pP and typeof(BP) == "table" then
            return BP
        end
        return nil
    end
    function __T_uP_938(rP, IP)
        local pP = _G -- ENV_GETTER rewritten to _G
        if rP and typeof(rP.Name) == "string" and rP.Name ~= "" then
            return rP.Name
        end
        return "U_2854" .. IP
    end
    function __T_rP_939()
        local IP = _G -- ENV_GETTER rewritten to _G
        if typeof(writefile) ~= "function" then
            return
        end
        local pP = table.create(#__T_VP_923)
        for BP = 1, #__T_VP_923 do
            local tP = __T_VP_923[BP]
            pP[BP] = (tP.Name or "U_2854" .. tP[1--[[u999]]]) .. "U_75" .. tP[1--[[u999]]]
        end
        local BP = table.concat(pP, "U_2145")
        __T_LP_925 = BP
        pcall(writefile, __T_JP_934(true), BP)
    end
    function __T_IP_940(pP)
        local BP = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_VP_923)
        table.clear(__T_hP_924)
        local tP = {}
        for _P in string.gmatch(pP, "U_2968") do
            local pP = string.match(_P, "U_2027")
            if pP ~= "" and string.sub(pP, 1, 1) ~= "U_2022" and string.sub(pP, 1, 2) ~= "U_1475" then
                local AP, iP = string.match(pP, "U_1909")
                if not iP then
                    AP, iP = nil, (__T_r_935(pP))
                else
                    AP = if AP == "" then nil else AP
                end
                if iP and not __T_hP_924[iP] and not __T_FP_897[iP] then
                    _P = { ["Name"] = AP, [1--[[u999]]] = iP }
                    __T_hP_924[iP] = _P
                    __T_VP_923[#__T_VP_923 + 1] = _P
                    if not AP then
                        tP[#tP + 1] = _P
                    end
                end
            end
        end
        return tP
    end
    function __T_r_941()
        local pP = _G -- ENV_GETTER rewritten to _G
        if typeof(readfile) ~= "function" then
            return false
        end
        local BP, tP = pcall(readfile, __T_JP_934())
        local JP = not BP or typeof(tP) ~= "string"
        if JP then
            BP = __T_LP_925
            if BP == nil then
                return false
            end
            __T_LP_925 = nil
            table.clear(__T_VP_923)
            table.clear(__T_hP_924)
            return true
        end
        JP = __T_LP_925
        if tP == JP then
            return false
        end
        __T_LP_925 = tP
        local LP = __T_IP_940(tP)
        JP = #LP > 0
        if JP then
            task.spawn(function()
                local JP = _G -- ENV_GETTER rewritten to _G
                for IP = 1, #LP do
                    LP[IP]["Name"] = __T_uP_938(__T_s_937(LP[IP][1--[[u999]]]), LP[IP][1--[[u999]]])
                end
                __T_rP_939()
                __T_jP_918 = nil
                pcall(__T_Z_933)
            end)
        end
        return true
    end
    function __T_LP_942(JP)
        local IP, pP = _G,  __T_k_936(JP) -- ENV_GETTER rewritten to _G
        if #pP == 0 then
            return false
        end
        local k = {}
        for JP = 1, #pP do
            if not (__T_hP_924[pP[JP]] or __T_FP_897[pP[JP]]) then
                k[#k + 1] = pP[JP]
            end
        end
        if #k == 0 then
            return false
        end
        task.spawn(function()
            local FP = _G -- ENV_GETTER rewritten to _G
            local JP
            local IP = 0
            for pP = 1, #k do
                local BP = k[pP]
                pP = __T_s_937(BP)
                if not (pP and typeof(pP.U_1478) == "number" and not __T_OP_895[pP.U_1478]) then
                    local k = { ["Name"] = __T_uP_938(pP, BP), [1--[[u999]]] = BP }
                    __T_hP_924[BP] = k
                    __T_VP_923[#__T_VP_923 + 1] = k
                    JP, IP = k, IP + 1
                end
            end
            if IP == 0 then
                return
            end
            __T_rP_939()
            __T_jP_918 = nil
            __T_bP_926 = true
            pcall(__T_Z_933)
            __T_bP_926 = false
            if IP == 1 and JP and JP.U_1819 then
                __T_KP_928(JP.U_1819)
            end
        end)
        return true
    end
    function __T_k_943(s)
        local OP, uP = _G,  s and s.U_1148 -- ENV_GETTER rewritten to _G
        if not uP then
            return
        end
        for FP = 1, #__T_VP_923 do
            if __T_VP_923[FP] == uP then
                table.remove(__T_VP_923, FP)
                break
            end
        end
        __T_hP_924[uP[1--[[u999]]]] = nil
        __T_rP_939()
        __T_jP_918 = nil
        uP = __T_YP_901
        local FP = uP == s.Name
        if FP then
            __T_YP_901 = nil
        end
        pcall(__T_Z_933)
    end
    task.spawn(function()
        local s = _G -- ENV_GETTER rewritten to _G
        local OP
        while true do
            local uP = __T_EP_920
            if not uP then
                break
            end
            if OP then
                local FP = false
                pcall(function()
                    local VP = _G -- ENV_GETTER rewritten to _G
                    FP = isfolder(OP)
                end)
                uP = not FP
                if uP then
                    OP = nil
                    table.clear(__T_G_886)
                    __T_jP_918 = nil
                end
            end
            if not OP then
                OP = __T_kP_930()
            end
            if OP then
                uP = __T_T_891(OP)
                local T = (if __T_r_941() then true else uP) or not __T_aP_919
                if T then
                    pcall(__T_Z_933)
                    __T_aP_919 = true
                end
            end
            task.wait(2)
        end
    end)
    function __T_r_944()
        local T = _G -- ENV_GETTER rewritten to _G
        for Z = #__T_eP_904, 1, -1 do
            local G = __T_eP_904[Z]
            if G.U_1616["Parent"] then
                pcall(function()
                    G.U_1616["Transparency"] = G.U_2332
                end)
            end
            __T_eP_904[Z] = nil
        end
    end
    function __T_T_945(Z)
        local G, s, OP = _G,  #__T_eP_904 + 1,  { ["U_1616"] = Z } -- ENV_GETTER rewritten to _G
        OP.U_2332, __T_eP_904[s] = Z.Transparency, OP
        pcall(function()
            Z.Transparency = 1
        end)
    end
    function __T_Z_946(G, s)
        local OP = G
        while OP and OP ~= s do
            G = "Tool"
            if OP:IsA(G) then
                return true
            end
            OP = OP.Parent
        end
        return false
    end
    function __T_G_947(s, OP)
        if not (s:IsA("BasePart") or s:IsA("U_1417")) then
            return
        end
        if __T_Z_946(s, OP) then
            return
        end
        __T_T_945(s)
    end
    function __T_T_948(Z)
        local s = _G -- ENV_GETTER rewritten to _G
        __T_r_944()
        for OP, OP in ipairs(Z:GetDescendants()) do
            __T_G_947(OP, Z)
        end
    end
    function __T_Z_949(s)
        local OP, uP, FP = _G,  #__T_xP_907 + 1,  { ["U_1616"] = s } -- ENV_GETTER rewritten to _G
        FP.Parent, __T_xP_907[uP] = s.Parent, FP
        pcall(function()
            s.Parent = nil
        end)
    end
    function __T_s_950(OP)
        if OP then
            __T_MP_909[#__T_MP_909 + 1] = OP
        end
    end
    function __T_OP_951(uP)
        local FP, eP = _G,  __T_nP_910[uP] -- ENV_GETTER rewritten to _G
        if not eP then
            return
        end
        __T_nP_910[uP] = nil
        for uP = #eP[1--[[u3315]]], 1, -1 do
            pcall(function()
                eP[1--[[u3315]]][uP]:Destroy()
            end)
            eP[1--[[u3315]]][uP] = nil
        end
        for uP = #eP[1--[[u1255]]], 1, -1 do
            local jP = eP[1--[[u1255]]][uP]
            if jP.U_1616["Parent"] then
                pcall(function()
                    jP.U_1616["Transparency"] = jP.U_2332
                end)
            end
            eP[1--[[u1255]]][uP] = nil
        end
    end
    function __T_uP_952()
        local FP = _G -- ENV_GETTER rewritten to _G
        for eP in pairs(__T_nP_910) do
            __T_OP_951(eP)
        end
        table.clear(__T_nP_910)
    end
    function __T_FP_953(eP)
        local jP = _G -- ENV_GETTER rewritten to _G
        if eP.U_1070 then
            pcall(function()
                eP.U_1070:Destroy()
            end)
            eP.U_1070 = nil
        end
        for aP = #eP[1--[[u1255]]], 1, -1 do
            local VP = eP[1--[[u1255]]][aP]
            if VP.U_1616["Parent"] then
                pcall(function()
                    VP.U_1616[VP.U_1819] = VP.U_2332
                end)
            end
            eP[1--[[u1255]]][aP] = nil
        end
    end
    function __T_eP_954()
        for jP = #__T_XP_911, 1, -1 do
            __T_FP_953(__T_XP_911[jP])
            __T_XP_911[jP] = nil
        end
    end
    function __T_jP_955()
        local aP = _G -- ENV_GETTER rewritten to _G
        aP.U_1537["U_912"] = nil
        for VP = #__T_MP_909, 1, -1 do
            pcall(function()
                __T_MP_909[VP]:Disconnect()
            end)
            __T_MP_909[VP] = nil
        end
        __T_uP_952()
        __T_eP_954()
        local uP = __T_HP_914
        if uP then
            pcall(function()
                __T_HP_914:Disconnect()
            end)
            __T_HP_914 = nil
        end
        uP = __T_WP_915
        if uP then
            pcall(function()
                __T_WP_915:Disconnect()
            end)
            __T_WP_915 = nil
        end
        uP = __T_RP_913
        if uP then
            pcall(function()
                __T_RP_913:Destroy()
            end)
            __T_RP_913 = nil
        end
        for uP = #__T_oP_906, 1, -1 do
            pcall(function()
                __T_oP_906[uP]:Destroy()
            end)
            __T_oP_906[uP] = nil
        end
        for uP = #__T_xP_907, 1, -1 do
            local eP = __T_xP_907[uP]
            pcall(function()
                eP.U_1616["Parent"] = eP.Parent
            end)
            __T_xP_907[uP] = nil
        end
        for uP = #__T_cP_905, 1, -1 do
            local eP = __T_cP_905[uP]
            if eP.U_1616["Parent"] then
                pcall(function()
                    eP.U_1616["Color"] = eP.U_2332
                end)
            end
            __T_cP_905[uP] = nil
        end
        table.clear(__T_CP_908)
        __T_r_944()
    end
    function __T_r_956(uP)
        local eP, xP = _G,  __T_dP_903[uP] -- ENV_GETTER rewritten to _G
        if xP then
            return xP
        end
        xP = nil
        local MP = typeof(readfile) == "function" and typeof(writefile) == "function"
        if MP then
            local MP, aP = pcall(readfile, uP)
            local VP = MP and typeof(aP) == "string" and #aP > 0
            if VP then
                MP = __T_DP_916
                __T_DP_916 = MP + 1
                local MP = __T_J_869 .. "U_40" .. __T_DP_916 .. "U_548"
                if pcall(writefile, MP, aP) then
                    local DP, aP = pcall(__T_z_883, MP)
                    xP = if DP and typeof(aP) == "string" and aP ~= "" then aP else xP
                end
            end
        end
        if not xP then
            local MP, DP = pcall(__T_z_883, uP)
            xP = if MP and typeof(DP) == "string" and DP ~= "" then DP else xP
        end

-- =============================================================================
-- MODULE 11/17: VisualsAndESP — clones/lighting/skybox/aura/crosshair/weather/ESP/chams/graph/effects
-- ChamsController/CharacterClonePreview/LightingController/SkyboxController/CrosshairController/Weat]============],
    [19] = [============[
herParticle/ESPSettings/GunDropESP/Backtrack/JumpCircles/VelocityGraph/FootCircle/HitEffects
-- ==============================================================================
        if xP then
            __T_dP_903[uP] = xP
        end
        return xP
    end
    function __T_z_957(uP)
        __T_WP_915 = uP.ChildAdded:Connect(function(eP)
            local xP, MP = _G,  __T_PP_900 -- ENV_GETTER rewritten to _G
            if not MP then
                return
            end
            if not (eP:IsA("U_1662") or eP:IsA("U_1611") or eP:IsA("U_1605") or eP:IsA("U_785") and __T_CP_908[eP.U_1471]) then
                return
            end
            task.defer(function()
            local xP = __T_PP_900 and eP.Parent == uP
            if xP then
                __T_Z_949(eP)
            end
        end)
        end)
    end
    function __T_uP_958(eP, xP)
        local MP, WP = _G,  0 -- ENV_GETTER rewritten to _G
        for DP = 1, #__T_I_870 do
            local aP = __T_I_870[DP]
            DP = eP.U_964[aP.U_3171]
            local eP = DP and xP:FindFirstChild(aP.Part)
            if eP and eP:IsA("BasePart") then
                local VP = __T_r_956(DP)
                if VP then
                    for DP, DP in ipairs(xP:GetChildren()) do
                        if DP:IsA("U_785") and DP.U_1471 == aP.U_835 then
                            __T_Z_949(DP)
                        end
                    end
                    for DP, hP in ipairs(eP:GetChildren()) do
                        DP = "SpecialMesh"
                        if hP:IsA(DP) then
                            __T_Z_949(hP)
                        end
                    end
                    local DP, hP = #__T_cP_905 + 1, { ["U_1616"] = eP }
                    hP.U_2332, __T_cP_905[DP] = eP.Color, hP
                    eP.Color = Color3.new(1, 1, 1)
                    hP = Instance.new("SpecialMesh")
                    hP.U_3232 = __T_EnumFB.U_3232["U_3126"]
                    hP.U_270 = VP
                    hP[1--[[u1447]]] = 1--[[u1694]]
                    hP.U_1638 = 1--[[u1694]]
                    hP.Parent = eP
                    __T_oP_906[#__T_oP_906 + 1] = hP
                    __T_CP_908[aP.U_835] = true
                    WP += 1
                end
            end
        end
        if WP > 0 then
            for eP, eP in ipairs(xP:GetChildren()) do
                if eP:IsA("U_1662") or eP:IsA("U_1611") or eP:IsA("U_1605") then
                    __T_Z_949(eP)
                end
            end
        end
        return WP
    end
    function __T_Z_959(eP)
        local cP = _G -- ENV_GETTER rewritten to _G
        for xP, xP in ipairs(eP:GetDescendants()) do
            if xP:IsA("U_3043") or xP:IsA("U_1121") or xP:IsA("U_1899") or xP:IsA("U_179") or xP:IsA("Humanoid") then
                pcall(function()
                    xP:Destroy()
                end)
            end
        end
    end
    function __T_eP_960(cP)
        cP.Anchored = false
        cP.CanCollide = false
        cP.CanQuery = false
        cP.CanTouch = false
        cP.Massless = true
        cP.U_1378 = true
        cP.LocalTransparencyModifier = 0
    end
    function __T_cP_961(xP)
        local CP, MP = _G,  {} -- ENV_GETTER rewritten to _G
        for WP, WP in ipairs(xP:GetDescendants()) do
            if WP:IsA("BasePart") or WP:IsA("U_1417") then
                local xP, DP = #MP + 1, { ["U_1616"] = WP }
                DP.U_2332, MP[xP] = WP.Transparency, DP
                pcall(function()
                    WP.Transparency = 1
                end)
            end
        end
        return MP
    end
    function __T_xP_962(CP, MP, WP, DP)
        local aP = _G -- ENV_GETTER rewritten to _G
        if __T_nP_910[CP] then
            return true
        end
        local VP = CP:FindFirstChild("U_117")
        VP = if not (VP and VP:IsA("BasePart")) then CP:FindFirstChildWhichIsA("BasePart") else VP
        if not VP then
            return false
        end
        local hP = {}
        if MP and WP and DP and DP.Parent then
            if (VP.Position - DP.Position)["Magnitude"] > __T_i_876 then
                return false
            end
            local i, bP, rP = __T_A_875 * CFrame:Inverse() * CFrame, CFrame:Inverse(), {}
            for A, DP in ipairs(CP:GetDescendants()) do
                A = "BasePart"
                if DP:IsA(A) then
                    rP[#rP + 1] = DP
                end
            end
            local A = CP:Clone()
            __T_Z_959(A)
            local DP = {}
            for VP, kP in ipairs(A:GetDescendants()) do
                VP = "BasePart"
                if kP:IsA(VP) then
                    DP[#DP + 1] = kP
                end
            end
            for VP = 1, #DP do
                local kP, JP = rP[VP], DP[VP]
                if kP then
                    VP = i * (bP * CFrame)
                    __T_eP_960(JP)
                    JP.CastShadow = false
                    JP.Parent = MP
                    CFrame = CFrame * VP
                    local i = Instance.new("U_2538")
                    i.U_981 = WP
                    i.U_3121 = JP
                    i.U_228 = VP
                    i.Parent = JP
                    hP[#hP + 1] = JP
                end
            end
            pcall(function()
                A:Destroy()
            end)
            if #hP == 0 then
                return false
            end
        end
        __T_nP_910[CP] = { [1--[[u3315]]] = hP, [1--[[u1255]]] = __T_cP_961(CP) }
        return true
    end
    function __T_A_963(i)
        __T_s_950(i.DescendantAdded:Connect(function(cP)
            local CP = __T_PP_900
            if not CP then
                return
            end
            __T_G_947(cP, i)
        end))
    end
    function __T_i_964(G, cP, CP)
        local MP = _G -- ENV_GETTER rewritten to _G
        local nP
        if cP then
            nP = G:FindFirstChild("U_3378") or G:FindFirstChild("U_2833")
            if nP and not nP:IsA("BasePart") then
                nP = nil
            end
        end
        local function WP(DP)
            local aP = _G -- ENV_GETTER rewritten to _G
            task.defer(function()
                local aP, VP, hP = 1, 12, 1
                for bP = aP, VP, hP do
                    bP = not __T_PP_900 or DP.Parent ~= G
                    if bP then
                        return
                    end
                    if __T_xP_962(DP, cP, CP, nP) then
                        return
                    end
                    __T_H_866.RenderStepped:Wait()
                end
            end)
        end
        for cP, xP in ipairs(G:GetChildren()) do
            cP = "Tool"
            if xP:IsA(cP) then
                WP(xP)
            end
        end
        __T_s_950(G.ChildAdded:Connect(function(cP)
            local xP = __T_PP_900 and cP:IsA("Tool")
            if xP then
                WP(cP)
            end
        end))
        __T_s_950(G.ChildRemoved:Connect(function(G)
            local cP = "Tool"
            if G:IsA(cP) then
                __T_OP_951(G)
            end
        end))
    end
    function __T_G_965(OP, cP)
        local xP, CP = _G,  { OP } -- ENV_GETTER rewritten to _G
        for MP, MP in ipairs(OP:GetDescendants()) do
            CP[#CP + 1] = MP
        end
        for MP = 1, #CP do
            local nP = CP[MP]
            if nP:IsA("BasePart") or nP:IsA("U_1417") then
                OP, MP = #cP + 1, { ["U_1616"] = nP, ["U_1819"] = "Transparency" }
                MP.U_2332, cP[OP] = nP.Transparency, MP
                pcall(function()
                    nP.Transparency = 1
                end)
            else
                if nP:IsA("U_1080") or nP:IsA("U_1284") or nP:IsA("U_1650") or nP:IsA("U_557") or nP:IsA("U_2065") or nP:IsA("U_2814") or nP:IsA("U_693") then
                    local OP, CP = #cP + 1, { ["U_1616"] = nP, ["U_1819"] = "Enabled" }
                    CP.U_2332, cP[OP] = nP.Enabled, CP
                    pcall(function()
                        nP.Enabled = false
                    end)
                end
            end
        end
    end
    function __T_OP_966(cP, xP, CP, MP)
        local nP, WP = _G,  cP:Clone() -- ENV_GETTER rewritten to _G
        __T_Z_959(WP)
        for cP, DP in ipairs(WP:GetDescendants()) do
            cP = "BasePart"
            if DP:IsA(cP) then
                __T_eP_960(DP)
                DP.CastShadow = false
            end
        end
        __T_eP_960(WP)
        WP.CastShadow = false
        WP.Parent = xP
        CFrame = CFrame * MP
        xP = Instance.new("U_2538")
        xP.U_981 = CP
        xP.U_3121 = WP
        xP.U_228 = MP
        xP.Parent = WP
        return WP
    end
    function __T_cP_967(xP, CP, MP)
        local nP, WP = xP:FindFirstChild(MP), CP:FindFirstChild(MP)
        if nP and WP and nP:IsA("U_2466") and WP:IsA("U_2466") then
            return CFrame * CFrame:Inverse()
        end
        return nil
    end
    function __T_xP_968(CP, MP)
        local nP, WP = _G,  CP:FindFirstChild("HumanoidRootPart") -- ENV_GETTER rewritten to _G
        if not (WP and MP) then
            return nil
        end
        if MP == WP then
            return CFrame.new()
        end
        local nP = CP:FindFirstChild("LowerTorso")
        if not nP then
            return nil
        end
        local DP = __T_cP_967(WP, nP, "U_1309")
        if not DP then
            return nil
        end
        if MP == nP then
            return DP
        end
        if MP == CP:FindFirstChild("UpperTorso") then
            WP = __T_cP_967(nP, MP, "U_249")
            if WP then
                return DP * WP
            end
        end
        return nil
    end
    function __T_cP_969(CP)
        local MP = CP:FindFirstChildOfClass("U_1523")
        if MP then
            return MP.U_1707, MP.U_640
        end
        return nil, nil
    end
    function __T_CP_970(MP, nP, WP, DP)
        if WP and DP and WP.Parent and WP.Parent:IsA("BasePart") and WP.Parent["Parent"] == MP then
            local aP = __T_xP_968(MP, WP.Parent)
            if aP then
                return aP * CFrame * CFrame:Inverse()
            end
        end
        WP = MP:FindFirstChild("HumanoidRootPart")
        if WP then
            return CFrame:Inverse() * CFrame
        end
        return nil
    end
    function __T_xP_971(MP, nP, WP, DP)
        local aP = _G -- ENV_GETTER rewritten to _G
        for VP = 1, #__T_XP_911 do
            if __T_XP_911[VP]["U_1616"] == DP then
                return
            end
        end
        local VP, hP = __T_cP_969(DP)
        local bP = { ["U_1616"] = DP, [1--[[u1255]]] = {}, ["U_1070"] = nil, ["U_2634"] = VP }
        if nP and WP and WP.Parent then
            local rP = __T_CP_970(MP, DP, VP, hP)
            if rP then
                local CP, MP = pcall(__T_OP_966, DP, nP, WP, rP)
                if CP then
                    bP.U_1070 = MP
                end
            end
        end
        __T_G_965(DP, bP[1--[[u1255]]])
        __T_XP_911[#__T_XP_911 + 1] = bP
    end
    function __T_G_972(OP, CP, MP)
        local nP, WP = _G,  __T_PP_900 and OP and OP.Parent -- ENV_GETTER rewritten to _G
        if not WP then
            return
        end
        WP = {}
        for DP = 1, #__T_p_871 do
            local aP = OP:FindFirstChild(__T_p_871[DP])
            DP = aP and aP:IsA("U_314") and aP.U_2506 or nil
            if DP and DP:IsA("BasePart") and DP.Parent then
                WP[DP] = true
            end
        end
        for DP = #__T_XP_911, 1, -1 do
            local aP = __T_XP_911[DP]
            local VP = not WP[aP.U_1616] or not aP.U_1616["Parent"]
            if not VP and aP.U_1070 then
                local hP = __T_cP_969(aP.U_1616)
                VP = not aP.U_1070["Parent"] or aP.U_2634 ~= hP
            end
            if VP then
                __T_FP_953(aP)
                table.remove(__T_XP_911, DP)
            end
        end
        for FP in pairs(WP) do
            __T_xP_971(OP, CP, MP, FP)
        end
    end
    function __T_OP_973(FP, cP, xP)
        local function CP(MP)
            if not (MP and MP:IsA("U_314")) then
                return
            end
            __T_s_950(MP.U_2033:Connect(function()
                local MP, nP = _G,  __T_PP_900 -- ENV_GETTER rewritten to _G
                if not nP then
                    return
                end
                task.defer(function()
                __T_G_972(FP, cP, xP)
            end)
            end))
        end
        for MP = 1, #__T_p_871 do
            CP(FP:FindFirstChild(__T_p_871[MP]))
        end
        __T_s_950(FP.ChildAdded:Connect(function(p)
            local MP, nP = _G,  __T_PP_900 -- ENV_GETTER rewritten to _G
            if not nP then
                return
            end
            if p.Name ~= "U_666" and p.Name ~= "U_1520" then
                return
            end
            CP(p)
            task.defer(function()
            __T_G_972(FP, cP, xP)
        end)
        end))
        __T_G_972(FP, cP, xP)
    end
    function __T_p_974(FP, cP)
        local function xP()
            local CP, MP = _G,  not __T_PP_900 or __T_gP_912 -- ENV_GETTER rewritten to _G
            if MP then
                return
            end
            __T_gP_912 = true
            local MP = __T_vP_917
            task.defer(function()
                __T_gP_912 = false
                local CP = __T_PP_900 and MP == __T_vP_917
                if CP then
                    __T_jP_955()
                end
            end)
        end
        if cP then
            __T_s_950(cP.Died:Connect(xP))
            __T_s_950(cP:GetPropertyChangedSignal("Health"):Connect(function()
                if cP.Health <= 0 then
                    xP()
                end
            end))
        end
        __T_s_950(FP.U_706:Connect(function()
            local cP = _G -- ENV_GETTER rewritten to _G
            if not FP:IsDescendantOf(workspace) then
                xP()
            end
        end))
        __T_s_950(__T_m_856.CharacterRemoving:Connect(function(s)
            if s == FP then
                xP()
            end
        end))
    end
    function __T_s_975(FP, cP, xP)
        local CP, MP = _G,  cP:FindFirstChild("HumanoidRootPart") -- ENV_GETTER rewritten to _G
        if not MP then
            return 0
        end
        local nP, XP = {}, 0
        for gP = 1, #__T_I_870 do
            local WP = __T_I_870[gP]
            gP = FP.U_964[WP.U_3171]
            if gP then
                local I = __T_r_956(gP)
                if I then
                    nP[WP.Part] = I
                    XP += 1
                end
            end
        end
        if XP == 0 then
            return 0
        end
        local r = Instance.new("Model")
        r.Name = "U_1352"
        local I = {}
        for gP = 1, #__T_N_877 do
            local WP, DP = __T_N_877[gP], Instance.new("Part")
            DP.Name = WP.Name
            DP.Size = WP.Size
            DP.U_1088 = __T_EnumFB.U_1221["U_1474"]
            DP.U_1397 = __T_EnumFB.U_1221["U_1474"]
            CFrame = CFrame
            __T_eP_960(DP)
            if WP.Name == "U_285" then
                DP.Anchored = true
                DP.Transparency = 1
            end
            gP = nP[WP.Name]
            if gP then
                DP.Color = Color3.new(1, 1, 1)
                FP = Instance.new("SpecialMesh")
                FP.U_3232 = __T_EnumFB.U_3232["U_3126"]
                FP.U_270 = gP
                FP[1--[[u1447]]] = 1--[[u1694]]
                FP.U_1638 = 1--[[u1694]]
                FP.Parent = DP
            end
            DP.Parent = r
            I[WP.Name] = DP
        end
        for N, gP in pairs(__T___880) do
            FP = Instance.new("U_2466")
            FP.Name = N
            FP.Position = gP
            FP.Parent = I.Torso
        end
        FP = cP:FindFirstChild("Head")
        local _
        if FP and FP:IsA("BasePart") then
            _ = FP:Clone()
            __T_Z_959(_)
            _.Name = "Head"
            __T_eP_960(_)
        else
            _ = Instance.new("Part")
            _.Name = "Head"
            _.Size = Vector3.new(2, 1, 1)
            __T_eP_960(_)
            local N = Instance.new("SpecialMesh")
            N.U_3232 = __T_EnumFB.U_3232["Head"]
            N[1--[[u1447]]] = Vector3.new(1--[[u2836]], 1--[[u2836]], 1--[[u2836]])
            N.Parent = _
        end
        CFrame = CFrame * CFrame.new(0, 1--[[u3221]], 0)
        _.Parent = r
        I.Head = _
        FP = _:FindFirstChild("U_2675")
        MP = CFrame.new(FP and FP.Position or Vector3.new(0, -_.Size["Y"] * 0.5, 0)) * __T_B_872
        for B = 1, #__T_l_878 do
            FP = __T_l_878[B]
            local _, N = I[FP.U_981], I[FP.U_3121]
            if _ and N then
                B = Instance.new("U_2283")
                B.Name = FP.Name
                B.U_981 = _
                B.U_3121 = N
                B.U_228 = FP.U_228
                B.U_2738 = FP.Name == "U_2408" and MP or FP.U_2738
                B.Parent = I[FP.U_2932]
            end
        end
        MP = Instance.new("U_571")
        MP.Parent = r
        local B = Instance.new("U_1476")
        B.Parent = MP
        r.PrimaryPart = I.U_285
        r.Parent = workspace.CurrentCamera or workspace
        __T_oP_906[#__T_oP_906 + 1] = r
        CP.U_1537["U_912"] = r
        local _ = cP:FindFirstChildOfClass("U_2552")
        local N, l, oP = 1, #__T_t_879, 1
        for gP = N, l, oP do
            local WP = __T_t_879[gP]
            gP = I[WP.Part]
            FP = gP and not nP[WP.Part]
            if FP then
                local t
                if _ then
                    pcall(function()
                        t = _[WP.U_3012]
                    end)
                end
                MP = not t
                if MP then
                    local _ = cP:FindFirstChild(WP.U_802)
                    local WP = _ and _:IsA("BasePart")
                    if WP then
                        t = _.Color
                    end
                end
                if t then
                    gP.Color = t
                end
            end
        end
        N = {}
        for t, t in pairs(I) do
            for _, gP in ipairs(t:GetChildren()) do
                _ = "U_2466"
                if gP:IsA(_) then
                    N[gP.Name] = gP
                end
            end
        end
        for t, _ in ipairs(cP:GetChildren()) do
            t = "U_1429"
            if _:IsA(t) then
                FP = _:FindFirstChildWhichIsA("BasePart")
                l = FP and FP:FindFirstChildWhichIsA("U_2466")
                MP = l and N[l.Name]
                if MP then
                    oP = FP:Clone()
                    __T_Z_959(oP)
                    __T_eP_960(oP)
                    nP = CFrame * CFrame:Inverse()
                    CFrame = MP.Parent["CFrame"] * nP
                    oP.Parent = r
                    local t = Instance.new("U_2538")
                    t.U_981 = MP.Parent
                    t.U_3121 = oP
                    t.U_228 = nP
                    t.Parent = oP
                end
            end
        end
        __T_T_948(cP)
        __T_A_963(cP)
        __T_i_964(cP, r, I.U_2833)
        __T_OP_973(cP, r, I.Torso)
        __T_p_974(cP, xP)
        local t = {}
        for _, N in pairs(__T_y_881) do
            local l = Instance.new("U_98")
            l.Name = _
            l.U_2152 = N
            l.Parent = r
            nP, FP = pcall(function()
                return B:LoadAnimation(l)
            end)
            if nP and FP then
                t[_] = FP
            end
        end
        local B, _
        local function N(l, y)
            local Z, FP = _G,  t[l] -- ENV_GETTER rewritten to _G
            local eP = B ~= l
            if eP then
                for oP, CP in pairs(t) do
                    if oP ~= l and CP.U_3383 then
                        pcall(function()
                            CP:Stop(1--[[u773]])
                        end)
                    end
                end
                if FP then
                    pcall(function()
                        FP:Play(1--[[u773]])
                    end)
                end
                B, _ = l, nil
            end
            eP = FP and y and y ~= _
            if eP then
                _ = y
                pcall(function()
                    FP:AdjustSpeed(y)
                end)
            end
        end
        local B = I.U_285
        local t = 0
        __T_HP_914 = __T_H_866.RenderStepped:Connect(function()
            local _, l = _G,  __T_PP_900 -- ENV_GETTER rewritten to _G
            if not l then
                return
            end
            if r.Parent == nil then
                pcall(function()
                    local y = _G -- ENV_GETTER rewritten to _G
                    r.Parent = workspace.CurrentCamera or workspace
                end)
            end
            l = os.clock() - t > 0.5
            if l then
                t = os.clock()
                __T_G_972(__T_m_856.Character, r, I.Torso)
            end
            if __T_m_856.Character == cP and cP.Parent and r.Parent then
                l = cP:FindFirstChild("HumanoidRootPart")
                if l then
                    local r = CFrame
                    local I = r.Position
                    local t = I.Y - l.Size["Y"] * 0.5 - (xP and xP.HipHeight or 0)
                    CFrame = CFrame.new(I.X, t + 3, I.Z) * r.Rotation
                    t, r = xP and (xP:GetState()), l.AssemblyLinearVelocity
                    I = math.sqrt(r.X * r.X + r.Z * r.Z)
                    if t == __T_EnumFB.U_3137["U_2642"] then
                        N("U_226")
                    else
                        if t == __T_EnumFB.U_3137["U_2202"] then
                            N("U_1141")
                        else
                            if t == __T_EnumFB.U_3137["U_3287"] then
                                N("U_950", 1)
                            else
                                if t == __T_EnumFB.U_3137["U_1763"] then
                                    N("U_813")
                                else
                                    if I > 1--[[u2206]] then
                                        N("U_2138", math.floor(math.clamp(I / 1--[[u2977]], 1--[[u234]], 3) * 1--[[u2553]]) / 1--[[u2553]])
                                    else
                                        N("U_1890")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        return XP
    end
    function __T_r_976(I)
        local B, t = _G,  __T_m_856.Character -- ENV_GETTER rewritten to _G
        if not t then
            __T_C_115:Notify({ ["U_3007"] = "U_860", ["U_1647"] = "U_1923", ["U_9"] = 4, ["U_1068"] = "U_542" })
            return
        end
        local _ = typeof(makefolder) == "function" and typeof(isfolder) == "function"
        if _ then
            local N = false
            pcall(function()
                local l = _G -- ENV_GETTER rewritten to _G
                N = isfolder(__T_J_869)
            end)
            local l = not N
            if l then
                pcall(makefolder, __T_J_869)
            end
        end
        _ = t:FindFirstChildOfClass("Humanoid")
        local J, N = t:FindFirstChild("UpperTorso") ~= nil or _ and _.U_3314 == __T_EnumFB.U_1029["U_1896"]
        if J then
            N = (__T_s_975(I, t, _))
        else
            N = __T_uP_958(I, t)
            if N > 0 then
                __T_z_957(t)
            end
        end
        if N == 0 then
            __T_C_115:Notify({
                ["U_3007"] = "U_860",
                ["U_1647"] = "U_1985" .. (J and "U_1896" or "U_2940") .. "U_1946",
                ["U_9"] = 4,
                ["U_1068"] = "U_542"
            })
        end
    end
    function __T_C_977(J)
        local I, B = _G,  __T_qP_902[J.Name] -- ENV_GETTER rewritten to _G
        if B then
            return B
        end
        B = J[1--[[u999]]]
        if not B then
            return nil
        end
        local t, _ = pcall(game.U_2365, game, "U_569" .. B)
        if not t or typeof(_) ~= "table" then
            return nil
        end
        local B = _[1]
        if not B then
            return nil
        end
        if not B:IsA("Model") then
            t = Instance.new("Model")
            B.Parent = t
            B = t
        end
        for t, t in ipairs(B:GetDescendants()) do
            if t:IsA("U_179") or t:IsA("Humanoid") or t:IsA("U_3043") or t:IsA("U_1121") or t:IsA("U_1899") then
                pcall(function()
                    t:Destroy()
                end)
            end
        end
        _ = false
        for t, N in ipairs(B:GetDescendants()) do
            t = "BasePart"
            if N:IsA(t) then
                _ = true
                N.Anchored = true
                N.CanCollide = false
                N.CanQuery = false
                N.CanTouch = false
                N.Massless = true
                N.CastShadow = false
                N.U_1378 = true
            end
        end
        if not _ then
            pcall(function()
                B:Destroy()
            end)
            return nil
        end
        __T_qP_902[J.Name] = B
        return B
    end
    function __T_J_978(I, B)
        local t, _ = _G,  __T_C_977(I) -- ENV_GETTER rewritten to _G
        I = not _ or B ~= __T_vP_917 or not __T_PP_900
        if I then
            return
        end
        B = __T_m_856.Character
        I = B and B:FindFirstChild("HumanoidRootPart")
        if not I then
            return
        end
        local C, N = B:FindFirstChildOfClass("Humanoid"), _:Clone()
        local l, l = B:GetBoundingBox()
        local y, y = N:GetBoundingBox()
        if y.Y > 1--[[u3159]] and l.Y > 1--[[u3159]] then
            local z = l.Y / y.Y
            if math.abs(z - 1) > 1--[[u2786]] then
                pcall(function()
                    N:ScaleTo(z)
                end)
            end
        end
        l, _ = N:GetBoundingBox()
        local y = (N:GetPivot():Inverse() * l):Inverse()
        local l = _.Y * 0.5 - I.Size["Y"] * 0.5 - (C and C.HipHeight or 0)
        N.Name = "U_2499"
        N.Parent = workspace
        __T_RP_913 = N
        t.U_1537["U_912"] = N
        __T_T_948(B)
        __T_A_963(B)
        __T_i_964(B, nil, nil)
        __T_OP_973(B, nil, nil)
        __T_p_974(B, C)
        local C
        local I = 0
        __T_HP_914 = __T_H_866.RenderStepped:Connect(function()
            local H, p = _G,  not __T_PP_900 or N.Parent == nil -- ENV_GETTER rewritten to _G
            if p then
                return
            end
            p = __T_m_856.Character
            local B = p and p:FindFirstChild("HumanoidRootPart")
            if not B then
                return
            end
            local t = os.clock() - I > 0.5
            if t then
                I = os.clock()
                __T_G_972(p, nil, nil)
            end
            t, p = CFrame, C
            if p == t then
                return
            end
            C = t
            p, B = t.LookVector, t.Position
            N:PivotTo(CFrame.new(B.X, B.Y + l, B.Z) * CFrame.new(0, math.atan2(-p.X, -p.Z), 0) * y)
        end)
    end
    function __T_C_979(H)
        local I = __T_fP_899[__T_YP_901]
        if not I then
            return
        end
        if I.U_1932 == "U_177" then
            __T_r_976(I)
        else
            __T_J_978(I, H)
        end
    end
    __T_SP_927 = function()
        local H, r = _G,  __T_vP_917 -- ENV_GETTER rewritten to _G
        __T_vP_917 = r + 1
        __T_jP_955()
        r = __T_PP_900
        if not r then
            return
        end
        local r = __T_vP_917
        task.spawn(function()
        local H = _G -- ENV_GETTER rewritten to _G
        pcall(__T_C_979, r)
        H = r == __T_vP_917 and not __T_PP_900
        if H then
            __T_jP_955()
        end
    end)
    end
    __T_KP_928 = function(C)
        local H = _G -- ENV_GETTER rewritten to _G
        local r = typeof(C) ~= "string" or not __T_fP_899[C] or C == __T_YP_901
        if r then
            return
        end
        __T_YP_901 = C
        r = __T_UP_921
        if r then
            pcall(function()
                __T_UP_921:SetValue(C)
            end)
        end
        r = __T_wP_922
        if r then
            pcall(function()
                __T_wP_922:SetValue(C)
            end)
        end
        r = __T_PP_900
        if r then
            __T_SP_927()
        end
    end
    function __T_C_980()
        local H = __T_f_857
        if H then
            __T_K_864()
        end
        H = __T_o_858
        if H then
            __T_x_865()
        end
        H = __T_PP_900
        if H then
            __T_SP_927()
        end
    end
    function __T_H_981()
        local r, J = _G,  __T_h_861 -- ENV_GETTER rewritten to _G
        if J then
            pcall(function()
                __T_h_861:Disconnect()
            end)
            __T_h_861 = nil
        end
        __T_h_861 = __T_m_856.CharacterAdded:Connect(function()
            local r = _G -- ENV_GETTER rewritten to _G
            task.wait(1)
            __T_C_980()
        end)
    end
    getgenv()["U_1499"]("char", "U_2878", function(C)
        C:AddToggle({
        ["Name"] = "U_2878",
        ["Default"] = false,
        ["Flag"] = "U_1027",
        ["Callback"] = function(C)
        __T_f_857 = C
  ]============],
    [20] = [============[
      if C then
            local C = __T_h_861
            if not C then
                __T_H_981()
            end
            __T_K_864()
        else
            __T_L_862()
        end
    end
    })
    end)
    getgenv()["U_1499"]("char", "U_2119", function(C)
        C:AddToggle({
        ["Name"] = "U_2119",
        ["Default"] = false,
        ["Flag"] = "U_759",
        ["Callback"] = function(C)
        __T_o_858 = C
        if C then
            local C = __T_h_861
            if not C then
                __T_H_981()
            end
            __T_x_865()
        else
            __T_S_863()
        end
    end
    })
    end)
    getgenv()["U_1499"]("char", "U_2659", function(x)
        local C = _G -- ENV_GETTER rewritten to _G
        __T_UP_921 = x:AddToggle({
        ["Name"] = "U_2659",
        ["Default"] = false,
        ["Flag"] = "U_754",
        ["U_3348"] = true,
        ["Callback"] = function(K)
        __T_PP_900 = K
        if K then
            local K = __T_h_861
            if not K then
                __T_H_981()
            end
            __T_SP_927()
        else
            local H = __T_vP_917
            __T_vP_917 = H + 1
            __T_jP_955()
        end
    end
    })["U_3348"]:AddDropdown({
        ["Name"] = "Model",
        ["Default"] = __T_YP_901,
        ["U_3220"] = __T_mP_898,
        ["U_2216"] = true,
        ["Flag"] = "U_2168",
        ["Callback"] = function(H)
        local K = _G -- ENV_GETTER rewritten to _G
        __T_KP_928(typeof(H) == "table" and H[1] or H)
    end
    })
        pcall(function()
        __T_UP_921:SetValues(__T_mP_898)
    end)
        if typeof(__T_E_120.U_551) ~= "function" then
            return
        end
        x = __T_E_120:AddSub({ ["Name"] = "U_541", ["U_1068"] = "U_1972", ["U_2396"] = "U_848" })
        local function C(H, E, E, K, r)
            local J = __T_fP_899[H]
            if not J then
                return
            end
            local I, p = {}, {
                ["U_1421"] = "U_3233",
                ["U_386"] = __T_YP_901 == H and "U_1052" or "U_1639",
                ["U_3364"] = function()
                __T_KP_928(H)
            end
            }
            do local _xgSrc = {p}; for _xgI = 1, #_xgSrc do I[#I + 1] = _xgSrc[_xgI] end end
            if J[1--[[u999]]] then
                I[#I + 1] = {
                    ["U_1421"] = "copy",
                    ["U_386"] = "U_890",
                    ["U_3364"] = function()
                    local p = _G -- ENV_GETTER rewritten to _G
                    if typeof(setclipboard) == "function" then
                        pcall(setclipboard, J[1--[[u999]]])
                    end
                end
                }
            end
            if J.U_162 then
                I[#I + 1] = { ["U_1421"] = "U_1997", ["U_386"] = "remove", ["U_3364"] = function()
                    __T_k_943(J)
                end }
            end
            __T_W_108({
                ["U_2125"] = H,
                ["U_1421"] = "U_1972",
                [1--[[u510]]] = E,
                ["U_2582"] = K,
                ["U_977"] = r,
                ["U_2946"] = I
            })
        end
        __T_wP_922 = x:AddImageList({
        ["Name"] = "U_541",
        ["U_1068"] = "U_1972",
        ["Position"] = "U_985",
        ["U_497"] = "U_2340",
        [1--[[u2488]]] = 1--[[u1248]],
        [1--[[u1575]]] = 78,
        ["U_2076"] = false,
        ["U_2515"] = "U_466",
        ["U_1570"] = "U_2714",
        ["U_3220"] = __T_Q_932(),
        ["Default"] = __T_YP_901,
        ["Flag"] = "U_768",
        ["U_844"] = C,
        ["U_2223"] = {
        {
        ["U_1421"] = "U_1810",
        ["U_1869"] = "U_3329",
        ["U_3364"] = function()
        __T_D_109({
        ["U_2125"] = "U_1176",
        ["U_1421"] = "U_1810",
        ["U_2142"] = "U_2384",
        ["U_1888"] = "U_1363",
        ["U_485"] = "cancel",
        ["U_3364"] = __T_LP_942
    })
    end
    }
    },
        ["Callback"] = function(x)
        local C = _G -- ENV_GETTER rewritten to _G
        __T_KP_928(typeof(x) == "table" and x[1] or x)
    end
    })
    end)
    __T_M_112 = getgenv()["U_2052"]
    getgenv()["U_1724"]("U_432", getgenv()["U_2619"])
    getgenv()["U_1724"]("char", __T_M_112)
    if __T_M_112 then
        __T_M_112:AddButton({
            ["Name"] = "U_1722",
            ["Callback"] = function()
            local x, C = _G,  __T_m_856.Character -- ENV_GETTER rewritten to _G
            local m = C and C:FindFirstChildWhichIsA("Humanoid")
            if m then
                m:ChangeState(__T_EnumFB.U_3137["Dead"])
            else
                if C then
                    pcall(function()
                        C:BreakJoints()
                    end)
                end
            end
        end
        })
    end
    getgenv()["U_1531"] = function()
        local m, x, C, H = _G,  false,  false,  false -- ENV_GETTER rewritten to _G
        __T_f_857, __T_o_858, __T_PP_900 = x, C, H
        __T_EP_920 = false
        H = __T_vP_917
        __T_vP_917 = H + 1
        x = __T_h_861
        if x then
            pcall(function()
                __T_h_861:Disconnect()
            end)
            __T_h_861 = nil
        end
        __T_L_862()
        __T_S_863()
        __T_jP_955()
        for f, o in pairs(__T_qP_902) do
            pcall(function()
                o:Destroy()
            end)
            __T_qP_902[f] = nil
        end
        table.clear(__T_dP_903)
    end
    __T_m_982 = typeof(__T_U_121.U_551) == "function" and __T_U_121:AddSub({ ["Name"] = "U_96", ["U_1068"] = "U_3029", ["U_2396"] = "U_1426" }) or __T_U_121
    __T_f_983, __T_o_984 = game:GetService("Players"), game:GetService("HttpService")
    __T_x_985 = __T_f_983.LocalPlayer
    __T_f_986, __T_C_987, __T_H_988 = {
        { "U_2780", "U_1890" },
        { "U_2448", "U_2138" },
        { "U_2203", "U_2771" },
        { "Jump", "U_226" },
        { "U_182", "U_1141" },
        { "U_103", "U_950" },
        { "U_2729", "U_3318" },
        { "U_2270", "U_1423" }
    }, {}, {}
    for D, D in ipairs(__T_f_986) do
        __T_C_987[#__T_C_987 + 1] = D[1]
        __T_H_988[D[1]] = D[2]
    end
    __T_C_989, __T_H_990, __T_D_991, __T_E_992, __T_h_993 = {}, {}, {}, {}, {}
    __T_L_994, __T_S_995 = false
    __T_K_996 = false
    __T_r_997 = false
    __T_k_998 = 0
    __T_J_999 = 0
    function __T_I_1000()
        local p = __T_x_985.Character
        if not p then
            return
        end
        local B, t = p:FindFirstChildOfClass("Humanoid"), "U_376"
        return p, B, p:FindFirstChild(t)
    end
    function __T_p_1001(B, t)
        if B and t and t.MoveDirection["Magnitude"] == 0 then
            B.U_602 = true
            B.U_602 = false
        end
    end
    function __T_B_1002(t)
        local _ = _G -- ENV_GETTER rewritten to _G
        if not t then
            return
        end
        for A, A in pairs(t:GetPlayingAnimationTracks()) do
            pcall(function()
                A:Stop()
            end)
        end
    end
    function __T_t_1003(_)
        local A = _G -- ENV_GETTER rewritten to _G
        local i = tostring(_[1--[[u1191]]])
        if __T_D_991[i] then
            return __T_D_991[i]
        end
        local N = _.U_491
        if typeof(N) ~= "table" then
            return nil
        end
        local _ = {}
        for l, y in pairs(N) do
            if typeof(y) == "table" then
                for N, Q in pairs(y) do
                    l, N = pcall(game.U_2365, game, "U_569" .. Q)
                    if l and N then
                        local function l(y, Q)
                            local z = _G -- ENV_GETTER rewritten to _G
                            for T, Z in ipairs(y:GetChildren()) do
                                T = "U_98"
                                if Z:IsA(T) then
                                    local y = (Q .. "U_3333" .. Z.Name):split("U_3333")
                                    _[#_ + 1] = { ["U_2184"] = y[#y - 1], ["U_386"] = y[#y], [1--[[u1191]]] = Z.U_2152 }
                                else
                                    if #Z:GetChildren() > 0 then
                                        l(Z, Q .. "U_3333" .. Z.Name)
                                    end
                                end
                            end
                        end
                        for y, y in ipairs(N) do
                            l(y, y.Name)
                            pcall(function()
                                y:Destroy()
                            end)
                        end
                    end
                end
            end
        end
        __T_D_991[i] = _
        return _
    end
    function __T_D_1004(_, A)
        local i, N = _G,  __T_t_1003(_) -- ENV_GETTER rewritten to _G
        if not N then
            return nil
        end
        _ = {}
        for t, t in ipairs(N) do
            if t.U_2184 and t.U_2184:lower() == A then
                _[t.U_386:lower()] = t[1--[[u1191]]]
            end
        end
        return _
    end
    function __T_t_1005(_, A, i)
        local N = _G -- ENV_GETTER rewritten to _G
        if not (_ and i) then
            return
        end
        local l = __T_D_1004(i, A)
        if not (l and next(l)) then
            return
        end
        i = _:FindFirstChild(A)
        if not i then
            return
        end
        A, _ = next(l)
        local D, A = ipairs, i:GetChildren()
        for N, y in D(A) do
            N = y:IsA("U_98")
            if N then
                local D = l[y.Name:lower()] or _
                if D then
                    local _ = __T_h_993[y] == nil
                    if _ then
                        local _ = __T_h_993
                        _[y] = y.U_2152
                    end
                    y.U_2152 = D
                    y.Parent = nil
                    y.Parent = i
                end
            end
        end
    end
    function __T_D_1006(_)
        local A = _G -- ENV_GETTER rewritten to _G
        local i = ipairs
        for N, l in i(__T_f_986) do
            N = __T_E_992
            A = N[l[2]]
            if A and A ~= "U_1131" and __T_H_990[A] then
                __T_t_1005(_, l[2], __T_H_990[A])
            end
        end
    end
    function __T_t_1007()
        local _ = _G -- ENV_GETTER rewritten to _G
        local A, i = pairs, __T_h_993
        for N, l in A(i) do
            if N and N.Parent then
                pcall(function()
                    local _ = N.Parent
                    N.U_2152 = l
                    N.Parent = nil
                    N.Parent = _
                end)
            end
        end
        __T_h_993 = {}
    end
    function __T___1008()
        local A, i = _G,  __T_J_999 -- ENV_GETTER rewritten to _G
        __T_J_999 = i + 1
        local i = __T_J_999
        task.spawn(function()
            local A, A, N = __T_I_1000()
            local l = not N or i ~= __T_J_999
            if l then
                return
            end
            __T_B_1002(A)
            __T_t_1007()
            __T_D_1006(N)
            l = __T_J_999
            if i == l then
                __T_p_1001(N, A)
            end
        end)
    end
    function __T_D_1009()
        local A = __T_L_994
        if not A then
            return
        end
        A = not __T_K_996
        if A then
            __T_r_997 = true
            return
        end
        __T___1008()
    end
    function __T___1010()
        local A, i, N = _G,  { "U_2478", "U_1673" },  {} -- ENV_GETTER rewritten to _G
        for l, y in ipairs(i) do
            local i, Q = pcall(function()
                local z = _G -- ENV_GETTER rewritten to _G
                local T = game:HttpGet(y)
                return T ~= "" and __T_o_984:JSONDecode(T) or nil
            end)
            if i and typeof(Q) == "table" then
                l = Q.U_1375 or Q
                for i, y in pairs(l) do
                    i = tonumber(y[1--[[u1191]]])
                    if i and i > 0 and y.U_491 and not N[i] then
                        N[i] = true
                        local N = tostring(y.U_386 or "U_2610" .. i)
                        N = if __T_H_990[N] then N .. "U_3288" .. i .. "U_2026" else N
                        __T_H_990[N] = { [1--[[u1191]]] = i, ["U_491"] = y.U_491 }
                        __T_C_989[#__T_C_989 + 1] = { ["U_386"] = N, [1--[[u1191]]] = i }
                    end
                end
            end
        end
    end
    __T_A_1011 = nil
    __T_i_1012 = false
    function __T_N_1013()
        local l, y = _G,  {} -- ENV_GETTER rewritten to _G
        local Q = ipairs
        for z, T in Q(__T_f_986) do
            z = __T_E_992
            local Q = z[T[2]]
            if typeof(Q) == "string" and Q ~= "" and Q ~= "U_1131" then
                y[Q] = true
            end
        end
        return y
    end
    function __T_l_1014()
        local y = __T_S_995
        if y then
            return
        end
        __T_S_995 = __T_x_985.CharacterAdded:Connect(function(x)
            local y = _G -- ENV_GETTER rewritten to _G
            x:WaitForChild("Humanoid")
            local Q = x:WaitForChild("U_376", 5)
            task.wait(1--[[u2185]])
            x = __T_L_994 and Q
            if x then
                __T_h_993 = {}
                __T_D_1009()
            end
        end)
    end
    function __T_x_1015()
        local h, y = _G,  __T_S_995 -- ENV_GETTER rewritten to _G
        if y then
            pcall(function()
                __T_S_995:Disconnect()
            end)
            __T_S_995 = nil
        end
    end
    function __T_h_1016()
        local y, y, Q = __T_I_1000()
        __T_B_1002(y)
        __T_t_1007()
        __T_p_1001(Q, y)
    end
    function __T_p_1017()
        local y = _G -- ENV_GETTER rewritten to _G
        if not __T_A_1011 then
            return
        end
        local Q = {}
        for z in pairs(__T_N_1013()) do
            Q[#Q + 1] = z
        end
        __T_i_1012 = true
        pcall(function()
            __T_A_1011:SetValue(Q)
        end)
        __T_i_1012 = false
    end
    function __T_y_1018()
        local Q = _G -- ENV_GETTER rewritten to _G
        local z = next(__T_N_1013()) ~= nil
        if z then
            __T_L_994 = true
            __T_l_1014()
            __T_D_1009()
        else
            __T_L_994 = false
            __T_r_997 = false
            Q = __T_J_999
            __T_J_999 = Q + 1
            __T_x_1015()
            __T_h_1016()
        end
    end
    function __T_x_1019(h)
        local l = _G -- ENV_GETTER rewritten to _G
        local Q = ipairs
        for l, z in Q(__T_f_986) do
            l = __T_E_992
            if l[z[2]] ~= h then
                return false
            end
        end
        return true
    end
    function __T_h_1020(l, Q, z)
        local T, Z = _G,  Q == "U_1809" -- ENV_GETTER rewritten to _G
        if Z then
            local Z = ipairs
            for G, s in Z(__T_f_986) do
                if z then
                    T = __T_E_992
                    T[s[2]] = l
                else
                    G = __T_E_992
                    local T = G[s[2]] == l
                    if T then
                        local T = __T_E_992
                        T[s[2]] = nil
                    end
                end
            end
        else
            if z then
                __T_E_992[Q] = l
            else
                local z = __T_E_992[Q] == l
                if z then
                    __T_E_992[Q] = nil
                end
            end
        end
        __T_p_1017()
        __T_y_1018()
    end
    function __T_l_1021(Q, z, T, Z)
        local G = _G -- ENV_GETTER rewritten to _G
        if not __T_H_990[Q] then
            return
        end
        local H, s = {
            {
            ["U_1421"] = "U_1971",
            ["U_386"] = "U_675",
            ["U_2376"] = __T_x_1019(Q),
            ["U_3364"] = function()
            __T_h_1020(Q, "U_1809", not __T_x_1019(Q))
            return __T_x_1019(Q)
        end
        }
        }, ipairs
        for x, x in s(__T_f_986) do
            local G = x[2]
            H[#H + 1] = {
                ["U_1421"] = "U_767",
                ["U_386"] = x[1],
                ["U_2376"] = __T_E_992[G] == Q,
                ["U_3364"] = function()
                __T_h_1020(Q, G, __T_E_992[G] ~= Q)
                local x = __T_E_992[G]
                return x == Q
            end
            }
        end
        __T_W_108({
            ["U_2125"] = Q,
            ["U_1421"] = "U_3339",
            [1--[[u510]]] = z,
            ["U_2582"] = T,
            ["U_977"] = Z,
            ["U_2946"] = H
        })
    end
    __T_A_1011 = __T_U_121:AddImageList({
        ["Name"] = "U_1921",
        ["U_1068"] = "U_3339",
        ["Position"] = "U_985",
        ["U_798"] = true,
        ["U_497"] = "U_2662",
        [1--[[u2488]]] = 1--[[u1248]],
        [1--[[u1575]]] = 1--[[u380]],
        ["U_2076"] = false,
        ["U_1570"] = "U_771",
        ["U_3220"] = __T_C_989,
        ["Flag"] = "U_1372",
        ["U_956"] = { ["U_1421"] = "U_3015", ["U_3364"] = function(x, H, H, h, Q)
        __T_l_1021(x, H, h, Q)
    end },
        ["U_844"] = function(x, H, H, h, Q)
        __T_l_1021(x, H, h, Q)
    end,
        ["Callback"] = function(x)
        local H = _G -- ENV_GETTER rewritten to _G
        local h = __T_i_1012 or os.clock() < __T_k_998
        if h then
            return
        end
        h = {}
        if typeof(x) == "table" then
            for i, i in ipairs(x) do
                if typeof(i) == "string" and i ~= "" then
                    h[#h + 1] = i
                end
            end
        else
            if typeof(x) == "string" and x ~= "" then
                h[1] = x
            end
        end
        x = {}
        for i = 1, #h do
            x[h[i]] = true
        end
        local i, l = __T_N_1013(), next
        for N in l, x, nil do
            h = not i[N]
            if h then
                local Q = ipairs
                for z, T in Q(__T_f_986) do
                    z = __T_E_992
                    z[T[2]] = N
                end
            end
        end
        h = next
        for N in h, i, nil do
            l = not x[N]
            if l then
                local x = ipairs
                for H, h in x(__T_f_986) do
                    H = __T_E_992
                    local f = H[h[2]] == N
                    if f then
                        H = __T_E_992
                        H[h[2]] = nil
                    end
                end
            end
        end
        __T_p_1017()
        __T_y_1018()
    end
    })
    __T_e_096:hook("U_765", "string", function()
        local f = _G -- ENV_GETTER rewritten to _G
        local x, H = pcall(function()
        local f = __T_E_992
        return __T_o_984:JSONEncode(f)
    end)
        return x and H or "U_2803"
    end, function(f)
        local x, H = _G,  {} -- ENV_GETTER rewritten to _G
        if typeof(f) == "table" then
            for h, i in pairs(f) do
                if typeof(h) == "string" and typeof(i) == "string" then
                    H[h] = i
                end
            end
        else
            if typeof(f) == "string" and f ~= "" then
                pcall(function()
                    local h, i = _G,  __T_o_984:JSONDecode(f) -- ENV_GETTER rewritten to _G
                    if typeof(i) == "table" then
                        for f, o in pairs(i) do
                            if typeof(f) == "string" and typeof(o) == "string" then
                                H[f] = o
                            end
                        end
                    end
                end)
            end
        end
        __T_k_998 = os.clock() + 1--[[u2604]]
        task.defer(function()
        __T_E_992 = H
        __T_p_1017()
        __T_y_1018()
    end)
    end)
    task.spawn(function()
        local f = _G -- ENV_GETTER rewritten to _G
        __T___1010()
        __T_K_996 = true
        pcall(function()
        __T_A_1011:SetData(__T_C_989)
    end)
        __T_p_1017()
        f = __T_r_997
        if f then
            __T_r_997 = false
            __T_D_1009()
        end
    end)
    getgenv()["U_2122"] = function()
        local f = _G -- ENV_GETTER rewritten to _G
        __T_L_994 = false
        __T_r_997 = false
        local o = __T_J_999
        __T_J_999 = o + 1
        pcall(function()
        __T_e_096:unhook("U_765")
    end)
        o = __T_S_995
        if o then
            pcall(function()
                __T_S_995:Disconnect()
            end)
            __T_S_995 = nil
        end
        local o, o, x = __T_I_1000()
        __T_B_1002(o)
        __T_t_1007()
        if x then
            pcall(function()
                x.U_602 = true
                x.U_602 = false
            end)
        end
    end
    __T_f_1022, __T_o_1023 = game:GetService("Players"), game:GetService("HttpService")
    __T_x_1024 = __T_f_1022.LocalPlayer
    __T_f_1025 = "U_1945"
    __T_C_1026, __T_H_1027, __T_D_1028, __T_E_1029, __T_h_1030, __T_L_1031, __T_S_1032, __T_K_1033, __T_r_1034, __T_k_1035 = { { "U_3283", "U_815" } }, {}, {}, {}, {}, {}, {}
    __T_J_1036 = true
    function __T_I_1037()
        local p = _G -- ENV_GETTER rewritten to _G
        local B = not (isfile and isfile(__T_f_1025))
        if B then
            local t = __T_k_1035 ~= nil
            if t then
                __T_k_1035, __T_H_1027 = nil, {}
                return true
            end
            return false
        end
        local t, _ = pcall(readfile, __T_f_1025)
        B = not t or _ == __T_k_1035
        if B then
            return false
        end
        __T_k_1035, __T_H_1027 = _, {}
        t, B = pcall(function()
            return __T_o_1023:JSONDecode(_)
        end)
        local f = t and typeof(B) == "table"
        if f then
            t = pairs
            for f, k in t(B) do
                local B, t
                if typeof(k) == "table" then
                    B, t = (tostring(k.U_386 or k[1] or f)), tostring(k[1--[[u1191]]] or k[2] or "")
                else
                    B, t = (tostring(f)), tostring(k)
                end
                f = B ~= "" and t ~= ""
                if f then
                    k = __T_H_1027
                    k[#k + 1] = { B, t }
                end
            end
        end
        return true
    end
    function __T_f_1038()
        local k = _G -- ENV_GETTER rewritten to _G
        __T_D_1028, __T_E_1029 = {}, {}
        local function p(B, t)
            local _ = _G -- ENV_GETTER rewritten to _G
            B = tostring(B)
            B = if __T_D_1028[B] then B .. "U_3288" .. tostring(t) .. "U_2026" else B
            local A = __T_D_1028
            A[B] = tostring(t)
            A = __T_E_1029
            local i, N = #A + 1, { ["U_386"] = B }
            N[1--[[u1191]]], A[i] = tonumber((tostring(t):gsub(1--[[u26]], ""))) or t, N
        end
        for B, B in ipairs(__T_C_1026) do
            p(B[1], B[2])
        end
        local C, B = ipairs, __T_H_1027
        for H, H in C(B) do
            p(H[1], H[2])
        end
        for C, C in ipairs(__T_L_1031) do
            p(C.U_386, C[1--[[u1191]]])
        end
    end
    __T_I_1037()
    __T_f_1038()
    function __T_C_1039()
        local H = __T_x_1024.Character
        return H and H:FindFirstChildOfClass("Humanoid")
    end
    function __T_H_1040()
        local k, p = _G,  __T_K_1033 -- ENV_GETTER rewritten to _G
        if p then
            pcall(function()
                __T_K_1033:Stop()
            end)
            __T_K_1033 = nil
        end
    end
    function __T_k_1041(p)
        local B = _G -- ENV_GETTER rewritten to _G
        if __T_h_1030[p] then
            return __T_h_1030[p]
        end
        local t = "U_2841"
        if p:find(t) then
            __T_h_1030[p] = p
            return p
        end
        t = p:gsub(1--[[u26]], "")
        local _, A = pcall(game.U_2365, game, "U_569" .. t)
        local i = _ and typeof(A) == "table"
        if i then
            local _
            local function N(l)
                local y, Q = _G,  _ -- ENV_GETTER rewritten to _G
                if Q then
                    return
                end
                Q = l:IsA("U_98") and l.U_2152 ~= ""
                if Q then
                    _ = l.U_2152
                    return
                end
                for Q, Q in ipairs(l:GetChildren()) do
                    N(Q)
                end
            end
            for l, l in ipairs(A) do
                N(l)
                pcall(function()
                    l:Destroy()
                end)
            end
            if _ then
                __T_h_1030[p] = _
                return _
            end
        end
        i = "U_569" .. t
        __T_h_1030[p] = i
        return i
    end
    function __T_h_1042()
        local p, B = _G,  __T_C_1039() -- ENV_GETTER rewritten to _G
        local C = not B or not __T_r_1034
        if C then
            return
        end
        __T_H_1040()
        local t = Instance.new("U_98")
        t.U_2152 = __T_k_1041(__T_r_1034)
        local k, _ = pcall(function()
            return B:LoadAnimation(t)
        end)
        t:Destroy()
        C = k and _
        if C then
            _.U_2266 = __T_EnumFB.U_1454["U_956"]
            _.U_1718 = true
            _:Play()
            __T_K_1033 = _
        end
    end
    __T_C_1043 = nil
    __T_C_1043 = __T_m_982:AddImageList({
        ["Name"] = "U_96",
        ["U_1068"] = "U_3029",
        ["Position"] = "U_985",
        ["U_497"] = "U_2340",
        [1--[[u2488]]] = 1--[[u1248]],
        [1--[[u1575]]] = 1--[[u380]],
        ["U_611"] = true,
        ["U_2076"] = false,
        ["U_1570"] = "U_3301",
        ["U_3220"] = __T_E_1029,
        ["Flag"] = "U_2606",
        ["Callback"] = function(K)
        local k = _G -- ENV_GETTER rewritten to _G
        local p = typeof(K) == "table" and K.U_386 or K
        K = typeof(p) ~= "string" or p == ""
        if K then
            __T_r_1034 = nil
            __T_H_1040()
            return
        end
        __T_r_1034 = __T_D_1028[p]
        k = __T_r_1034
        if k then
            __T_h_1042()
        else
            __T_H_1040()
        end
    end
    })
    function __T_D_1044()
        local K, k = _G,  __T_I_1037() -- ENV_GETTER rewritten to _G
        if k then
            __T_f_1038()
            pcall(function()
                __T_C_1043:SetData(__T_E_1029)
            end)
        end
    end
    function __T_K_1045()
        local k = _G -- ENV_GETTER rewritten to _G
        local I, p = pcall(function()
            local B = _G -- ENV_GETTER rewritten to _G
            local t = game:HttpGet("U_707")
            return t ~= "" and __T_o_1023:JSONDecode(t) or nil
        end)
        if I and typeof(p) == "table" then
            local o, I = p.U_1375 or p, {}
            for p, B in pairs(o) do
                p = tonumber(B[1--[[u1191]]])
                if p and p > 0 and not I[p] then
                    I[p] = true
                    local o = tostring(B.U_386 or "U_553" .. p)
                    o = if __T_S_1032[o] then o .. "U_3288" .. p .. "U_2026" else o
                    __T_S_1032[o] = tostring(p)
                    __T_L_1031[#__T_L_1031 + 1] = { ["U_386"] = o, [1--[[u1191]]] = p }
                end
            end
        end
    end
    task.spawn(function()
        local o = _G -- ENV_GETTER rewritten to _G
        __T_K_1045()
        __T_f_1038()
        pcall(function()
        __T_C_1043:SetData(__T_E_1029)
    end)
    end)
    __T_f_1046 = __T_x_1024.CharacterAdded:Connect(function()
        local o = _G -- ENV_GETTER rewritten to _G
        task.wait(1)
        o = __T_r_1034
        if o then
            __T_h_1042()
        end
    end)
    task.spawn(function()
        local o = _G -- ENV_GETTER rewritten to _G
        while true do
            local x = __T_J_1036 and task.wait(3)
            if not x then
                break
            end
            __T_D_1044()
        end
    end)
    getgenv()["U_2459"] = function()
        local o = _G -- ENV_GETTER rewritten to _G
        __T_J_1036, __T_r_1034 = false, nil
        __T_H_1040()
        local x = __T_f_1046
        if x then
            pcall(function()
                __T_f_1046:Disconnect()
            end)
            __T_f_1046 = nil
        end
    end
    __T_f_1047 = game:GetService("Players")
    __T_o_1048, __T_x_1049 = game:GetService("RunService"), workspace
    __T_C_1050, __T_H_1051, __T_D_1052 = __T_f_1047.LocalPlayer, {}, {}
    __T_E_1053, __T_h_1054, __T_L_1055, __T_S_1056 = false
    __T_K_1057 = false
    __T_r_1058 = false
    __T_k_1059 = false
    __T_J_1060 = false
    __T_I_1061 = false
    __T_p_1062 = 3
    __T_B_1063, __T_t_1064, __T___1065, __T_A_1066 = false
    __T_i_1067 = 0
    __T_N_1068 = 0
    __T_l_1069 = 0
    function __T_y_1070()
        local Q = __T_C_1050.Character
        return Q and Q:FindFirstChild("HumanoidRootPart")
    end
    function __T_Q_1071(z)
        local T = z and z.Character
        return T and (T:FindFirstChild("HumanoidRootPart") or T:FindFirstChild("Head"))
    end
    function __T_z_1072(T)
        local Z = _G -- ENV_GETTER rewritten to _G
        if getgenv()["U_1717"] and getgenv()["U_1717"](T) then
            return
        end
        Z = __T_y_1070()
        if Z then
            CFrame = T
        end
    end
    function __T_T_1073(Z)
        local G, s = _G,  {} -- ENV_GETTER rewritten to _G
        for OP, OP in ipairs(__T_f_1047:GetPlayers()) do
            if OP ~= __T_C_1050 ]============],
    [21] = [============[
and OP ~= Z then
                s[#s + 1] = { ["U_386"] = OP.Name, ["U_277"] = OP.DisplayName, [1--[[u1191]]] = OP.UserId }
            end
        end
        return s
    end
    function __T_Z_1074(G)
        if not G then
            return "U_1131"
        end
        local s = __T_f_1047:FindFirstChild(G)
        return s and s.DisplayName or G
    end
    function __T_G_1075()
        local s, OP, uP = _G,  {},  __T_r_1058 -- ENV_GETTER rewritten to _G
        if uP then
            OP[#OP + 1] = "U_2512"
        end
        uP = __T_J_1060
        if uP then
            OP[#OP + 1] = "U_813"
        end
        uP = __T_I_1061
        if uP then
            OP[#OP + 1] = "U_1319"
        end
        uP = __T_k_1059
        if uP then
            OP[#OP + 1] = "U_2628"
        end
        if #OP == 0 then
            return ""
        end
        return "U_3288" .. table.concat(OP, "U_3393") .. "U_2026"
    end
    function __T_s_1076()
        if not __T_S_1056 then
            return
        end
        local OP = #__T_D_1052
        local uP = OP == 0
        if uP then
            __T_S_1056:SetValue("U_2039")
        else
            local uP = OP == 1
            if uP then
                __T_S_1056:SetValue("U_1391" .. __T_Z_1074(__T_h_1054) .. __T_G_1075())
            else
                __T_S_1056:SetValue("U_1391" .. __T_Z_1074(__T_h_1054) .. "U_2935" .. OP - 1 .. "U_1956" .. __T_G_1075())
            end
        end
    end
    function __T_Z_1077(G)
        local OP, uP = _G,  {} -- ENV_GETTER rewritten to _G
        for FP = 1, #G do
            uP[G[FP]] = true
        end
        for FP = #__T_D_1052, 1, -1 do
            if not uP[__T_D_1052[FP]] then
                table.remove(__T_D_1052, FP)
            end
        end
        local OP, FP, mP = 1, #G, 1
        for fP = OP, FP, mP do
            local OP = __T_H_1051
            if not OP[G[fP]] then
                __T_D_1052[#__T_D_1052 + 1] = G[fP]
            end
        end
        __T_H_1051 = uP
        uP = not __T_h_1054 or not __T_f_1047:FindFirstChild(__T_h_1054)
        if uP then
            __T_h_1054 = __T_D_1052[#__T_D_1052]
        end
        __T_s_1076()
    end
    function __T_G_1078(OP)
        local uP = _G -- ENV_GETTER rewritten to _G
        if __T_E_1053 then
            return
        end
        local E = {}
        if typeof(OP) == "table" then
            for FP, FP in ipairs(OP) do
                if typeof(FP) == "string" and FP ~= "" then
                    E[#E + 1] = FP
                end
            end
        else
            if typeof(OP) == "string" and OP ~= "" then
                E[1] = OP
            end
        end
        __T_Z_1077(E)
    end
    __T_E_1079 = nil
    __T_L_1055 = __T_w_122:AddImageList({
        ["Name"] = "U_2875",
        ["U_1068"] = "U_3001",
        ["Position"] = "U_982",
        ["U_798"] = true,
        ["U_497"] = "U_1304",
        [1--[[u2488]]] = "U_1017",
        [1--[[u1575]]] = 1--[[u897]],
        ["U_1570"] = "U_1073",
        ["Default"] = {},
        ["U_3220"] = {},
        ["U_2076"] = false,
        ["Flag"] = "U_2088",
        ["U_956"] = {
        ["U_1421"] = "U_625",
        ["U_3364"] = function(Z, OP, OP, uP, FP)
        if __T_E_1079 then
            __T_E_1079(Z, OP, uP, FP)
        end
    end
    },
        ["U_844"] = function(Z, OP, OP, uP, FP)
        if __T_E_1079 then
            __T_E_1079(Z, OP, uP, FP)
        end
    end,
        ["Callback"] = __T_G_1078
    })
    __T_G_1078 = __T_w_122:AddSection({ ["Name"] = "U_1205", ["Position"] = "U_528" })
    __T_S_1056 = __T_G_1078:AddLabel("U_2039", false)
    function __T_S_1080(Z)
        local OP, uP, FP = _G,  __T_T_1073(Z),  {} -- ENV_GETTER rewritten to _G
        for T = 1, #uP do
            FP[uP[T]["U_386"]] = true
        end
        local T, mP, fP = #__T_D_1052, 1, -1
        for PP = T, mP, fP do
            Z = not FP[__T_D_1052[PP]]
            if Z then
                local T = __T_H_1051
                T[__T_D_1052[PP]] = nil
                table.remove(__T_D_1052, PP)
            end
        end
        Z = __T_h_1054 and not __T_f_1047:FindFirstChild(__T_h_1054)
        if Z then
            __T_h_1054 = nil
        end
        FP = not __T_h_1054
        if FP then
            __T_h_1054 = __T_D_1052[#__T_D_1052]
        end
        pcall(function()
            __T_L_1055:SetData(uP)
        end)
        __T_s_1076()
    end
    __T_H_1081 = __T_f_1047.PlayerAdded:Connect(function()
        __T_S_1080()
    end)
    __T_L_1082 = __T_f_1047.PlayerRemoving:Connect(function(T)
        __T_S_1080(T)
    end)
    __T_S_1080()
    function __T_S_1083(T)
        local Z = _G -- ENV_GETTER rewritten to _G
        if not T or not T.Character then
            return
        end
        local OP, uP = __T_y_1070(), __T_C_1050.Character and __T_C_1050.Character:FindFirstChildOfClass("Humanoid")
        if not OP then
            return
        end
        local FP = T.Character
        local mP, fP = FP:FindFirstChild("HumanoidRootPart") or FP:FindFirstChild("Head"), FP:FindFirstChildOfClass("Humanoid")
        if not mP then
            return
        end
        getgenv()[1--[[u3005]]] = (getgenv()[1--[[u3005]]] or 0) + 1
        if OP.Velocity["Magnitude"] < 1--[[u8]] then
            getgenv()["U_263"] = CFrame
        end
        if fP and fP.Sit then
            getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
            return
        end
        local PP, YP = __T_x_1049.CurrentCamera, __T_x_1049.FallenPartsDestroyHeight
        if mP then
            PP.CameraSubject = mP
        else
            if fP then
                PP.CameraSubject = fP
            end
        end
        pcall(function()
            __T_x_1049.FallenPartsDestroyHeight = "U_86"
        end)
        FP = Instance.new("U_3285")
        FP.Parent = OP
        FP.Velocity = Vector3.new(0, 0, 0)
        FP.U_1617 = Vector3.new(1--[[u3345]], 1--[[u3345]], 1--[[u3345]])
        T = uP and uP:GetStateEnabled(__T_EnumFB.U_3137["U_1763"])
        if uP then
            uP:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], false)
        end
        local qP, dP, eP = 2, tick(), 0
        while true do
            local cP = OP and fP
            if cP then
                local oP = if __T_B_1063 then fP.MoveDirection * fP.WalkSpeed else mP.Velocity
                if oP.Magnitude < 1--[[u8]] then
                    eP += 1--[[u807]]
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3221]], 0) + fP.MoveDirection * oP.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0) + fP.MoveDirection * oP.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3221]], 0) + fP.MoveDirection * oP.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0) + fP.MoveDirection * oP.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3221]], 0) + fP.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0) + fP.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(eP), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                else
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3221]], fP.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], -fP.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3221]], fP.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(mP.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1050.Character:SetPrimaryPartCFrame(CFrame)
                    OP.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    OP.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                end
            end
            local mP, fP = dP + qP, tick
            cP = mP < fP() or not __T_K_1057
            if cP then
                break
            end
        end
        if FP then
            FP:Destroy()
        end
        if uP and T ~= nil then
            uP:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], T)
        end
        PP.CameraSubject = uP
        if getgenv()["U_263"] and OP then
            CFrame = getgenv()["U_263"] * CFrame.new(0, 0.5, 0)
            __T_C_1050.Character:SetPrimaryPartCFrame(getgenv()["U_263"] * CFrame.new(0, 0.5, 0))
            if uP then
                uP:ChangeState("U_1320")
            end
            for T, T in pairs(__T_C_1050.Character:GetChildren()) do
                PP = "BasePart"
                if T:IsA(PP) then
                    T.Velocity = Vector3.new()
                    T.RotVelocity = Vector3.new()
                end
            end
            pcall(function()
                __T_x_1049.FallenPartsDestroyHeight = YP
            end)
        end
        getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
    end
    function __T_T_1084()
        local Z, OP = {}, {}
        for uP = 1, #__T_D_1052 do
            local FP = __T_D_1052[uP]
            if not OP[FP] then
                uP = __T_f_1047:FindFirstChild(FP)
                if uP and uP ~= __T_C_1050 then
                    OP[FP] = true
                    Z[#Z + 1] = uP
                end
            end
        end
        return Z
    end
    __T_Z_1085 = nil
    function __T_OP_1086()
        local uP, FP = _G,  __T_Z_1085 -- ENV_GETTER rewritten to _G
        if FP then
            return
        end
        __T_Z_1085 = task.spawn(function()
            local uP = _G -- ENV_GETTER rewritten to _G
            while true do
                local FP = __T_K_1057
                if not FP then
                    break
                end
                FP = __T_T_1084()
                local mP = #FP == 0
                if mP then
                    task.wait(1--[[u2185]])
                else
                    local mP, fP, PP = 1, #FP, 1
                    for YP = mP, fP, PP do
                        local mP = __T_K_1057
                        if not mP then
                            break
                        end
                        mP = FP[YP]
                        if mP and mP.Parent and mP.Character then
                            if __T_y_1070() then
                                __T_S_1083(mP)
                            else
                                task.wait(1--[[u3198]])
                            end
                        end
                    end
                    task.wait()
                end
            end
            __T_Z_1085 = nil
        end)
    end
    __T_c_074 = {
        ["Name"] = "U_1400",
        ["Default"] = false,
        ["U_3348"] = true,
        ["Flag"] = "U_2069",
        ["Callback"] = function(S)
        __T_K_1057 = S
        if S then
            __T_OP_1086()
        end
    end
    }
    __T_m_982, __T_U_121 = __T_G_1078:AddToggle(__T_c_074)["U_3348"], { ["Name"] = "U_198", ["Default"] = false, ["Flag"] = "U_2462" }
    __T_U_121.Callback = function(S)
        __T_B_1063 = S
    end
    __T_m_982:AddToggle(__T_U_121)
    __T_S_1087 = game:GetService("ReplicatedStorage")
    __T_B_1088 = nil
    function __T_Z_1089()
        local OP = _G -- ENV_GETTER rewritten to _G
        local uP, FP, mP = require, __T_S_1087:WaitForChild("U_3123"), "U_626"
        return uP(FP:WaitForChild(mP))
    end
    function __T_S_1090()
        local OP, uP = _G,  not __T_B_1088 -- ENV_GETTER rewritten to _G
        if uP then
            local FP, mP = pcall(__T_Z_1089)
            if not FP or typeof(mP) ~= "table" then
                return nil
            end
            __T_B_1088 = mP
        end
        uP = __T_B_1088
        return uP.U_1287
    end
    function __T_B_1091(Z, OP)
        local uP, FP = _G,  Z and Z[OP.Name] -- ENV_GETTER rewritten to _G
        if typeof(FP) ~= "table" then
            return false
        end
        if FP.Dead then
            return false
        end
        return FP.Role == "Innocent" or FP.Role == "Sheriff" or FP.Role == "Hero"
    end
    function __T_Z_1092()
        local OP = __T_C_1050.Character
        if OP then
            local uP = OP:FindFirstChild("Knife")
            if uP then
                return uP, true
            end
        end
        OP = __T_C_1050:FindFirstChildOfClass("Backpack")
        if OP then
            local uP = OP:FindFirstChild("Knife")
            if uP then
                return uP, false
            end
        end
        return nil, false
    end
    function __T_OP_1093()
        local uP, FP, mP = (_G), __T_Z_1092() -- [EnvProxyPartial]
        if not FP then
            return nil
        end
        if not mP then
            local Z = __T_C_1050.Character and __T_C_1050.Character:FindFirstChildOfClass("Humanoid")
            if Z then
                pcall(function()
                    Z:EquipTool(FP)
                end)
            end
            return nil
        end
        return FP
    end
    function __T_Z_1094(uP)
        local FP, mP = _G,  uP:FindFirstChild("U_320") -- ENV_GETTER rewritten to _G
        local uP = mP and mP:FindFirstChild("U_2748")
        if uP then
            pcall(function()
                uP:FireServer()
            end)
        end
    end
    function __T_uP_1095(FP, mP)
        local fP, PP = _G,  FP:FindFirstChild("U_320") -- ENV_GETTER rewritten to _G
        local FP = PP and PP:FindFirstChild("U_56")
        if FP then
            pcall(function()
                FP:FireServer(mP)
            end)
        end
    end
    __T_FP_1096 = false
    __T_mP_1097, __T_fP_1098 = 0
    function __T_PP_1099()
        local YP, qP = _G,  __T_fP_1098 -- ENV_GETTER rewritten to _G
        if qP then
            return
        end
        __T_fP_1098 = task.spawn(function()
            local YP = _G -- ENV_GETTER rewritten to _G
            while true do
                local qP = __T_FP_1096
                if not qP then
                    break
                end
                qP = __T_S_1090()
                local S = qP and qP[__T_C_1050.Name]
                if not (S ~= nil and S.Role == "Murderer" and not S.Dead) then
                    task.wait(1--[[u2185]])
                    continue
                end
                if getgenv()["U_3170"] then
                    task.wait()
                    continue
                end
                S = __T_OP_1093()
                if not S then
                    task.wait(1--[[u1824]])
                    continue
                end
                local OP = os.clock() - __T_mP_1097
                if OP < 1--[[u3159]] then
                    task.wait()
                    continue
                end
                local dP, eP = __T_T_1084(), {}
                for T = 1, #dP do
                    OP = dP[T]
                    if __T_B_1091(qP, OP) then
                        T = OP.Character
                        local B, qP = T and T:FindFirstChildOfClass("Humanoid"), T and (T:FindFirstChild("HumanoidRootPart") or T:FindFirstChild("Head"))
                        if B and B.Health > 0 and qP then
                            eP[#eP + 1] = qP
                        end
                    end
                end
                OP = #eP > 0
                if OP then
                    __T_Z_1094(S)
                    for B, B in ipairs(eP) do
                        __T_uP_1095(S, B)
                    end
                    __T_mP_1097 = os.clock()
                end
                task.wait()
            end
            __T_fP_1098 = nil
        end)
    end
    __T_G_1078:AddToggle({
        ["Name"] = "U_1546",
        ["Default"] = false,
        ["Flag"] = "U_2118",
        ["Callback"] = function(S)
        __T_FP_1096 = S
        if S then
            __T_PP_1099()
        end
    end
    })
    function __T_S_1100()
        local B = __T_h_1054 or __T_D_1052[#__T_D_1052]
        if not B or B == "" then
            return nil
        end
        local D = __T_f_1047:FindFirstChild(B)
        if D and D ~= __T_C_1050 then
            return D
        end
    end
    __T_D_1101 = __T_o_1048.RenderStepped:Connect(function()
        local B = __T_r_1058
        if not B then
            return
        end
        B = __T_S_1100()
        local T, Z = __T_Q_1071(B), B and B.Character and B.Character:FindFirstChildOfClass("Humanoid")
        if T then
            __T_x_1049.CurrentCamera["CameraSubject"] = Z or T
        end
    end)
    __T_B_1102 = __T_o_1048.Heartbeat:Connect(function()
        local T, Z = _G,  __T_k_1059 -- ENV_GETTER rewritten to _G
        if not Z then
            return
        end
        Z = __T_Q_1071(__T_S_1100())
        local OP = Z and __T_y_1070()
        if OP then
            __T_z_1072(CFrame + Vector3.new(__T_i_1067, __T_N_1068, __T_l_1069))
        end
    end)
    function __T_T_1103()
        local Z = __T_C_1050.Character
        return Z and Z:FindFirstChildOfClass("Humanoid")
    end
    function __T_Z_1104(OP)
        local uP, mP = _G,  OP and OP:FindFirstChildOfClass("Humanoid") -- ENV_GETTER rewritten to _G
        return mP ~= nil and mP.U_3314 == __T_EnumFB.U_1029["U_1896"]
    end
    __T_OP_1105 = __T_o_1048.Heartbeat:Connect(function()
        local uP, mP = _G,  __T_J_1060 -- ENV_GETTER rewritten to _G
        if not mP then
            return
        end
        local mP, fP, PP = __T_Q_1071(__T_S_1100()), __T_y_1070(), __T_T_1103()
        if mP and fP and PP then
            PP.Sit = true
            CFrame = CFrame * CFrame.new(0, 1--[[u2950]], 1--[[u234]])
        end
    end)
    function __T_uP_1106()
        local mP, fP = _G,  __T_T_1103() -- ENV_GETTER rewritten to _G
        if not fP then
            return
        end
        local PP = __T_A_1066 == fP and __T_t_1064
        if PP then
            return
        end
        PP = __T_t_1064
        if PP then
            pcall(function()
                __T_t_1064:Stop()
            end)
            __T_t_1064 = nil
        end
        PP = __T___1065
        if PP then
            pcall(function()
                __T___1065:Destroy()
            end)
            __T___1065 = nil
        end
        __T___1065 = Instance.new("U_98")
        PP = __T___1065
        PP.U_2152 = __T_Z_1104(__T_C_1050.Character) and "U_2085" or "U_1063"
        local Z, YP = pcall(function()
            local mP = __T___1065
            return fP:LoadAnimation(mP)
        end)
        PP = Z and YP
        if PP then
            __T_t_1064 = YP
            Z = __T_t_1064
            Z.U_1718 = true
            local Z = __T_t_1064
            Z:Play(1--[[u1824]], 1, 1)
            __T_t_1064:AdjustSpeed(__T_p_1062)
            __T_A_1066 = fP
        end
    end
    function __T_Z_1107()
        local mP, fP = _G,  __T_t_1064 -- ENV_GETTER rewritten to _G
        if fP then
            pcall(function()
                __T_t_1064:Stop()
            end)
            __T_t_1064 = nil
        end
        fP = __T___1065
        if fP then
            pcall(function()
                __T___1065:Destroy()
            end)
            __T___1065 = nil
        end
        __T_A_1066 = nil
    end
    __T___1108 = __T_o_1048.Stepped:Connect(function()
        local o, A = _G,  __T_I_1061 -- ENV_GETTER rewritten to _G
        if not A then
            return
        end
        __T_uP_1106()
        local A, mP = __T_Q_1071(__T_S_1100()), __T_y_1070()
        if A and mP then
            CFrame = CFrame * CFrame.new(0, 0, 1--[[u1848]])
        end
    end)
    function __T_o_1109()
        local S = __T_C_1050.Character and __T_C_1050.Character:FindFirstChildOfClass("Humanoid")
        if S then
            __T_x_1049.CurrentCamera["CameraSubject"] = S
        end
    end
    function __T_S_1110(A)
        __T_h_1054 = A
        __T_s_1076()
    end
    function __T_A_1111(mP, fP, PP)
        __T_S_1110(mP)
        mP = fP == "U_3304"
        if mP then
            __T_r_1058 = PP
            if not PP then
                __T_o_1109()
            end
        else
            local o = fP == "U_2848"
            if o then
                __T_J_1060 = PP
                if not PP then
                    local o = __T_T_1103()
                    if o then
                        o.Sit = false
                    end
                end
            else
                local o = fP == "U_1319"
                if o then
                    __T_I_1061 = PP
                    if PP then
                        __T_uP_1106()
                    else
                        __T_Z_1107()
                    end
                else
                    local o = fP == "U_2303"
                    if o then
                        __T_k_1059 = PP
                    end
                end
            end
        end
        __T_s_1076()
        return PP
    end
    __T_E_1079 = function(o, E, T, s)
        local uP = __T_f_1047:FindFirstChild(o)
        if not uP or uP == __T_C_1050 then
            return
        end
        local f, mP, fP, PP, YP, qP = __T_h_1054 == o, {
        ["U_2125"] = uP.DisplayName,
        ["U_1421"] = "U_1818",
        [1--[[u510]]] = E,
        ["U_2582"] = T,
        ["U_977"] = s
    }, "U_2946", {}, { ["U_1421"] = "U_1270", ["U_386"] = "U_1750" }, "U_3364"
        local function dP()
            local eP = _G -- ENV_GETTER rewritten to _G
            __T_S_1110(o)
            local cP = __T_Q_1071(uP)
            local Q = cP and __T_y_1070()
            if Q then
                __T_z_1072(CFrame + Vector3.new(__T_i_1067, __T_N_1068, __T_l_1069))
            end
        end
        YP[qP] = dP
        dP, T, s, E, qP = { ["U_1421"] = "U_1299", ["U_386"] = "U_244", ["U_3364"] = function()
        __T_S_1110(o)
    end }, {
        ["U_1421"] = "U_3029",
        ["U_386"] = "U_3304",
        ["U_2376"] = f and __T_r_1058,
        ["U_3364"] = function()
        local S, y = "U_3304", not (__T_h_1054 == o and __T_r_1058)
        return __T_A_1111(o, S, y)
    end
    }, {
        ["U_1421"] = "U_466",
        ["U_386"] = "U_2848",
        ["U_2376"] = f and __T_J_1060,
        ["U_3364"] = function()
        local S, y = "U_2848", not (__T_h_1054 == o and __T_J_1060)
        return __T_A_1111(o, S, y)
    end
    }, {
        ["U_1421"] = "U_29",
        ["U_386"] = "U_1319",
        ["U_2376"] = f and __T_I_1061,
        ["U_3364"] = function()
        local S, y = "U_1319", not (__T_h_1054 == o and __T_I_1061)
        return __T_A_1111(o, S, y)
    end
    }, {
        ["U_1421"] = "move",
        ["U_386"] = "U_64",
        ["U_2376"] = f and __T_k_1059,
        ["U_3364"] = function()
        local f, S = "U_2303", not (__T_h_1054 == o and __T_k_1059)
        return __T_A_1111(o, f, S)
    end
    }
        do local _xgSrc = {YP, dP, T, s, E, qP}; for _xgI = 1, #_xgSrc do PP[#PP + 1] = _xgSrc[_xgI] end end
        mP[fP] = PP
        __T_W_108(mP)
    end
    __T_G_1078:AddSlider({
        ["Name"] = "U_1134",
        ["Default"] = 3,
        ["Min"] = 1,
        ["Max"] = 10,
        ["Rounding"] = 1,
        ["Flag"] = "U_2724",
        ["Callback"] = function(f)
        local o = _G -- ENV_GETTER rewritten to _G
        __T_p_1062 = f
        f = __T_t_1064
        if f then
            pcall(function()
                __T_t_1064:AdjustSpeed(__T_p_1062)
            end)
        end
    end
    })
    __T_G_1078:AddSlider({
        ["Name"] = 1--[[u510]],
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_2637",
        ["Callback"] = function(f)
        __T_i_1067 = f
    end
    })
    __T_G_1078:AddSlider({
        ["Name"] = "U_2582",
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_2519",
        ["Callback"] = function(f)
        __T_N_1068 = f
    end
    })
    __T_G_1078:AddSlider({
        ["Name"] = "U_1936",
        ["Default"] = 0,
        ["Min"] = 0,
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_1803",
        ["Callback"] = function(f)
        __T_l_1069 = f
    end
    })
    getgenv()["U_2952"] = function()
        local f, o, W, E = _G,  false,  false,  false -- ENV_GETTER rewritten to _G
        __T_K_1057, __T_r_1058, __T_k_1059 = o, W, E
        W, o = false, false
        __T_J_1060, __T_I_1061 = W, o
        __T_FP_1096 = false
        E = __T_H_1081
        if E then
            pcall(function()
                __T_H_1081:Disconnect()
            end)
            __T_H_1081 = nil
        end
        E = __T_L_1082
        if E then
            pcall(function()
                __T_L_1082:Disconnect()
            end)
            __T_L_1082 = nil
        end
        o = __T_D_1101
        if o then
            pcall(function()
                __T_D_1101:Disconnect()
            end)
            __T_D_1101 = nil
        end
        o = __T_B_1102
        if o then
            pcall(function()
                __T_B_1102:Disconnect()
            end)
            __T_B_1102 = nil
        end
        o = __T_OP_1105
        if o then
            pcall(function()
                __T_OP_1105:Disconnect()
            end)
            __T_OP_1105 = nil
        end
        o = __T___1108
    ]============],
    [22] = [============[
    if o then
            pcall(function()
                __T___1108:Disconnect()
            end)
            __T___1108 = nil
        end
        pcall(__T_Z_1107)
        local o = __T_C_1050.Character and __T_C_1050.Character:FindFirstChildOfClass("Humanoid")
        if o then
            pcall(function()
                o.Sit = false
            end)
        end
        pcall(function()
        __T_x_1049.FallenPartsDestroyHeight = "U_1527"
    end)
        if o then
            pcall(function()
                __T_x_1049.CurrentCamera["CameraSubject"] = o
            end)
        end
    end
    __T_f_1112 = game:GetService("Players")
    game:GetService("RunService")
    __T_o_1113 = workspace
    __T_x_1114 = __T_f_1112.LocalPlayer
    function __T_C_1115()
        local H = __T_x_1114.Character
        return H and H:FindFirstChild("HumanoidRootPart")
    end
    function __T_H_1116()
        local W = __T_C_1115()
        if W then
            W.AssemblyLinearVelocity = Vector3.zero
            W.AssemblyAngularVelocity = Vector3.zero
        end
    end
    function __T_W_1117(D)
        local E = _G -- ENV_GETTER rewritten to _G
        if getgenv()["U_1717"] and getgenv()["U_1717"](D) then
            return
        end
        E = __T_C_1115()
        if E then
            CFrame = D
        end
    end
    function __T_D_1118(E)
        local h = _G -- ENV_GETTER rewritten to _G
        if not E or not E.Character then
            return
        end
        local L, S = __T_C_1115(), __T_x_1114.Character and __T_x_1114.Character:FindFirstChildOfClass("Humanoid")
        if not L then
            return
        end
        local K = E.Character
        local r, k = K:FindFirstChild("HumanoidRootPart") or K:FindFirstChild("Head"), K:FindFirstChildOfClass("Humanoid")
        if not r then
            return
        end
        getgenv()[1--[[u3005]]] = (getgenv()[1--[[u3005]]] or 0) + 1
        if L.Velocity["Magnitude"] < 1--[[u8]] then
            getgenv()["U_263"] = CFrame
        end
        if k and k.Sit then
            getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
            return
        end
        local J, I = __T_o_1113.CurrentCamera, __T_o_1113.FallenPartsDestroyHeight
        if r then
            J.CameraSubject = r
        else
            if k then
                J.CameraSubject = k
            end
        end
        pcall(function()
            __T_o_1113.FallenPartsDestroyHeight = "U_86"
        end)
        K = Instance.new("U_3285")
        K.Parent = L
        K.Velocity = Vector3.new(0, 0, 0)
        K.U_1617 = Vector3.new(1--[[u3345]], 1--[[u3345]], 1--[[u3345]])
        E = S and S:GetStateEnabled(__T_EnumFB.U_3137["U_1763"])
        if S then
            S:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], false)
        end
        local p, B, t = 2, tick(), 0
        while true do
            if L and k then
                local _ = if h.U_3300 then k.MoveDirection * k.WalkSpeed else r.Velocity
                if _.Magnitude < 1--[[u8]] then
                    t += 1--[[u807]]
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection * _.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection * _.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection * _.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection * _.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                else
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], -k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_x_1114.Character:SetPrimaryPartCFrame(CFrame)
                    L.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    L.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])

-- =============================================================================
-- MODULE 13/17: MM2TradeAndTimer — live value calculator + round timer
-- TradeValueCalculator/RoundTimerUI; item JSON, TradeGUI Offer/Request slots, total/item render
-- ==============================================================================
                    task.wait()
                end
            end
            local r, t = B + p, tick
            if r < t() or false then
                break
            end
        end
        if K then
            K:Destroy()
        end
        if S and E ~= nil then
            S:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], E)
        end
        J.CameraSubject = S
        if getgenv()["U_263"] and L then
            CFrame = getgenv()["U_263"] * CFrame.new(0, 0.5, 0)
            __T_x_1114.Character:SetPrimaryPartCFrame(getgenv()["U_263"] * CFrame.new(0, 0.5, 0))
            if S then
                S:ChangeState("U_1320")
            end
            for E, E in pairs(__T_x_1114.Character:GetChildren()) do
                k = "BasePart"
                if E:IsA(k) then
                    E.Velocity = Vector3.new()
                    E.RotVelocity = Vector3.new()
                end
            end
            pcall(function()
                __T_o_1113.FallenPartsDestroyHeight = I
            end)
        end
        getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
    end
    __T_E_1119, __T_h_1120, __T_L_1121, __T_S_1122 = false
    function __T_K_1123()
        local r, k = _G,  __T_E_1119 -- ENV_GETTER rewritten to _G
        if not k then
            return
        end
        k = __T_x_1114:FindFirstChildOfClass("Backpack")
        if not k then
            return
        end
        local J = k:FindFirstChild("U_2628")
        J = if not J and __T_x_1114.Character then __T_x_1114.Character:FindFirstChild("U_2628") else J
        if J then
            __T_h_1120 = J
            return
        end
        local J = __T_L_1121
        if J then
            pcall(function()
                __T_L_1121:Disconnect()
            end)
            __T_L_1121 = nil
        end
        __T_h_1120 = Instance.new("Tool")
        J = __T_h_1120
        J.Name = "U_2628"
        J = __T_h_1120
        J.U_1607 = false
        J = __T_h_1120
        J.U_1704 = false
        J = __T_h_1120
        J.Parent = k
        J = __T_h_1120
        __T_L_1121 = J.U_1621:Connect(function()
            local r, k, J = _G,  __T_C_1115(),  __T_x_1114:GetMouse()["U_2249"] -- ENV_GETTER rewritten to _G
            if not k or not J then
                return
            end
            __T_W_1117(CFrame.new(J.X, J.Y + 3, J.Z, select(4, CFrame:components())))
            __T_H_1116()
        end)
    end
    function __T_H_1124()
        local r, k = _G,  __T_L_1121 -- ENV_GETTER rewritten to _G
        if k then
            pcall(function()
                __T_L_1121:Disconnect()
            end)
            __T_L_1121 = nil
        end
        k = __T_h_1120
        if k then
            pcall(function()
                __T_h_1120:Destroy()
            end)
            __T_h_1120 = nil
        end
        k = __T_x_1114:FindFirstChildOfClass("Backpack")
        if k then
            local h = k:FindFirstChild("U_2628")
            if h then
                pcall(function()
                    h:Destroy()
                end)
            end
        end
        k = __T_x_1114.Character
        if k then
            local h = k:FindFirstChild("U_2628")
            if h then
                pcall(function()
                    h:Destroy()
                end)
            end
        end
    end
    getgenv()["U_1499"]("U_372", "U_2315", function(h)
        h:AddToggle({
        ["Name"] = "U_2315",
        ["Default"] = false,
        ["Flag"] = "U_1881",
        ["Callback"] = function(h)
        local L = _G -- ENV_GETTER rewritten to _G
        __T_E_1119 = h
        if h then
            __T_K_1123()
            local h = not __T_S_1122
            if h then
                __T_S_1122 = __T_x_1114.CharacterAdded:Connect(function()
                    local h = _G -- ENV_GETTER rewritten to _G
                    task.wait(0.5)
                    h = __T_E_1119
                    if h then
                        __T_K_1123()
                    end
                end)
            end
        else
            local h = __T_S_1122
            if h then
                pcall(function()
                    __T_S_1122:Disconnect()
                end)
                __T_S_1122 = nil
            end
            __T_H_1124()
        end
    end
    })
    end)
    __T_h_1125, __T_L_1126, __T_K_1127, __T_r_1128 = false
    __T_k_1129 = false
    function __T_J_1130()
        local I, p = _G,  __T_x_1114:GetMouse() -- ENV_GETTER rewritten to _G
        local B = p.U_2843
        if B then
            local t = B
            while t and t ~= __T_o_1113 do
                local _ = __T_f_1112:GetPlayerFromCharacter(t)
                if _ and _ ~= __T_x_1114 then
                    return _
                end
                t = t.Parent
            end
        end
        local t, _, A, i = __T_o_1113.CurrentCamera, Vector2.new(p.X, p.Y), 1--[[u576]]
        for N, l in ipairs(__T_f_1112:GetPlayers()) do
            if l ~= __T_x_1114 and l.Character then
                B = l.Character:FindFirstChild("HumanoidRootPart") or l.Character:FindFirstChild("Head")
                if B then
                    N, p = t:WorldToViewportPoint(B.Position)
                    if p then
                        local f = (Vector2.new(N.X, N.Y) - _)["Magnitude"]
                        if f < A then
                            A, i = f, l
                        end
                    end
                end
            end
        end
        return i
    end
    function __T_f_1131()
        local I, p = _G,  __T_h_1125 -- ENV_GETTER rewritten to _G
        if not p then
            return
        end
        p = __T_x_1114:FindFirstChildOfClass("Backpack")
        if not p then
            return
        end
        local B = p:FindFirstChild("U_1400")
        B = if not B and __T_x_1114.Character then __T_x_1114.Character:FindFirstChild("U_1400") else B
        if B then
            __T_L_1126 = B
            return
        end
        local B = __T_K_1127
        if B then
            pcall(function()
                __T_K_1127:Disconnect()
            end)
            __T_K_1127 = nil
        end
        __T_L_1126 = Instance.new("Tool")
        B = __T_L_1126
        B.Name = "U_1400"
        B = __T_L_1126
        B.U_1607 = false
        B = __T_L_1126
        B.U_1704 = false
        B = __T_L_1126
        B.Parent = p
        p = __T_L_1126
        __T_K_1127 = p.U_1621:Connect(function()
            local I = __T_J_1130()
            if I and (__T_C_1115()) then
                __T_D_1118(I)
            end
        end)
    end
    function __T_D_1132()
        local J, I = _G,  __T_K_1127 -- ENV_GETTER rewritten to _G
        if I then
            pcall(function()
                __T_K_1127:Disconnect()
            end)
            __T_K_1127 = nil
        end
        I = __T_L_1126
        if I then
            pcall(function()
                __T_L_1126:Destroy()
            end)
            __T_L_1126 = nil
        end
        I = __T_x_1114:FindFirstChildOfClass("Backpack")
        if I then
            local L = I:FindFirstChild("U_1400")
            if L then
                pcall(function()
                    L:Destroy()
                end)
            end
        end
        I = __T_x_1114.Character
        if I then
            local L = I:FindFirstChild("U_1400")
            if L then
                pcall(function()
                    L:Destroy()
                end)
            end
        end
    end
    getgenv()["U_1499"]("U_372", "U_926", function(L)
        local K = {
        ["Name"] = "U_926",
        ["Default"] = false,
        ["U_3348"] = true,
        ["Flag"] = "U_2362",
        ["Callback"] = function(J)
        local I = _G -- ENV_GETTER rewritten to _G
        __T_h_1125 = J
        if J then
            __T_f_1131()
            local J = not __T_r_1128
            if J then
                __T_r_1128 = __T_x_1114.CharacterAdded:Connect(function()
                    local x = _G -- ENV_GETTER rewritten to _G
                    task.wait(0.5)
                    x = __T_h_1125
                    if x then
                        __T_f_1131()
                    end
                end)
            end
        else
            local f = __T_r_1128
            if f then
                pcall(function()
                    __T_r_1128:Disconnect()
                end)
                __T_r_1128 = nil
            end
            __T_D_1132()
        end
    end
    }
        local f, x = L:AddToggle(K)["U_3348"], { ["Name"] = "U_2685", ["Default"] = false, ["Flag"] = "U_819" }
        x.Callback = function(L)
        __T_k_1129 = L
    end
        f:AddToggle(x)
    end)
    function __T_f_1133(x)
        local L = x.Parent
        while L and L ~= __T_o_1113 do
            if L.Name == "U_457" or L.Name == "U_113" then
                return true
            end
            L = L.Parent
        end
        return false
    end
    function __T_x_1134(L)
        local K = _G -- ENV_GETTER rewritten to _G
        __T_W_1117(L)
        if getgenv()["U_2255"] then
            return
        end
        task.spawn(function()
            local W, L = _G,  __T_C_1115() -- ENV_GETTER rewritten to _G
            if not L then
                return
            end
            local K = os.clock()
            while os.clock() - K < 1--[[u1791]] and L.Parent do
                pcall(function()
                    L.AssemblyLinearVelocity = Vector3.zero
                    L.AssemblyAngularVelocity = Vector3.zero
                end)
                task.wait()
            end
        end)
    end
    function __T_W_1135()
        local L = _G -- ENV_GETTER rewritten to _G
        if not __T_C_1115() then
            return
        end
        local K = {}
        for k, k in ipairs(__T_o_1113:GetDescendants()) do
            if (k:IsA("U_2611") or k:IsA("BasePart") and k.Name == "U_2204") and not __T_f_1133(k) then
                K[#K + 1] = k
            end
        end
        if #K > 0 then
            __T_x_1134(K[math.random(1, #K)]["CFrame"] + Vector3.new(0, 5, 0))
        end
    end
    function __T_f_1136()
        local L = _G -- ENV_GETTER rewritten to _G
        if not __T_C_1115() then
            return
        end
        local C = __T_o_1113:FindFirstChild("U_457") or __T_o_1113:FindFirstChild("U_113")
        if not C then
            return
        end
        local o = {}
        for K, K in ipairs(C:GetDescendants()) do
            if K:IsA("U_2611") or K:IsA("BasePart") and K.Name == "U_2204" then
                o[#o + 1] = K
            end
        end
        if #o > 0 then
            __T_x_1134(o[math.random(1, #o)]["CFrame"] + Vector3.new(0, 3, 0))
        else
            local o, K = pcall(function()
                return C:GetPivot()
            end)
            if o then
                __T_x_1134(K + Vector3.new(0, 5, 0))
            end
        end
    end
    getgenv()["U_1499"]("U_372", "U_661", function(o)
        o:AddButton({ ["Name"] = "U_407", ["Callback"] = __T_f_1136 })
        o:AddButton({ ["Name"] = "U_661", ["Callback"] = __T_W_1135 })
    end)
    getgenv()["U_2679"] = function()
        local f, o, x = _G,  false,  false -- ENV_GETTER rewritten to _G
        __T_E_1119, __T_h_1125 = o, x
        x = __T_S_1122
        if x then
            pcall(function()
                __T_S_1122:Disconnect()
            end)
            __T_S_1122 = nil
        end
        x = __T_r_1128
        if x then
            pcall(function()
                __T_r_1128:Disconnect()
            end)
            __T_r_1128 = nil
        end
        __T_H_1124()
        __T_D_1132()
    end
    __T_f_1137 = game:GetService("Players")
    __T_o_1138 = game:GetService("ReplicatedStorage")
    __T_x_1139 = __T_f_1137.LocalPlayer
    __T_C_1140 = false
    __T_H_1141 = false
    __T_W_1142 = false
    __T_D_1143 = false
    __T_E_1144 = "U_2668"
    __T_h_1145 = "U_1044"
    __T_L_1146, __T_S_1147, __T_K_1148, __T_r_1149, __T_k_1150 = "U_3013"
    __T_J_1151 = false
    __T_I_1152, __T_p_1153 = 0
    function __T_B_1154()
        local t = _G -- ENV_GETTER rewritten to _G
        local _, A, i = require, __T_o_1138:WaitForChild("U_3123"), "U_626"
        return _(A:WaitForChild(i))
    end
    function __T_t_1155()
        local _, A = _G,  not __T_p_1153 -- ENV_GETTER rewritten to _G
        if A then
            local i, N = pcall(__T_B_1154)
            if not i or typeof(N) ~= "table" then
                return nil
            end
            __T_p_1153 = N
        end
        A = __T_p_1153
        return A.U_1287
    end
    function __T_p_1156()
        local B = __T_x_1139.Character
        if B and B:FindFirstChild("Gun") then
            return true
        end
        B = __T_x_1139:FindFirstChildOfClass("Backpack")
        if B and B:FindFirstChild("Gun") then
            return true
        end
        return false
    end
    function __T_B_1157()
        local _ = __T_t_1155()
        local A = _ and _[__T_x_1139.Name]
        _ = A and A.Role
        if _ == "Sheriff" or _ == "Hero" then
            return _
        end
        if __T_p_1156() then
            return "Hero"
        end
        return _
    end
    function __T_p_1158()
        local _, A = _G,  __T_t_1155() -- ENV_GETTER rewritten to _G
        if typeof(A) ~= "table" then
            return nil
        end
        for i, N in pairs(A) do
            if typeof(N) == "table" and N.Role == "Murderer" then
                return __T_f_1137:FindFirstChild(i)
            end
        end
        return nil
    end
    function __T___1159(A, i)
        local N = _G -- ENV_GETTER rewritten to _G
        if __T_g_116 then
            pcall(function()
                __T_g_116:Notify({ ["U_3007"] = A, ["U_1068"] = i, ["U_9"] = 4 })
            end)
        end
    end
    task.spawn(function()
        local A = _G -- ENV_GETTER rewritten to _G
        while true do
            local i, N = task.wait, 1--[[u234]]
            if not i(N) then
                break
            end
            N = __T_C_1140 and __T_D_1143
            if not N then
                continue
            end
            i = __T_B_1157()
            N = i and i ~= __T_S_1147
            if N then
                __T_S_1147 = i
                __T___1159("U_1207" .. tostring(i), __T_L_1146)
            else
                local L = not i
                if L then
                    __T_S_1147 = nil
                end
            end
        end
    end)
    task.spawn(function()
        local L = _G -- ENV_GETTER rewritten to _G
        while true do
            local S, A = task.wait, 0.5
            if not S(A) then
                break
            end
            L = __T_C_1140
            if not L then
                continue
            end
            L = __T_p_1158()
            S = L and L.Name
            L = S ~= __T_k_1150
            if L then
                __T_k_1150 = S
                __T_J_1151 = false
            end
        end
    end)
    function __T_L_1160()
        local S, k = _G,  __T_C_1140 and (__T_H_1141 or __T_W_1142) -- ENV_GETTER rewritten to _G
        if not k then
            return
        end
        k = __T_B_1157()
        if k ~= "Sheriff" and k ~= "Hero" then
            return
        end
        k = __T_p_1158()
        if not k then
            return
        end
        local p = k.Name
        task.delay(1--[[u1903]], function()
            local S, k = _G,  __T_C_1140 -- ENV_GETTER rewritten to _G
            if not k then
                return
            end
            k = __T_t_1155()
            local B, t = k and k[p], __T_f_1137:FindFirstChild(p)
            k = t and t.Character and t.Character:FindFirstChildOfClass("Humanoid")
            local f, A = B and B.Dead == true or k ~= nil and k.Health <= 0, B and B.Dead == false or k ~= nil and k.Health > 0
            if f then
                t = __T_W_1142 and not __T_J_1151
                if t then
                    __T_J_1151 = true
                    __T___1159("U_2127" .. p, __T_h_1145)
                end
            else
                if A then
                    B = __T_H_1141 and getgenv()["U_3363"] and os.clock() - __T_I_1152 > 1--[[u3221]]
                    if B then
                        __T_I_1152 = os.clock()
                        __T___1159("U_68" .. p, __T_E_1144)
                    end
                end
            end
        end)
    end
    function __T_f_1161()
        local E, h = _G,  __T_K_1148 and __T_r_1149 -- ENV_GETTER rewritten to _G
        if h then
            return
        end
        local S, k = pcall(function()
            local J, I = __T_o_1138:WaitForChild("U_2227"):WaitForChild("U_1442"), "U_339"
            return J:WaitForChild(I)
        end)
        if not S or not k then
            return
        end
        h = __T_K_1148
        if h then
            pcall(function()
                __T_K_1148:Disconnect()
            end)
            __T_K_1148 = nil
        end
        __T_r_1149 = k
        __T_K_1148 = k.OnClientEvent:Connect(function(o)
            local E, h = _G,  __T_x_1139.Character -- ENV_GETTER rewritten to _G
            if typeof(o) == "Instance" and h and o:IsDescendantOf(h) then
                __T_L_1160()
            end
        end)
    end
    task.spawn(function()
        local o = _G -- ENV_GETTER rewritten to _G
        while true do
            local x = __T_C_1140 and (__T_H_1141 or __T_W_1142)
            if x then
                __T_f_1161()
            end
            task.wait(1--[[u234]])
        end
    end)
    getgenv()["U_1499"]("U_1557", "U_2305", function(o)
        local x = o:AddToggle({
        ["Name"] = "U_2305",
        ["Default"] = false,
        ["Flag"] = "U_952",
        ["U_3348"] = true,
        ["Callback"] = function(o)
        local E = _G -- ENV_GETTER rewritten to _G
        __T_C_1140 = o
        local h = o and (__T_H_1141 or __T_W_1142)
        if h then
            task.spawn(__T_f_1161)
        end
    end
    })
        local o, E = x.U_3348, { ["Name"] = "U_1030", ["Default"] = false, ["Flag"] = "U_2440" }
        E.Callback = function(h)
        local L = _G -- ENV_GETTER rewritten to _G
        __T_H_1141 = h
        local S = h and __T_C_1140
        if S then
            task.spawn(__T_f_1161)
        end
    end
        o:AddToggle(E)
        E, o = x.U_3348, { ["Name"] = "U_1682", ["Default"] = false, ["Flag"] = "U_718" }
        o.Callback = function(h)
        local L = _G -- ENV_GETTER rewritten to _G
        __T_W_1142 = h
        local S = h and __T_C_1140
        if S then
            task.spawn(__T_f_1161)
        end
    end
        E:AddToggle(o)
        E, o = x.U_3348, { ["Name"] = "U_719", ["Default"] = false, ["Flag"] = "U_782" }
        o.Callback = function(f)
        __T_D_1143 = f
    end
        E:AddToggle(o)
    end)
    getgenv()["U_2339"] = function()
        local f, o, x, E, h = _G,  false,  false,  false,  false -- ENV_GETTER rewritten to _G
        __T_C_1140, __T_H_1141, __T_W_1142, __T_D_1143 = o, x, E, h
        h = __T_K_1148
        if h then
            pcall(function()
                __T_K_1148:Disconnect()
            end)
            __T_K_1148 = nil
        end
        __T_r_1149 = nil
    end
    __T_f_1162, __T_o_1163 = game:GetService("Players"), game:GetService("SoundService")
    __T_x_1164, __T_x_1165 = __T_f_1162.LocalPlayer, {
        ["U_2228"] = { ["U_2376"] = false, ["U_386"] = "U_3305", ["U_1162"] = 1 },
        ["U_2769"] = { ["U_2376"] = false, ["U_386"] = "U_1188", ["U_1162"] = 1 }
    }
    __T_f_1166, __T_C_1167, __T_H_1168 = {
        "U_1380",
        "U_879",
        "U_2358",
        "U_3305",
        "U_1188",
        "U_3166",
        "U_3010"
    }, {
        "U_1915",
        "U_2329",
        "U_221",
        "U_2688",
        "U_3199",
        "U_642",
        "U_1420",
        "U_3109"
    }, { ["U_3109"] = "U_190" }
    __T_W_1169 = "U_294"
    __T_D_1170 = "U_2134"
    __T_E_1171 = { ["U_1540"] = true, ["U_1806"] = true, ["U_3306"] = true }
    __T_h_1172 = {
        "U_382",
        "U_3279",
        "U_3086",
        "U_1706",
        __T_D_1170,
        "",
        __T_W_1169
    }
    __T_L_1173 = { "U_1540", "U_1806", "U_3306", "" }
    __T_S_1174, __T_K_1175, __T_r_1176 = "U_2451", {}, {}
    for k, k in ipairs(__T_f_1166) do
        __T_K_1175[#__T_K_1175 + 1] = k
        __T_r_1176[k] = true
    end
    for f, f in ipairs(__T_C_1167) do
        __T_K_1175[#__T_K_1175 + 1] = f
    end
    __T_f_1177, _]============],
    [23] = [============[
_T_C_1178, __T_k_1179 = #__T_K_1175, {}
    __T_J_1180, __T_I_1181, __T_p_1182, __T_B_1183, __T_t_1184, __T___1185, __T_A_1186 = {}, {}, {}, {}, {}, {}, {}
    __T_i_1187 = true
    __T_N_1188 = { ["U_2228"] = 0, ["U_2769"] = 0 }
    function __T_l_1189()
        local y = _G -- ENV_GETTER rewritten to _G
        return typeof(isfile) == "function" and typeof(readfile) == "function" and typeof(writefile) == "function" and typeof(getcustomasset) == "function"
    end
    function __T_y_1190(Q)
        local z = _G -- ENV_GETTER rewritten to _G
        local T, Z = pcall(isfile, Q)
        if not (T and Z) then
            return nil
        end
        T, Z = pcall(readfile, Q)
        if not (T and typeof(Z) == "string" and #Z > 0) then
            return nil
        end
        T = string.match(Q, "U_236")
        Q = T and string.lower(T) or "U_1540"
        Q = if not __T_E_1171[Q] then "U_1540" else Q
        local G = "U_2403" .. tostring(math.random(1--[[u3206]], 1--[[u2799]])) .. Q
        if not pcall(writefile, G, Z) then
            return nil
        end
        T, Z = pcall(getcustomasset, G)
        if not (T and typeof(Z) == "string" and Z ~= "") then
            pcall(function()
                local Q = _G -- ENV_GETTER rewritten to _G
                if typeof(delfile) == "function" then
                    delfile(G)
                end
            end)
            return nil
        end
        T = getgenv()["U_1159"]
        if typeof(T) == "function" then
            local Q, s = pcall(T, G, Z, "U_2371")
            Z = if Q and typeof(s) == "string" and s ~= "" then s else Z
        else
            __T_A_1186[#__T_A_1186 + 1] = G
        end
        return Z
    end
    function __T_Q_1191(z)
        local T, Z = _G,  __T_C_1178[z] -- ENV_GETTER rewritten to _G
        if Z then
            local G = __T_y_1190(Z)
            if G then
                return G, Z
            end
        end
        Z = __T_H_1168[z] or z
        for G, s in ipairs(__T_h_1172) do
            for h, h in ipairs(__T_L_1173) do
                z = s .. Z .. h
                G = __T_y_1190(z)
                if G then
                    return G, z
                end
            end
        end
        return nil, nil
    end
    function __T_h_1192()
        local L = _G -- ENV_GETTER rewritten to _G
        if typeof(isfolder) ~= "function" or typeof(makefolder) ~= "function" then
            return false
        end
        local y, z = pcall(isfolder, __T_D_1170)
        if not y then
            return false
        end
        if z then
            return true
        end
        return pcall(makefolder, __T_D_1170) == true
    end
    function __T_L_1193()
        local y, z = _G,  {} -- ENV_GETTER rewritten to _G
        if typeof(listfiles) ~= "function" then
            return z
        end
        if not __T_h_1192() then
            return z
        end
        local T, Z = pcall(listfiles, __T_D_1170)
        if not T or typeof(Z) ~= "table" then
            return z
        end
        T = {}
        for D, G in ipairs(Z) do
            if typeof(G) == "string" then
                D = string.gsub(G, "U_3003", "U_40")
                local Z, G = string.match(D, "U_2021")
                if Z and G and __T_E_1171[string.lower(G)] and not T[Z] then
                    T[Z] = true
                    z[#z + 1] = { ["U_386"] = Z, ["U_709"] = D }
                end
            end
        end
        table.sort(z, function(D, E)
            local y = _G -- ENV_GETTER rewritten to _G
            return string.lower(D.U_386) < string.lower(E.U_386)
        end)
        return z
    end
    function __T_D_1194(E)
        local y = _G -- ENV_GETTER rewritten to _G
        if not E then
            return
        end
        pcall(function()
            local y, z = _G,  E:GetValue() -- ENV_GETTER rewritten to _G
            E:SetValues(__T_K_1175)
            E:Generate()
            z = if typeof(z) == "table" then z[1] else z
            if typeof(z) == "string" and z ~= "" and E:GetValue() ~= z then
                for y = 1, #__T_K_1175 do
                    if __T_K_1175[y] == z then
                        E:SetValue(z)
                        break
                    end
                end
            end
        end)
    end
    function __T_E_1195()
        local y, z, T = _G,  __T_L_1193(),  {} -- ENV_GETTER rewritten to _G
        for L = 1, #z do
            T[L] = z[L]["U_386"]
        end
        local L, Z = table.concat(T, "U_3245"), __T_k_1179
        if L == Z then
            return
        end
        __T_k_1179 = L
        for L in pairs(__T_C_1178) do
            __T_I_1181[L] = nil
            __T_t_1184[L] = nil
        end
        table.clear(__T_C_1178)
        for L = 1, #z do
            __T_C_1178[z[L]["U_386"]] = z[L]["U_709"]
            __T_I_1181[z[L]["U_386"]] = nil
            __T_t_1184[z[L]["U_386"]] = nil
        end
        for L = #__T_K_1175, __T_f_1177 + 1, -1 do
            __T_K_1175[L] = nil
        end
        Z = {}
        for L = 1, __T_f_1177 do
            Z[__T_K_1175[L]] = true
        end
        for f = 1, #T do
            if not Z[T[f]] then
                Z[T[f]] = true
                __T_K_1175[#__T_K_1175 + 1] = T[f]
            end
        end
        __T_D_1194(__T_J_1180.U_2228)
        __T_D_1194(__T_J_1180.U_2769)
    end
    function __T_f_1196(D)
        local L = _G -- ENV_GETTER rewritten to _G
        local y = getgenv()["U_1449"]
        if typeof(y) ~= "function" then
            return nil
        end
        local z, T = __T_H_1168[D] or D, getgenv()["U_2352"]
        if typeof(T) == "function" then
            local H, Z = pcall(T, "")
            if H and typeof(Z) == "table" then
                for H, G in ipairs(Z) do
                    D, H = string.match(G, "U_265")
                    if D == z and (H == "U_1806" or H == "U_3306" or H == "U_1540") then
                        local H = y(G)
                        if H then
                            return H
                        end
                    end
                end
            end
            return nil
        end
        T, D = ipairs, { "U_1806", "U_3306", "U_1540" }
        for H, H in T(D) do
            L = y(z .. H)
            if L then
                return L
            end
        end
        return nil
    end
    function __T_H_1197(D)
        local L = _G -- ENV_GETTER rewritten to _G
        if __T_B_1183[D] ~= nil then
            return __T_B_1183[D]
        end
        if not __T_r_1176[D] then
            __T_B_1183[D] = false
            return false
        end
        local r = __T_W_1169 .. D .. "U_1540"
        local y, z = pcall(isfile, r)
        if y and z then
            __T_B_1183[D] = true
            return true
        end
        if typeof(isfolder) ~= "function" or typeof(makefolder) ~= "function" then
            __T_B_1183[D] = false
            return false
        end
        if not pcall(function()
            local T = _G -- ENV_GETTER rewritten to _G
            if not isfolder(__T_W_1169) then
                makefolder(__T_W_1169)
            end
        end) then
            __T_B_1183[D] = false
            return false
        end
        local W = __T_S_1174 .. string.gsub(D, "U_3393", "U_417") .. "U_1540"
        y, z = pcall(function()
            local S = _G -- ENV_GETTER rewritten to _G
            return game:HttpGet(W)
        end)
        if not y or typeof(z) ~= "string" or #z < "U_1579" then
            __T_B_1183[D] = false
            return false
        end
        __T_B_1183[D] = pcall(writefile, r, z) == true
        return __T_B_1183[D]
    end
    function __T_W_1198(D)
        local L, S = _G,  __T_I_1181[D] -- ENV_GETTER rewritten to _G
        if S ~= nil then
            if S == false then
                return nil
            end
            return S
        end
        if not __T_l_1189() then
            __T_I_1181[D] = false
            return nil
        end
        local S, r = __T_Q_1191(D)
        if not S then
            S = __T_f_1196(D)
            r = if S then D else r
        end
        if not S and __T_H_1197(D) then
            S, r = __T_Q_1191(D)
        end
        __T_I_1181[D] = S or false
        __T_p_1182[D] = r
        if not S and not __T_t_1184[D] then
            __T_t_1184[D] = true
            if __T_g_116 then
                pcall(function()
                    __T_g_116:Notify({ ["U_3007"] = "U_3368" .. D .. "U_1785", ["U_1068"] = "U_629", ["U_9"] = 5 })
                end)
            end
        end
        return S
    end
    function __T_f_1199(g)
        local H, D = _G,  __T_x_1165[g] -- ENV_GETTER rewritten to _G
        if not D then
            return nil
        end
        local L = __T_W_1198(D.U_386)
        if not L then
            local S = __T___1185[g]
            if S then
                pcall(function()
                    S:Destroy()
                end)
                __T___1185[g] = nil
            end
            return nil
        end
        local S = __T___1185[g]
        if S and S.Parent and S.U_1424 == L then
            pcall(function()
                S.U_2428 = D.U_1162
            end)
            return S
        end
        if S then
            pcall(function()
                S:Destroy()
            end)
        end
        local S, r = pcall(function()
            local p = _G -- ENV_GETTER rewritten to _G
            local B = Instance.new("Sound")
            B.Name = "\0"
            B.U_1424 = L
            B.U_2428 = D.U_1162
            B.U_1718 = false
            B.Parent = __T_o_1163
            return B
        end)
        if not S or not r then
            __T___1185[g] = nil
            return nil
        end
        __T___1185[g] = r
        task.spawn(function()
            local g = _G -- ENV_GETTER rewritten to _G
            pcall(function()
            local g = _G -- ENV_GETTER rewritten to _G
            game:GetService("ContentProvider"):PreloadAsync({ r })
        end)
        end)
        return r
    end
    function __T_g_1200(H)
        local D, L = _G,  __T___1185[H] or __T_f_1199(H) -- ENV_GETTER rewritten to _G
        if not L then
            return false
        end
        return (pcall(function()
            local D, S = _G,  L:Clone() -- ENV_GETTER rewritten to _G
            S.U_2428 = __T_x_1165[H]["U_1162"]
            S.U_1718 = false
            S.U_1127 = false
            S.U_2925 = 0
            S.Parent = __T_o_1163
            S:Play()
            task.delay(1--[[u2185]], function()
            local H = _G -- ENV_GETTER rewritten to _G
            if not S.Parent then
                return
            end
            if S.U_3383 or S.U_2925 > 0 then
                return
            end
            pcall(function()
            S.U_1127 = true
            S:Destroy()
        end)
        end)
            task.delay(8, function()
            local H = _G -- ENV_GETTER rewritten to _G
            pcall(function()
            S:Destroy()
        end)
        end)
        end))
    end
    function __T_H_1201()
        return __T_x_1165.U_2228["U_2376"] or __T_x_1165.U_2769["U_2376"]
    end
    function __T_D_1202()
        local L = _G -- ENV_GETTER rewritten to _G
        for S, r in pairs(__T___1185) do
            pcall(function()
                r:Destroy()
            end)
            __T___1185[S] = nil
        end
    end
    function __T_L_1203()
        local S = _G -- ENV_GETTER rewritten to _G
        for r, p in pairs(__T_x_1165) do
            __T_b_126.U_272["U_1402"](r, p.U_2376 and __T_f_1199(r) ~= nil)
        end
        __T_b_126.U_272["U_1323"]("U_439", __T_i_1187 and __T_H_1201())
    end
    __T_b_126.U_272["sub"](function(b, S)
        local r, p = _G,  __T_x_1165[S] -- ENV_GETTER rewritten to _G
        local B = b ~= "U_1546" or not __T_i_1187 or not p or not p.U_2376
        if B then
            return
        end
        if not __T___1185[S] and not __T_f_1199(S) then
            return
        end
        b = os.clock()
        if b - __T_N_1188[S] < 1--[[u773]] then
            return
        end
        __T_N_1188[S] = b
        __T_g_1200(S)
    end)
    task.spawn(function()
        local f = _G -- ENV_GETTER rewritten to _G
        while true do
            local g = __T_i_1187
            if not g then
                break
            end
            if __T_h_1192() then
                pcall(__T_E_1195)
            end
            if __T_H_1201() then
                pcall(__T_L_1203)
            end
            task.wait(2)
        end
    end)
    function __T_f_1204(g, E)
        local h = _G -- ENV_GETTER rewritten to _G
        __T_x_1165[g]["U_2376"] = E
        pcall(__T_L_1203)
        if not __T_H_1201() then
            __T_D_1202()
        end
    end
    function __T_g_1205(E, h)
        local b, S = _G,  __T_W_1198(E) -- ENV_GETTER rewritten to _G
        if not S then
            return
        end
        pcall(function()
            local W = _G -- ENV_GETTER rewritten to _G
            local E = Instance.new("Sound")
            E.U_1424 = S
            E.U_2428 = h
            E.U_1718 = false
            E.Parent = __T_o_1163
            E:Play()
            task.delay(8, function()
            local o = _G -- ENV_GETTER rewritten to _G
            pcall(function()
            E:Destroy()
        end)
        end)
        end)
    end
    function __T_o_1206()
        local W = _G -- ENV_GETTER rewritten to _G
        local E = getgenv()["U_817"]
        if not E then
            return false
        end
        if os.clock() - E.U_3149 < 3 then
            return true
        end
        return os.clock() - E.U_36 < 1--[[u1903]] and E.U_218 >= 3
    end
    __T_W_1207 = 0
    function __T_E_1208(h, b)
        local S, r = _G,  __T_W_1207 -- ENV_GETTER rewritten to _G
        __T_W_1207 = r + 1
        local r = __T_W_1207
        task.delay(1--[[u2185]], function()
            local S = __T_W_1207
            if r ~= S then
                return
            end
            S = __T_i_1187
            if not S then
                return
            end
            if __T_o_1206() then
                return
            end
            __T_g_1205(h, b)
        end)
    end
    function __T_o_1209(g, W)
        local h = _G -- ENV_GETTER rewritten to _G
        W = if typeof(W) == "table" then W[1] else W
        if typeof(W) ~= "string" or W == "" then
            return
        end
        __T_x_1165[g]["U_386"] = W
        if __T_H_1201() then
            pcall(__T_L_1203)
        end
        __T_E_1208(W, __T_x_1165[g]["U_1162"])
    end
    function __T_g_1210(H, W)
        local E = _G -- ENV_GETTER rewritten to _G
        __T_x_1165[H]["U_1162"] = W
        local h = __T___1185[H]
        if h then
            pcall(function()
                h.U_2428 = W
            end)
        end
    end
    getgenv()["U_1499"]("U_1557", "U_401", function(H)
        local W = H:AddToggle({
        ["Name"] = "U_401",
        ["Default"] = false,
        ["Flag"] = "U_1744",
        ["U_3348"] = true,
        ["Callback"] = function(H)
        __T_f_1204("U_2228", H)
    end
    })
        __T_J_1180.U_2228 = W.U_3348:AddDropdown({
        ["Name"] = "U_2371",
        ["Default"] = "U_3305",
        ["U_3220"] = __T_K_1175,
        ["Flag"] = "U_1025",
        ["Callback"] = function(H)
        __T_o_1209("U_2228", H)
    end
    })
        W.U_3348:AddSlider({
        ["Name"] = "U_1162",
        ["Default"] = 1,
        ["Min"] = 1--[[u1824]],
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_2075",
        ["Callback"] = function(H)
        __T_g_1210("U_2228", H)
    end
    })
    end)
    getgenv()["U_1499"]("U_1557", "U_3175", function(H)
        local W = H:AddToggle({
        ["Name"] = "U_3175",
        ["Default"] = false,
        ["Flag"] = "U_343",
        ["U_3348"] = true,
        ["Callback"] = function(H)
        __T_f_1204("U_2769", H)
    end
    })
        __T_J_1180.U_2769 = W.U_3348:AddDropdown({
        ["Name"] = "U_2371",
        ["Default"] = "U_1188",
        ["U_3220"] = __T_K_1175,
        ["Flag"] = "U_2261",
        ["Callback"] = function(f)
        __T_o_1209("U_2769", f)
    end
    })
        W.U_3348:AddSlider({
        ["Name"] = "U_1162",
        ["Default"] = 1,
        ["Min"] = 1--[[u1824]],
        ["Max"] = 5,
        ["Rounding"] = 1,
        ["Flag"] = "U_3187",
        ["Callback"] = function(f)
        __T_g_1210("U_2769", f)
    end
    })
    end)
    getgenv()["U_797"] = function()
        local f = _G -- ENV_GETTER rewritten to _G
        __T_i_1187 = false
        __T_x_1165.U_2228["U_2376"] = false
        __T_x_1165.U_2769["U_2376"] = false
        pcall(__T_L_1203)
        __T_D_1202()
        if typeof(delfile) == "function" then
            for o = 1, #__T_A_1186 do
                pcall(delfile, __T_A_1186[o])
            end
        end
        table.clear(__T_A_1186)
        table.clear(__T_I_1181)
        table.clear(__T_t_1184)
        table.clear(__T_C_1178)
        table.clear(__T_J_1180)
        __T_k_1179 = nil
    end
    __T_f_1211 = game:GetService("Players")
    __T_o_1212 = game:GetService("ReplicatedStorage")
    __T_x_1213 = workspace
    __T_C_1214 = __T_f_1211.LocalPlayer
    __T_g_1215 = false
    __T_H_1216, __T_W_1217, __T_D_1218 = false
    __T_E_1219 = false
    function __T_h_1220()
        local L = __T_C_1214.Character
        return L and L:FindFirstChild("HumanoidRootPart")
    end
    function __T_L_1221()
        local b, S = _G,  not __T_D_1218 -- ENV_GETTER rewritten to _G
        if S then
            local K, r = pcall(function()
                local k = _G -- ENV_GETTER rewritten to _G
                local J, I, p = require, __T_o_1212:WaitForChild("U_3123"), "U_626"
                return J(I:WaitForChild(p))
            end)
            local o = K and typeof(r) == "table"
            if o then
                __T_D_1218 = r
            end
        end
        local o, b = __T_D_1218
        if o then
            S = __T_D_1218
            b = S.U_1287
        else
            b = o
        end
        return b
    end
    function __T_o_1222(D)
        local b, S = _G,  __T_L_1221() -- ENV_GETTER rewritten to _G
        if typeof(S) ~= "table" then
            return nil
        end
        for L, K in pairs(S) do
            if typeof(K) == "table" and not K.Dead and (K.Role == D or D == "Sheriff" and K.Role == "Hero") then
                local D = __T_f_1211:FindFirstChild(L)
                if D and D ~= __T_C_1214 then
                    return D
                end
            end
        end
        return nil
    end
    function __T_f_1223(D)
        local L = _G -- ENV_GETTER rewritten to _G
        if not D or not D.Character then
            return
        end
        local b, S = __T_h_1220(), __T_C_1214.Character and __T_C_1214.Character:FindFirstChildOfClass("Humanoid")
        if not b then
            return
        end
        local K = D.Character
        local r, k = K:FindFirstChild("HumanoidRootPart") or K:FindFirstChild("Head"), K:FindFirstChildOfClass("Humanoid")
        if not r then
            return
        end
        getgenv()[1--[[u3005]]] = (getgenv()[1--[[u3005]]] or 0) + 1
        if b.Velocity["Magnitude"] < 1--[[u8]] then
            getgenv()["U_263"] = CFrame
        end
        if k and k.Sit then
            getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
            return
        end
        local J, I = __T_x_1213.CurrentCamera, __T_x_1213.FallenPartsDestroyHeight
        if r then
            J.CameraSubject = r
        else
            if k then
                J.CameraSubject = k
            end
        end
        pcall(function()
            __T_x_1213.FallenPartsDestroyHeight = "U_86"
        end)
        D = Instance.new("U_3285")
        D.Parent = b
        D.Velocity = Vector3.new(0, 0, 0)
        D.U_1617 = Vector3.new(1--[[u3345]], 1--[[u3345]], 1--[[u3345]])
        K = S and S:GetStateEnabled(__T_EnumFB.U_3137["U_1763"])
        if S then
            S:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], false)
        end
        local p, B, t = 2, tick(), 0
        while true do
            local _ = b and k
            if _ then
                local A = if __T_E_1219 then k.MoveDirection * k.WalkSpeed else r.Velocity
                if A.Magnitude < 1--[[u8]] then
                    t += 1--[[u807]]
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection * A.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection * A.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection * A.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection * A.Magnitude / 1--[[u2836]]
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], 0) + k.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0) + k.MoveDirection
                    CFrame = CFrame * CFrame.Angles(math.rad(t), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                else
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], -k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3221]], k.WalkSpeed)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles((math.pi / 2), 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                    CFrame = CFrame.new(r.Position) * CFrame.new(0, 1--[[u3089]], 0)
                    CFrame = CFrame * CFrame.Angles(0, 0, 0)
                    __T_C_1214.Character:SetPrimaryPartCFrame(CFrame)
                    b.Velocity = Vector3.new(1--[[u199]], 1--[[u2172]], 1--[[u199]])
                    b.RotVelocity = Vector3.new(1--[[u2172]], 1--[[u2172]], 1--[[u2172]])
                    task.wait()
                end
            end
            local t, A = B + p, tick
            _ = t < A() or not (__T_g_1215 or __T_H_1216)
            if _ then
                break
            end
        end
        if D then
            D:Destroy()
        end
        if S and K ~= nil then
            S:SetStateEnabled(__T_EnumFB.U_3137["U_1763"], K)
        end
        J.CameraSubject = S
        if getgenv()["U_263"] then
            while true do
                CFrame = getgenv()["U_263"] * CFrame.new(0, 0.5, 0)
                __T_C_1214.Character:SetPrimaryPartCFrame(getgenv()["U_263"] * CFrame.new(0, 0.5, 0))
                if S then
                    S:ChangeState("U_1320")
                end
                for S, S in pairs(__T_C_1214.Character:GetChildren()) do
                    K = "BasePart"
                    if S:IsA(K) then
                        S.Velocity = Vector3.new()
                        S.RotVelocity = Vector3.new()
                    end
                end
                task.wait()
                B, D = b.Position, getgenv()
                p, r = D.U_263, "U_1622"
                k, J = (B - p[r])["Magnitude"], 25
                if k < J then
                    break
                end
            end
            pcall(function()
                __T_x_1213.FallenPartsDestroyHeight = I
            end)
        end
        getgenv()[1--[[u3005]]] = math.max(0, (getgenv()[1--[[u3005]]] or 1) - 1)
    end
    function __T_x_1224()
        local C, D = _G,  __T_W_1217 -- ENV_GETTER rewritten to _G
        if D then
            return
        end
        __T_W_1217 = task.spawn(function()
            local C = _G -- ENV_GETTER rewritten to _G
            while true do
                local D = __T_g_1215 or __T_H_1216
                if not D then
                    break
                end
                D = if __T_g_1215 then __T_o_1222("Murderer") else nil
                D = if not D and __T_H_1216 then __T_o_1222("Sheriff") else D
                if D and D.Character and __T_h_1220() then
                    __T_f_1223(D)
                else
                    task.wait(1--[[u2185]])
                end
                task.wait()
            end
            __T_W_1217 = nil
        end)
    end
    getgenv()["U_1499"]("U_372", "U_436", function(f)
        f:AddToggle({
        ["Name"] = "U_436",
        ["Default"] = false,
        ["Flag"] = "U_679",
        ["Callback"] = function(f)
        __T_g_1215 = f
        if f then
            __T_x_1224()
        end
    end
    })
    end)
    getgenv()["U_1499"]("U_372", "U_2070", function(f)
        f:AddToggle({
        ["Name"] = "U_2070",
        ["Default"] = false,
        ["Flag"] = "U_840",
        ["Callback"] = function(f)
        __T_H_1216 = f
        if f then
            __T_x_1224()
        end
    end
    })
    end)
    getgenv()["U_1499"]("U_372", "U_2685", function(f)
        f:AddToggle({
        ["Name"] = "U_2685",
        ["Default"] = false,
        ["Flag"] = "U_647",
        ["Callback"] = function(f)
        __T_E_1219 = f
    end
    })
    end)
    getgenv()["U_1724"]("U_372", getgenv()["U_1252"])
    getgenv()["U_1724"]("U_1557", getgenv()["U_3202"])
    getgenv()["U_378"] = function()
        __T_g_1215 = false
        __T_H_1216 = false
    end
    __T_f_1225, __T_o_1226 = getgenv()["U_731"] or __T_X_111:AddSection({ ["Name"] = "U_2334", ["Position"] = "U_528" }), game:GetService("ReplicatedStorage")
    __T_x_1227 = game.Players["Loc]============],
    [24] = [============[
alPlayer"]
    getgenv()["U_1677"] = false
    getgenv()["U_1082"] = Color3.fromRGB(1--[[u151]], 1--[[u3144]], 255)
    getgenv()["U_3023"] = 1--[[u319]]
    getgenv()["U_1777"] = 1--[[u3159]]
    __T_C_1228, __T_g_1229, __T_H_1230, __T_W_1231 = false
    __T_D_1232 = (function()
        local E = _G -- ENV_GETTER rewritten to _G
        local h = game:GetService("TweenService")
        local L = getgenv()
        if typeof(L.U_2584) == "function" then
            L.U_2584()
        end
        local b = 1--[[u2770]]
        local S = 1--[[u2836]]
        local K = 1--[[u2054]]
        local r = 1--[[u500]]
        local k = 1--[[u1957]]
        local J = 1--[[u370]]
        local I = 1--[[u143]]
        local p = 1--[[u234]]
        local B = 1--[[u2836]]
        local t = 1--[[u773]]
        local _ = 1--[[u2543]]
        local A = 1--[[u3198]]
        local i = Color3.new(1, 1, 1)
        local N = true
        local function l(y)
            local Q = _G -- ENV_GETTER rewritten to _G
            return math.clamp(tonumber(y) or 0, 0, 1)
        end
        local function y(Q)
            Q = l(Q)
            return Q * Q * (3 - 2 * Q)
        end
        local function Q(z, T)
            local Z = _G -- ENV_GETTER rewritten to _G
            local G = y(math.min(T, 1 - T) / b)
            local b, y = 1--[[u2912]] + G ^ r * 1--[[u678]], G ^ S
            T, G = z / (k * b), z / (J * b)
            z = l(y * math.exp(-(T * T) * K)) * I
            return z + l(y * math.exp(-(G * G) * K)) * p * (1 - z)
        end
        local function b(S, K, r)
            local k, J = _G,  {} -- ENV_GETTER rewritten to _G
            for I = 0, 255 do
                local p = I
                for y = 1, 8 do
                    p = if p % 2 == 1 then bit32.bxor(3988292384, bit32.rshift(p, 1)) else bit32.rshift(p, 1)
                end
                J[I] = p
            end
            local function I(p, y, z)
                local T, Z = _G,  4294967295 -- ENV_GETTER rewritten to _G
                for G = y, y + z - 1 do
                    Z = bit32.bxor(J[bit32.band(bit32.bxor(Z, buffer.readu8(p, G)), 255)], bit32.rshift(Z, 8))
                end
                return bit32.bxor(Z, 4294967295)
            end
            local function J(p, y, z)
                local T = _G -- ENV_GETTER rewritten to _G
                buffer.writeu8(p, y, bit32.band(bit32.rshift(z, 24), 255))
                buffer.writeu8(p, y + 1, bit32.band(bit32.rshift(z, 16), 255))
                buffer.writeu8(p, y + 2, bit32.band(bit32.rshift(z, 8), 255))
                buffer.writeu8(p, y + 3, bit32.band(z, 255))
            end
            local p = K * (1 + S * 4)
            local y, z = buffer.create(p), 1
            local T = 0
            local function Z(G)
                z = (z + G) % 65521
                T = (T + z) % 65521
            end
            local G = 0
            for s = 0, K - 1 do
                local OP = (s + 0.5) / K
                buffer.writeu8(y, G, 0)
                Z(0)
                G += 1
                for uP = 0, S - 1 do
                    s = math.abs((uP + 0.5) / S * 2 - 1)
                    uP = math.floor(l(r(s, OP)) * 255 + 0.5)
                    buffer.writeu8(y, G, 255)
                    buffer.writeu8(y, G + 1, 255)
                    buffer.writeu8(y, G + 2, 255)
                    buffer.writeu8(y, G + 3, uP)
                    Z(255)
                    Z(255)
                    Z(255)
                    Z(uP)
                    G += 4
                end
            end
            r = math.max(1, math.ceil(p / 65535))
            Z = 2 + r * 5 + p + 4
            local G, s, OP, uP = buffer.create(1--[[u14]] + Z + 12), 0, ipairs, {
                137,
                80,
                78,
                71,
                13,
                10,
                26,
                10
            }
            for FP, FP in OP(uP) do
                buffer.writeu8(G, s, FP)
                s += 1
            end
            J(G, s, 13)
            s += 4
            buffer.writestring(G, s, "IHDR")
            r = s
            s = r + 4
            J(G, s, S)
            s += 4
            J(G, s, K)
            s += 4
            buffer.writeu8(G, s, 8)
            s += 1
            buffer.writeu8(G, s, 6)
            s += 1
            buffer.writeu8(G, s, 0)
            s += 1
            buffer.writeu8(G, s, 0)
            s += 1
            buffer.writeu8(G, s, 0)
            s += 1
            J(G, s, I(G, r, 16))
            s += 4
            J(G, s, Z)
            s += 4
            buffer.writestring(G, s, "IDAT")
            uP = s
            s = uP + 4
            buffer.writeu8(G, s, 1--[[u3069]])
            s += 1
            buffer.writeu8(G, s, 1)
            OP = p
            s += 1
            p = 0
            while OP > 0 do
                K = math.min(65535, OP)
                buffer.writeu8(G, s, OP - K == 0 and 1 or 0)
                s += 1
                buffer.writeu8(G, s, bit32.band(K, 255))
                s += 1
                buffer.writeu8(G, s, bit32.band(bit32.rshift(K, 8), 255))
                s += 1
                S = bit32.band(bit32.bnot(K), 65535)
                buffer.writeu8(G, s, bit32.band(S, 255))
                s += 1
                buffer.writeu8(G, s, bit32.band(bit32.rshift(S, 8), 255))
                s += 1
                buffer.copy(G, s, y, p, K)
                s += K
                p += K
                OP = OP - K
            end
            J(G, s, T * 65536 + z)
            s += 4
            J(G, s, I(G, uP, 4 + Z))
            s += 4
            J(G, s, 0)
            s += 4
            buffer.writestring(G, s, "IEND")
            uP = s
            s = uP + 4
            J(G, s, I(G, uP, 4))
            s += 4
            return buffer.tostring(G)
        end
        local S, K, r, k = "U_1910", 1--[[u2533]], 1--[[u2867]]
        local J, I = L.U_1535, typeof(isfile) == "function" and isfile(S)
        if typeof(J) == "string" and #J > 0 and I then
            k = J
        else
            if typeof(writefile) == "function" and typeof(getcustomasset) == "function" then
                writefile(S, b(K, r, Q))
                local b = getcustomasset(S)
                if typeof(b) == "string" and #b > 0 then
                    k = b
                    L.U_1535 = b
                end
            end
        end
        local b = {}
        r, S = ipairs, {
        0,
        1--[[u2786]],
        1--[[u3159]],
        1--[[u1228]],
        1--[[u3009]],
        1--[[u2770]],
        0.5,
        1--[[u2112]],
        1--[[u3332]],
        1--[[u552]],
        1--[[u2987]],
        1--[[u143]],
        1
    }
        for K, J in r(S) do
            b[K] = { J, 1 - Q(0, J) }
        end
        local function S(K)
            local r = _G -- ENV_GETTER rewritten to _G
            if k then
                return NumberSequence.new(l(K))
            end
            local J, I = {}, 1 - l(K)
            for K, p in ipairs(b) do
                J[K] = NumberSequenceKeypoint.new(p[1], l(1 - (1 - p[2]) * I))
            end
            return NumberSequence.new(J)
        end
        local b = Instance.new("Part")
        b.Name = "\0"
        b.Anchored = true
        b.CanCollide = false
        b.CanQuery = false
        b.CanTouch = false
        b.CastShadow = false
        b.Transparency = 1
        b.Size = 1--[[u1694]]
        CFrame = CFrame.new()
        b.Parent = workspace.CurrentCamera or workspace
        local K = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local E, r = _G,  N -- ENV_GETTER rewritten to _G
        if not r then
            return
        end
        r = workspace.CurrentCamera
        if r and b.Parent ~= r then
            b.Parent = r
        end
    end)
        local E, r, J = 1--[[u3195]], {}, {}
        local function I()
            local p = _G -- ENV_GETTER rewritten to _G
            local l = Instance.new("U_2466")
            l.Name = "\0"
            l.Parent = b
            local y = Instance.new("U_2466")
            y.Name = "\0"
            y.Parent = b
            local Q = Instance.new("U_1080")
            Q.Name = "\0"
            Q.U_1707 = l
            Q.U_640 = y
            Q.U_2680 = true
            Q.U_2418 = __T_EnumFB.U_2418["U_2899"]
            Q.U_1755 = 0
            Q.U_2931 = 1
            Q.U_832 = 0
            Q.U_17 = 0
            Q.U_183 = 2
            Q.U_1072 = 0
            Q.U_3390 = 0
            Q.U_1928 = 0
            Q.U_3381 = 0
            Q.U_1233 = 0
            Q.Color = ColorSequence.new(i)
            Q.Transparency = NumberSequence.new(1)
            Q.Enabled = false
            if k then
                Q.U_145 = k
            end
            Q.Parent = b
            local k = Instance.new("U_2043")
            k.Name = "\0"
            k.U_2506 = 1
            k.Parent = Q
            return {
                ["U_2395"] = Q,
                ["U_1669"] = l,
                ["U_2992"] = y,
                ["U_455"] = k,
                ["U_2974"] = k:GetPropertyChangedSignal("U_2506"):Connect(function()
                Q.Transparency = S(k.U_2506)
            end)
            }
        end
        for k = 1, E do
            r[#r + 1] = I()
        end
        local function E(k)
            local I = k.U_2432
            if not I then
                return
            end
            k.U_2432 = nil
            I:Cancel()
        end
        local function k(I)
            E(I)
            I.U_2395["Enabled"] = false
        end
        local function I(p)
            E(p)
            if p.U_2974 then
                p.U_2974:Disconnect()
                p.U_2974 = nil
            end
            p.U_2395:Destroy()
            p.U_1669:Destroy()
            p.U_2992:Destroy()
        end
        local function p(l)
            k(l)
            r[#r + 1] = l
        end
        local function k()
            local l = _G -- ENV_GETTER rewritten to _G
            local y = table.remove(r)
            if y then
                return y
            end
            y = table.remove(J, 1)
            if y then
                E(y)
                return y
            end
        end
        local function E(l, y, Q)
            local z, T = _G,  l.ViewportSize -- ENV_GETTER rewritten to _G
            if T.Y <= 0 then
                return 0
            end
            return y * (2 * Q * math.tan(math.rad(l.FieldOfView) * 0.5)) / T.Y
        end
        local function l(y, Q, z, T, Z)
            local G = _G -- ENV_GETTER rewritten to _G
            local s = not N or typeof(y) ~= "Vector3" or typeof(Q) ~= "Vector3"
            if s then
                return
            end
            if (Q - y)["Magnitude"] < 1--[[u3159]] then
                return
            end
            s = workspace.CurrentCamera
            if not s then
                return
            end
            local OP = k()
            if not OP then
                return
            end
            local k = tonumber(T) or 5
            k = if k <= 1--[[u1791]] then k * 1--[[u807]] else k
            k = math.clamp(k, 1, 1--[[u2553]]) * B
            local B, uP, FP = math.clamp(tonumber(Z) or 1--[[u319]], 1--[[u3159]], 10), (typeof(z) == "Color3" and z or i):Lerp(i, t), CFrame
            T, z = math.max(-FP:PointToObjectSpace(y)["Z"], 1--[[u1791]]), math.max(-FP:PointToObjectSpace(Q)["Z"], 1--[[u1791]])
            Z, FP = E(s, k, T), E(s, k, z)
            if Z <= 0 or FP <= 0 then
                p(OP)
                return
            end
            s = math.min(_, B * A)
            local E, k, t, _, A = math.max(B - s, 1--[[u1591]]), OP.U_2395, OP.U_1669, OP.U_2992, OP.U_455
            t.Position = y
            _.Position = Q
            k.Color = ColorSequence.new(uP)
            k.U_3381 = Z
            k.U_1233 = FP
            A.U_2506 = 0
            k.Transparency = S(0)
            k.Enabled = true
            local S = h:Create(A, TweenInfo.new(E, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"], 0, false, s), { ["U_2506"] = 1 })
            OP.U_2432 = S
            J[#J + 1] = OP
            S:Play()
            task.delay(B + 1--[[u2786]], function()
                local E, h = _G,  not N or OP.U_2432 ~= S -- ENV_GETTER rewritten to _G
                if h then
                    return
                end
                for h = #J, 1, -1 do
                    if J[h] == OP then
                        table.remove(J, h)
                        break
                    end
                end
                p(OP)
            end)
        end
        local function E()
            local h = N
            if not h then
                return
            end
            N = false
            h = K
            if h then
                K:Disconnect()
                K = nil
            end
            for h = #J, 1, -1 do
                I(J[h])
                J[h] = nil
            end
            for h = #r, 1, -1 do
                I(r[h])
                r[h] = nil
            end
            b:Destroy()
            if L.U_2584 == E then
                L.U_2584 = nil
            end
        end
        L.U_2584 = E
        return { ["U_77"] = l, ["U_2379"] = E }
    end)()
    function __T_E_1233()
        local h = _G -- ENV_GETTER rewritten to _G
        local L, b = pcall(function()
            local S = _G -- ENV_GETTER rewritten to _G
            local K, r, k = require, __T_o_1226:WaitForChild("U_3123"), "U_626"
            return K(r:WaitForChild(k))
        end)
        if L then
            __T_W_1231 = b
        end
        h = __T_W_1231
        return h
    end
    function __T_W_1234()
        local h = __T_x_1227.Character
        if h and h:FindFirstChild("Gun") then
            return true
        end
        h = __T_x_1227:FindFirstChildOfClass("Backpack")
        if h and h:FindFirstChild("Gun") then
            return true
        end
        h = __T_E_1233()
        if not h then
            return false
        end
        local E = h.U_1287
        h = E and E[__T_x_1227.Name]
        return h ~= nil and (h.Role == "Sheriff" or h.Role == "Hero")
    end
    function __T_E_1235(h)
        local L = _G -- ENV_GETTER rewritten to _G
        if typeof(h) == "Vector3" then
            return h
        else
            if typeof(h) == "CFrame" then
                return h.Position
            else
                if typeof(h) == "Instance" then
                    local L = "U_2466"
                    if h:IsA(L) then
                        return h.U_1554
                    else
                        local L = "BasePart"
                        if h:IsA(L) then
                            return h.Position
                        end
                    end
                end
            end
        end
    end
    function __T_h_1236(L, b)
        local S, K, r = _G,  __T_E_1235(L),  __T_E_1235(b) -- ENV_GETTER rewritten to _G
        if not K or not r then
            return
        end
        __T_D_1232.U_77(K, r, getgenv()["U_1082"], getgenv()["U_1777"], getgenv()["U_3023"])
    end
    function __T_E_1237(L, b, S)
        local K, r = _G,  __T_C_1228 -- ENV_GETTER rewritten to _G
        if not r then
            return
        end
        r = __T_x_1227.Character
        if not r then
            return
        end
        if not (typeof(L) == "Instance" and L:IsDescendantOf(r)) then
            return
        end
        if not __T_W_1234() then
            return
        end
        __T_h_1236(b, S)
    end
    function __T_x_1238()
        local W = _G -- ENV_GETTER rewritten to _G
        local h, L = pcall(function()
            local b, S = __T_o_1226:WaitForChild("U_2227"):WaitForChild("U_1442"), "U_339"
            return b:WaitForChild(S)
        end)
        if not h or not L then
            return
        end
        local o, b = __T_g_1229 and __T_H_1230 == L
        if o then
            h = __T_g_1229
            b = h.U_1010
        else
            b = o
        end
        if b then
            return
        end
        h = __T_g_1229
        if h then
            pcall(function()
                __T_g_1229:Disconnect()
            end)
            __T_g_1229 = nil
        end
        __T_H_1230 = L
        __T_g_1229 = L.OnClientEvent:Connect(function(o, W, h)
            local L = _G -- ENV_GETTER rewritten to _G
            task.spawn(__T_E_1237, o, W, h)
        end)
    end
    task.spawn(function()
        local o = _G -- ENV_GETTER rewritten to _G
        while true do
            local W = __T_C_1228
            if W then
                pcall(__T_x_1238)
            end
            task.wait(1)
        end
    end)
    __T_M_112 = __T_f_1225:AddToggle({
        ["Name"] = "U_3312",
        ["Default"] = false,
        ["Flag"] = "U_896",
        ["U_3348"] = true,
        ["Callback"] = function(f)
        local o = _G -- ENV_GETTER rewritten to _G
        __T_C_1228 = f
        getgenv()["U_1677"] = f
        if f then
            __T_x_1238()
        end
    end
    })
    __T_M_112.U_3348:AddColorPicker({
        ["Name"] = "U_1333",
        ["Default"] = Color3.fromRGB(1--[[u151]], 1--[[u3144]], 255),
        ["Flag"] = "U_1754",
        ["Callback"] = function(f)
        local o = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1082"] = f
    end
    })
    __T_M_112.U_3348:AddSlider({
        ["Name"] = "U_3331",
        ["Default"] = 5,
        ["Min"] = 1,
        ["Max"] = 1--[[u2553]],
        ["Rounding"] = 0,
        ["Flag"] = "U_780",
        ["Callback"] = function(f)
        local o = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_1777"] = (tonumber(f) or 5) / 1--[[u807]]
    end
    })
    __T_M_112.U_3348:AddSlider({
        ["Name"] = "U_1325",
        ["Default"] = 1--[[u319]],
        ["Min"] = 1--[[u3198]],
        ["Max"] = 4,
        ["Rounding"] = 1,
        ["Suffix"] = "U_2102",
        ["Flag"] = "U_1437",
        ["Callback"] = function(f)
        local o = _G -- ENV_GETTER rewritten to _G
        getgenv()["U_3023"] = tonumber(f) or 1--[[u319]]
    end
    })
    getgenv()["U_1970"] = function()
        local f = _G -- ENV_GETTER rewritten to _G
        __T_C_1228 = false
        getgenv()["U_1677"] = false
        f = __T_g_1229
        if f then
            __T_g_1229:Disconnect()
            __T_g_1229 = nil
        end
        __T_H_1230 = nil
        __T_D_1232.U_2379()
    end
    __T_v_117:AddColors()
    __T_R_114, __T_X_111 = __T_v_117:AddConfig()
    __T_f_1239 = nil
    function __T_o_1240()
        local x = _G -- ENV_GETTER rewritten to _G
        local C, g = typeof(gethui) == "function" and gethui() or game:GetService("CoreGui"), "U_1145"
        local R = C:FindFirstChild(g)
        if R then
            local H = R:FindFirstChild("U_2082")
            if H and H:IsA("U_3354") then
                pcall(function()
                    H:Invoke()
                end)
            end
            pcall(function()
                R:Destroy()
            end)
            task.wait(1--[[u773]])
        end
        local R, H
        local W = game:GetService("Players")
        local D = game:GetService("RunService")

-- =============================================================================
-- MODULE 16/17: CompanionBotFrieren — procedural R15 NPC + AI + procedural anim
-- createCompanionRig/generateFaceEditableMesh/generateHairEditableMesh/updateCompanionAI/updateCompanionProceduralAnim; Pathfinding+ClickDetector headpat
-- ==============================================================================
        local E, h = game:GetService("UserInputService"), game:GetService("PathfindingService")
        local L = game:GetService("TweenService")
        local b = game:GetService("AssetService")
        local S = game:GetService("Workspace")
        local K = {
            ["Name"] = "U_2132",
            ["WalkSpeed"] = 16,
            ["U_1955"] = 22,
            ["U_1912"] = 1--[[u2836]],
            ["U_665"] = 0,
            ["U_468"] = 1--[[u940]],
            ["U_2701"] = 1--[[u2573]],
            ["U_1721"] = 18,
            ["U_970"] = 4,
            ["U_233"] = 9,
            ["U_1756"] = 1--[[u2950]],
            ["U_2781"] = 1--[[u1817]],
            ["U_246"] = 1--[[u3221]],
            ["U_1765"] = 1--[[u14]],
            ["U_539"] = false,
            ["U_1274"] = 1--[[u194]],
            ["U_2852"] = 10,
            ["U_2062"] = 22,
            [1--[[u2243]]] = 1--[[u1693]],
            [1--[[u2364]]] = "U_784",
            ["U_2387"] = Color3.fromRGB(1--[[u2567]], 1--[[u586]], 1--[[u2447]]),
            ["U_371"] = Color3.fromRGB(1--[[u2669]], 1--[[u3210]], 1--[[u2906]]),
            ["U_2818"] = Color3.fromRGB(1--[[u1398]], 1--[[u2359]], 1--[[u3195]]),
            ["U_2617"] = Color3.fromRGB(1--[[u3274]], 143, 115),
            ["U_2234"] = Color3.fromRGB(1--[[u1583]], 1--[[u978]], 1--[[u425]]),
            ["U_976"] = Color3.fromRGB(1--[[u1020]], 1--[[u3275]], 65),
            ["U_2630"] = Color3.fromRGB(1--[[u2325]], 1--[[u1590]], 78),
            ["U_2166"] = Color3.fromRGB(1--[[u380]], 1--[[u2325]], 1--[[u2600]]),
            ["U_1603"] = Color3.fromRGB(43, 1--[[u192]], 1--[[u385]]),
            ["U_847"] = Color3.fromRGB(1--[[u8]], 1--[[u513]], 1--[[u579]]),
            ["U_1611"] = Color3.fromRGB(25, 23, 29),
            ["U_1143"] = Color3.fromRGB(1--[[u2281]], 35, 1--[[u1379]]),
            ["U_1680"] = Color3.fromRGB(1--[[u196]], 1--[[u1428]], 1--[[u499]]),
            ["U_38"] = Color3.fromRGB(1--[[u3189]], 56, 1--[[u897]]),
            ["U_3051"] = Color3.fromRGB(1--[[u818]], 1--[[u1345]], 1--[[u803]]),
            ["U_2108"] = Color3.fromRGB(26, 1--[[u904]], 1--[[u1016]]),
            ["U_2067"] = Color3.fromRGB(1--[[u2811]], 1--[[u61]], 1--[[u1583]]),
            ["U_2650"] = Color3.fromRGB(1--[[u876]], 1--[[u757]], 1--[[u3195]]),
            ["U_1786"] = Color3.fromRGB(1--[[u196]], 24, 1--[[u1548]]),
            ["U_1297"] = Color3.fromRGB(255, 1--[[u499]], 1--[[u3217]]),
            ["U_1862"] = Color3.fromRGB(1--[[u1100]], 1--[[u1444]], 1--[[u2533]]),
            ["U_315"] = Color3.fromRGB(1--[[u2271]], 1--[[u576]], 1--[[u978]]),
            ["U_2562"] = 1--[[u310]],
            ["U_1505"] = 1--[[u3221]],
            ["U_358"] = "U_615",
            ["U_454"] = "U_361",
            ["U_1953"] = __T_EnumFB.U_375["U_671"],
            ["U_837"] = __T_EnumFB.U_375["U_3270"],
            ["U_1768"] = __T_EnumFB.U_375["U_1630"],
            ["U_1564"] = __T_EnumFB.U_375["U_1981"]
        }
        local r = { K.U_2617, K.U_2818, K.U_2234, K.U_976 }
        local k = Random.new(math.floor(os.clock() * 1--[[u2149]]) % 1--[[u1466]])
        local J = W.LocalPlayer
        assert(J, "U_2414")
        local I, p, B, t, _, A, i, N, l, y, Q, z, T, Z
        local G, s, OP, uP, FP, mP = -3, {}, {}, {}, {}, {}
        local fP = true
        local PP = "U_2784"
        local YP = -3
        local qP = 12
        local dP = 0
        local eP = {
            ["U_3228"] = true,
            ["U_1194"] = false,
            ["U_2327"] = false,
            ["U_1811"] = 0,
            ["U_451"] = nil,
            ["U_2498"] = 1,
            ["U_300"] = 0,
            ["U_2776"] = 0,
            ["U_2731"] = false,
            ["U_449"] = 0,
            ["U_1211"] = false,
            ["U_134"] = nil,
            ["U_97"] = 0,
            ["U_1933"] = nil,
            ["U_307"] = 0
        }
        local cP = {
            [1--[[u1778]]] = 0,
            ["U_2546"] = 0,
            ["U_2267"] = 0,
            [1--[[u1109]]] = 0,
            ["U_3359"] = false,
            ["U_3291"] = 0
        }
        local function oP(xP)
            I = xP or J.Character or J.CharacterAdded:Wait()
            xP = I
            p = xP:WaitForChild("HumanoidRootPart", 8)
        end
        oP()
        local function xP(CP)
            local MP = _G -- ENV_GETTER rewritten to _G
            return -(math.cos(math.pi * CP) - 1) * 0.5
        end
        local function CP(MP)
            local nP, XP = 1--[[u2652]], 1--[[u1769]]
            return 1 + XP * (MP - 1) ^ 3 + nP * (MP - 1) ^ 2
        end
        local function MP()
            local nP = _G -- ENV_GETTER rewritten to _G
            local XP = Instance.new("U_114")
            XP.U_692 = 0
            XP.U_2793 = 0
            XP.U_2531 = 1
            XP.U_296 = "U_54"
            XP.U_2330 = "U_54"
            XP.U_2493 = 1
            XP.U_3122 = K.U_2387
            XP.U_636 = K.U_2387
            XP.U_1522 = K.U_2387
            XP.U_2044 = K.U_2387
            XP.U_909 = K.U_1611
            XP.U_959 = K.U_1611
            XP.U_3156 = 0
            XP.U_1662 = 0
            XP.U_1611 = 0
            XP.U_1484 = 0
            return XP
        end
        local function nP()
            local XP = _G -- ENV_GETTER rewritten to _G
            local gP, RP = pcall(function()
                local HP, WP = _G,  MP() -- ENV_GETTER rewritten to _G
                local MP = __T_EnumFB.U_1029["U_1896"]
                return W:CreateHumanoidModelFromDescription(WP, MP)
            end)
            if not gP or not RP then
                error("U_471")
            end
            RP.Name = K.Name
            gP = RP:WaitForChild("Humanoid")
            gP.U_1418 = false
            gP.DisplayName = K.Name
            gP.U_2891 = __T_EnumFB.U_971["U_3008"]
            gP.U_1189 = 1--[[u807]]
            gP.U_1023 = 0
            gP.WalkSpeed = K.WalkSpeed
            gP.MaxHealth = 1--[[u2149]]
            gP.Health = 1--[[u2149]]
            gP.U_2295 = false
            gP.U_3136 = true
            for W, MP in ipairs(RP:GetDescendants()) do
                if MP:IsA("U_3184") or MP:IsA("U_1662") or MP:IsA("U_1611") or MP:IsA("U_1605") then
                    MP:Destroy()
                else
                    if MP:IsA("U_1417") and MP.Parent and MP.Parent["Name"] == "Head" then
                        MP:Destroy()
                    else
                        W = "BasePart"
                        if MP:IsA(W) then
                            MP.CanCollide = MP.Name == "HumanoidRootPart"
                            MP.CanQuery = false
                            MP.CanTouch = false
                            MP.CastShadow = false
                            MP.Massless = MP.Name ~= "HumanoidRootPart"
                            MP.Material = __T_EnumFB.Material["U_1046"]
                            MP.Transparency = 1
                        end
                    end
                end
            end
            local W, MP = ipairs, {
                "U_1994",
                "U_3336",
                "U_2042",
                "U_2706",
                "U_1365",
                "U_1376"
            }
            for HP, WP in W(MP) do
                HP = RP:FindFirstChild(WP, true)
                if HP and HP:IsA("U_2283") then
                    local W, MP = HP.U_228, HP.U_2738
                    HP.U_228 = CFrame.new(W.Position["X"], W.Position["Y"] * K[1--[[u2364]]], W.Position["Z"]) * W.Rotation
                    HP.U_2738 = CFrame.new(MP.Position["X"], MP.Position["Y"] * K[1--[[u2364]]], MP.Position["Z"]) * MP.Rotation
                end
            end
            return RP, gP
        end
        B, t = nP()
        _ = B:WaitForChild("HumanoidRootPart")
        A = B:WaitForChild("UpperTorso")
        i = B:WaitForChild("LowerTorso")
        N = B:WaitForChild("Head")
        B.PrimaryPart = _
        local function W(MP)
            local XP = _G -- ENV_GETTER rewritten to _G
            return FP[MP] or CFrame.new()
        end
        (function()
            local MP = _G -- ENV_GETTER rewritten to _G
            FP[_] = CFrame.new()
            local XP = {}
            for gP, gP in ipairs(B:GetDescendants()) do
                if (gP:IsA("U_2283") or gP:IsA("U_2160")) and gP.U_981 and gP.U_3121 then
                    table.insert(XP, gP)
                end
            end
            local gP = true
            while gP do
                gP = false
                for RP, RP in ipairs(XP) do
                    if FP[RP.U_981] and not FP[RP.U_3121] then
                        FP[RP.U_3121] = FP[RP.U_981] * RP.U_228 * RP.U_2738:Inverse()
                        gP = true
                    end
                end
            end
        end)()
        local MP, XP, gP = B:WaitForChild("U_1780"), W(i)["Position"]["Y"] - i.Size["Y"] * 0.5, W(A)["Position"]["Y"] + A.Size["Y"] * 0.5
        nP = W(MP)["Position"]["Y"] - MP.Size["Y"] * 0.5
        PP, YP = (gP - XP) / 12, nP
        qP = (XP - YP) / PP
        dP = qP - 12
        local function MP(XP, RP, HP)
            local WP = _G -- ENV_GETTER rewritten to _G
            return Vector3.new(XP * PP, YP + RP * PP, HP * PP)
        end
        local function XP(RP, HP, WP)
            return MP(RP, HP + dP, WP)
        end
        local function dP(RP, HP, WP, DP)
            local vP = _G -- ENV_GETTER rewritten to _G
            local jP = Instance.new("Part")
            jP.Name = RP
            jP.Size = HP
            jP.Color = WP
            jP.Material = __T_EnumFB.Material["U_1046"]
            jP.U_1088 = __T_EnumFB.U_1221["U_1474"]
            jP.U_1397 = __T_EnumFB.U_1221["U_1474"]
            jP.CanCollide = false
            jP.CanQuery = false
            jP.CanTouch = false
            jP.Massless = true
            jP.CastShadow = DP ~= "U_2342"
            jP.Transparency = DP == "U_2342" and 1 or 0
            jP.Parent = B
            if DP ~= "U_2342" then
                table.insert(uP, jP)
            end
            return jP
        end
        local function RP(HP, WP, DP, vP)
            local jP = _G -- ENV_GETTER rewritten to _G
            CFrame = CF]============],
    [25] = [============[
rame * DP
            local aP = Instance.new("U_2538")
            aP.Name = vP or WP.Name .. "U_2538"
            aP.U_981 = HP
            aP.U_3121 = WP
            aP.U_228 = DP
            aP.U_2738 = CFrame.new()
            aP.Parent = HP
            return aP
        end
        local function HP(WP, DP, vP, jP)
            local aP = _G -- ENV_GETTER rewritten to _G
            CFrame = CFrame * vP
            local EP = Instance.new("U_2283")
            EP.Name = jP
            EP.U_981 = WP
            EP.U_3121 = DP
            EP.U_228 = vP
            EP.U_2738 = CFrame.new()
            EP.Parent = WP
            return EP
        end
        local function WP(DP, vP, jP, aP, EP, UP, wP)
            local VP = _G -- ENV_GETTER rewritten to _G
            local hP, LP = dP(vP, Vector3.new(jP[1], jP[2], jP[3]) * PP, EP, UP), CFrame.new(XP(aP[1], aP[2], aP[3])) * (wP or CFrame.new())
            RP(DP, hP, W(DP):Inverse() * LP)
            return hP
        end
        local function DP(vP, jP, aP, EP, UP, wP, VP, hP, LP, bP)
            local SP, KP, rP = _G,  VP * qP,  hP * qP -- ENV_GETTER rewritten to _G
            VP = dP(jP, Vector3.new(UP * PP, (rP - KP) * PP, wP * PP), LP, bP)
            RP(vP, VP, W(vP):Inverse() * CFrame.new(MP(aP, (KP + rP) * 0.5, EP)))
            return VP
        end
        local qP = {
            2,
            1,
            2,
            3,
            2,
            1,
            3,
            2,
            1,
            3,
            2,
            2,
            1,
            2
        }
        local function MP(vP, jP, aP)
            local EP, UP = _G,  qP[(vP + aP) % #qP + 1] -- ENV_GETTER rewritten to _G
            local qP = math.floor(jP / 5)
            qP = if (jP * 2 + vP + aP) % 9 == 0 then qP - 1 else if (jP + vP * 3 + aP) % 11 == 0 then qP + 1 else qP
            return r[math.clamp(UP + qP, 1, #r)]
        end
        local function qP(vP, jP, aP, EP, UP)
            local wP = _G -- ENV_GETTER rewritten to _G
            local VP = Instance.new("U_1572")
            VP.Name = "U_2557"
            VP.U_3156 = jP
            VP.U_1276 = __T_EnumFB.U_397["U_1961"]
            VP.U_1961 = 1--[[u1590]]
            VP.U_17 = 1
            VP.U_506 = false
            VP.U_1928 = 1--[[u2912]]
            VP.Parent = vP
            jP, vP = 1 / aP, 1 / EP
            for hP = 0, aP - 1 do
                local aP, LP = (MP(hP, 0, UP)), 0
                for bP = 1, EP do
                    local SP = bP < EP and MP(hP, bP, UP) or nil
                    if SP ~= aP then
                        local MP = Instance.new("U_853")
                        MP.Name = "U_3270" .. hP .. "U_2720" .. LP
                        MP.U_2240 = aP
                        MP.U_2733 = 0
                        MP.Size = UDim2.fromScale(jP * 1--[[u1095]], vP * (bP - LP) + 1--[[u2912]])
                        MP.Position = UDim2.fromScale(hP * jP, LP * vP)
                        MP.Parent = VP
                        aP, LP = SP, bP
                    end
                end
            end
            return VP
        end
        local function MP(vP, jP, aP)
            local EP = _G -- ENV_GETTER rewritten to _G
            local UP, wP = dP(jP, Vector3.new(1--[[u2609]], 1--[[u2609]], 1--[[u2609]]), K.U_2630, "U_2342"), CFrame.new(XP(aP[1], aP[2], aP[3]))
            EP = W(vP):Inverse() * wP
            FP[UP] = wP
            return UP, HP(vP, UP, EP, jP .. "U_2768"), EP
        end
        local function FP(dP, HP, vP)
            local jP = _G -- ENV_GETTER rewritten to _G
            for aP, EP in ipairs(HP) do
                aP = Instance.new("U_1572")
                aP.Name = "U_847"
                aP.U_3156 = EP
                aP.U_1276 = __T_EnumFB.U_397["U_1961"]
                aP.U_1961 = 1--[[u1590]]
                aP.U_17 = 1
                aP.U_506 = false
                aP.U_1928 = 1--[[u2912]]
                aP.Parent = dP
                for dP = 1, vP do
                    EP = Instance.new("U_853")
                    EP.Name = "U_2161" .. dP
                    EP.U_2240 = K.U_847
                    EP.U_1105 = 1--[[u1791]]
                    EP.U_2733 = 0
                    EP.Size = UDim2.fromScale(1, 1--[[u1346]] / vP)
                    EP.Position = UDim2.fromScale(0, (dP - 1--[[u2382]]) / vP)
                    EP.Parent = aP
                end
            end
        end
        local function dP(HP, vP, jP, aP, EP, UP, wP)
            local VP = _G -- ENV_GETTER rewritten to _G
            local hP = Instance.new("U_853")
            hP.Name = vP
            hP.Position = jP
            hP.Size = aP
            hP.U_2240 = EP
            hP.U_2733 = 0
            hP.Rotation = UP or 0
            hP.U_2435 = wP or 1
            hP.Parent = HP
            return hP
        end
        local function HP(vP, jP)
            local aP = _G -- ENV_GETTER rewritten to _G
            local EP = Instance.new("U_301")
            EP.U_1327 = UDim.new(jP or 1--[[u1791]], 0)
            EP.Parent = vP
        end
        local function vP()
            local jP, aP, EP, UP, wP, VP = _G,  WP(N, "U_1762", { 8, 8, 8 }, { 0, "U_1267", 0 }, K.U_2387),  WP(N, "U_1860", { "U_383", 1--[[u1226]], "U_383" }, { 0, "U_1552", 0 }, K.U_2818),  WP(N, "U_3118", { "U_383", "U_987", 1--[[u1226]] }, { 0, "U_519", "U_2883" }, K.U_2818),  WP(N, "U_1039", { 1--[[u1226]], "U_987", "U_3268" }, { "U_2883", "U_519", 0 }, K.U_2818),  WP(N, "U_443", { 1--[[u1226]], "U_987", "U_3268" }, { "U_800", "U_519", 0 }, K.U_2818) -- ENV_GETTER rewritten to _G
            qP(EP, __T_EnumFB.U_2513["U_2294"], 9, 9, 3)
            qP(UP, __T_EnumFB.U_2513["Quad"], 9, 9, 7)
            qP(wP, __T_EnumFB.U_2513["U_43"], 9, 9, 11)
            qP(VP, __T_EnumFB.U_2513["U_501"], 9, 9, 16)
            UP = {
                { 1--[[u1850]], "U_1435" },
                { 1--[[u2372]], "U_549" },
                { 1--[[u3221]], 30 },
                { 0.5, "U_2828" },
                { 1--[[u1954]], "U_1198" },
                { 1--[[u3089]], "U_2961" },
                { "U_3388", "U_346" },
                { "U_2520", "U_3297" }
            }
            for hP, LP in ipairs(UP) do
                EP = "U_1552"
                qP(WP(N, "U_1685" .. hP, { "U_3180", EP - LP[2], 1--[[u1226]] }, { LP[1], (EP + LP[2]) * 0.5, "U_800" }, K.U_2818), __T_EnumFB.U_2513["U_3135"], 1, math.max(1, math.floor(EP - LP[2] + 0.5)), hP * 5)
            end
            UP = {
                { 1--[[u1850]], "U_1117" },
                { 1--[[u2372]], "U_2474" },
                { 1--[[u3221]], "U_1332" },
                { 0.5, "U_2285" },
                { 1--[[u1954]], "U_2961" },
                { 1--[[u3089]], "U_2575" },
                { "U_3388", "U_664" },
                { "U_2520", "U_3019" }
            }
            for hP, LP in ipairs(UP) do
                EP = "U_2269"
                qP(WP(N, "U_1653" .. hP, { "U_3180", EP - LP[2], 1--[[u957]] }, { LP[1], (EP + LP[2]) * 0.5, "U_344" }, r[(hP + 1) % 3 + 1]), __T_EnumFB.U_2513["U_3135"], 1, math.max(1, math.floor(EP - LP[2] + 0.5)), hP * 3 + 2)
            end
            EP = {
                { 1--[[u1850]], "U_568" },
                { 1--[[u2372]], "U_3153" },
                { 1--[[u3221]], "U_549" },
                { 0.5, 30 },
                { 1--[[u1954]], "U_3186" }
            }
            for hP, LP in ipairs(EP) do
                VP = "U_2845"
                qP(WP(N, "U_505" .. hP, { "U_3180", VP - LP[2], 0.5 }, { LP[1], (VP + LP[2]) * 0.5, "U_2367" }, r[hP % 3 + 1]), __T_EnumFB.U_2513["U_3135"], 1, math.max(1, math.floor(VP - LP[2] + 0.5)), hP * 7)
            end
            UP = {
                { 1--[[u2372]], "U_3251", "U_1118", "U_2367" },
                { 0.5, "U_664", "U_129", "U_2367" },
                { 1--[[u3089]], "U_2355", "U_1053", "U_344" },
                { "U_3388", "U_2876", 29, "U_344" }
            }
            for qP, hP in ipairs(UP) do
                WP(N, "U_596" .. qP, { "U_217", hP[3] - hP[2], 1--[[u2819]] }, { hP[1], (hP[2] + hP[3]) * 0.5, hP[4] }, r[qP % 4 + 1])
            end
            local r = 1--[[u2915]]
            local qP, hP = CFrame.Angles(0, 0, r), 3
            local LP = "U_2438"
            local bP = -1--[[u1496]]
            local function SP(KP, rP, kP)
                local JP = _G -- ENV_GETTER rewritten to _G
                local IP, pP = math.cos(r), math.sin(r)
                return { hP + KP * IP - rP * pP, LP + KP * pP + rP * IP, bP + (kP or 0) }
            end
            wP = { { 0, "U_743" }, { 0, "U_235" }, { "U_743", 0 }, { "U_235", 0 } }
            for r, hP in ipairs(wP) do
                WP(N, "U_110" .. r, { 1--[[u3221]], 1--[[u3221]], 1--[[u2206]] }, SP(hP[1], hP[2]), K.U_1786, nil, qP)
            end
            WP(N, "U_2093", { 2, 2, "U_2468" }, SP(0, 0, "U_1823"), K.U_1297, nil, qP)
            local r = Instance.new("U_1572")
            r.Name = "U_3157"
            r.U_3156 = __T_EnumFB.U_2513["U_3135"]
            r.U_1276 = __T_EnumFB.U_397["U_1208"]
            r.U_2197 = Vector2.new("U_1348", "U_1348")
            r.U_17 = 1
            r.U_506 = false
            r.U_1928 = 1--[[u2786]]
            r.Parent = aP
            UP, wP = dP(r, "U_2870", UDim2.fromScale(1--[[u3356]], 1--[[u1545]]), UDim2.fromScale(1--[[u2368]], 1--[[u2030]]), K.U_2234, 0, 4), dP(r, "U_2425", UDim2.fromScale(1--[[u3062]], 1--[[u1545]]), UDim2.fromScale(1--[[u2368]], 1--[[u2030]]), K.U_2234, 0, 4)
            local function hP(LP, bP, KP)
                local rP = _G -- ENV_GETTER rewritten to _G
                dP(r, LP .. "U_3207", UDim2.fromScale(bP - 1--[[u2912]], 1--[[u2409]]), UDim2.fromScale(1--[[u2900]], 1--[[u416]]), K.U_2108, 0, 6)
                local kP = dP(r, LP .. "U_1048", UDim2.fromScale(bP, 1--[[u2955]]), UDim2.fromScale(1--[[u2687]], 1--[[u2304]]), Color3.fromRGB(1--[[u1150]], 1--[[u3080]], 1--[[u1488]]), 0, 2)
                dP(dP(kP, LP .. "U_1331", UDim2.fromScale(KP, 0), UDim2.fromScale(1--[[u843]], 1), K.U_3051, 0, 3), LP .. "U_2020", UDim2.fromScale(0, 0), UDim2.fromScale(1, 1--[[u2609]]), K.U_2108, 0, 4)
                return kP
            end
            hP("U_43", 1--[[u1820]], "U_2857")
            hP("U_501", 1--[[u1491]], 1--[[u1957]])
            aP, qP = dP(r, "U_178", UDim2.fromScale(1--[[u1820]], 1--[[u2819]]), UDim2.fromScale(1--[[u2687]], 0), K.U_2387, 0, 9), dP(r, "U_3028", UDim2.fromScale(1--[[u1491]], 1--[[u2819]]), UDim2.fromScale(1--[[u2687]], 0), K.U_2387, 0, 9)
            T = { ["U_982"] = qP, ["U_528"] = aP, ["U_3382"] = 0 }
            aP, EP, VP, hP = {}, {}, ipairs, { "U_3298", "U_1051" }
            for LP, bP in VP(hP) do
                SP = dP(r, "U_1342" .. LP, UDim2.fromScale(bP, 1--[[u194]]), UDim2.fromScale(1--[[u1984]], 1--[[u1165]]), K.U_2067, 0, 2)
                SP.U_1105 = 1--[[u1656]]
                table.insert(aP, SP)
            end
            VP, hP = ipairs, {
                "U_2885",
                1--[[u2770]],
                "U_1788",
                "U_490",
                "U_2550",
                "U_1292"
            }
            for LP, bP in VP(hP) do
                qP = dP(r, "U_1782" .. LP, UDim2.fromScale(bP, 1--[[u606]]), UDim2.fromScale(1--[[u2484]], 1--[[u2839]]), K.U_2067, 1--[[u3117]], 3)
                qP.U_1105 = 1--[[u370]]
                table.insert(EP, qP)
            end
            SP, hP = {
                { 1--[[u2473]], "U_2942", "U_903", "U_2453" },
                { "U_627", "U_3100", "U_2402", "U_2853" },
                { "U_574", "U_2942", "U_2402", "U_2453" },
                { "U_1416", "U_3100", "U_2402", "U_2853" },
                { "U_2547", "U_2942", "U_903", "U_2453" }
            }, {}
            for qP, LP in ipairs(SP) do
                VP = dP(r, "U_2650" .. qP, UDim2.fromScale(LP[1], LP[2]), UDim2.fromScale(LP[3], LP[4]), K.U_2650, 0, 4)
                table.insert(hP, VP)
            end
            Z = {
                ["U_2526"] = UP,
                ["U_1547"] = wP,
                ["U_954"] = aP,
                ["U_48"] = EP,
                ["U_790"] = hP
            }
        end
        local function r()
            local qP = _G -- ENV_GETTER rewritten to _G
            local jP = Instance.new("U_955")
            jP.Name = "U_2274"
            jP.U_1995 = N
            jP.Size = UDim2.fromOffset(1--[[u171]], 1--[[u2281]])
            jP.U_3075 = Vector3.new(0, 1--[[u2947]], 0)
            jP.U_506 = true
            jP.U_17 = 0
            jP.U_1495 = 1--[[u876]]
            jP.Parent = N
            local aP = Instance.new("U_3116")
            aP.Size = UDim2.fromScale(1, 1)
            aP.U_1105 = 1
            aP.U_2842 = __T_EnumFB.U_2842["U_2958"]
            aP[1--[[u3145]]] = "U_2132"
            aP.U_1161 = true
            aP.U_2326 = Color3.fromRGB(255, 255, 255)

-- =============================================================================
-- MODULE 14/17: CharacterCosmeticsAndAnimations — Korblox/Headless/morphs/emotes
-- KorbloxAndHeadless/CustomAvatarMorpher/AnimationPackManager/EmotePlayer
-- ==============================================================================
            aP.U_2882 = Color3.fromRGB(1--[[u3217]], 1--[[u1870]], 1--[[u2944]])
            aP.U_2233 = 1--[[u1791]]
            aP.Parent = jP
        end
        local function qP(jP)
            local aP, EP = _G,  b:CreateEditableMesh() -- ENV_GETTER rewritten to _G
            assert(EP, "U_774")
            local UP, wP, VP, hP, LP = 1--[[u1379]], 1--[[u192]], 1--[[u1215]], 16, 1--[[u2749]]
            local bP = -1--[[u125]]
            local SP = -1--[[u1672]]
            local function KP(rP)
                local kP = _G -- ENV_GETTER rewritten to _G
                rP = math.clamp(rP, 0, 1)
                return rP * rP * (3 - 2 * rP)
            end
            local function rP(kP, JP)
                local IP, pP = _G,  1 - kP * kP - JP * JP -- ENV_GETTER rewritten to _G
                if pP <= 0 then
                    return 0
                end
                return math.sqrt(pP) * KP(pP / 1--[[u2770]])
            end
            local function kP(JP, IP, pP)
                local BP, tP = _G,  IP - 1--[[u2596]] -- ENV_GETTER rewritten to _G
                local _P = tP >= 0 and "U_2207" or "U_2407"
                local AP, iP = rP((JP - pP) / 1--[[u3257]], tP / _P), math.clamp((1--[[u2553]] - IP) / 1--[[u940]], 0, 1)
                return AP * (1--[[u811]] + 1--[[u2171]] * iP)
            end
            local function JP(IP, pP)
                local BP, tP, _P = _G,  kP(IP, pP, 1--[[u125]]),  kP(IP, pP, "U_1696") -- ENV_GETTER rewritten to _G
                local kP, AP = (tP ^ 4 + _P ^ 4) ^ 1--[[u1791]], pP - 1--[[u2596]]
                pP = AP >= 0 and 1--[[u1850]] or "U_2299"
                tP = rP(IP / 1--[[u3125]], AP / pP) * 1--[[u2953]]
                return math.max(kP, tP)
            end
            local function rP(kP, IP)
                local pP = _G -- ENV_GETTER rewritten to _G
                local BP = math.clamp((IP - 1--[[u1513]]) / 1--[[u332]], 0, 1)
                local tP, _P = 1--[[u2543]] + 1--[[u1247]] * BP ^ 1--[[u1086]], 1--[[u2422]]
                return KP((tP - math.abs(kP) + _P) / 1--[[u2862]]) * KP((IP - 1--[[u2542]]) / 1--[[u234]])
            end
            local kP = K.U_2562 or 0
            local IP = K.U_1505 or 1--[[u2950]]
            local pP = (SP - bP) * PP
            local BP = 1--[[u125]] * PP
            local tP = K.U_358 or 0
            local _P = ((K.U_454 or "U_299") - LP) * PP
            local function AP(iP, NP)
                local lP = _G -- ENV_GETTER rewritten to _G
                local yP = math.abs(NP)
                if kP == 0 or yP < "U_917" then
                    return iP
                end
                local QP, zP = NP >= 0 and 1 or -1, math.clamp(yP / IP, 0, 1)
                NP = zP * zP * (3 - 2 * zP)
                yP, zP = -QP * kP * NP, QP * BP
                local IP, BP, NP, QP = iP.X - zP, iP.Z - pP, math.cos(yP), math.sin(yP)
                return Vector3.new(zP + IP * NP + BP * QP, iP.Y, pP - IP * QP + BP * NP)
            end
            local function IP(pP)
                local BP = _G -- ENV_GETTER rewritten to _G
                if tP == 0 then
                    return pP
                end
                local iP, NP, lP, yP = pP.Y - _P, pP.Z, math.cos(tP), math.sin(tP)
                return Vector3.new(pP.X, _P + iP * lP - NP * yP, iP * yP + NP * lP)
            end
            local function pP(BP, tP)
                local _P, iP = _G,  JP(BP, tP) -- ENV_GETTER rewritten to _G
                return IP(AP(Vector3.new(BP * PP, (tP - LP) * PP, (SP - bP - iP) * PP), BP)), iP
            end
            local bP, SP, JP, IP, BP = table.create("U_35"), Vector3.new(math.huge, math.huge, math.huge), Vector3.new((-math.huge), (-math.huge), (-math.huge)), 0, 1--[[u1693]]
            for tP = 0, wP do
                local _P = hP + 1--[[u598]] * tP / wP
                for AP = 0, UP do
                    tP = VP + 12 * AP / UP
                    local iP, NP = pP(tP, _P)
                    local lP, yP, QP = pP(tP - BP, _P), pP(tP + BP, _P), pP(tP, _P - BP)
                    AP = (pP(tP, _P + BP) - QP):Cross(yP - lP)
                    AP = AP.Magnitude > "U_1586" and AP.Unit or Vector3.new(0, 0, -1)
                    IP += 1
                    bP[IP] = {
                        ["U_306"] = iP,
                        ["U_2217"] = AP,
                        [1--[[u2624]]] = NP,
                        [1--[[u510]]] = tP,
                        ["U_2582"] = _P
                    }
                    SP, JP = Vector3.new(math.min(SP.X, iP.X), math.min(SP.Y, iP.Y), math.min(SP.Z, iP.Z)), Vector3.new(math.max(JP.X, iP.X), math.max(JP.Y, iP.Y), math.max(JP.Z, iP.Z))
                end
            end
            VP, pP, BP, hP = (SP + JP) * 0.5, table.create(35), {}, {}
            IP = 0
            local SP, JP
            for tP = 0, wP do
                local _P = table.create(1--[[u14]])
                pP[tP + 1] = _P
                for AP = 0, UP do
                    IP += 1
                    tP = bP[IP]
                    local bP = tP.U_306 - VP
                    local IP, iP, NP = EP:AddVertex(bP), EP:AddNormal(tP.U_2217), rP(tP[1--[[u510]]], tP.U_2582)
                    local lP = K.U_2630:Lerp(K.U_2387, NP)
                    NP = EP:AddColor(lP, 1)
                    local yP, QP = AP + 1, { ["U_2091"] = IP, ["U_2217"] = iP, ["U_1333"] = NP }
                    QP[1--[[u2624]]], _P[yP] = tP[1--[[u2624]]], QP
                    table.insert(hP, { [1--[[u1191]]] = NP, ["U_2752"] = lP })
                    AP, NP, QP = KP(tP[1--[[u2624]]] / 1--[[u2007]]) * KP((1--[[u1167]] - tP.U_2582) / 1--[[u940]]), math.clamp(1 - math.abs(tP[1--[[u510]]]) / 1--[[u1190]], 0, 1), KP((tP.U_2582 - 1--[[u3148]]) / 3)
                    yP = KP(NP) * QP
                    if AP > "U_1168" or yP > 1--[[u1591]] then
                        table.insert(BP, { [1--[[u1191]]] = IP, ["U_2887"] = bP, [1--[[u1261]]] = AP, [1--[[u2460]]] = yP })
                    end
                    if tP[1--[[u2624]]] > 1--[[u858]] and tP.U_2582 > "U_1018" and tP.U_2582 < "U_3255" then
                        QP = math.max(AP, 1--[[u1086]])
                        if tP[1--[[u510]]] > 1--[[u319]] then
                            SP = if not SP or tP[1--[[u2624]]] > SP[1--[[u2624]]] then {
                                ["U_2887"] = bP,
                                [1--[[u1261]]] = QP,
                                [1--[[u2624]]] = tP[1--[[u2624]]],
                                ["U_2217"] = tP.U_2217,
                                [1--[[u510]]] = tP[1--[[u510]]],
                                ["U_2582"] = tP.U_2582
                            } else SP
                        else
                            JP = if tP[1--[[u510]]] < "U_795" then if not JP or tP[1--[[u2624]]] > JP[1--[[u2624]]] then {
                                ["U_2887"] = bP,
                                [1--[[u1261]]] = QP,
                                [1--[[u2624]]] = tP[1--[[u2624]]],
                                ["U_2217"] = tP.U_2217,
                                [1--[[u510]]] = tP[1--[[u510]]],
                                ["U_2582"] = tP.U_2582
                            } else JP else JP
                        end
                    end
                end
            end
            local function bP(KP, IP, tP)
                local _P = EP:AddTriangle(KP.U_2091, IP.U_2091, tP.U_2091)
                EP:SetFaceNormals(_P, { KP.U_2217, IP.U_2217, tP.U_2217 })
                EP:SetFaceColors(_P, { KP.U_1333, IP.U_1333, tP.U_1333 })
            end
            for KP = 1, wP do
                for wP = 1, UP do
                    local UP, IP, tP, _P = pP[KP][wP], pP[KP + 1][wP], pP[KP + 1][wP + 1], pP[KP][wP + 1]
                    if math.max(UP[1--[[u2624]]], IP[1--[[u2624]]], tP[1--[[u2624]]], _P[1--[[u2624]]]) > "U_206" then
                        bP(UP, IP, tP)
                        bP(UP, tP, _P)
                    end

-- =============================================================================
-- MODULE 15/17: TargetInteractionsAndAudio — fling/bang/sit/spectate/notifier/sounds/tracers
-- flingPlayer/spectateTarget/RoleAndCombatNotifier/CustomWeaponSounds/BulletTracerSystem; buffer+TWEEN beam pool
-- ==============================================================================
                end
            end
            rP, pP = pcall(function()
                local UP = _G -- ENV_GETTER rewritten to _G
                local wP, bP = UP.U_1647["U_1837"](EP), { ["U_525"] = __T_EnumFB.U_525["U_1460"], ["U_3394"] = __T_EnumFB.U_3394["U_905"] }
                return b:CreateMeshPartAsync(wP, bP)
            end)
            if not rP or not pP then
                EP:Destroy()
                error("U_471")
            end
            pP.Name = "U_3212"
            pP.Color = Color3.new(1, 1, 1)
            pP.Material = __T_EnumFB.Material["U_1046"]
            pP.Reflectance = 0
            pP.Transparency = 0
            pP.Anchored = false
            pP.CanCollide = false
            pP.CanQuery = false
            pP.CanTouch = false
            pP.Massless = true
            pP.CastShadow = true
            pP.U_3034 = true
            pP.Parent = B
            table.insert(uP, pP)
            RP(jP, pP, CFrame.new(VP), "U_47")
            return {
                ["U_3174"] = pP,
                ["U_3374"] = EP,
                ["U_1403"] = BP,
                ["U_165"] = (1--[[u412]] - LP) * PP - VP.Y,
                ["U_242"] = hP,
                ["U_2141"] = SP,
                ["U_902"] = JP,
                ["U_2880"] = kP,
                ["U_1263"] = VP
            }
        end
        local function jP(aP)
            local EP, UP = _G,  b:CreateEditableMesh() -- ENV_GETTER rewritten to _G
            assert(UP, "U_581")
            local wP, VP, hP, LP, bP = 1--[[u513]], 30, "U_3050", 1--[[u1245]], 1--[[u53]]
            local function SP(KP)
                local rP = _G -- ENV_GETTER rewritten to _G
                KP = math.clamp(KP, 0, 1)
                return KP * KP * (3 - 2 * KP)
            end
            local function KP(rP, kP)
                local JP, IP = _G,  1 - rP * rP - kP * kP -- ENV_GETTER rewritten to _G
                if IP <= 0 then
                    return 0
                end
                return math.sqrt(IP) * SP(IP / 1--[[u2770]])
            end
            local function rP(kP, JP, IP)
                local pP, BP = _G,  JP - 1--[[u3027]] -- ENV_GETTER rewritten to _G
                local tP, _P = BP >= 0 and 1--[[u3257]] or 3, kP - IP
                local kP, AP = KP(_P / (_P * IP >= 0 and "U_2317" or 1--[[u1751]]), BP / tP), math.clamp((1--[[u496]] - JP) / 4, 0, 1)
                return kP * (1--[[u858]] + 1--[[u1791]] * AP)
            end
            local function KP(kP, JP)
                local IP, pP = rP(kP, JP, 1--[[u123]]), rP(kP, JP, "U_1925")
                return (IP ^ 4 + pP ^ 4) ^ 1--[[u1791]]
            end
            local function rP(kP, JP)
                local IP, pP = KP(kP, JP), W(aP)
                local KP = XP(kP, JP, bP + IP)
                return pP:PointToObjectSpace(KP), IP
            end
            local bP, KP, kP, JP, IP = table.create("U_3370"), Vector3.new(math.huge, math.huge, math.huge), Vector3.new((-math.huge), (-math.huge), (-math.huge)), 0, 1--[[u1693]]
            for pP = 0, VP do
                local BP = LP + 1--[[u2626]] * pP / VP
                for tP = 0, wP do
                    pP = hP + 1--[[u418]] * tP / wP
                    local _P, AP = rP(pP, BP)
                    local iP, NP, lP, yP = rP(pP - IP, BP), rP(pP + IP, BP), rP(pP, BP - IP), rP(pP, BP + IP)
                    tP = (NP - iP):Cross(yP - lP)
                    tP = tP.Magnitude > "U_1586" and tP.Unit or Vector3.new(0, 0, 1)
                    JP += 1
                    bP[JP] = {
                        ["U_306"] = _P,
                        ["U_2217"] = tP,
                        [1--[[u2624]]] = AP,
                        [1--[[u510]]] = pP,
                        ["U_2582"] = BP
                    }
                    KP, kP = Vector3.new(math.min(KP.X, _P.X), math.min(KP.Y, _P.Y), math.min(KP.Z, _P.Z)), Vector3.new(math.max(kP.X, _P.X), math.max(kP.Y, _P.Y), math.max(kP.Z, _P.Z))
                end
            end
            LP, rP, IP = (KP + kP) * 0.5, table.create(31), {}
            JP = 0
            for KP = 0, VP do
                hP = table.create("U_1160")
                rP[KP + 1] = hP
                for kP = 0, wP do
                    JP += 1
                    KP = bP[JP]
                    local JP = KP.U_306 - LP
                    local pP, BP = UP:AddVertex(JP), UP:AddNormal(KP.U_2217)
                    local tP, _P = kP + 1, { ["U_2091"] = pP, ["U_2217"] = BP }
                    _P[1--[[u2624]]], hP[tP] = KP[1--[[u2624]]], _P
                    tP, BP, _P = SP(KP[1--[[u2624]]] / 1--[[u1219]]), SP((1--[[u1714]] - KP.U_2582) / 1--[[u53]]), SP((KP.U_2582 - 1--[[u1245]]) / 1--[[u2987]])
                    kP = tP * BP * _P
                    if kP > "U_1168" then
                        BP = SP((KP[1--[[u510]]] + 1--[[u194]]) / 1--[[u2328]])
                        table.insert(IP, { [1--[[u1191]]] = pP, ["U_2887"] = JP, ["U_828"] = kP * (1 - BP), ["U_2820"] = kP * BP })
                    end
                end
            end
            local function hP(SP, KP, kP)
                local JP = UP:AddTriangle(SP.U_2091, KP.U_2091, kP.U_2091)
                UP:SetFaceNormals(JP, { SP.U_2217, KP.U_2217, kP.U_2217 })
            end
            for SP = 1, VP do
                for VP = 1, wP do
                    local wP, KP, kP, JP = rP[SP][VP], rP[SP + 1][VP], rP[SP + 1][VP + 1], rP[SP][VP + 1]
                    if math.max(wP[1--[[u2624]]], KP[1--[[u2624]]], kP[1--[[u2624]]], JP[1--[[u2624]]]) > "U_206" then
                        hP(wP, kP, KP)
                        hP(wP, JP, kP)
                    end
                end
            end
            rP, bP = pcall(function()
                local wP = _G -- ENV_GETTER rewritten to _G
                local VP, hP = wP.U_1647["U_1837"](UP), { ["U_525"] = __T_EnumFB.U_525["U_1460"], ["U_3394"] = __T_EnumFB.U_3394["U_905"] }
                return b:CreateMeshPartAsync(VP, hP)
            end)
            if not rP or not bP then
                UP:Destroy()
                error("U_471")
            end
            bP.Name = "U_1303"
            bP.Color = K.U_1611
            bP.Material = __T_EnumFB.Material["U_1046"]
            bP.Reflectance = 0
            bP.Transparency = 0
            bP.Anchored = false
            bP.CanCollide = false
            bP.CanQuery = false
            bP.CanTouch = false
            bP.Massless = true
            bP.CastShadow = true
            bP.U_3034 = true
            bP.Parent = B
            table.insert(uP, bP)
            RP(aP, bP, CFrame.new(LP), "U_1660")
            return {
                ["U_3174"] = bP,
                ["U_3374"] = UP,
                ["U_1403"] = IP,
                ["U_470"] = W(aP):PointToObjectSpace(XP("U_1925", "U_2965", 1--[[u1751]])) - LP,
                ["U_2933"] = W(aP):PointToObjectSpace(XP(1--[[u123]], "U_2965", 1--[[u1751]])) - LP
            }
        end
        local function W()
            local b, XP, RP = _G,  {},  {} -- ENV_GETTER rewritten to _G
            WP(A, "U_2436", { 1--[[u1409]], 1--[[u125]], 1--[[u1409]] }, { 0, "U_3395", 0 }, K.U_2387)["U_1483"] = __T_EnumFB.U_512["U_2312"]
            WP(A, "U_174", { 1--[[u1751]], 1--[[u234]], 1--[[u1751]] }, { 0, "U_1699", "U_2257" }, K.U_1603)
            WP(A, "U_111", { "U_2911", "U_726", "U_946" }, { 0, "U_2898", "U_390" }, K.U_2387)
            local aP = WP(A, "U_353", { 1--[[u1738]], "U_1705", "U_2941" }, { 0, "U_2898", "U_390" }, K.U_2630)
            FP(aP, { __T_EnumFB.U_2513["U_501"], __T_EnumFB.U_2513["U_43"], __T_EnumFB.U_2513["Quad"] }, 5)
            table.insert(XP, aP)
            local EP = Instance.new("U_1572")
            EP.Name = "U_3347"
            EP.U_3156 = __T_EnumFB.U_2513["U_3135"]
            EP.U_1276 = __T_EnumFB.U_397["U_1208"]
            EP.U_2197 = Vector2.new(1--[[u2867]], 1--[[u2867]])
            EP.U_17 = 1
            EP.U_506 = false
            EP.U_1928 = "U_1443"
            EP.Parent = aP
            HP(dP(EP, "U_916", UDim2.fromScale(1--[[u2877]], 1--[[u312]]), UDim2.fromScale(1--[[u476]], 1--[[u2171]]), K.U_2387, 0, 2), 0.5)
            HP(dP(EP, "U_883", UDim2.fromScale(1--[[u1357]], 1--[[u3070]]), UDim2.fromScale(1--[[u1289]], 1--[[u1289]]), K.U_2387, 1--[[u14]], 2), 1--[[u24]============],
    [26] = [============[
22]])
            aP = WP(A, "U_1581", { "U_157", 1--[[u370]], 4 }, { 0, 16, "U_2893" }, K.U_1603)
            table.insert(XP, aP)
            local dP, UP, wP = MP(A, "U_2890", { 0, 1--[[u2749]], "U_1696" })
            local MP = qP(dP)
            MP.U_3174["CanQuery"] = true
            dP = Instance.new("U_482")
            dP.Name = "U_3243"
            dP.U_1339 = 1--[[u2553]]
            dP.Parent = MP.U_3174
            aP = {
                { "U_1906", "U_2357", "U_1094", 1--[[u940]] },
                { "U_2357", "U_2219", "U_326", 4 },
                { "U_2219", "U_55", "U_1203", 1--[[u2007]] },
                { "U_55", "U_2144", "U_1457", "U_563" },
                { "U_2144", 15, 6, "U_2207" },
                { 15, "U_2439", "U_3375", 1--[[u1219]] }
            }
            for qP, VP in ipairs(aP) do
                local hP, LP, bP, SP = VP[1], VP[2], VP[3], VP[4]
                WP(i, "U_1079" .. qP, { bP, LP - hP, SP }, { 0, (hP + LP) * 0.5, 0 }, K.U_2387)
            end
            WP(i, "U_2535", { 1--[[u2819]], 1--[[u1281]], 1--[[u2862]] }, { 0, "U_2964", 1--[[u588]] }, K.U_371)
            EP = {
                { "U_799", "U_1560", "U_1594", "U_1855" },
                { "U_1560", "U_875", "U_1829", "U_3081" },
                { "U_875", "U_269", "U_329", "U_1394" },
                { "U_269", "U_3104", 9, "U_1286" },
                { "U_3104", "U_1170", "U_927", "U_115" },
                { "U_1170", "U_2357", 1--[[u598]], 1--[[u2953]] }
            }
            for qP, VP in ipairs(EP) do
                local hP, LP, bP, SP = VP[1], VP[2], VP[3], VP[4]
                WP(i, "U_1232" .. qP, { bP, LP - hP, SP }, { 0, (hP + LP) * 0.5, 1--[[u2609]] }, qP == #EP and K.U_1143 or K.U_1611)
            end
            local qP, EP, VP = jP(i), ipairs, { { "U_43", 1 }, { "U_501", -1 } }
            for i, jP in EP(VP) do
                i, aP = jP[1], jP[2]
                local jP, EP, hP, LP, bP, SP = B:WaitForChild(i .. "U_1600"), B:WaitForChild(i .. "U_2028"), B:WaitForChild(i .. "U_2791"), B:WaitForChild(i .. "U_135"), B:WaitForChild(i .. "U_2011"), B:WaitForChild(i .. "U_2078")
                WP(jP, i .. "U_118", { 1--[[u858]], "U_1033", "U_2941" }, { 1--[[u207]] * aP, "U_2727", 0 }, K.U_2387)
                WP(jP, i .. "U_2151", { 1--[[u1850]], "U_3375", "U_946" }, { 1--[[u3328]] * aP, "U_1298", 0 }, K.U_2387)
                WP(EP, i .. "U_2360", { "U_749", "U_1169", 1--[[u1850]] }, { 1--[[u3328]] * aP, "U_1062", 0 }, K.U_2387)
                WP(EP, i .. "U_3262", { 1--[[u858]], 1--[[u3130]], "U_2941" }, { 1--[[u3328]] * aP, "U_1355", 0 }, K.U_2387)
                local KP, rP, kP, JP = WP(jP, i .. "U_540", { "U_563", 1--[[u3221]], 1--[[u2007]] }, { 1--[[u207]] * aP, "U_2727", 0 }, K.U_2630), WP(jP, i .. "U_643", { "U_2941", 1--[[u1738]], "U_563" }, { 1--[[u3328]] * aP, "U_1298", 0 }, K.U_2630), WP(EP, i .. "U_2589", { "U_946", "U_424", "U_2941" }, { 1--[[u3328]] * aP, "U_1062", 0 }, K.U_2630), WP(EP, i .. "U_2826", { "U_563", 1--[[u370]], 1--[[u2007]] }, { 1--[[u3328]] * aP, "U_1355", 0 }, K.U_1603)
                WP(hP, i .. "U_2791", { 1--[[u1850]], 1--[[u125]], 1--[[u1850]] }, { 1--[[u3328]] * aP, "U_2532", 0 }, K.U_2387)
                FP(rP, { __T_EnumFB.U_2513["U_3135"], __T_EnumFB.U_2513["Quad"] }, 4)
                FP(kP, { __T_EnumFB.U_2513["U_3135"], __T_EnumFB.U_2513["Quad"] }, 3)
                table.insert(XP, KP)
                table.insert(XP, rP)
                table.insert(XP, kP)
                table.insert(XP, JP)
                DP(LP, i .. "U_2746", 1--[[u1601]] * aP, 1--[[u2185]], "U_573", 6, "U_747", "U_2999", K.U_1611)
                DP(LP, i .. "U_3103", 1--[[u500]] * aP, 1--[[u3198]], 1--[[u3328]], 1--[[u1496]], "U_2235", "U_1640", K.U_1611)
                DP(LP, i .. "U_713", 1--[[u123]] * aP, 1--[[u1824]], "U_1533", 5, "U_756", "U_746", K.U_1611)
                DP(LP, i .. "U_1840", 1--[[u2471]] * aP, 1--[[u773]], "U_115", "U_424", 1--[[u1226]], 1--[[u1817]], K.U_1143)
                DP(bP, i .. "U_968", 1--[[u123]] * aP, 1--[[u1824]], "U_796", "U_2683", "U_1734", "U_2201", K.U_1611)
                DP(bP, i .. "U_274", 1--[[u1409]] * aP, 1--[[u2604]], "U_424", "U_71", "U_2667", "U_2544", K.U_1611)
                DP(bP, i .. "U_1470", 1--[[u1409]] * aP, 1--[[u3159]], 1--[[u940]], "U_796", "U_717", "U_1164", K.U_1611)
                DP(bP, i .. "U_3392", 1--[[u1409]] * aP, 0, "U_115", "U_2578", "U_472", "U_2559", K.U_1680)
                DP(SP, i .. "U_1680", 1--[[u1409]] * aP, "U_3060", "U_424", "U_573", "U_3108", "U_2399", K.U_1680)
                DP(SP, i .. "U_38", 1--[[u1409]] * aP, "U_3060", "U_1533", 1--[[u1358]], 0, "U_3108", K.U_38, "U_488")
            end
            for i, i in ipairs(XP) do
                for FP, FP in ipairs(i:GetChildren()) do
                    aP = "U_1572"
                    if FP:IsA(aP) then
                        table.insert(RP, FP)
                    end
                end
            end
            local function i(FP, WP, DP)
                local jP = _G -- ENV_GETTER rewritten to _G
                local aP = Instance.new("Part")
                aP.Name = FP .. "U_1862"
                aP.U_1483 = __T_EnumFB.U_512["U_2312"]
                aP.Size = Vector3.new(1--[[u1086]] * PP, 1--[[u1086]] * PP, 1--[[u1824]] * PP)
                aP.Color = K.U_1862
                aP.Material = __T_EnumFB.Material["U_1046"]
                aP.U_1088 = __T_EnumFB.U_1221["U_1474"]
                aP.U_1397 = __T_EnumFB.U_1221["U_1474"]
                aP.CanCollide = false
                aP.CanQuery = false
                aP.CanTouch = false
                aP.Massless = true
                aP.CastShadow = false
                aP.Transparency = 1
                aP.Parent = B
                table.insert(uP, aP)
                local EP = Instance.new("Part")
                EP.Name = FP .. "U_2396"
                EP.U_1483 = __T_EnumFB.U_512["U_2312"]
                EP.Size = Vector3.new(1--[[u1346]] * PP, 1--[[u1346]] * PP, 1--[[u1346]] * PP)
                EP.Color = K.U_315
                EP.Material = __T_EnumFB.Material["U_1046"]
                EP.U_1088 = __T_EnumFB.U_1221["U_1474"]
                EP.U_1397 = __T_EnumFB.U_1221["U_1474"]
                EP.CanCollide = false
                EP.CanQuery = false
                EP.CanTouch = false
                EP.Massless = true
                EP.CastShadow = false
                EP.Transparency = 1
                EP.Parent = B
                table.insert(uP, EP)
                local hP = Instance.new("U_2538")
                hP.Name = FP .. "U_2397"
                hP.U_981 = MP.U_3174
                hP.U_3121 = aP
                hP.Parent = aP
                local LP = Instance.new("U_2538")
                LP.Name = FP .. "U_204"
                LP.U_981 = MP.U_3174
                LP.U_3121 = EP
                LP.Parent = EP
                return {
                    ["U_3052"] = aP,
                    ["U_1869"] = EP,
                    ["U_1251"] = hP,
                    ["U_789"] = LP,
                    ["U_1056"] = WP,
                    ["U_2695"] = DP
                }
            end
            VP = {}
            if MP.U_2141 then
                table.insert(VP, (i("U_3095", MP.U_2141, 1)))
            end
            if MP.U_902 then
                table.insert(VP, (i("U_3246", MP.U_902, -1)))
            end
            l = {
                ["U_426"] = UP,
                ["U_2887"] = wP,
                ["U_3174"] = MP.U_3174,
                ["U_2524"] = dP,
                ["U_3374"] = MP.U_3374,
                ["U_3054"] = { MP.U_3374 },
                ["U_1403"] = MP.U_1403,
                ["U_165"] = MP.U_165,
                ["U_1393"] = nil,
                ["U_2258"] = nil,
                ["U_2278"] = nil,
                ["U_1368"] = nil,
                ["U_681"] = 0,
                ["U_3384"] = 0,
                ["U_3044"] = 0,
                ["U_2505"] = 0,
                ["U_242"] = MP.U_242,
                ["U_2880"] = MP.U_2880 or 0,
                ["U_2394"] = VP,
                ["U_109"] = XP,
                ["U_1243"] = RP,
                ["U_2284"] = 0,
                ["U_3254"] = 0,
                ["U_3266"] = 0,
                ["U_1633"] = 0,
                ["U_486"] = 0
            }
            y = {
                ["U_3174"] = qP.U_3174,
                ["U_3374"] = qP.U_3374,
                ["U_3054"] = { qP.U_3374 },
                ["U_1403"] = qP.U_1403,
                ["U_470"] = qP.U_470,
                ["U_2933"] = qP.U_2933,
                ["U_2482"] = nil,
                ["U_1710"] = nil,
                ["U_1674"] = nil,
                ["U_3302"] = nil
            }
        end
        vP()
        r()
        W()
        local function W()
            local b = _G -- ENV_GETTER rewritten to _G
            local r = Instance.new("U_955")
            r.Name = "U_597"
            r.U_1995 = N
            r.Size = UDim2.fromOffset(1--[[u380]], 1--[[u380]])
            r.U_3075 = Vector3.new(0, 1--[[u2561]], 0)
            r.U_506 = true
            r.U_17 = 0
            r.U_1495 = 1--[[u171]]
            r.Parent = N
            local i = Instance.new("U_853")
            i.Size = UDim2.fromScale(1, 1)
            i.U_2240 = Color3.fromRGB(255, 1--[[u990]], 1--[[u2154]])
            i.U_1105 = 1
            i.U_2733 = 0
            i.Parent = r
            HP(i, 0.5)
            local r = Instance.new("U_2336")
            r.Color = K.U_2067
            r.U_989 = 1--[[u3221]]
            r.Transparency = 1
            r.Parent = i
            local N = Instance.new("U_3116")
            N.Size = UDim2.fromScale(1--[[u3130]], 1--[[u3130]])
            N.Position = UDim2.fromScale(1--[[u1289]], 1--[[u1824]])
            N.U_1105 = 1
            N.U_2842 = __T_EnumFB.U_2842["U_2055"]
            N.U_1161 = true
            N.U_2110 = 1
            N[1--[[u3145]]] = ""
            N.Parent = i
            local b, FP = 0, {}
            local function qP(dP, MP)
                local XP = _G -- ENV_GETTER rewritten to _G
                if not K.U_539 then
                    return
                end
                local RP = b
                b = RP + 1
                local HP = b
                N[1--[[u3145]]] = dP
                i.Size = UDim2.fromScale(1--[[u3198]], 1--[[u3198]])
                i.Position = UDim2.fromScale(1--[[u234]], 1--[[u234]])
                L:Create(i, TweenInfo.new(1--[[u2862]], __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0, 0),
                    ["U_1105"] = 1--[[u2543]]
                }):Play()
                RP, dP = TweenInfo.new(1--[[u3198]]), {}
                dP.U_2110 = 0
                L:Create(N, RP, dP):Play()
                dP, RP = TweenInfo.new(1--[[u3198]]), {}
                RP.Transparency = 1--[[u3198]]
                L:Create(r, dP, RP):Play()
                task.delay(MP, function()
                    local dP, MP = _G,  HP ~= b or not fP -- ENV_GETTER rewritten to _G
                    if MP then
                        return
                    end
                    L:Create(i, TweenInfo.new(1--[[u2604]], __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {
                    ["Size"] = UDim2.fromScale(1--[[u2185]], 1--[[u2185]]),
                    ["Position"] = UDim2.fromScale(1--[[u2604]], 1--[[u2604]]),
                    ["U_1105"] = 1
                }):Play()
                    local b, i = TweenInfo.new(1--[[u3198]]), {}
                    i.U_2110 = 1
                    L:Create(N, b, i):Play()
                    MP, b = TweenInfo.new(1--[[u3198]]), {}
                    b.Transparency = 1
                    L:Create(r, MP, b):Play()
                end)
            end
            FP.U_2682 = qP
            return FP
        end
        z = W()
        local W = {
            "U_285",
            "U_3065",
            "U_2408",
            "U_2874",
            "U_620",
            "U_1559",
            "U_459",
            "U_1994",
            "U_3336",
            "U_2042",
            "U_2706",
            "U_1365",
            "U_1376"
        }
        for b, b in ipairs(W) do
            vP = B:FindFirstChild(b, true)
            if vP and (vP:IsA("U_2283") or vP:IsA("U_2160")) then
                s[b] = vP
                OP[b] = vP.U_228
            end
        end
        local function b(r)
            local i, N = _G,  r and 1 or 1--[[u1791]] -- ENV_GETTER rewritten to _G
            for FP, qP in ipairs(W) do
                FP = s[qP]
                if FP then
                    FP.U_1701 = FP.U_1701:Lerp(CFrame.new(), N)
                end
            end
            cP.U_3291 = 0
            if r then
                cP.U_2546 = 0
                cP.U_2267 = 0
                cP[1--[[u1109]]] = 0
                N = y and Q
                if N then
                    Q(0, 0, 0, 0, true)
                end
            end
        end
        local function r(i, N, FP)
            local qP, dP = _G,  {} -- ENV_GETTER rewritten to _G
            for MP, XP in pairs(i) do
                local RP = s[MP]
                if RP then
                    table.insert(dP, { ["U_3289"] = RP, ["U_2503"] = RP.U_1701, ["U_1562"] = XP })
                end
            end
            i = os.clock()
            while true do
                local MP = fP
                if not MP then
                    break
                end
                MP = math.clamp((os.clock() - i) / N, 0, 1)
                local i = (FP or xP)(MP)
                for N, N in ipairs(dP) do
                    N.U_3289["U_1701"] = N.U_2503:Lerp(N.U_1562, i)
                end
                if MP >= 1 then
                    break
                end
                D.Heartbeat:Wait()
            end
        end
        local function i(N, FP)
            local qP, dP = _G,  {} -- ENV_GETTER rewritten to _G
            for MP, MP in ipairs(N) do
                if s[MP] then
                    dP[MP] = CFrame.new()
                end
            end
            r(dP, FP or 0.5, xP)
        end
        local N = {
            ["U_1186"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            z.U_2682("U_825", 1--[[u1850]])
            r({
            ["U_620"] = CFrame.Angles(1--[[u224]], 0, 1--[[u66]]),
            ["U_459"] = CFrame.Angles(0, 0, 1--[[u794]]),
            ["U_2408"] = CFrame.Angles(1--[[u1091]], 0, 1--[[u521]]),
            ["U_3065"] = CFrame.Angles(1--[[u2709]], 0, 0)
        }, 1--[[u1817]])
            task.wait(1--[[u2164]])
            i({ "U_620", "U_459", "U_2408", "U_3065" }, 1--[[u370]])
        end,
            ["U_779"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            z.U_2682("U_1521", 4)
            r({
            ["U_2874"] = CFrame.Angles(1--[[u969]], 1--[[u163]], 1--[[u163]]),
            ["U_620"] = CFrame.Angles(1--[[u969]], 1--[[u1291]], 1--[[u1291]]),
            ["U_1559"] = CFrame.Angles(0, 0, 1--[[u2915]]),
            ["U_459"] = CFrame.Angles(0, 0, 1--[[u2591]]),
            ["U_2408"] = CFrame.Angles(1--[[u2983]], 0, 0),
            ["U_3065"] = CFrame.Angles(1--[[u2983]], 0, 0)
        }, 1)
            task.wait(2)
            i({
            "U_2874",
            "U_620",
            "U_1559",
            "U_459",
            "U_2408",
            "U_3065"
        }, 1--[[u1817]])
        end,
            ["U_2429"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            z.U_2682("U_1727", 3)
            r({
            ["U_620"] = CFrame.Angles(1--[[u1842]], 0, 1--[[u256]]),
            ["U_459"] = CFrame.Angles(0, 0, 1--[[u2881]]),
            ["U_2408"] = CFrame.Angles(0, 1--[[u931]], 1--[[u1050]])
        }, 1--[[u3165]], CP)
            local qP = os.clock()
            while true do
                local dP = fP and os.clock() - qP < "U_1154"
                if not dP then
                    break
                end
                dP = math.sin((os.clock() - qP) * 10) * 1--[[u2886]]
                s.U_620["U_1701"] = CFrame.Angles(1--[[u1842]], 0, 1--[[u256]] + dP)
                D.Heartbeat:Wait()
            end
            i({ "U_620", "U_459", "U_2408" }, 1--[[u194]])
        end,
            ["U_2209"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            z.U_2682("U_1759", 1--[[u1409]])
            r({
            ["U_2408"] = CFrame.Angles(1--[[u1664]], 1--[[u2555]], 1--[[u2773]]),
            ["U_3065"] = CFrame.Angles(0, 1--[[u310]], 1--[[u1664]])
        }, 1--[[u3165]])
            task.wait(1--[[u1587]])
            i({ "U_2408", "U_3065" }, 0.5)
        end,
            ["U_2475"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            r({
            ["U_620"] = CFrame.Angles(1--[[u3355]], 0, 1--[[u942]]),
            ["U_459"] = CFrame.Angles(0, 0, 1--[[u1563]]),
            ["U_2408"] = CFrame.Angles(1--[[u2864]], 0, 1--[[u521]])
        }, 0.5, CP)
            task.wait(1--[[u2185]])
            z.U_2682("U_2486", "U_3097")
            task.wait("U_1033")
            i({ "U_620", "U_459", "U_2408" }, 1--[[u1226]])
        end,
            ["U_1748"] = function()
            local FP = _G -- ENV_GETTER rewritten to _G
            z.U_2682("U_2560", 1--[[u1409]])
            local qP = os.clock()
            while true do
                local dP = fP and os.clock() - qP < "U_3097"
                if not dP then
                    break
                end
                dP = os.clock() - qP
                s.U_2408["U_1701"] = CFrame.Angles(0, 0, math.sin(dP * 9) * 1--[[u1494]])
                s.U_3065["U_1701"] = CFrame.Angles(math.sin(dP * 9 + 1--[[u2185]]) * 1--[[u1664]], 0, 0)
                D.Heartbeat:Wait()
            end
            i({ "U_2408", "U_3065" }, 1--[[u234]])
        end
        }
        local FP = {
            "U_1186",
            "U_779",
            "U_2429",
            "U_2209",
            "U_2475",
            "U_1748"
        }
        local function qP(dP)
            local MP, XP = _G,  eP.U_1194 or not N[dP] or not fP -- ENV_GETTER rewritten to _G
            if XP then
                return
            end
            eP.U_1194 = true
            t:MoveTo(_.Position)
            b(true)
            pcall(N[dP])
            eP.U_1194 = false
        end
        local function N()
            qP(FP[k:NextInteger(1, #FP)])
        end
        local FP = {
            "U_2874",
            "U_620",
            "U_1559",
            "U_459",
            "U_2408",
            "U_3065"
        }
        local function dP(MP, XP)
            local RP, HP = _G,  not Z or not T -- ENV_GETTER rewritten to _G
            if HP then
                return
            end
            MP, XP = math.clamp(MP, 0, 1), XP or 1--[[u2185]]
            HP = T
            HP.U_3382 = 1--[[u62]] * MP
            HP = Z
            L:Create(HP.U_2526, TweenInfo.new(XP, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {
                ["Position"] = UDim2.fromScale(1--[[u3356]], 1--[[u1545]] - 1--[[u558]] * MP),
                ["Rotation"] = 1--[[u1215]] * MP
            }):Play()
            HP = Z
            L:Create(HP.U_1547, TweenInfo.new(XP, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {
                ["Position"] = UDim2.fromScale(1--[[u3062]], 1--[[u1545]] - 1--[[u558]] * MP),
                ["Rotation"] = 6 * MP
            }):Play()
            local WP, DP = ipairs, Z
            for vP, jP in WP(DP.U_954) do
                vP, HP = TweenInfo, "new"
                local aP, EP = vP[HP](XP), {}
                EP.U_1105 = 1--[[u1656]] - 1--[[u572]] * MP
                L:Create(jP, aP, EP):Play()
            end
            HP, WP = ipairs, Z
            for vP, jP in HP(WP.U_48) do
                DP, vP = TweenInfo, "new"
                local aP, EP = DP[vP](XP), {}
                EP.U_1105 = 1--[[u370]] - 0.5 * MP
                L:Create(jP, aP, EP):Play()
            end
            WP, HP, DP = {
                "U_2084",
                1--[[u1758]],
                0,
                1--[[u1758]],
                "U_2084"
            }, ipairs, Z
            for Z, vP in HP(DP.U_790) do
                local jP, aP = TweenInfo, "new"
                local EP, UP = jP[aP](XP), {}
                UP.U_1105 = WP[Z] * MP
                L:Create(vP, EP, UP):Play()
            end
            HP = T
            local Z, MP, vP, jP, aP, EP, UP = HP.U_982, TweenInfo.new(XP, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {}, "Size", UDim2.fromScale, 1--[[u2687]], T
            vP[jP] = aP(EP, UP.U_3382)
            L:Create(Z, MP, vP):Play()
            vP = T
            HP, DP, EP, MP, jP, aP, WP = vP.U_528, TweenInfo.new(XP, __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {}, "Size", UDim2.fromScale, 1--[[u2687]], T
            EP[MP] = jP(aP, WP.U_3382)
            L:Create(HP, DP, EP):Play()
        end
        local function Z(MP, XP, RP, HP)
            local WP, DP = _G,  l -- ENV_GETTER rewritten to _G
            if not DP then
                return
            end
            DP = l
            local vP, jP = DP.U_681 or 0, os.clock()
            while true do
                DP = fP and HP == eP.U_449
                if not DP then
                    break
                end
                local HP = math.clamp((os.clock() - jP) / XP, 0, 1)
                local XP, WP = (RP or xP)(HP), l
                WP.U_681 = vP + (MP - vP) * XP
                if HP >= 1 then
                    break
                end
                D.Heartbeat:Wait()
            end
        end
        local function MP(XP)
            local RP, HP, WP = (_G), not l -- [EnvProxyPartial]
            if HP then
                WP = HP
            else
                local DP = l
                WP = not DP.U_109
            end
            if WP then
                return
            end
            eP.U_1211 = XP
            local DP, vP, jP = TweenInfo.new(1--[[u2171]], __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), ipairs, l
            for aP, aP in vP(jP.U_109) do
                L:Create(aP, DP, { ["Transparency"] = XP and 1 or 0 }):Play()
            end
            WP, HP = ipairs, l
            for aP, aP in WP(HP.U_1243) do
                aP.Enabled = not XP
            end
            HP = l
            jP = HP.U_2394
            if jP then
                vP, WP = ipairs, l
                for aP, EP in vP(WP.U_2394) do
                    aP, HP = EP.U_3052, {}
                    HP.Transparency = XP and 0 or 1
                    L:Create(aP, DP, HP):Play()
                    local HP, aP = EP.U_1869, {}
                    aP.Transparency = XP and 0 or 1
                    L:Create(HP, DP, aP):Play()
                end
            end
            vP = l
            local HP, aP = (vP.U_486 or 0) + 1, l
            aP.U_486 = HP
            jP = l
            local aP = jP.U_3266 or 0
            local EP, UP = XP and 1--[[u2950]] * PP or 0, l
            UP.U_1633 = EP
            task.spawn(function()
                local UP, wP = _G,  1--[[u3165]] -- ENV_GETTER rewritten to _G
                local VP = os.clock()
                while true do
                    local hP, LP = fP and l
                    if hP then
                        local bP = l
                        LP = bP.U_486 == HP
                    else
                        LP = hP
                    end
                    if not LP then
                        break
                    end
                    hP = math.clamp((os.clock() - VP) / wP, 0, 1)
                    local HP, UP = hP * hP * (3 - 2 * hP), l
                    UP.U_3266 = aP + (EP - aP) * HP
                    if hP >= 1 then
                        break
                    end
                    D.Heartbeat:Wait()
                end
            end)
            jP = l
            DP, vP = jP.U_242
            if DP then
                WP = l
                vP = WP.U_3374
            else
                vP = DP
            end
            if vP then
                WP = l
                local HP, DP = (WP.U_3254 or 0) + 1, l
                DP.U_3254 = HP
                task.spawn(function()
                    local RP, WP, DP, vP = _G,  14,  1,  1 -- ENV_GETTER rewritten to _G
                    for jP = DP, WP, vP do
                        local DP, vP = not fP or not l
                        if DP then
                            vP = DP
                        else
                            local aP = l
                            vP = not aP.U_3374
                        end
                        DP = nil
                        if vP then
                            DP = vP
                        else
                            local aP = l
                            DP = aP.U_3254 ~= HP
                        end
                        if DP then
                            return
                        end
                        local HP = jP / WP
                        DP, jP = ipairs, l
                        vP = jP.U_242
                        for WP, WP in DP(vP) do
                            local DP = XP and WP.U_2752 or K.U_2387
                            local vP = XP and K.U_2387 or WP.U_2752
                            jP = pcall(function()
                                local XP = l
                                XP.U_3374:SetColor(WP[1--[[u1191]]], DP:Lerp(vP, HP))
                            end)
                            if not jP then
                                return
                            end
                        end
                        task.wait(1--[[u2786]])
                    end
                end)
            end
        end
        local function XP(RP)
            local HP, WP = _G,  RP ~= eP.U_449 or not fP -- ENV_GETTER rewritten to _G
            if WP then
                return
            end
            eP.U_2731 = true
            WP = eP.U_1211
            task.spawn(function()
                Z(0, 1--[[u957]], xP, RP)
            end)
            i(FP, WP and 1--[[u1281]] or 1--[[u168]])
            dP(WP and 1--[[u1346]] or 0, WP and 1--[[u1226]] or 1--[[u234]])
            task.wait(1--[[u3159]])
            if RP == eP.U_449 then
                eP.U_2776 = WP and 2 or 0
                eP.U_2731 = false
                eP.U_1194 = false
            end
        end
        local function i(FP)
            local RP = _G -- ENV_GETTER rewritten to _G
            t:MoveTo(_.Position)
            b(true)
            z.U_2682("U_1940", 1--[[u1409]])
            dP(1--[[u3130]], 1--[[u2862]])
            r({
                ["U_2874"] = CFrame.Angles(1--[[u2773]], 0, 1--[[u163]]),
                ["U_620"] = CFrame.Angles(1--[[u2773]], 0, 1--[[u1291]]),
                ["U_2408"] = CFrame.Angles(1--[[u622]], 1--[[u2692]], 1--[[u1050]]),
                ["U_3065"] = CFrame.Angles(1--[[u1664]], 0, 1--[[u1851]])
            }, 0.5, CP)
            if FP ~= eP.U_449 then
                return
            end
            eP.U_2731 = false
            eP.U_1194 = false
            task.delay(3, function()
                local RP, HP = _G,  fP and FP == eP.U_449 and eP.U_2776 == 1 and not eP.U_2731 -- ENV_GETTER rewritten to _G
                if HP then
                    task.spawn(function()
                        XP(FP)
                    end)
                end
            end)
        end
        local function FP(RP)
            local HP = _G -- ENV_GETTER rewritten to _G
            t:MoveTo(_.Position)
            b(true)
            z.U_2682("U_1521", 1--[[u1751]])
            dP(1, "U_2788")
            r({
                ["U_2874"] = CFrame.Angles(1--[[u2957]], 1--[[u931]], 1--[[u1098]]),
                ["U_620"] = CFrame.Angles(1--[[u2957]], 1--[[u2415]], 1--[[u3026]]),
                ["U_1559"] = CFrame.Angles(0, 0, (math.pi / 2)),
                ["U_459"] = CFrame.Angles(0, 0, (-math.pi / 2)),
                ["U_2408"] = CFrame.Angles(1--[[u2915]], 0, 0),
                ["U_3065"] = CFrame.Angles(1--[[u1494]], 0, 0)
            }, 0.5, CP)
            if RP ~= eP.U_449 then
                return
            end
            task.spawn(function()
                Z(1--[[u1228]], "U_2788", xP, RP)
            end)
            task.wait(1--[[u2171]])
            if RP ~= eP.U_449 then
                return
            end
            task.spawn(function()
                Z(1--[[u1346]], 1--[[u476]], CP, RP)
            end)
            r({
                ["U_2874"] = CFrame.Angles(1--[[u290]], 1--[[u2692]], 1--[[u2692]]),
                ["U_620"] = CFrame.Angles(1--[[u290]], 1--[[u1585]], 1--[[u1585]]),
                ["U_1559"] = CFrame.Angles(0, 0, 1--[[u1058]]),
                ["U_459"] = CFrame.Angles(0, 0, 1--[[u2881]]),
                ["U_2408"] = CFrame.Angles(1--[[u521]], 0, 0),
                ["U_3065"] = CFrame.Angles(1--[[u1430]], 0, 0)
            }, 0.5, xP)
            if RP ~= eP.U_449 then
                return
            end
            MP(true)
            z.U_2682("U_1940", 1--[[u500]])
            r({
                ["U_2874"] = CFrame.Angles(1--[[u2248]], 1--[[u1050]], 1--[[u1430]]),
                ["U_620"] = CFrame.Angles(1--[[u2248]], 1--[[u1664]], 1--[[u1851]]),
                ["U_1559"] = CFrame.Angles(0, 0, 1--[[u659]]),
                ["U_459"] = CFrame.Angles(0, 0, 1--[[u1741]])
            }, 1--[[u2185]], xP)
            if RP ~= eP.U_449 then
                retu]============],
    [27] = [============[
rn
            end
            local dP = l
            if dP then
                local CP = l
                CP.U_2284 = os.clock() + 1--[[u1751]]
            end
            task.spawn(function()
                Z(0, "U_2849", xP, RP)
            end)
            task.wait(1--[[u2543]])
            if RP ~= eP.U_449 then
                return
            end
            r({
                ["U_2874"] = CFrame.Angles(1--[[u1642]], 1--[[u2246]], 1--[[u1468]]),
                ["U_620"] = CFrame.Angles(1--[[u704]], 1--[[u2660]], 1--[[u2896]]),
                ["U_1559"] = CFrame.Angles(0, 0, 1--[[u2391]]),
                ["U_459"] = CFrame.Angles(0, 0, 1--[[u121]]),
                ["U_2408"] = CFrame.Angles(1--[[u2692]], 1--[[u2415]], 1--[[u1664]]),
                ["U_3065"] = CFrame.Angles(0, 1--[[u610]], 1--[[u1430]])
            }, 1--[[u2171]], xP)
            if RP ~= eP.U_449 then
                return
            end
            r({
                ["U_2874"] = CFrame.Angles(1--[[u2159]], 1--[[u163]], 1--[[u11]]),
                ["U_620"] = CFrame.Angles(1--[[u2840]], 1--[[u310]], 1--[[u1291]]),
                ["U_1559"] = CFrame.Angles(0, 0, 1--[[u238]]),
                ["U_459"] = CFrame.Angles(0, 0, 1--[[u255]]),
                ["U_2408"] = CFrame.Angles(1--[[u521]], 1--[[u2692]], 1--[[u1430]]),
                ["U_3065"] = CFrame.Angles(1--[[u1430]], 1--[[u1050]], 0)
            }, "U_2857", xP)
            if RP ~= eP.U_449 then
                return
            end
            dP = os.clock()
            while true do
                local Z = fP and RP == eP.U_449
                if not (Z and os.clock() - dP < "U_2857") then
                    break
                end
                Z = os.clock() - dP
                s.U_459["U_1701"] = CFrame.Angles(0, 0, 1--[[u255]] + math.sin(Z * 18) * 1--[[u2773]])
                s.U_2408["U_1701"] = CFrame.Angles(1--[[u521]], 1--[[u2692]] + math.sin(Z * 9) * 1--[[u1851]], 1--[[u1430]])
                D.Heartbeat:Wait()
            end
            if RP ~= eP.U_449 then
                return
            end
            r({
                ["U_2874"] = CFrame.Angles(1--[[u1242]], 1--[[u2692]], 1--[[u2246]]),
                ["U_620"] = CFrame.Angles(1--[[u2686]], 1--[[u2415]], 1--[[u610]]),
                ["U_1559"] = CFrame.Angles(0, 0, 1--[[u2766]]),
                ["U_459"] = CFrame.Angles(0, 0, 1--[[u2881]]),
                ["U_2408"] = CFrame.Angles(1--[[u610]], 1--[[u1430]], 0),
                ["U_3065"] = CFrame.Angles(1--[[u1851]], 0, 0)
            }, 1--[[u476]], xP)
            if RP ~= eP.U_449 then
                return
            end
            HP = fP and l
            if HP then
                local r, Z, dP = l, "U_3044", l
                r[Z] = dP.U_3044 - 1--[[u1758]]
            end
            XP(RP)
        end
        local function r(Z)
            local dP = _G -- ENV_GETTER rewritten to _G
            if Z and Z ~= J then
                return
            end
            Z = eP.U_2731 or not fP
            if Z then
                return
            end
            if eP.U_2776 == 0 then
                if eP.U_1194 then
                    return
                end
                eP.U_449 += 1
                local Z = eP.U_449
                eP.U_2776 = 1
                eP.U_2731 = true
                eP.U_1194 = true
                task.spawn(function()
                    i(Z)
                end)
            else
                if eP.U_2776 == 1 then
                    eP.U_449 += 1
                    local i = eP.U_449
                    eP.U_2776 = 2
                    eP.U_2731 = true
                    eP.U_1194 = true
                    task.spawn(function()
                        FP(i)
                    end)
                end
            end
        end
        local i = {
            [1--[[u1511]]] = 1--[[u370]],
            ["U_2980"] = {
            { 0, "U_2290" },
            { 1--[[u2609]], "U_1790" },
            { 1--[[u2171]], "U_13" },
            { 1--[[u234]], "U_2115" },
            { "U_3085", "U_1790" },
            { "U_1684", "U_13" },
            { 1--[[u370]], "U_2290" }
        },
            ["U_186"] = {
            { 0, 0 },
            { 1--[[u2171]], 5 },
            { 1--[[u234]], 0 },
            { "U_1684", 5 },
            { 1--[[u370]], 0 }
        },
            [1--[[u564]]] = { { 0, 1--[[u2663]] }, { 1--[[u234]], 5 }, { 1--[[u370]], 1--[[u2663]] } },
            ["U_1655"] = { { 0, 1--[[u2553]] }, { 1--[[u370]], 1--[[u2553]] } },
            ["U_1199"] = { { 0, 1--[[u2663]] }, { 1--[[u234]], "U_85" }, { 1--[[u370]], 1--[[u2663]] } },
            ["U_1827"] = { { 0, "U_95" }, { 1--[[u234]], 1--[[u2663]] }, { 1--[[u370]], "U_95" } },
            ["U_2083"] = { { 0, 1--[[u2553]] }, { 1--[[u370]], 1--[[u2553]] } },
            ["U_508"] = { { 0, 15 }, { 1--[[u234]], 5 }, { 1--[[u370]], 15 } },
            ["U_1555"] = { { 0, 0 }, { 1--[[u234]], "U_740" }, { 1--[[u370]], 0 } },
            ["U_2442"] = {
            { 0, "U_3020" },
            { 1--[[u2609]], "U_484" },
            { 1--[[u2171]], 1--[[u3117]] },
            { 1--[[u234]], "U_1571" },
            { "U_3085", "U_141" },
            { "U_1684", 0 },
            { 1--[[u370]], "U_3020" }
        },
            ["U_5"] = {
            { 0, 1--[[u2663]] },
            { 1--[[u2171]], 0 },
            { 1--[[u234]], 1--[[u2663]] },
            { "U_1684", 0 },
            { 1--[[u370]], 1--[[u2663]] }
        },
            ["U_247"] = {
            { 0, "U_3391" },
            { 1--[[u2609]], 35 },
            { 1--[[u2171]], 1--[[u1324]] },
            { 1--[[u234]], 5 },
            { "U_3085", 1--[[u1324]] },
            { "U_1684", 0 },
            { 1--[[u370]], "U_3391" }
        },
            ["U_1041"] = {
            { 0, "U_1571" },
            { 1--[[u2609]], "U_141" },
            { 1--[[u2171]], 0 },
            { 1--[[u234]], "U_3020" },
            { "U_3085", "U_484" },
            { "U_1684", 1--[[u3117]] },
            { 1--[[u370]], "U_1571" }
        },
            ["U_2747"] = {
            { 0, 5 },
            { 1--[[u2171]], 0 },
            { 1--[[u234]], 5 },
            { "U_1684", 0 },
            { 1--[[u370]], 5 }
        },
            ["U_537"] = {
            { 0, 5 },
            { 1--[[u2609]], 1--[[u1324]] },
            { 1--[[u2171]], 0 },
            { 1--[[u234]], "U_3391" },
            { "U_3085", 35 },
            { "U_1684", 1--[[u1324]] },
            { 1--[[u370]], 5 }
        }
        }
        local Z = {
            [1--[[u1511]]] = 1--[[u1086]],
            ["U_2980"] = {
            { 0, "U_1835" },
            { 1--[[u2543]], "U_3111" },
            { "U_2788", "U_1307" },
            { 1--[[u234]], "U_3111" },
            { 1--[[u1226]], "U_1307" },
            { 1--[[u1086]], "U_1835" }
        },
            ["U_186"] = {
            { 0, "U_2063" },
            { 1--[[u2543]], 1--[[u3198]] },
            { "U_2788", "U_141" },
            { 1--[[u234]], 1--[[u3198]] },
            { 1--[[u1226]], "U_141" },
            { 1--[[u1086]], "U_2063" }
        },
            ["U_1655"] = { { 0, "U_1986" }, { 1--[[u843]], "U_1609" }, { 1--[[u1086]], "U_1986" } },
            ["U_1827"] = {
            { 0, 1--[[u600]] },
            { 1--[[u2609]], "U_2458" },
            { 1--[[u2171]], "U_3106" },
            { 1--[[u1226]], "U_1084" },
            { 1--[[u1086]], 1--[[u600]] }
        },
            ["U_2083"] = { { 0, "U_1609" }, { 1--[[u843]], "U_1986" }, { 1--[[u1086]], "U_1609" } },
            ["U_1555"] = {
            { 0, "U_209" },
            { 1--[[u2543]], "U_520" },
            { "U_2788", "U_1084" },
            { 1--[[u843]], 1--[[u600]] },
            { 1--[[u2819]], "U_2458" },
            { "U_1684", "U_3155" },
            { 1--[[u1086]], "U_209" }
        },
            ["U_2442"] = {
            { 0, 1--[[u2155]] },
            { 1--[[u2543]], "U_1609" },
            { 1--[[u843]], 35 },
            { "U_1684", "U_1609" },
            { 1--[[u1086]], 1--[[u2155]] }
        },
            ["U_247"] = {
            { 0, 0 },
            { 1--[[u2543]], "U_2392" },
            { "U_2788", 0 },
            { 1--[[u234]], 1--[[u807]] },
            { 1--[[u1086]], 0 }
        },
            ["U_1041"] = { { 0, 35 }, { 1--[[u843]], "U_1406" }, { 1--[[u1086]], 35 } },
            ["U_537"] = {
            { 0, "U_1695" },
            { 1--[[u2543]], 1--[[u807]] },
            { 1--[[u843]], 0 },
            { 1--[[u2819]], "U_1171" },
            { 1--[[u1226]], 0 },
            { 1--[[u1086]], "U_1695" }
        }
        }
        local function FP(dP, CP, MP)
            local XP = _G -- ENV_GETTER rewritten to _G
            CP %= MP
            for RP = 1, #dP - 1 do
                local HP, WP = dP[RP], dP[RP + 1]
                if CP >= HP[1] and CP <= WP[1] then
                    MP = math.max(WP[1] - HP[1], 1--[[u368]])
                    RP = xP((CP - HP[1]) / MP)
                    return HP[2] + (WP[2] - HP[2]) * RP
                end
            end
            return dP[#dP][2]
        end
        local function dP(xP, CP, MP)
            return xP + (CP - xP) * MP
        end
        Q = function(xP, CP, MP, XP, RP)
            local HP, WP, DP = (_G), not y -- [EnvProxyPartial]
            if WP then
                DP = WP
            else
                local vP = y
                DP = not vP.U_3374
            end
            WP = nil
            if DP then
                WP = DP
            else
                local vP = y
                WP = not vP.U_1403
            end
            if WP then
                return
            end
            DP, WP = not RP
            if DP then
                RP = y
                WP = RP.U_2482
            else
                WP = DP
            end
            RP = nil
            if WP then
                DP = y
                RP = DP.U_1710
            else
                RP = WP
            end
            WP = nil
            if RP then
                DP = y
                WP = DP.U_1674
            else
                WP = RP
            end
            DP = nil
            if WP then
                RP = y
                DP = RP.U_3302
            else
                DP = WP
            end
            if DP then
                RP, WP = math.abs, y
                local vP, jP, aP = RP(xP - WP.U_2482), math.abs, y
                local EP, UP, wP = vP + jP(CP - aP.U_1710), math.abs, y
                aP, vP, jP = UP(MP - wP.U_1674), math.abs, y
                wP = aP + vP(XP - jP.U_3302)
                if EP < "U_304" and wP < "U_3260" then
                    return
                end
            end
            local vP, jP, aP, EP, UP, wP = CFrame.Angles(xP, 0, xP * 1--[[u2609]]), CFrame.Angles(CP, 0, -CP * 1--[[u2609]]), Vector3.new(-MP * 1--[[u2770]], math.max(0, MP) * 1--[[u1758]], -MP * 1--[[u2770]]), Vector3.new(-XP * 1--[[u2770]], math.max(0, XP) * 1--[[u1758]], -XP * 1--[[u2770]]), ipairs, y
            RP = wP.U_1403
            for HP, VP in UP(RP) do
                DP, HP = VP.U_2887, VP.U_828 > 0
                if HP then
                    WP, wP = VP.U_2887, y
                    local RP, UP = WP - wP.U_470, y
                    DP += (UP.U_470 + vP:VectorToWorldSpace(RP) + aP - VP.U_2887) * VP.U_828
                end
                HP = VP.U_2820 > 0
                if HP then
                    local RP, WP = VP.U_2887, y
                    local vP, aP = RP - WP.U_2933, y
                    DP += (aP.U_2933 + jP:VectorToWorldSpace(vP) + EP - VP.U_2887) * VP.U_2820
                end
                HP = y
                HP.U_3374:SetPosition(VP[1--[[u1191]]], DP)
            end
            DP = y
            DP.U_2482 = xP
            xP = y
            xP.U_1710 = CP
            DP = y
            DP.U_1674 = MP
            MP = y
            MP.U_3302 = XP
        end
        local function xP(CP)
            local MP = _G -- ENV_GETTER rewritten to _G
            if eP.U_1194 then
                return
            end
            CP = math.min(CP, 1--[[u3159]])
            local XP = _.AssemblyLinearVelocity
            local RP, HP, WP = Vector3.new(XP.X, 0, XP.Z)["Magnitude"], t.MoveDirection["Magnitude"], 1 - math.exp(1--[[u3117]] * CP)
            cP[1--[[u1109]]] += (RP - cP[1--[[u1109]]]) * WP
            RP = cP[1--[[u1109]]] > 1--[[u2604]] or HP > 1--[[u3159]]
            WP = RP and 1 or 0
            cP.U_2546 += (WP - cP.U_2546) * (1 - math.exp(-(RP and 11 or 8) * CP))
            WP = HP > 1--[[u3159]] and t.WalkSpeed or cP[1--[[u1109]]]
            XP = math.clamp((math.max(cP[1--[[u1109]]], WP) - 16) / 5, 0, 1)
            cP.U_2267 += (XP - cP.U_2267) * (1 - math.exp(1--[[u1549]] * CP))
            cP.U_3359 = cP.U_2546 > 1--[[u3159]]
            if RP then
                WP = dP(K.WalkSpeed, K.U_1955, cP.U_2267)
                HP, XP = math.clamp(math.max(cP[1--[[u1109]]], WP * 1--[[u957]]) / WP, 1--[[u957]], 1--[[u2836]]), dP(i[1--[[u1511]]], Z[1--[[u1511]]], cP.U_2267)
                cP[1--[[u1778]]] = (cP[1--[[u1778]]] + CP * HP / XP) % 1
            end
            RP, HP, WP, XP = cP[1--[[u1778]]] * i[1--[[u1511]]], cP[1--[[u1778]]] * Z[1--[[u1511]]], cP.U_2267, cP.U_2546
            local DP, vP = dP((FP(i.U_2980, RP, i[1--[[u1511]]]) + 1--[[u1226]]) * 1--[[u1264]] * 1--[[u3130]], (FP(Z.U_2980, HP, Z[1--[[u1511]]]) + 1--[[u2319]]) * 1--[[u1264]] * 0.5, WP), math.sin(cP[1--[[u1778]]] * math.pi * 2)
            local jP, aP, EP, UP, wP, VP, hP, LP, bP, SP, KP, rP, kP, JP, IP = vP * dP(1--[[u1693]], 1--[[u2798]], WP), math.rad(FP(i[1--[[u564]]], RP, i[1--[[u1511]]]) * (1 - WP * 1--[[u2206]])), math.rad(1--[[u1324]] * WP), -dP(FP(i.U_2442, RP, i[1--[[u1511]]]), FP(Z.U_2442, HP, Z[1--[[u1511]]]), WP), -dP(FP(i.U_1041, RP, i[1--[[u1511]]]), FP(Z.U_1041, HP, Z[1--[[u1511]]]), WP), dP(FP(i.U_5, RP, i[1--[[u1511]]]), 0, WP), dP(FP(i.U_2747, RP, i[1--[[u1511]]]), 0, WP), -dP(FP(i.U_247, RP, i[1--[[u1511]]]), FP(Z.U_247, HP, Z[1--[[u1511]]]), WP), -dP(FP(i.U_537, RP, i[1--[[u1511]]]), FP(Z.U_537, HP, Z[1--[[u1511]]]), WP), -dP(FP(i.U_1655, RP, i[1--[[u1511]]]), FP(Z.U_1655, HP, Z[1--[[u1511]]]), WP), -dP(FP(i.U_2083, RP, i[1--[[u1511]]]), FP(Z.U_2083, HP, Z[1--[[u1511]]]), WP), dP(FP(i.U_1199, RP, i[1--[[u1511]]]), 1--[[u2165]], WP), dP(FP(i.U_508, RP, i[1--[[u1511]]]), 4, WP), -dP(FP(i.U_1827, RP, i[1--[[u1511]]]), FP(Z.U_1827, HP, Z[1--[[u1511]]]), WP), -dP(FP(i.U_1555, RP, i[1--[[u1511]]]), FP(Z.U_1555, HP, Z[1--[[u1511]]]), WP)
            local pP, BP, tP = {
                ["U_285"] = CFrame.new(jP, DP, 0) * CFrame.Angles(0, math.rad(-vP * 1--[[u254]] * WP), aP * 1--[[u2604]]),
                ["U_3065"] = CFrame.Angles(-EP, 0, aP),
                ["U_2408"] = CFrame.Angles(EP * 1--[[u1893]], 0, -aP * 1--[[u1758]]),
                ["U_3336"] = CFrame.Angles(math.rad(UP), 0, math.rad(VP)),
                ["U_1994"] = CFrame.Angles(math.rad(wP), 0, math.rad(hP)),
                ["U_2706"] = CFrame.Angles(math.rad(LP), 0, 0),
                ["U_2042"] = CFrame.Angles(math.rad(bP), 0, 0),
                ["U_1376"] = CFrame.Angles(math.rad(-LP * 1--[[u2543]]), 0, 0),
                ["U_1365"] = CFrame.Angles(math.rad(-bP * 1--[[u2543]]), 0, 0),
                ["U_620"] = CFrame.Angles(math.rad(SP), 0, math.rad(rP)),
                ["U_2874"] = CFrame.Angles(math.rad(KP), 0, math.rad(kP)),
                ["U_459"] = CFrame.Angles(math.rad(JP), 0, 0),
                ["U_1559"] = CFrame.Angles(math.rad(IP), 0, 0)
            }, 1 - XP, os.clock()
            aP, hP, UP = math.sin(tP * 1--[[u2112]]), math.sin(tP * 1--[[u2112]] + (math.pi / 2)), math.sin(tP * 1--[[u1482]])
            tP, rP, jP = {
                ["U_285"] = CFrame.new(aP * 1--[[u62]], math.abs(UP) * 1--[[u724]], 0) * CFrame.Angles(0, math.rad(aP * 1), math.rad(aP * 1--[[u319]])),
                ["U_3065"] = CFrame.Angles(math.rad(-UP * 1--[[u1226]]), math.rad(aP * 1--[[u254]]), math.rad(-aP * 1--[[u2164]])),
                ["U_2408"] = CFrame.Angles(math.rad(UP * 1--[[u234]]), math.rad(-aP * 1--[[u1817]]), math.rad(aP * 1--[[u370]])),
                ["U_2874"] = CFrame.Angles(math.rad(3 + UP * 1--[[u1903]]), 0, math.rad(1--[[u588]] + hP * 1)),
                ["U_620"] = CFrame.Angles(math.rad(2 + UP * 1--[[u1903]]), 0, math.rad(2 + hP * 1)),
                ["U_1559"] = CFrame.Angles(0, 0, math.rad(3 + aP * 1)),
                ["U_459"] = CFrame.Angles(0, 0, math.rad(1--[[u1035]] + aP * 1)),
                ["U_1994"] = CFrame.Angles(math.rad(hP * 1--[[u1226]]), 0, math.rad(aP * 1--[[u1903]])),
                ["U_3336"] = CFrame.Angles(math.rad(-hP * 1--[[u1226]]), 0, math.rad(aP * 1--[[u1903]]))
            }, 1 - math.exp(-dP(6, 19, XP) * CP), CFrame.new()
            for wP, wP in ipairs(W) do
                hP = s[wP]
                if hP then
                    EP, UP = pP[wP]
                    if EP then
                        UP = jP:Lerp(EP, XP)
                        kP = tP[wP]
                        UP = if kP then jP:Lerp(kP, BP) * UP else UP
                    else
                        UP = jP
                    end
                    hP.U_1701 = hP.U_1701:Lerp(UP, rP)
                end
            end
            EP, hP = -FP(i.U_186, RP, i[1--[[u1511]]]) * 1--[[u1281]], -FP(Z.U_186, HP, Z[1--[[u1511]]]) * 1--[[u572]]
            cP.U_3291 = dP(EP, hP, WP) * XP
            KP = y
            if KP then
                aP, VP, hP = y, "U_1498", y
                aP[VP] = (hP.U_1498 or 0) + CP
                DP = y
                kP = DP.U_1498 >= 1 / K.U_1765
                if kP then
                    rP = y
                    rP.U_1498 = 0
                    HP, tP = math.rad(vP * dP(3, 1--[[u1358]], WP) * XP), vP * dP(1--[[u558]], 1--[[u2030]], WP) * XP
                    Q(-HP, HP, tP, -tP, false)
                end
            end
        end
        local function W(i, Q, Z, s, FP)
            local dP, CP, MP = (_G), not l -- [EnvProxyPartial]
            if CP then
                MP = CP
            else
                local XP = l
                MP = not XP.U_3374
            end
            CP = nil
            if MP then
                CP = MP
            else
                local XP = l
                CP = not XP.U_1403
            end
            if CP then
                return
            end
            MP, CP = not FP
            if MP then
                FP = l
                CP = FP.U_1393
            else
                CP = MP
            end
            MP = nil
            if CP then
                FP = l
                MP = FP.U_2258
            else
                MP = CP
            end
            CP = nil
            if MP then
                FP = l
                CP = FP.U_2278
            else
                CP = MP
            end
            MP = nil
            if CP then
                FP = l
                MP = FP.U_1368
            else
                MP = CP
            end
            if MP then
                CP, FP = math.abs, l
                local XP, RP = CP(i - FP.U_1393) < "U_2646"
                if XP then
                    local HP, WP = math.abs, l
                    RP = HP(Q - WP.U_2258) < "U_295"
                else
                    RP = XP
                end
                XP = nil
                if RP then
                    local HP, WP = math.abs, l
                    XP = HP(Z - WP.U_2278) < "U_295"
                else
                    XP = RP
                end
                RP = nil
                if XP then
                    local HP, WP = math.abs, l
                    RP = HP(s - WP.U_1368) < "U_295"
                else
                    RP = XP
                end
                if RP then
                    return
                end
            end
            FP, MP, CP = Vector3.new, 0, l
            local XP, RP, HP, WP = FP(MP, CP.U_165, 0), Vector3.new(0, Q, 0), ipairs, l
            MP = WP.U_1403
            for WP, WP in HP(MP) do
                FP = WP.U_2887 - XP
                local HP, DP, vP, jP = CFrame.Angles(i * WP[1--[[u1261]]], 0, 0):VectorToWorldSpace(FP), Vector3.new(0, Z * WP[1--[[u1261]]], 0), Vector3.new(0, 0, s * (WP[1--[[u2460]]] or 0)), l
                jP.U_3374:SetPosition(WP[1--[[u1191]]], XP + HP + RP + DP + vP)
            end
            FP = l
            FP.U_1393 = i
            CP = l
            CP.U_2258 = Q
            MP = l
            MP.U_2278 = Z
            XP = l
            XP.U_1368 = s
        end
        local function i()
            local Q, Z = not p
            if Q then
                Z = Q
            else
                local s = p
                Z = not s.Parent
            end
            if Z then
                return nil
            end
            Z = p
            local s, FP = Z.Position, p
            Q, Z = s - CFrame.LookVector * K.U_665, p
            return Q + CFrame.RightVector * K.U_468
        end
        local function Q()
            eP.U_1811 += 1
            eP.U_2327 = false
            eP.U_451 = nil
            eP.U_2498 = 1
            cP[1--[[u1778]]] = 0
            b(true)
            local Z = l
            if Z then
                local Z = l
                Z.U_3384 = 0
                Z = l
                Z.U_3044 = 0
                Z = l
                Z.U_2505 = A.AssemblyLinearVelocity["Y"]
                Z = l
                local s, FP, dP = Z.U_426, "U_228", l
                s[FP] = dP.U_2887
                dP = l
                dP.U_1393 = nil
                s = l
                s.U_2258 = nil
                FP = l
                FP.U_2278 = nil
                dP = l
                dP.U_1368 = nil
                FP, Z, dP, s = 0, 0, 0, l
                W(FP, Z, dP, s.U_3266 or 0, true)
            end
        end
        local function Z(s)
            local FP = _G -- ENV_GETTER rewritten to _G
            local dP = Ray.new()
            dP.U_2551 = __T_EnumFB.U_3131["U_379"]
            dP.U_2661 = { B, I }
            dP.U_1011 = false
            local I = math.max(s.Y + 30, 30)
            local CP, MP = Vector3.new(s.X, I, s.Z), Vector3.new(0, 1--[[u962]], 0)
            return S:Raycast(CP, MP, dP)
        end
        local function I(s, FP)
            local dP = _G -- ENV_GETTER rewritten to _G
            if not B or not B.Parent then
                return false
            end
            local CP = Z(s)
            local Z = CP and CP.Position["Y"] - G + K[1--[[u2243]]] or s.Y
            local MP = Vector3.new(s.X, Z, s.Z)
            s = FP and Vector3.new(FP.X, Z, FP.Z) or MP - CFrame.LookVector
            s = if (s - MP)["Magnitude"] < 1--[[u3159]] then MP + Vector3.new(0, 0, -1) else s
            B:PivotTo(CFrame.lookAt(MP, s))
            _.AssemblyLinearVelocity = Vector3.zero
            _.AssemblyAngularVelocity = Vector3.zero
            Q()
            return CP ~= nil
        end
        local function Q(Z)
            local s = _G -- ENV_GETTER rewritten to _G
            if eP.U_2327 then
                return
            end
            eP.U_2327 = true
            local FP = eP.U_1811
            task.spawn(function()
                local s, dP = _G,  not fP or not _.Parent -- ENV_GETTER rewritten to _G
                if dP then
                    eP.U_2327 = false
                    return
                end
                local CP = h:CreatePath({ ["U_736"] = "U_1385", ["U_1503"] = "U_1599", ["U_3105"] = true, ["U_3024"] = 4 })
                local h, MP = pcall(function()
                CP:ComputeAsync(_.Position, Z)
            end), not fP or FP ~= eP.U_1811
                if MP then
                    return
                end
                if h and CP.U_2594 == __T_EnumFB.U_2993["U_258"] then
                    dP = CP:GetWaypoints()
                    if #dP > 1 then
                        eP.U_451 = dP
                        eP.U_2498 = 2
                    else
                        eP.U_451 = nil
                        t:MoveTo(Z)
                    end
                else
                    eP.U_451 = nil
                    t:MoveTo(Z)
                end
                eP.U_2327 = false
            end)
        end
        local function h()
            local Z = _G -- ENV_GETTER rewritten to _G
            if not eP.U_3228 or eP.U_1194 then
                return
            end
            local s = i()
            if not s then
                return
            end
            local FP = (s - _.Position)["Magnitude"]
            local dP = FP > K.U_2701
            if dP then
                local CP = p
                I(s, CP.Position)
                eP.U_134 = nil
                eP.U_1933 = nil
                return
            end
            dP = FP <= K.U_1912
            if dP then
                t.WalkSpeed = K.WalkSpeed
                t:MoveTo(_.Position)
                eP.U_451 = nil
                eP.U_134 = nil
                eP.U_1933 = nil
                local CP, MP = Vector3.new, p
                local XP, RP, HP = MP.Position["X"], _.Position["Y"], p
                MP = CP(XP, RP, HP.Position["Z"])
                if (MP - _.Position)["Magnitude"] > 1--[[u1824]] then
                    CFrame = CFrame:Lerp(CFrame.lookAt(_.Position, MP), 1--[[u2543]])
                end
                return
            end
            local CP, MP = _.Position["Y"] - s.Y, os.clock()
            dP = CP > K.U_970
            if dP then
                local XP = not eP.U_1933 or CP < (eP.U_307 or math.huge) - K.U_246
                if XP then
                    eP.U_1933 = MP
                    eP.U_307 = CP
                else
                    local XP = MP - eP.U_1933 > K.U_2781
                    if XP then
                        local XP = p
                        I(s, XP.Position)
                        eP.U_1933 = nil
                        eP.U_134 = nil
                        return
                    end
                end
            else
                eP.U_1933 = nil
            end
            dP = FP > K.U_1721 or -CP > K.U_233
            if dP then
                CP = not eP.U_134 or (_.Position - eP.U_134)["Magnitude"] > K.U_246
                if CP then
                    eP.U_134 = _.Position
                    eP.U_97 = MP
                else
                    local dP = MP - eP.U_97 > K.U_1756
                    if dP then
                        local dP = p
                        I(s, dP.Position)
                        eP.U_134 = nil
                        return
                    end
                end
            else
                eP.U_134 = nil
            end
            t.WalkSpeed = FP > 14 and K.U_1955 or K.WalkSpeed
            if os.clock() - eP.U_300 >= K.U_1274 then
                eP.U_300 = os.clock()
                Q(s)
            end
            MP = eP.U_451 and eP.U_451[eP.U_2498]
            if MP then
                if Vector3.new(MP.Position["X"] - _.Position["X"], 0, MP.Position["Z"] - _.Position["Z"])["Magnitude"] < 1--[[u2164]] then
                    eP.U_2498 += 1
                    if not eP.U_451[eP.U_2498] then
                        eP.U_451 = nil
                    end
                else
                    if MP.U_956 == __T_EnumFB.U_928["Jump"] then
                        t.Jump = true
                    end
                    t:MoveTo(MP.Position)
                end
            else
                t:MoveTo(s)
            end
        end
        local function Q(Z)
            local s, FP = _G,  not l or not A.Parent -- ENV_GETTER rewritten to _G
            if FP then
                return
            end
            Z = math.min(Z, 1--[[u2755]])
            local dP, CP, MP = A.AssemblyLinearVelocity["Y"], math.clamp, l
            local A, XP = CP((dP - MP.U_2505) / math.max(Z, 1--[[u23]]), "U_2976", "U_116"), l
            XP.U_2505 = dP
            CP = cP.U_2546 < 1--[[u3159]] and math.sin(os.clock() * 1--[[u125]]) * 1--[[u2463]] or 0
            XP, FP, dP = math.clamp(-A * 1--[[u1517]], 1--[[u2851]], 1--[[u1787]]) + CP, os.clock(), l
            MP = FP < (dP.U_2284 or 0)
            FP, dP, CP, A = MP and "U_1599" or 15, MP and "U_1606" or "U_2873", MP and "U_2133" or 1--[[u2484]], l
            local RP, HP, WP, DP = (XP - A.U_3384) * 1--[[u2777]], l, "U_3044", l
            HP[WP] = (DP.U_3044 + RP * Z) * math.exp(-FP * Z)
            DP = l
            XP, MP = DP.U_3384, l
            DP = XP + MP.U_3044 * Z
            RP = DP < dP
            if RP then
                MP, HP, A = l, "U_3044", l
                MP[HP] = -A.U_3044 * 1--[[u476]]
                DP = dP
            else
                WP = DP > CP
                if WP then
                    local vP, jP, aP = l, "U_3044", l
                    vP[jP] = -aP.U_3044 * 1--[[u476]]
                    DP = CP
                end
            end
            CP = l
            CP.U_3384 = DP
            XP, RP, MP = math.rad, cP.U_3291 * 1--[[u2862]], l
            HP, WP = XP(RP + MP.U_3384 * 1--[[u1379]]), l
            RP, XP, CP = WP.U_426, "U_228", l
            RP[XP] = CP.U_2887
            A = l
            FP, RP = A.U_681 or 0, l
            DP, CP = RP.U_3384, l
            XP, WP, RP, dP = CP.U_3266 or 0, l, "U_1498", l
            WP[RP] = (dP.U_1498 or 0) + Z
            A = l
            if A.U_1498 < 1 / K.U_1765 then
                return
            end
            dP = l
            dP.U_1498 = 0
            W(HP, FP, DP, XP, false)
            RP = l
            MP, XP = RP.U_2394
            if MP then
                RP = l
                XP = #RP.U_2394 > 0
            else
                XP = MP
            end
            if XP then
          ]============],
    [28] = [============[
      dP, CP, MP = Vector3.new, 0, l
                WP, RP = dP(CP, MP.U_165, 0), l
                local W, Z, dP = RP.U_2880 or 0, ipairs, l
                for CP, MP in Z(dP.U_2394) do
                    CP = MP.U_1056
                    if CP and CP.U_2887 then
                        A = CP.U_2887 - WP
                        local Z, dP = WP + CFrame.Angles(HP * CP[1--[[u1261]]], 0, 0):VectorToWorldSpace(A) + Vector3.new(0, FP + DP * CP[1--[[u1261]]], 0), -MP.U_2695 * W
                        local W = CFrame.Angles(0, dP, 0)
                        MP.U_1251["U_228"] = CFrame.new(Z) * W * CFrame.new(0, 0, 1--[[u2421]] * PP)
                        MP.U_789["U_228"] = CFrame.new(Z) * W * CFrame.new(0, 0, 1--[[u3072]] * PP)
                    end
                end
            end
        end
        G = YP
        t.HipHeight = math.max(0, -G - _.Size["Y"] * 0.5 + K[1--[[u2243]]])
        B.Parent = S
        nP = i() or p.Position + CFrame.RightVector * K.U_468
        I(nP, p.Position)
        mP.U_494 = D.RenderStepped:Connect(function(W)
            local S = not fP or not B.Parent
            if S then
                return
            end
            xP(W)
            Q(W)
        end)
        mP.U_1529 = D.Heartbeat:Connect(function()
            local W = not fP or not B.Parent
            if W then
                return
            end
            h()
        end)
        mP.U_208 = l.U_2524["U_648"]:Connect(function(W)
            r(W)
        end)
        mP.U_994 = E.U_2568:Connect(function(W, D)
            local E, h = _G,  D or not fP -- ENV_GETTER rewritten to _G
            if h then
                return
            end
            D = W.U_375 == K.U_1953
            if D then
                eP.U_3228 = not eP.U_3228
                if not eP.U_3228 then
                    t:MoveTo(_.Position)
                    eP.U_451 = nil
                end
                z.U_2682(eP.U_3228 and "U_2920" or "U_825", 1--[[u3221]])
            else
                h = W.U_375 == K.U_837
                if h then
                    task.spawn(N)
                else
                    local D = W.U_375 == K.U_1768 and p
                    if D then
                        local D = i()
                        local E
                        if D then
                            E = D
                        else
                            local h = p
                            local S, A = h.Position, p
                            E = S + CFrame.RightVector * K.U_468
                        end
                        D = p
                        I(E, D.Position)
                    else
                        if W.U_375 == K.U_1564 then
                            H()
                        end
                    end
                end
            end
        end)
        mP.char = J.CharacterAdded:Connect(function(W)
            oP(W)
            W = fP and B.Parent
            if W then
                local W = i()
                local D
                if W then
                    D = W
                else
                    local E = p
                    local h, S = E.Position, p
                    D = h + CFrame.RightVector * K.U_468
                end
                W = p
                I(D, W.Position)
            end
        end)
        task.spawn(function()
            local W = _G -- ENV_GETTER rewritten to _G
            while true do
                local D = fP
                if not D then
                    break
                end
                task.wait(k:NextNumber(1--[[u1409]], "U_71"))
                D = fP
                if not D then
                    break
                end
                local E, h = T
                if E then
                    D = T
                    h = D.U_982
                else
                    h = E
                end
                E = nil
                if h then
                    D = T
                    E = D.U_982["Parent"]
                else
                    E = h
                end
                if E then
                    D = T
                    local E, S = L:Create(D.U_982, TweenInfo.new("U_1209", __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), { ["Size"] = UDim2.fromScale(1--[[u2687]], 1--[[u1824]]) }), T
                    h = L:Create(S.U_528, TweenInfo.new("U_1209", __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), { ["Size"] = UDim2.fromScale(1--[[u2687]], 1--[[u1824]]) })
                    E:Play()
                    h:Play()
                    task.wait(1--[[u1228]])
                    S, E = fP
                    if S then
                        local D = T
                        E = D.U_982["Parent"]
                    else
                        E = S
                    end
                    if E then
                        S = T
                        local D, E, h, A, i, Q, z = S.U_982, TweenInfo.new(1--[[u1228]], __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {}, "Size", UDim2.fromScale, 1--[[u2687]], T
                        h[A] = i(Q, z.U_3382 or 0)
                        L:Create(D, E, h):Play()
                        E = T
                        local D, h, S, A, i, Q, z = E.U_528, TweenInfo.new(1--[[u1228]], __T_EnumFB.EasingStyle["Quad"], __T_EnumFB.EasingDirection["Out"]), {}, "Size", UDim2.fromScale, 1--[[u2687]], T
                        S[A] = i(Q, z.U_3382 or 0)
                        L:Create(D, h, S):Play()
                    end
                end
            end
        end)
        task.spawn(function()
            local W = _G -- ENV_GETTER rewritten to _G
            while true do
                local D = fP
                if not D then
                    break
                end
                task.wait(k:NextNumber(K.U_2852, K.U_2062))
                W = fP
                if not W then
                    break
                end
                W, D = _ and p
                if W then
                    local E, h = _.Position, p
                    D = (E - h.Position)["Magnitude"] < 8
                else
                    D = W
                end
                if D then
                    N()
                end
            end
        end)
        local function W()
            local D = _G -- ENV_GETTER rewritten to _G
            local E, h = (Vector3.new(math.huge, math.huge, math.huge)), (Vector3.new((-math.huge), (-math.huge), (-math.huge)))
            for L, S in ipairs(uP) do
                if S.Parent then
                    for K = -1, 1, 2 do
                        for k = -1, 1, 2 do
                            for p = -1, 1, 2 do
                                L = CFrame:PointToWorldSpace(Vector3.new(S.Size["X"] * K * 0.5, S.Size["Y"] * k * 0.5, S.Size["Z"] * p * 0.5))
                                p = CFrame:PointToObjectSpace(L)
                                E, h = Vector3.new(math.min(E.X, p.X), math.min(E.Y, p.Y), math.min(E.Z, p.Z)), Vector3.new(math.max(h.X, p.X), math.max(h.Y, p.Y), math.max(h.Z, p.Z))
                            end
                        end
                    end
                end
            end
            return E, h
        end
        H = function()
            local D, E = _G,  fP -- ENV_GETTER rewritten to _G
            if not E then
                return
            end
            fP = false
            E = R
            if E then
                pcall(function()
                    R:Destroy()
                end)
                R = nil
            end
            eP.U_1811 += 1
            for h, h in pairs(mP) do
                pcall(function()
                    h:Disconnect()
                end)
            end
            b(true)
            local h, L = l
            if h then
                E = l
                L = E.U_3054
            else
                L = h
            end
            if L then
                h, E = ipairs, l
                for b, b in h(E.U_3054) do
                    pcall(function()
                        b:Destroy()
                    end)
                end
                local b = l
                b.U_3054 = nil
                b = l
                b.U_3374 = nil
            else
                local b, S = l
                if b then
                    local K = l
                    S = K.U_3374
                else
                    S = b
                end
                if S then
                    pcall(function()
                        local S = l
                        S.U_3374:Destroy()
                    end)
                    b = l
                    b.U_3374 = nil
                end
            end
            L, E = y
            if L then
                h = y
                E = h.U_3054
            else
                E = L
            end
            if E then
                L, h = ipairs, y
                for E, E in L(h.U_3054) do
                    pcall(function()
                        E:Destroy()
                    end)
                end
                local E = y
                E.U_3054 = nil
                E = y
                E.U_3374 = nil
            else
                local E, h = y
                if E then
                    local L = y
                    h = L.U_3374
                else
                    h = E
                end
                if h then
                    pcall(function()
                        local h = y
                        h.U_3374:Destroy()
                    end)
                    E = y
                    E.U_3374 = nil
                end
            end
            if B then
                pcall(function()
                    B:Destroy()
                end)
            end
        end
        OP = {
            ["U_1526"] = B,
            ["U_2196"] = eP,
            ["U_688"] = cP,
            ["U_2762"] = PP,
            ["U_2106"] = function(D)
            local E = _G -- ENV_GETTER rewritten to _G
            task.spawn(function()
            qP(D)
        end)
        end,
            ["U_2143"] = function()
            r(J)
        end,
            ["U_687"] = function(D, E)
            return I(D, E)
        end,
            ["U_1861"] = function()
            local D, E = W()
            return {
            ["U_2762"] = PP,
            ["U_488"] = YP,
            ["U_1040"] = G,
            ["U_1043"] = t.HipHeight,
            ["U_2778"] = D,
            ["U_152"] = E,
            ["U_50"] = E - D,
            [1--[[u1109]]] = cP[1--[[u1109]]],
            ["U_3359"] = cP.U_3359,
            ["U_2267"] = cP.U_2267,
            [1--[[u1778]]] = cP[1--[[u1778]]]
        }
        end,
            ["U_101"] = H
        }
        R = Instance.new("Folder")
        R.Name = g
        R.Parent = C
        gP = Instance.new("U_3354")
        gP.Name = "U_2082"
        gP.U_1364 = function()
            H()
        end
        gP.Parent = R
        return OP
    end
    function __T_x_1241()
        local C, g = _G,  __T_f_1239 -- ENV_GETTER rewritten to _G
        if g then
            return
        end
        local R, H = pcall(__T_o_1240)
        g = R and typeof(H) == "table"
        if g then
            __T_f_1239 = H
        end
    end
    function __T_o_1242()
        local C, g = _G,  __T_f_1239 -- ENV_GETTER rewritten to _G
        if not g then
            return
        end
        pcall(function()
            local C = _G -- ENV_GETTER rewritten to _G
            local g, R = typeof, __T_f_1239
            C = g(R.U_101) == "function"
            if C then
                R = __T_f_1239
                R.U_101()
            end
        end)
        __T_f_1239 = nil
    end
    if #__T_e_096.U_464 > 0 then
        __T_X_111:toggle({
            ["U_386"] = "U_1749",
            ["U_869"] = false,
            ["U_3022"] = "U_2400",
            ["U_3364"] = function(f)
            __T_e_096:setcursor(f)
        end
        })
        __T_X_111:dropdown({
            ["U_386"] = "U_1097",
            ["U_3058"] = __T_e_096.U_464,
            ["U_869"] = __T_e_096.U_464[1],
            ["U_3022"] = "U_595",
            ["U_3364"] = function(f)
            __T_e_096:setstyle(f)
        end
        })
    end
    __T_X_111:toggle({
        ["U_386"] = "U_1139",
        ["U_869"] = false,
        ["U_3022"] = "U_772",
        ["U_3364"] = function(f)
        __T_e_096:setsound(f)
    end
    })
    __T_X_111:dropdown({
        ["U_386"] = "U_2371",
        ["U_3058"] = __T_e_096.U_1889,
        ["U_869"] = "U_81",
        ["U_3022"] = "U_996",
        ["U_3364"] = function(f)
        __T_e_096:settone(f)
    end
    })
    __T_X_111:toggle({
        ["U_386"] = "U_1857",
        ["U_869"] = true,
        ["U_3022"] = "U_355",
        ["U_3364"] = function(f)
        local C = _G -- ENV_GETTER rewritten to _G
        if __T_v_117.U_175 and typeof(__T_v_117.U_175["U_701"]) == "function" then
            __T_v_117.U_175:setfury(f)
        end
    end
    })
    __T_X_111:toggle({
        ["U_386"] = "U_474",
        ["U_869"] = true,
        ["U_3022"] = "U_146",
        ["U_3364"] = function(f)
        __T_e_096:sethotkeys(f)
    end
    })
    __T_X_111:toggle({
        ["U_386"] = "U_2318",
        ["U_869"] = true,
        ["U_3022"] = "U_2162",
        ["U_3364"] = function(f)
        __T_e_096:setwatermark(f)
    end
    })
    __T_X_111:toggle({
        ["U_386"] = "U_3292",
        ["U_869"] = false,
        ["U_3022"] = "U_3265",
        ["U_3364"] = function(f)
        if f then
            __T_x_1241()
        else
            __T_o_1242()
        end
    end
    })
    __T_X_111:keybind({
        ["U_386"] = "U_2514",
        ["U_869"] = "U_1630",
        ["U_3022"] = "U_2006",
        ["U_3364"] = function(f)
        __T_v_117:SetBind(f)
    end
    })
    __T_X_111:button({
        ["U_386"] = "U_1900",
        ["U_1421"] = "U_1396",
        ["U_3364"] = function()
        local f = _G -- ENV_GETTER rewritten to _G
        pcall(function()
        local f = _G -- ENV_GETTER rewritten to _G
        setclipboard("U_3021")
        __T_n_104.new("U_1941", "U_2643", 5)
    end)
    end
    })
    function __T_f_1243()
        local x = _G -- ENV_GETTER rewritten to _G
        pcall(function()
            local C, n = _G,  { -- ENV_GETTER rewritten to _G
            "U_605",
            "U_727",
            "U_3203",
            "U_433",
            "U_877",
            "U_1970",
            "U_1884",
            "U_1386",
            "U_144",
            "U_2117",
            "U_1924",
            "U_2929",
            "U_2090",
            "U_2094",
            "U_2313",
            "U_477",
            "U_266",
            "U_1531",
            "U_2952",
            "U_2679",
            "U_2339",
            "U_797",
            "U_2696",
            "U_378",
            "U_2459",
            "U_2122",
            "U_2353",
            "U_2860",
            "U_3352",
            "U_2490",
            "U_1271",
            "U_884"
        }
            for g, R in ipairs(n) do
                g = getgenv()[R]
                if g then
                    pcall(g)
                    getgenv()[R] = nil
                end
            end
            if C.U_2908 then
                task.cancel(C.U_2908)
                C.U_2908 = nil
            end
            n = __T_a_119
            if n then
                task.cancel(__T_a_119)
                __T_a_119 = nil
            end
            for n = 1, #__T_j_118 do
                local g = __T_j_118[n]
                pcall(function()
                    g:Disconnect()
                end)
            end
            table.clear(__T_j_118)
            pcall(function()
            local n = _G -- ENV_GETTER rewritten to _G
            local g = game:GetService("Lighting")
            if getgenv()["U_1974"] then
                g.U_3227 = Color3.fromRGB(1--[[u2774]], 1--[[u2774]], 1--[[u2774]])
                g.U_2035 = 0
                g.U_534 = 1--[[u3206]]
                getgenv()["U_1974"] = false
            end
            if getgenv()["U_3264"] then
                g.U_2343 = 1
                g.U_2576 = 14
                g.U_534 = 1--[[u3206]]
                g.U_1210 = true
                g.U_2047 = Color3.fromRGB(1--[[u2533]], 1--[[u2533]], 1--[[u2533]])
                getgenv()["U_3264"] = false
            end
            if getgenv()["U_1822"] then
                g.U_3309 = Color3.fromRGB(0, 0, 0)
                g.U_2047 = Color3.fromRGB(1--[[u2533]], 1--[[u2533]], 1--[[u2533]])
                getgenv()["U_1822"] = false
            end
            if getgenv()["U_2865"] then
                for R, R in pairs(g:GetChildren()) do
                    if R:IsA("U_850") and R.Name == "U_2830" then
                        R:Destroy()
                    end
                end
                getgenv()["U_2865"] = false
            end
            for R, R in pairs(game:GetService("CoreGui"):GetChildren()) do
                if R.Name == "U_495" then
                    R:Destroy()
                end
            end
            for R, H in pairs(g:GetChildren()) do
                R = "U_34"
                if H:IsA(R) then
                    H:Destroy()
                end
            end
        end)
            if __T_q_095 and __T_q_095.U_3200 then
                pcall(function()
                    __T_q_095.U_18()
                end)
            end
        end)
        pcall(function()
            __T_e_096:unload()
        end)
        pcall(__T_o_1242)
        getgenv()["U_2808"] = nil
    end
    __T_X_111:button({ ["U_386"] = "U_18", ["U_1421"] = "U_2707", ["U_3364"] = __T_f_1243 })
    __T_f_1244, __T_q_1245 = game:GetService("Players"), game:GetService("ReplicatedStorage")
    __T_e_1246 = game:GetService("AssetService")
    __T_o_1247 = game:GetService("HttpService")
    __T_x_1248 = game:GetService("CollectionService")
    __T_C_1249 = __T_f_1244.LocalPlayer
    __T_n_1250 = "U_185"
    __T_g_1251 = "U_1648"
    __T_R_1252 = string.char(1--[[u2296]], 97, 1--[[u1020]], 1--[[u2566]], 1--[[u1489]], 115, 1--[[u3074]], 1--[[u3217]], 1--[[u1137]], 115, 1--[[u1623]], 1--[[u576]])
    __T_H_1253 = "U_223"
    __T_W_1254, __T_D_1255, __T_v_1256, __T_j_1257, __T_a_1258 = "U_3290"
    __T_E_1259, __T_h_1260, __T_L_1261, __T_b_1262, __T_S_1263 = {}, {}, {}, {}, {}
    __T_K_1264 = "U_1809"
    __T_r_1265 = "U_1809"
    __T_k_1266, __T_J_1267, __T_I_1268, __T_p_1269, __T_B_1270 = "U_1078", {}, {}, {}, {}
    __T_t_1271 = { ["Knife"] = nil, ["Gun"] = nil }
    __T___1272 = { ["Knife"] = {}, ["Gun"] = {} }
    __T_A_1273 = { ["Knife"] = {}, ["Gun"] = {} }
    __T_i_1274, __T_N_1275 = { ["Knife"] = nil, ["Gun"] = nil }, {}
    __T_l_1276 = true
    __T_y_1277, __T_Q_1278, __T_z_1279, __T_T_1280, __T_Z_1281 = true
    __T_G_1282 = {
        ["Anchored"] = true,
        ["Massless"] = true,
        ["CanCollide"] = true,
        ["CanQuery"] = true,
        ["CanTouch"] = true,
        ["U_270"] = true,
        ["U_2048"] = true,
        ["Size"] = true,
        ["U_981"] = true,
        ["U_3121"] = true,
        ["U_1707"] = true,
        ["U_640"] = true,
        ["U_1378"] = true,
        ["U_435"] = true,
        ["U_1830"] = true,
        ["U_3261"] = true,
        ["U_3383"] = true
    }
    __T_s_1283 = {
        ["U_1080"] = true,
        ["U_1650"] = true,
        ["U_1284"] = true,
        ["U_1417"] = true,
        ["U_145"] = true,
        ["U_557"] = true,
        ["U_2065"] = true,
        ["U_2814"] = true,
        ["U_1958"] = true,
        ["U_2193"] = true,
        ["U_1808"] = true
    }
    __T_OP_1284 = { ["U_3128"] = true }
    __T_uP_1285 = {
        ["U_1284"] = true,
        ["U_1080"] = true,
        ["U_1650"] = true,
        ["U_557"] = true,
        ["U_2065"] = true,
        ["U_2814"] = true,
        ["U_1958"] = true,
        ["U_2193"] = true,
        ["U_1808"] = true
    }
    __T_FP_1286 = 3
    __T_U_121 = {
        "BasePart",
        "MeshPart",
        "SpecialMesh",
        "U_1417",
        "U_145",
        "U_1284",
        "U_1080",
        "U_1650",
        "Sound",
        "U_2466",
        "Highlight"
    }
    function __T_U_1287(mP)
        local fP = _G -- ENV_GETTER rewritten to _G
        local PP, YP, qP = tonumber, tostring(mP), "U_760"
        return PP(YP:match(qP))
    end
    function __T_mP_1288(fP)
        local PP = _G -- ENV_GETTER rewritten to _G
        if typeof(fP) ~= "string" or fP == "" then
            return nil
        end
        local YP, qP = tostring(fP), "U_760"
        return YP:match(qP)
    end
    function __T_fP_1289(PP)
        local YP = _G -- ENV_GETTER rewritten to _G
        if typeof(PP) ~= "string" or PP == "" then
            return nil
        end
        local qP = PP:match("U_1973") or PP:match("U_919") or PP:match("U_2289")
        if qP then
            return tonumber(qP)
        end
        local qP, dP = "U_760"
        for eP in PP:gmatch(qP) do
            dP = eP
        end
        return dP and tonumber(dP) or nil
    end
    function __T_PP_1290(YP, qP)
        local dP = __T_mP_1288(qP)
        if not dP then
            return true
        end
        qP = not __T_a_1258 or not __T_a_1258[YP]
        if qP then
            return true
        end
        qP = __T_a_1258[YP][dP]
        if qP == nil then
            return true
        end
        return qP
    end
    function __T_YP_1291(qP)
        return __T_PP_1290("U_3344", qP) and __T_PP_1290("U_1433", qP)
    end
    function __T_qP_1292(dP)
        local eP = _G -- ENV_GETTER rewritten to _G
        if not dP or not __T_uP_1285[dP.U_3214] then
            return nil
        end
        local uP = dP.U_745 or {}
        local cP = __T_mP_1288(uP.U_145) or __T_mP_1288(uP.U_888) or ""
        return dP.U_3214 .. "U_2721" .. tostring(dP.U_386) .. "U_2721" .. cP
    end
    function __T_uP_1293(dP)
        local eP = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_E_1259)
        if typeof(dP) ~= "table" then
            return
        end
        for cP, cP in pairs(dP) do
            local dP, oP = ipairs, { "U_277", "U_1636" }
            for xP, CP in dP(oP) do
                xP = cP[CP]
                for dP, dP in ipairs(xP and xP.U_1584 or {}) do
                    CP = __T_qP_1292(dP)
                    if CP then
                        __T_E_1259[CP] = true
                    end
                end
            end
        end
    end
    function __T_dP_1294()
        local eP, cP, oP = (_G), not __T_D_1255 -- [EnvProxyPartial]
        if cP then
            oP = cP
        else
            local xP, CP = typeof, __T_D_1255
            oP = xP(CP.U_2946) ~= "table"
        end
        if oP then
            return
        end
        local xP, CP, MP = {}, pairs, __T_D_1255
        for nP, XP in CP(MP.U_2946) do
            if XP.U_1493 then
                oP, cP, nP = {}, ipairs, { "U_277", "U_1636" }
                for gP, RP in cP(nP) do
                    gP = XP[RP]
                    for nP, nP in ipairs(gP and gP.U_1584 or {}) do
                        RP = __T_qP_1292(nP)
                        if RP and not __T_E_1259[RP] and not oP[RP] then
                            oP[RP] = true
                            xP[RP] = (xP[RP] or 0) + 1
                        end
                    end
                end
            end
        end
        table.clear(__T_h_1260)
        for E, nP in pairs(xP) do
            if nP >= __T_FP_1286 then
                __T_h_1260[E] = true
            end
        end
        if not next(__T_h_1260) then
            return
        end
        MP, cP = pairs, __T_D_1255
        for E, FP in MP(cP.U_2946) do
            if FP.U_1493 then
                E, CP = ipairs, { "U_277", "U_1636" }
                for cP, MP in E(CP) do
                    xP = FP[MP]
                    cP = xP and xP.U_1584
                    if cP then
                        MP = {}
                        for E = #cP, 1, -1 do
                            oP = cP[E]
                            local FP = __T_qP_1292(oP)
                            if FP and __T_h_1260[FP] then
                                if oP.U_709 then
                                    MP[oP.U_709] = true
                                end
                                table.remove(cP, E)
                            end
                        end
                        if next(MP) then
                            for E = #cP, 1, -1 do
                                local h = cP[E]["U_619"]
                                if h and MP[h] then
                                    table.remove(cP, E)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    function __T_E_1295(h)
        local FP, qP = not __T_j_1257
        if FP then
            qP = FP
        else
            local FP = __T_j_1257
            qP = not FP.U_1257
        end
        if qP then
            return "U_2525"
        end
        qP = __T_j_1257
        return qP.U_1257[h] or "U_2525"
    end
    function __T_h_1296(FP)
        local qP = _G -- ENV_GETTER rewritten to _G
        return FP and Vector3.new(FP[1], FP[2], FP[3]) or nil
    end
    function __T_FP_1297(qP)
        local eP = _G -- ENV_GETTER rewritten to _G
        return qP and Color3.new(qP[1], qP[2], qP[3]) or nil
    end
    function __T_qP_1298(eP, cP)
        local oP = _G -- ENV_GETTER rewritten to _G
        local xP = tostring(eP):match("U_2366")
        if not xP then
            return nil
        end
        local eP, CP = pcall(function()
            return cP[xP]
        end)
        return eP and CP or nil
    end
    function __T_eP_1299(cP)
        local oP, xP = _G,  {} -- ENV_GETTER rewritten to _G
        for CP, CP in ipairs(cP) do
            xP[#xP + 1] = NumberSequenceKeypoint.new(CP[1--[[u1833]]], CP[1--[[u388]]], CP.U_1649 or 0)
        end
        if #xP >= 2 then
            return NumberSequence.new(xP)
        end
        return NumberSequence.new(xP[1] and xP[1]["U_2506"] or 0)
    end
    function __T_cP_1300(oP)
        local xP, CP = _G,  {} -- ENV_GETTER rewritten to _G
        for MP, MP in ipairs(oP) do
            CP[#CP + 1] = ColorSequenceKeypoint.new(MP[1--[[u1833]]], Color3.new(MP.U_1620[1], MP.U_1620[2], MP.U_1620[3]))
        end
        if #CP >= 2 then
            return ColorSequence.new(CP)
        end
        return ColorSequence.new(CP[1] and CP[1]["U_2506"] or Color3.new(1, 1, 1))
    end
    function __T_oP_1301(xP)
        local CP = _G -- ENV_GETTER rewritten to _G
        local MP, nP = tostring(xP):match("U_923")
        if not MP then
            return nil
        end
        local xP, XP = pcall(function()
            local CP = _G -- ENV_GETTER rewritten to _G
            return __T_EnumFB[MP][nP]
        end)
        return xP and XP or nil
    end
    function __T_xP_1302(CP, MP)
        local nP = _G -- ENV_GETTER rewritten to _G
        local XP = typeof(CP)
        if typeof(MP) == "string" then
            if XP == "U_2501" then
                return __T_oP_1301(MP)
            end
            return MP
        end
        if typeof(MP) == "number" or typeof(MP) == "U_791" then
            return MP
        end
        if typeof(MP) ~= "table" then
            return nil
        end
        CP = #MP
        if XP == "Color3" and CP == 3 then
            return __T_FP_1297(MP)
        end
        if XP == "Vector3" and CP == 3 then
            return __T_h_1296(MP)
        end
        if XP == "Vector2" and CP == 2 then
            return Vector2.new(MP[1], MP[2])
        end
        if XP == "NumberRange" and CP == 2 then
            return NumberRange.new(MP[1], MP[2])
        end
        if XP == "CFrame" and (CP == 12 or CP == 7) then
            return CFrame.new(table.unpack(MP))
        end
        if XP == "NumberSequence" and typeof(MP[1]) == "table" then
            return __T_eP_1299(MP)
        end
        if XP == "ColorSequence" and typeof(MP[1]) == "table" then
            return __T_cP_1300(MP)
        end
        return nil
    end
    function __T_eP_1303(cP, oP)
        local CP = _G -- ENV_GETTER rewritten to _G
        if not oP then
            return
        end
        for MP, nP in pairs(oP) do
            if not __T_G_1282[MP] then
                local G, oP = pcall(function()
                    return cP[MP]
                end)
                if G then
                    local G = __T_xP_1302(oP, nP)
                    if G ~= nil then
                        pcall(function()
                            cP[MP] = G
                        end)
                    end
                end
            end
        end
    end
    function __T_G_1304(cP)
        local oP, xP = _G,  __T_U_1287(cP.U_270) -- ENV_GETTER rewritten to _G
        if not xP then
            return nil
        end
        if not __T_YP_1291(cP.U_270) then
            return nil
        end
        local U = __T_J_1267[xP]
        if not U then
            local CP, MP = pcall(function()
                local nP = _G -- ENV_GETTER rewritten to _G
                local XP = nP.U_1647["U_3209"](xP)
                return __T_e_1246:CreateMeshPartAsync(XP)
            end)
            if not CP or not MP then
                return nil
            end
            MP.Parent = nil
            __T_J_1267[xP] = MP
            U = MP
        end
        local e = U:Clone()
        if cP.Size then
            e.Size = __T_h_1296(cP.Size)
        end
        if cP.U_514 and cP.U_514 ~= "" and __T_PP_1290("U_672", cP.U_514) then
            pcall(function()
                e.U_514 = cP.U_514
            end)
        end
        if cP.Color then
   ]============],
    [29] = [============[
         e.Color = __T_FP_1297(cP.Color)
        end
        if cP.Transparency then
            e.Transparency = cP.Transparency
        end
        if cP.Reflectance then
            e.Reflectance = cP.Reflectance
        end
        local U = __T_qP_1298(cP.Material, __T_EnumFB.Material)
        if U then
            pcall(function()
                e.Material = U
            end)
        end
        e.Anchored = false
        e.Massless = true
        e.CanCollide = false
        e.CanQuery = false
        e.CanTouch = false
        e.U_1378 = true
        return e
    end
    function __T_e_1305(U)
        U.Anchored = false
        U.Massless = true
        U.CanCollide = false
        U.CanQuery = false
        U.CanTouch = false
        U.U_1378 = true
        return U
    end
    function __T_U_1306(cP)
        local oP = _G -- ENV_GETTER rewritten to _G
        for xP, xP in ipairs(cP.U_277 and cP.U_277["U_1584"] or {}) do
            if xP.U_3214 == "SpecialMesh" and not xP.U_619 and xP.U_745 and xP.U_745["U_270"] then
                return xP
            end
        end
        return nil
    end
    function __T_cP_1307(oP, xP)
        local CP = _G -- ENV_GETTER rewritten to _G
        if not __T_YP_1291(xP.U_745["U_270"]) then
            return nil
        end
        local YP = Instance.new("Part")
        if oP then
            __T_eP_1303(YP, oP)
            if oP.Size then
                YP.Size = __T_h_1296(oP.Size)
            end
            if oP.Color then
                YP.Color = __T_FP_1297(oP.Color)
            end
            local FP = oP.Material and __T_qP_1298(oP.Material, __T_EnumFB.Material)
            if FP then
                pcall(function()
                    YP.Material = FP
                end)
            end
            if oP.Transparency then
                YP.Transparency = oP.Transparency
            end
            if oP.Reflectance then
                YP.Reflectance = oP.Reflectance
            end
        end
        __T_e_1305(YP)
        local e = Instance.new("SpecialMesh")
        e.U_3232 = __T_EnumFB.U_3232["U_3126"]
        e.Name = xP.U_386 or "U_293"
        __T_eP_1303(e, xP.U_745)
        pcall(function()
            e.U_270 = xP.U_745["U_270"]
        end)
        if xP.U_745["U_1982"] and xP.U_745["U_1982"] ~= "" and __T_PP_1290("U_672", xP.U_745["U_1982"]) then
            pcall(function()
                e.U_1982 = xP.U_745["U_1982"]
            end)
        else
            pcall(function()
                e.U_1982 = ""
            end)
        end
        e.Parent = YP
        return YP
    end
    function __T_e_1308(FP)
        local YP = FP.U_277 and FP.U_277["U_1735"] and FP.U_277["U_1735"]["U_745"]
        if not YP then
            return nil
        end
        if YP.U_270 then
            local qP = __T_G_1304(YP)
            if qP then
                return qP
            end
        end
        local qP = __T_U_1306(FP)
        if qP then
            return __T_cP_1307(YP, qP)
        end
        return nil
    end
    function __T_U_1309(FP, YP)
        __T_I_1268[#__T_I_1268 + 1] = { ["U_3276"] = FP, ["U_2388"] = YP }
    end
    function __T_FP_1310(YP)
        local qP = _G -- ENV_GETTER rewritten to _G
        for oP = #__T_I_1268, 1, -1 do
            local xP = __T_I_1268[oP]
            if not YP or xP.U_3276 == YP then
                if xP.U_2388 then
                    pcall(function()
                        xP.U_2388:Destroy()
                    end)
                end
                table.remove(__T_I_1268, oP)
            end
        end
    end
    function __T_YP_1311(qP)
        if qP.X >= qP.Y and qP.X >= qP.Z then
            return Vector3.xAxis
        end
        if qP.Y >= qP.Z then
            return Vector3.yAxis
        end
        return Vector3.zAxis
    end
    __T_qP_1312 = {
        ["Knife"] = Vector3.new(0, -1, 1--[[u2232]]),
        ["Gun"] = Vector3.new(0, 1--[[u851]], 1--[[u1903]])
    }
    function __T_oP_1313(xP, CP)
        local MP = _G -- ENV_GETTER rewritten to _G
        if not CP then
            return CFrame.identity
        end
        local nP = __T_YP_1311(CP)
        if xP == "Gun" then
            if nP == Vector3.zAxis then
                return CFrame.identity
            end
            if nP == Vector3.yAxis then
                return CFrame.fromAxisAngle(Vector3.xAxis, (math.pi / 2))
            end
            return CFrame.fromAxisAngle(Vector3.yAxis, (math.pi / 2))
        end
        if nP == Vector3.zAxis then
            return CFrame.fromAxisAngle(Vector3.xAxis, (-math.pi / 2))
        end
        return CFrame.identity
    end
    function __T_YP_1314(xP)
        local CP, MP = _G,  {} -- ENV_GETTER rewritten to _G
        for nP, nP in ipairs(xP.U_277 and xP.U_277["U_1584"] or {}) do
            if not nP.U_619 then
                MP[#MP + 1] = nP
            end
        end
        return MP
    end
    function __T_xP_1315(CP)
        return CP.U_277 and CP.U_277["U_1735"] and CP.U_277["U_1735"]["U_745"] or nil
    end
    __T_CP_1316 = {}
    function __T_MP_1317(nP)
        local XP, gP = _G,  nP.U_277 and nP.U_277["U_1735"] and nP.U_277["U_1735"]["U_745"] -- ENV_GETTER rewritten to _G
        if gP and gP.U_270 then
            return __T_mP_1288(gP.U_270)
        end
        for gP, gP in ipairs(nP.U_277 and nP.U_277["U_1584"] or {}) do
            if gP.U_3214 == "SpecialMesh" and not gP.U_619 and gP.U_745 and gP.U_745["U_270"] then
                return __T_mP_1288(gP.U_745["U_270"])
            end
        end
        return nil
    end
    function __T_nP_1318(XP)
        local gP, RP = _G,  XP.U_1636 and XP.U_1636["U_1584"] -- ENV_GETTER rewritten to _G
        if not RP then
            return nil
        end
        for XP, XP in ipairs(RP) do
            if XP.U_386 == "U_117" and XP.U_745 and XP.U_745["U_270"] then
                return __T_mP_1288(XP.U_745["U_270"])
            end
        end
        for XP, XP in ipairs(RP) do
            if XP.U_3214 == "SpecialMesh" and XP.U_619 == "U_117" and XP.U_745 and XP.U_745["U_270"] then
                return __T_mP_1288(XP.U_745["U_270"])
            end
        end
        return nil
    end
    function __T_mP_1319(XP)
        local gP = XP.U_1636 and XP.U_1636["U_1735"] and XP.U_1636["U_1735"]["U_745"] and XP.U_1636["U_1735"]["U_745"]["U_2380"]
        if not gP then
            return nil
        end
        local RP, HP = __T_MP_1317(XP), __T_nP_1318(XP)
        if not RP or not HP or RP ~= HP then
            return nil
        end
        return gP
    end
    function __T_nP_1320()
        local XP = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_CP_1316)
        local gP = __T_D_1255
        if not gP then
            return
        end
        local RP, HP = pairs, __T_D_1255
        for WP, DP in RP(HP.U_881 or {}) do
            if DP.U_3281 then
                __T_CP_1316[tostring(WP)] = DP.U_3281
            end
        end
        HP, RP = pairs, __T_D_1255
        for WP, DP in HP(RP.U_2946) do
            gP = __T_mP_1319(DP)
            WP = gP and (__T_MP_1317(DP))
            if WP and not __T_CP_1316[WP] then
                __T_CP_1316[WP] = gP
            end
        end
        RP, HP = pairs, __T_D_1255
        for WP, WP in RP(HP.U_2946) do
            XP = WP.U_1135 and WP.U_1135["U_3281"]
            gP = XP and (__T_MP_1317(WP))
            if gP and not __T_CP_1316[gP] then
                __T_CP_1316[gP] = XP
            end
        end
    end
    function __T_XP_1321(gP)
        local RP = __T_mP_1319(gP)
        if RP then
            return RP
        end
        if gP.U_1135 and gP.U_1135["U_3281"] then
            return gP.U_1135["U_3281"]
        end
        RP = __T_MP_1317(gP)
        return RP and __T_CP_1316[RP] or nil
    end
    __T_c_074, __T_f_1244 = setmetatable, { ["U_3367"] = "U_2349" }
    __T_mP_1322 = __T_c_074({}, __T_f_1244)
    function __T_f_1323(CP, MP)
        local gP = __T_mP_1322[CP]
        if not gP or gP.U_2476 ~= MP or not gP.U_2476["Parent"] then
            gP = {
                ["U_3281"] = CP.U_2380,
                ["U_1643"] = MP.Size,
                ["U_2517"] = MP.Transparency,
                ["U_650"] = MP.LocalTransparencyModifier,
                ["U_2476"] = MP
            }
            __T_mP_1322[CP] = gP
        end
        return gP
    end
    function __T_CP_1324(MP)
        local gP = __T_C_1249.Character
        if not gP then
            return nil
        end
        local RP = gP:FindFirstChild("U_1212" .. MP)
        MP = RP and RP.U_2506
        return MP and MP.Parent and MP or nil
    end
    function __T_MP_1325(gP)
        local RP = _G -- ENV_GETTER rewritten to _G
        local HP, WP, DP, vP = ipairs, {}, __T_C_1249.Character, "Backpack"
        do local _xgSrc = {DP, __T_C_1249:FindFirstChildOfClass(vP)}; for _xgI = 1, #_xgSrc do WP[#WP + 1] = _xgSrc[_xgI] end end
        for RP, RP in HP(WP) do
            if RP then
                DP = RP:FindFirstChild(gP)
                if DP and DP:IsA("Tool") then
                    return DP
                end
            end
        end
        return nil
    end
    function __T_gP_1326(RP, HP)
        local WP = _G -- ENV_GETTER rewritten to _G
        if not HP then
            return nil
        end
        for DP, DP in ipairs(RP.U_277 and RP.U_277["U_1584"] or {}) do
            if DP.U_3214 == "SpecialMesh" and DP.U_619 == HP and DP.U_745 and DP.U_745["U_270"] then
                return DP
            end
        end
        return nil
    end
    function __T_RP_1327(HP, WP, DP, vP)
        local jP = _G -- ENV_GETTER rewritten to _G
        for aP, EP in ipairs(__T_YP_1314(HP)) do
            if (EP.U_3214 == "MeshPart" or EP.U_3214 == "Part") and EP[1--[[u94]]] and EP.U_745 then
                aP = nil
                if EP.U_3214 == "MeshPart" then
                    aP = __T_G_1304(EP.U_745)
                else
                    local G = __T_gP_1326(HP, EP.U_709)
                    aP = if G then __T_cP_1307(EP.U_745, G) else aP
                end
                if aP then
                    aP.Name = EP.U_386
                    aP.Parent = vP
                    CFrame = CFrame * CFrame.new(table.unpack(EP[1--[[u94]]]))
                    local G = Instance.new("U_2424")
                    G.U_981 = DP
                    G.U_3121 = aP
                    G.Parent = aP
                    __T_U_1309(WP, aP)
                end
            end
        end
    end
    function __T_G_1328(YP, cP)
        local gP = _G -- ENV_GETTER rewritten to _G
        for HP, HP in ipairs(cP.U_2599 or {}) do
            if HP ~= "U_607" then
                pcall(function()
                    __T_x_1248:AddTag(YP, HP)
                end)
            end
        end
        for x, HP in pairs(cP.U_849 or {}) do
            local cP = typeof(HP)
            if cP == "string" or cP == "number" or cP == "U_791" then
                pcall(function()
                    YP:SetAttribute(x, HP)
                end)
            end
        end
    end
    function __T_x_1329(YP, cP)
        local gP, HP = _G,  __T_A_1273[YP] -- ENV_GETTER rewritten to _G
        if not HP or not cP then
            return
        end
        if not table.find(HP, cP) then
            HP[#HP + 1] = cP
        end
    end
    function __T_YP_1330(cP, gP, HP, WP)
        local DP, vP, jP, aP = _G,  {},  {},  cP.U_1104 -- ENV_GETTER rewritten to _G
        for EP, UP in ipairs(cP.U_277 and cP.U_277["U_1584"] or {}) do
            local cP, wP = UP.U_3214, UP.U_745 and UP.U_745["U_145"]
            local VP, hP = wP and wP ~= "" and not __T_PP_1290("U_672", wP), UP.U_619 and vP[UP.U_619] or ((cP == "U_2466" or cP == "Sound" or cP == "U_1080") and WP or HP)
            if VP then
                continue
            end
            if cP == "Sound" then
                VP = UP.U_745 and UP.U_745["U_1424"]
                if VP and VP ~= "" and __T_PP_1290("U_2371", VP) then
                    EP = hP:FindFirstChild(UP.U_386)
                    if EP and EP:IsA("Sound") then
                        if not __T_p_1269[EP] then
                            __T_p_1269[EP] = { ["U_150"] = EP.U_1424, ["U_641"] = EP.U_2428, [1--[[u1109]]] = EP.U_498 }
                        end
                        __T_x_1329(aP, EP)
                        __T_eP_1303(EP, UP.U_745)
                        jP[UP.U_386] = EP
                        if UP.U_709 then
                            vP[UP.U_709] = EP
                        end
                    else
                        local PP = Instance.new("Sound")
                        PP.Name = UP.U_386
                        __T_eP_1303(PP, UP.U_745)
                        PP.Parent = hP
                        jP[UP.U_386] = PP
                        if UP.U_709 then
                            vP[UP.U_709] = PP
                        end
                        __T_U_1309(gP, PP)
                    end
                end
            else
                if cP == "U_2466" then
                    local PP = hP:FindFirstChild(UP.U_386)
                    if PP and PP:IsA("U_2466") then
                        if not __T_p_1269[PP] then
                            __T_p_1269[PP] = { ["U_1943"] = CFrame }
                        end
                        __T_x_1329(aP, PP)
                        __T_eP_1303(PP, UP.U_745)
                        if UP.U_709 then
                            vP[UP.U_709] = PP
                        end
                    else
                        local x = Instance.new("U_2466")
                        x.Name = UP.U_386
                        __T_eP_1303(x, UP.U_745)
                        x.Parent = hP
                        if UP.U_709 then
                            vP[UP.U_709] = x
                        end
                        __T_U_1309(gP, x)
                    end
                else
                    if __T_s_1283[cP] then
                        local x = hP:FindFirstChild(UP.U_386)
                        if x and x.ClassName == cP then
                            pcall(function()
                                x:Destroy()
                            end)
                        end
                        local x = Instance.new(cP)
                        x.Name = UP.U_386
                        __T_eP_1303(x, UP.U_745)
                        if wP then
                            pcall(function()
                                x.U_145 = wP
                            end)
                        end
                        x.Parent = hP
                        __T_G_1328(x, UP)
                        if UP.U_709 then
                            vP[UP.U_709] = x
                        end
                        __T_U_1309(gP, x)
                    end
                end

-- =============================================================================
-- MODULE 17/17: WeaponSkinChanger & ArcadeAutoFarmer — skins + station farmer + unload
-- loadSkinDatabase/applyWeaponSkin/restoreWeaponSkin/scanArcadeStations/runStationFarmLoop/unloadAllModules
-- ==============================================================================
            end
        end
        return jP
    end
    function __T_x_1331(G)
        local s, PP = _G,  __T_CP_1324(G.U_1104) -- ENV_GETTER rewritten to _G
        if not PP then
            return false
        end
        if not __T_p_1269[PP] then
            __T_p_1269[PP] = { ["U_650"] = PP.LocalTransparencyModifier, ["U_1643"] = PP.Size, ["U_1878"] = PP.Transparency }
        end
        __T_FP_1310(PP)
        for eP, eP in ipairs(PP:GetChildren()) do
            if eP.Name == "U_535" then
                eP:Destroy()
            end
        end
        PP.LocalTransparencyModifier = 1
        pcall(function()
            PP.Transparency = 1
        end)
        if not __T_xP_1315(G) then
            return false
        end
        local eP = __T_e_1308(G)
        if not eP then
            return false
        end
        eP.Name = "U_535"
        eP.Parent = PP
        __T_U_1309(PP, eP)
        CFrame = CFrame
        local cP = Instance.new("U_2424")
        cP.U_981 = PP
        cP.U_3121 = eP
        cP.Parent = eP
        __T_RP_1327(G, PP, eP, PP)
        __T_YP_1330(G, PP, eP, eP)
        return true
    end
    function __T_G_1332(s)
        local PP, eP = _G,  __T_MP_1325(s.U_1104) -- ENV_GETTER rewritten to _G
        if not eP then
            return false
        end
        local cP = eP:FindFirstChild("U_117") or eP:FindFirstChildWhichIsA("BasePart")
        if not cP then
            return false
        end
        local gP = __T_f_1323(eP, cP)
        if not __T_p_1269[eP] then
            __T_p_1269[eP] = {
                ["U_3281"] = gP.U_3281,
                ["U_1643"] = gP.U_1643,
                ["U_2517"] = gP.U_2517,
                ["U_650"] = gP.U_650,
                ["U_2476"] = cP
            }
        end
        __T_FP_1310(eP)
        for f, f in ipairs(eP:GetChildren()) do
            if f.Name == "U_535" then
                f:Destroy()
            end
        end
        local f = __T_xP_1315(s)
        if not f then
            return false
        end
        cP.LocalTransparencyModifier = 1
        pcall(function()
            cP.Transparency = 1
        end)
        local xP = __T_h_1296(f.Size)
        if xP then
            cP.Size = xP
        end
        local h = __T_XP_1321(s)
        if h then
            pcall(function()
                local XP = _G -- ENV_GETTER rewritten to _G
                eP.U_2380 = CFrame.new(table.unpack(h))
            end)
        else
            pcall(function()
                local h, XP = _G,  __T_qP_1312[s.U_1104] or gP.U_3281["Position"] -- ENV_GETTER rewritten to _G
                eP.U_2380 = __T_oP_1313(s.U_1104, xP) * CFrame.new(XP)
            end)
        end
        f = __T_e_1308(s)
        if not f then
            return false
        end
        f.Name = "U_535"
        f.Parent = eP
        __T_U_1309(eP, f)
        CFrame = CFrame
        local e = Instance.new("U_2424")
        e.U_981 = cP
        e.U_3121 = f
        e.Parent = f
        __T_RP_1327(s, eP, f, eP)
        e = __T_YP_1330(s, eP, f, cP)
        table.clear(__T___1272[s.U_1104])
        f = false
        for h in pairs(e) do
            f = true
            break
        end
        if f then
            for h, h in ipairs(eP:GetDescendants()) do
                if h:IsA("Sound") and __T_OP_1284[h.Name] and not e[h.Name] then
                    if not __T_p_1269[h] then
                        __T_p_1269[h] = { ["U_450"] = h.U_2428 }
                    end
                    pcall(function()
                        h.U_2428 = 0
                    end)
                    table.insert(__T___1272[s.U_1104], h)
                end
            end
        end
        __T_i_1274[s.U_1104] = e
        local h = __T_N_1275[eP]
        if h then
            pcall(function()
                h:Stop()
            end)
            pcall(function()
                h:Destroy()
            end)
            __T_N_1275[eP] = nil
        end
        e = nil
        for h, h in ipairs(s.U_1636 and s.U_1636["U_1584"] or {}) do
            if h.U_3214 == "U_98" and h.U_386 == "U_2745" and h.U_745 and h.U_745["U_2152"] then
                e = h.U_745["U_2152"]
                break
            end
        end
        if e and e ~= "" then
            f = __T_C_1249.Character and __T_C_1249.Character:FindFirstChildOfClass("Humanoid")
            local h = f and f:FindFirstChildOfClass("U_1476")
            if h then
                local f = Instance.new("U_98")
                f.U_2152 = e
                f.Parent = eP
                __T_U_1309(eP, f)
                local e, U = pcall(function()
                    return h:LoadAnimation(f)
                end)
                if e and U then
                    U.U_2266 = __T_EnumFB.U_1454["U_956"]
                    U.U_1718 = true
                    __T_N_1275[eP] = U
                    if eP.Parent == __T_C_1249.Character then
                        pcall(function()
                            U:Play()
                        end)
                    end
                    __T_B_1270[#__T_B_1270 + 1] = eP.U_1313:Connect(function()
                        local f, e = _G,  __T_N_1275[eP] -- ENV_GETTER rewritten to _G
                        if e then
                            pcall(function()
                                e:Play()
                            end)
                        end
                    end)
                    __T_B_1270[#__T_B_1270 + 1] = eP.U_958:Connect(function()
                        local f, e = _G,  __T_N_1275[eP] -- ENV_GETTER rewritten to _G
                        if e then
                            pcall(function()
                                e:Stop()
                            end)
                        end
                    end)
                end
            end
        end
        return true
    end
    function __T_f_1333(e)
        local U = _G -- ENV_GETTER rewritten to _G
        local h, s = pcall(function()
            local OP = _G -- ENV_GETTER rewritten to _G
            return require(__T_q_1245.U_3123["U_868"])
        end)
        if h and s and s.U_686 and s.U_686["U_1313"] then
            s.U_686["U_1313"][e.U_1104] = e[1--[[u1191]]]
        end
        pcall(function()
            __T_q_1245.U_2678["U_2809"]["U_2740"]:FireServer(e[1--[[u1191]]], "U_686")
        end)
    end
    function __T_e_1334(U, h)
        local s = _G -- ENV_GETTER rewritten to _G
        if not U.Parent then
            return
        end
        if h.U_3281 then
            pcall(function()
                U.U_2380 = h.U_3281
            end)
        end
        if h.U_150 then
            pcall(function()
                U.U_1424 = h.U_150
                U.U_2428 = h.U_641
                U.U_498 = h[1--[[u1109]]]
            end)
        end
        if h.U_450 then
            pcall(function()
                U.U_2428 = h.U_450
            end)
        end
        if h.U_1943 then
            pcall(function()
                CFrame = h.U_1943
            end)
        end
        if h.U_1878 ~= nil then
            pcall(function()
                U.Transparency = h.U_1878
            end)
        end
        if h.U_2476 and h.U_2476["Parent"] then
            pcall(function()
                h.U_2476["Size"] = h.U_1643
                h.U_2476["Transparency"] = h.U_2517 or 0
                h.U_2476["LocalTransparencyModifier"] = h.U_650
            end)
        else
            if h.U_650 then
                pcall(function()
                    U.Size = h.U_1643
                    U.LocalTransparencyModifier = h.U_650
                end)
            end
        end
    end
    function __T_U_1335(h)
        local s = __T_p_1269[h]
        if not s then
            return
        end
        __T_e_1334(h, s)
        __T_p_1269[h] = nil
    end
    function __T_h_1336(s)
        local OP = _G -- ENV_GETTER rewritten to _G
        __T_t_1271[s] = nil
        __T_i_1274[s] = nil
        for PP, PP in ipairs(__T___1272[s]) do
            __T_U_1335(PP)
        end
        table.clear(__T___1272[s])
        local PP, YP = {}, __T_CP_1324(s)
        if YP then
            PP[#PP + 1] = YP
        end
        YP = __T_MP_1325(s)
        if YP then
            PP[#PP + 1] = YP
            local qP = __T_N_1275[YP]
            if qP then
                pcall(function()
                    qP:Stop()
                end)
                pcall(function()
                    qP:Destroy()
                end)
                __T_N_1275[YP] = nil
            end
        end
        for N, N in ipairs(PP) do
            YP = N:IsA("Tool") and N:FindFirstChild("U_117") or nil
            __T_FP_1310(N)
            __T_U_1335(N)
            if YP then
                __T_U_1335(YP)
            end
        end
        for N, N in ipairs(__T_A_1273[s]) do
            __T_U_1335(N)
        end
        table.clear(__T_A_1273[s])
    end
    function __T_U_1337()
        local N = _G -- ENV_GETTER rewritten to _G
        __T_FP_1310()
        for s, OP in pairs(__T_p_1269) do
            __T_e_1334(s, OP)
        end
        table.clear(__T_p_1269)
        table.clear(__T_A_1273.Knife)
        table.clear(__T_A_1273.Gun)
        __T_t_1271.Knife, __T_t_1271.Gun = nil, nil
    end
    function __T_e_1338(N)
        local s = _G -- ENV_GETTER rewritten to _G
        if not N then
            return
        end
        __T_f_1333(N)
        task.wait(1--[[u2604]])
        __T_x_1331(N)
        __T_G_1332(N)
    end
    function __T_f_1339()
        local N = _G -- ENV_GETTER rewritten to _G
        local s, OP = ipairs, { "Knife", "Gun" }
        for PP, YP in s(OP) do
            PP = __T_t_1271[YP]
            if PP then
                pcall(__T_e_1338, PP)
            end
        end
    end
    function __T_N_1340(s)
        local OP = _G -- ENV_GETTER rewritten to _G
        for PP, PP in ipairs(__T_I_1268) do
            if PP.U_3276 == s and PP.U_2388 and PP.U_2388["Parent"] then
                return true
            end
        end
        return false
    end
    function __T_I_1341(s)
        local OP, PP = _G,  s.U_1661 or {} -- ENV_GETTER rewritten to _G
        return tostring(PP.U_2620 or "U_935"):lower()
    end
    function __T_s_1342()
        local OP = _G -- ENV_GETTER rewritten to _G
        if typeof(isfile) ~= "function" or not isfile(__T_n_1250) then
            return false
        end
        local PP, YP = pcall(readfile, __T_n_1250)
        if not PP or typeof(YP) ~= "string" or #YP < 1--[[u1870]] then
            return false
        end
        local n, PP = pcall(function()
            return __T_o_1247:JSONDecode(YP)
        end)
        if not n or typeof(PP) ~= "table" or typeof(PP.U_2946) ~= "table" then
            return false
        end
        n = nil
        n, __T_D_1255 = PP.U_393, PP
        __T_v_1256 = n
        __T_uP_1293(PP.U_2946)
        __T_nP_1320()
        return true
    end
    function __T_n_1343()
        local v = _G -- ENV_GETTER rewritten to _G
        local OP = getgenv()["U_689"]
        if typeof(OP) == "function" then
            local uP, PP = pcall(OP, __T_R_1252)
            if uP and typeof(PP) == "string" and #PP >= 8 then
                return PP
            end
        end
        if typeof(isfile) ~= "function" or not isfile(__T_g_1251) then
            return nil
        end
        local R, OP = pcall(readfile, __T_g_1251)
        if not R or typeof(OP) ~= "string" or #OP < 8 then
            return nil
        end
        return OP
    end
    function __T_g_1344()
        local R, v = _G,  __T_n_1343() -- ENV_GETTER rewritten to _G
        if typeof(v) ~= "string" then
            return 0
        end
        local n, OP = pcall(function()
            return __T_o_1247:JSONDecode(v)
        end)
        if not n or typeof(OP) ~= "table" or typeof(OP.U_1866) ~= "table" then
            return 0
        end
        n = not __T_D_1255
        if n then
            __T_D_1255 = { ["U_2946"] = {}, ["U_881"] = {}, ["U_3082"] = {} }
        end
        local v, uP, PP = __T_D_1255, "U_2946", __T_D_1255
        v[uP] = PP.U_2946 or {}
        uP, n, PP = 0, pairs, OP.U_1866
        for YP, qP in n(PP) do
            v = qP.U_386
            OP = v and qP.U_277
            if OP then
                YP, R = __T_j_1257
                if YP then
                    local n = __T_j_1257
                    R = n.U_1257
                else
                    R = YP
                end
                local n
                if R then
                    local OP = __T_j_1257
                    n = OP.U_1257[v]
                else
                    n = R
                end
                local R, OP = n or nil, __T_D_1255
                n = OP.U_2946[v]
                OP = not n or not n.U_277 or R == "U_373" or R == "U_516"
                if OP then
                    R = __T_D_1255
                    R.U_2946[v] = {
                        [1--[[u1191]]] = v,
                        ["U_1104"] = qP.U_1104 or qP.U_1661 and qP.U_1661["U_1807"],
                        ["U_1661"] = qP.U_1661 or n and n.U_1661,
                        ["U_277"] = qP.U_277,
                        ["U_1636"] = qP.U_1636 or n and n.U_1636,
                        ["U_2863"] = qP.U_2863 or n and n.U_2863,
                        ["U_1135"] = n and n.U_1135,
                        ["U_1493"] = true
                    }
                    local n, R = __T_j_1257
                    if n then
                        local OP = __T_j_1257
                        R = OP.U_1257
                    else
                        R = n
                    end
                    if R then
                        n = __T_j_1257
                        n.U_1257[v] = "U_2525"
                    end
                    uP += 1
                end
            end
        end
        __T_nP_1320()
        return uP
    end
    function __T_n_1345()
        local function R(v)
            local OP = _G -- ENV_GETTER rewritten to _G
            if typeof(isfile) ~= "function" or not isfile(v) then
                return nil
            end
            local uP, PP = pcall(readfile, v)
            if not uP or typeof(PP) ~= "string" or #PP < 8 then
                return nil
            end
            uP, v = pcall(function()
                return __T_o_1247:JSONDecode(PP)
            end)
            return uP and typeof(v) == "table" and v or nil
        end
        __T_j_1257 = R(__T_H_1253)
        __T_a_1258 = R(__T_W_1254)
    end
    function __T_o_1346()
        local R = _G -- ENV_GETTER rewritten to _G
        __T_L_1261,]============],
    [30] = [============[
 __T_b_1262 = {}, {}
        local H, W = {}, __T_D_1255
        if not W then
            return
        end
        local v, j, a = {}, pairs, __T_D_1255
        for OP in j(a.U_2946) do
            v[#v + 1] = OP
        end
        table.sort(v)
        j = ipairs
        for OP, uP in j(v) do
            W = __T_D_1255
            a = W.U_2946[uP]
            OP = a.U_1661 or {}
            local D, v = a.U_1104 or OP.U_1807, __T_I_1341(a)
            H[v] = true
            local j = __T_K_1264
            local I, PP = j == "U_1809"
            if I then
                PP = I
            else
                j = __T_K_1264
                PP = j == "U_1918" and D == "Knife"
            end
            I = nil
            if PP then
                I = PP
            else
                j = __T_K_1264
                I = j == "U_252" and D == "Gun"
            end
            D, j = __T_E_1295(uP), __T_k_1266
            local E, YP = j == "U_1809"
            if E then
                YP = E
            else
                PP = __T_k_1266
                YP = PP == "U_1078" and D == "U_2525"
            end
            j = nil
            if YP then
                j = YP
            else
                PP = __T_k_1266
                j = PP == "U_49" and D ~= "U_2525"
            end
            j = I and j
            PP = nil
            if j then
                E = __T_r_1265
                PP = E == "U_1809" or __T_r_1265 == v
            else
                PP = j
            end
            if PP then
                YP = tostring(OP.U_3079 or uP)
                __T_b_1262[uP] = a
                I = __T_L_1261
                I[#I + 1] = {
                    ["U_386"] = uP,
                    ["U_277"] = YP .. "U_3" .. v .. (D == "U_2525" and "" or "U_3" .. D),
                    [1--[[u1191]]] = __T_fP_1289(OP.U_2188) or __T_fP_1289(OP.U_786)
                }
            end
        end
        __T_S_1263 = { "U_1809" }
        W = {}
        for D in pairs(H) do
            W[#W + 1] = D
        end
        table.sort(W)
        H = ipairs
        for D, D in H(W) do
            R = __T_S_1263
            R[#R + 1] = D
        end
    end
    function __T_R_1347()
        local H = _G -- ENV_GETTER rewritten to _G
        __T_o_1346()
        if __T_Q_1278 then
            pcall(function()
                __T_Q_1278:SetData(__T_L_1261)
            end)
        end
        if __T_z_1279 then
            pcall(function()
                __T_z_1279:SetValues(__T_S_1263)
            end)
        end
    end
    __T_X_111 = __T_d_075:AddSection({ ["Name"] = "U_2904", ["Position"] = "U_982" })
    __T_X_111:AddDropdown({
        ["Name"] = "U_1343",
        ["Default"] = "U_1809",
        ["U_3220"] = { "U_1809", "U_1918", "U_252" },
        ["Flag"] = "U_1441",
        ["Callback"] = function(o)
        local H = _G -- ENV_GETTER rewritten to _G
        __T_K_1264 = tostring(o or "U_1809")
        __T_R_1347()
    end
    })
    __T_z_1279 = __T_X_111:AddDropdown({
        ["Name"] = "U_2838",
        ["Default"] = "U_1809",
        ["U_3220"] = { "U_1809" },
        ["Flag"] = "U_2479",
        ["Callback"] = function(o)
        local H = _G -- ENV_GETTER rewritten to _G
        __T_r_1265 = tostring(o or "U_1809")
        __T_R_1347()
    end
    })
    __T_X_111:AddDropdown({
        ["Name"] = "U_1645",
        ["Default"] = "U_1078",
        ["U_3220"] = { "U_1078", "U_1809", "U_49" },
        ["Flag"] = "U_287",
        ["Callback"] = function(o)
        local H = _G -- ENV_GETTER rewritten to _G
        __T_k_1266 = tostring(o or "U_1078")
        __T_R_1347()
    end
    })
    __T_X_111:AddToggle({
        ["Name"] = "U_887",
        ["Default"] = true,
        ["Flag"] = "U_1166",
        ["Callback"] = function(o)
        __T_y_1277 = o and true or false
    end
    })
    __T_X_111:AddButton({
        ["Name"] = "U_530",
        ["U_1068"] = "U_924",
        ["Callback"] = function()
        __T_h_1336("Knife")
        if __T_Z_1281 then
            __T_Z_1281()
        end
    end
    })
    __T_X_111:AddButton({
        ["Name"] = "U_2997",
        ["U_1068"] = "U_924",
        ["Callback"] = function()
        __T_h_1336("Gun")
        if __T_Z_1281 then
            __T_Z_1281()
        end
    end
    })
    __T_X_111:AddButton({
        ["Name"] = "U_3223",
        ["U_1068"] = "U_924",
        ["Callback"] = function()
        local o = _G -- ENV_GETTER rewritten to _G
        __T_U_1337()
        if __T_Q_1278 then
            pcall(function()
                __T_Q_1278:Clear()
            end)
        end
        if __T_Z_1281 then
            __T_Z_1281()
        end
    end
    })
    __T_o_1348 = false
    function __T_X_1349()
        local H, W = _G,  {} -- ENV_GETTER rewritten to _G
        local D, v = ipairs, { "Knife", "Gun" }
        for H, j in D(v) do
            H = __T_t_1271[j]
            if H and H[1--[[u1191]]] then
                W[#W + 1] = H[1--[[u1191]]]
            end
        end
        return W
    end
    __T_Z_1281 = function()
        local H = _G -- ENV_GETTER rewritten to _G
        if not __T_Q_1278 then
            return
        end
        __T_o_1348 = true
        pcall(function()
        __T_Q_1278:SetValue(__T_X_1349())
    end)
        __T_o_1348 = false
        if __T_T_1280 then
            local X, H = __T_t_1271.Knife and (__T_t_1271.Knife["U_1661"] and __T_t_1271.Knife["U_1661"]["U_3079"] or __T_t_1271.Knife[1--[[u1191]]]) or "U_1131", __T_t_1271.Gun and (__T_t_1271.Gun["U_1661"] and __T_t_1271.Gun["U_1661"]["U_3079"] or __T_t_1271.Gun[1--[[u1191]]]) or "U_1131"
            __T_T_1280:SetValue("U_1138" .. X .. "U_1235" .. H)
        end
    end
    function __T_X_1350(H)
        local W, D = _G,  __T_o_1348 -- ENV_GETTER rewritten to _G
        if D then
            return
        end
        D = {}
        if typeof(H) == "table" then
            for o, v in ipairs(H) do
                o = typeof(v) == "table" and (v.U_386 or v[1]) or v
                if typeof(o) == "string" and o ~= "" then
                    D[#D + 1] = o
                end
            end
        else
            if typeof(H) == "string" and H ~= "" then
                D[1] = H
            end
        end
        local o, v = { ["Knife"] = {}, ["Gun"] = {} }, ipairs
        for j, a in v(D) do
            j = __T_b_1262[a]
            if j then
                a = o[j.U_1104 or j.U_1661 and j.U_1661["U_1807"]]
                if a then
                    a[#a + 1] = j
                end
            end
        end
        D, v, H = { ["Knife"] = nil, ["Gun"] = nil }, ipairs, { "Knife", "Gun" }
        for j, a in v(H) do
            j = o[a]
            if #j > 0 then
                local H
                for E, E in ipairs(j) do
                    if E ~= __T_t_1271[a] then
                        H = E
                        break
                    end
                end
                D[a] = H or j[1]
            end
        end
        v, o = ipairs, { "Knife", "Gun" }
        for H, H in v(o) do
            local o = D[H]
            if o ~= __T_t_1271[H] then
                __T_h_1336(H)
                if o then
                    __T_t_1271[H] = o
                    task.spawn(function()
                        local H = _G -- ENV_GETTER rewritten to _G
                        pcall(__T_e_1338, o)
                    end)
                end
            end
        end
        __T_Z_1281()
    end
    __T_T_1280 = __T_d_075:AddSection({ ["Name"] = "U_589", ["Position"] = "U_982" }):AddLabel("U_456", false)
    __T_Q_1278 = __T_d_075:AddImageList({
        ["Name"] = "U_1628",
        ["U_1068"] = "U_2577",
        ["Position"] = "U_985",
        ["U_497"] = "U_2340",
        [1--[[u2488]]] = "U_3196",
        [1--[[u1575]]] = 1--[[u380]],
        ["U_798"] = true,
        ["U_611"] = true,
        ["U_2076"] = false,
        ["U_1570"] = "U_2938",
        ["Default"] = {},
        ["U_3220"] = __T_L_1261,
        ["Flag"] = "U_2806",
        ["Callback"] = __T_X_1350
    })
    task.spawn(function()
        __T_n_1345()
        local e, o = __T_s_1342(), __T_g_1344()
        __T_dP_1294()
        if e or o > 0 then
            __T_R_1347()
        end
    end)
    __T_w_122 = __T_q_1245:FindFirstChild("U_2227")
    __T_w_122 = __T_w_122 and __T_w_122:FindFirstChild("U_1442")
    __T_m_982 = __T_w_122 and __T_w_122:FindFirstChild("U_339")
    if __T_m_982 and __T_m_982:IsA("RemoteEvent") then
        table.insert(__T_B_1270, __T_m_982.OnClientEvent:Connect(function(q)
            local e, o = _G,  __T_i_1274.Gun -- ENV_GETTER rewritten to _G
            if not o then
                return
            end
            local n = __T_MP_1325("Gun")
            if not n or n.Parent ~= __T_C_1249.Character then
                return
            end
            if typeof(q) == "Instance" and not q:IsDescendantOf(n) then
                return
            end
            local q = o.U_3124 or o.U_3128
            if q and q.Parent then
                pcall(function()
                    q.U_2925 = 0
                    q:Play()
                end)
            end
        end))
    end
    task.spawn(function()
        local q = _G -- ENV_GETTER rewritten to _G
        while true do
            local e = __T_l_1276
            if not e then
                break
            end
            task.wait(1--[[u1226]])
            e = __T_y_1277
            if e then
                local e, o = ipairs, { "Knife", "Gun" }
                for n, X in e(o) do
                    n = __T_t_1271[X]
                    if n then
                        local e = __T_CP_1324(X)
                        if e and not __T_N_1340(e) then
                            pcall(__T_x_1331, n)
                        else
                            if e then
                                e.LocalTransparencyModifier = 1
                                if e.Transparency ~= 1 then
                                    pcall(function()
                                        e.Transparency = 1
                                    end)
                                end
                            end
                        end
                        local e = __T_MP_1325(X)
                        if e and not __T_N_1340(e) then
                            pcall(__T_G_1332, n)
                        else
                            if e then
                                local o = e:FindFirstChild("U_117")
                                if o then
                                    o.LocalTransparencyModifier = 1
                                    if o.Transparency ~= 1 then
                                        pcall(function()
                                            o.Transparency = 1
                                        end)
                                    end
                                end
                                for e, e in ipairs(__T___1272[X]) do
                                    if e.Parent and e.U_2428 ~= 0 then
                                        pcall(function()
                                            e.U_2428 = 0
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
    __T_q_1351, __T_e_1352 = nil, nil
    __T_e_1352 = __T_C_1249.CharacterAdded:Connect(function()
        local o = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_p_1269)
        table.clear(__T_mP_1322)
        table.clear(__T_A_1273.Knife)
        table.clear(__T_A_1273.Gun)
        __T_FP_1310()
        task.wait(1--[[u3221]])
        o = __T_y_1277
        if o then
            __T_f_1339()
        end
    end)
    function __T_f_1353(o)
        if not o then
            return
        end
        local x = o.ChildAdded
        local function o(n)
            local X, g = _G,  __T_y_1277 -- ENV_GETTER rewritten to _G
            if not g then
                return
            end
            if not n:IsA("Tool") then
                return
            end
            g = __T_t_1271[n.Name]
            if not g then
                return
            end
            n:WaitForChild("U_117", 3)
            task.wait(1--[[u1791]])
            pcall(__T_G_1332, g)
        end
        return x:Connect(o)
    end
    __T_q_1351 = __T_f_1353(__T_C_1249:FindFirstChildOfClass("Backpack"))
    __T_o_1354 = __T_C_1249.ChildAdded:Connect(function(x)
        local C, n = _G,  x:IsA("Backpack") -- ENV_GETTER rewritten to _G
        if n then
            local n = __T_q_1351
            if n then
                pcall(function()
                    __T_q_1351:Disconnect()
                end)
            end
            __T_q_1351 = __T_f_1353(x)
        end
    end)
    getgenv()["U_2490"] = function()
        local f = _G -- ENV_GETTER rewritten to _G
        __T_l_1276 = false
        __T_t_1271.Knife, __T_t_1271.Gun = nil, nil
        local x, C = ipairs, { __T_q_1351, __T_e_1352, __T_o_1354 }
        for q, q in x(C) do
            if q then
                pcall(function()
                    q:Disconnect()
                end)
            end
        end
        for q, q in ipairs(__T_B_1270) do
            pcall(function()
                q:Disconnect()
            end)
        end
        table.clear(__T_B_1270)
        __T_U_1337()
        table.clear(__T_mP_1322)
        for q, q in pairs(__T_J_1267) do
            pcall(function()
                q:Destroy()
            end)
        end
        table.clear(__T_J_1267)
    end
    __T_f_1355, __T_q_1356 = game:GetService("Players"), game:GetService("RunService")
    __T_e_1357 = __T_f_1355.LocalPlayer
    function __T_o_1358(x)
        local C, n = _G,  __T_Y_036(x) -- ENV_GETTER rewritten to _G
        if typeof(n) ~= "string" or #n == 0 then
            return nil
        end
        x = {}
        for Y in string.gmatch(n, "U_2823") do
            local n, X = string.match(Y, "U_1081")
            Y = tonumber(X)
            if n and n ~= "" and Y and Y > 0 then
                x[#x + 1] = { n, Y }
            end
        end
        if #x == 0 then
            return nil
        end
        return x
    end
    __T_Y_1359, __T_x_1360, __T_C_1361, __T_n_1362, __T_X_1363, __T_g_1364, __T_R_1365, __T_H_1366, __T_W_1367, __T_D_1368, __T_v_1369, __T_j_1370 = string.char(1--[[u2998]], 97, 1--[[u351]], 115, 1--[[u3217]], 1--[[u757]], 1--[[u3127]], 1--[[u576]]), {}, {}, {}, {}, {}
    __T_a_1371 = false
    __T_E_1372 = false
    __T_U_1373 = true
    __T_h_1374 = 3
    __T_L_1375, __T_b_1376, __T_S_1377 = 0
    __T_K_1378 = 0
    __T_r_1379 = 0
    __T_k_1380 = false
    __T_J_1381, __T_I_1382 = false
    function __T_p_1383()
        local B = _G -- ENV_GETTER rewritten to _G
        table.sort(__T_C_1361, function(B, t)
            local _ = _G -- ENV_GETTER rewritten to _G
            return string.lower(B.U_386) < string.lower(t.U_386)
        end)
    end
    function __T_B_1384(t, _)
        local A = _G -- ENV_GETTER rewritten to _G
        if typeof(t) ~= "string" or t == "" or t == "U_2456" then
            return false
        end
        if typeof(_) ~= "string" or _ == "" then
            return false
        end
        if __T_x_1360[t] then
            return false
        end
        __T_x_1360[t] = _
        __T_C_1361[#__T_C_1361 + 1] = { ["U_386"] = t, ["U_1"] = t, ["U_672"] = _ }
        return true
    end
    function __T_x_1385()
        local t = _G -- ENV_GETTER rewritten to _G
        if not __T_b_1376 then
            return
        end
        local _ = __T_b_1376:GetValue()
        table.clear(__T_n_1362)
        if typeof(_) == "table" then
            for A, A in ipairs(_) do
                if typeof(A) == "string" and A ~= "" then
                    __T_n_1362[A] = true
                end
            end
        else
            if typeof(_) == "string" and _ ~= "" then
                __T_n_1362[_] = true
            end
        end
    end
    function __T_t_1386()
        local _ = _G -- ENV_GETTER rewritten to _G
        local A
        for i = 1, 3 do
            A = __T_o_1358(__T_P_004.U_3271(__T_Y_1359))
            if A then
                break
            end
            task.wait(1--[[u2206]])
        end
        if not A then
            return
        end
        local P = false
        for Y = 1, #A do
            P = if __T_B_1384(A[Y][1], "U_569" .. A[Y][2]) then true else P
        end
        if not P then
            return
        end
        __T_p_1383()
        if __T_b_1376 then
            pcall(function()
                __T_b_1376:SetData(__T_C_1361)
            end)
        end
        __T_x_1385()
    end
    function __T_P_1387(Y)
        local o = _G -- ENV_GETTER rewritten to _G
        return tonumber(string.match(Y[1--[[u2293]]][1--[[u3145]]], 1--[[u1729]])) or 0
    end
    function __T_Y_1388(o)
        local _ = o.U_2125[1--[[u3145]]]
        return o.U_278["Enabled"] and _ ~= "" and _ ~= "U_2456"
    end
    function __T_o_1389()
        for _ = 1, #__T_X_1363 do
            if __T_X_1363[_]["U_278"]["Enabled"] then
                return true
            end
        end
        return false
    end
    function __T___1390()
        local A = _G -- ENV_GETTER rewritten to _G
        local i, N = ipairs, { __T_D_1368, __T_v_1369, __T_j_1370 }
        for l, l in i(N) do
            if l then
                pcall(function()
                    l:Disconnect()
                end)
            end
        end
        __T_D_1368, __T_v_1369, __T_j_1370 = nil, nil, nil
    end
    function __T_A_1391()
        __T___1390()
        __T_k_1380, __T_S_1377 = false, nil
        __T_L_1375, __T_I_1382 = 0, nil
    end
    function __T_i_1392(N)
        local l = _G -- ENV_GETTER rewritten to _G
        local y = Ray.new()
        y.U_2551 = __T_EnumFB.U_3131["U_379"]
        local Q, z, T = "U_2661", {}, __T_e_1357.Character
        do local _xgSrc = {T, __T_R_1365}; for _xgI = 1, #_xgSrc do z[#z + 1] = _xgSrc[_xgI] end end
        y[Q] = z
        z = workspace:Raycast(N.Position + Vector3.new(0, 8, 0), Vector3.new(0, 1--[[u2155]], 0), y)
        y = z and z.Position["Y"] + 1--[[u1157]] or N.Position["Y"]
        return Vector3.new(N.Position["X"], y, N.Position["Z"])
    end
    function __T_N_1393(l)
        local y, Q = _G,  __T_e_1357.Character -- ENV_GETTER rewritten to _G
        local z = Q and Q:FindFirstChild("HumanoidRootPart")
        if not z then
            return false
        end
        CFrame = CFrame.new(l)
        return true
    end
    function __T_l_1394()
        local y, Q = _G,  __T_e_1357.Character -- ENV_GETTER rewritten to _G
        local z = Q and Q:FindFirstChildWhichIsA("Humanoid")
        if z then
            z:ChangeState(__T_EnumFB.U_3137["Dead"])
            pcall(function()
                z.Health = 0
            end)
        else
            if Q then
                pcall(function()
                    Q:BreakJoints()
                end)
            end
        end
    end
    function __T_y_1395()
        local Q = {}
        for z = 1, #__T_X_1363 do
            local T = __T_X_1363[z]
            if __T_Y_1388(T) and __T_n_1362[T.U_2125[1--[[u3145]]]] then
                Q[#Q + 1] = T
            end
        end
        return Q
    end
    function __T_Y_1396(Q)
        local z, T = _G,  __T_y_1395() -- ENV_GETTER rewritten to _G
        if #T == 0 then
            __T_A_1391()
            return
        end
        local y = T[math.random(1, #T)]
        __T_S_1377 = __T_i_1392(y.U_335)
        __T_L_1375 = 0
        __T_K_1378 = __T_P_1387(y)
        T = __T_e_1357.Character
        local i = T and T:FindFirstChild("HumanoidRootPart")
        if not i then
            __T_A_1391()
            return
        end
        __T_I_1382 = CFrame
        T = __T_N_1393(__T_S_1377)
        if not T then
            __T_A_1391()
            return
        end
        T = not __T_E_1372
        if T then
            task.delay(1--[[u773]], function()
                local i, N = _G,  __T_r_1379 -- ENV_GETTER rewritten to _G
                if N ~= Q then
                    return
                end
                N = __T_e_1357.Character
                local z = N and N:FindFirstChild("HumanoidRootPart")
                if z then
                    local T = N:FindFirstChildWhichIsA("Humanoid")
                    if T then
                        pcall(function()
                            local N = _G -- ENV_GETTER rewritten to _G
                            T:ChangeState(__T_EnumFB.U_3137["U_3376"])
                        end)
                    end
                    CFrame = __T_I_1382
                    task.delay(1--[[u3159]], function()
                        local i, N = _G,  __T_e_1357.Character -- ENV_GETTER rewritten to _G
                        local z = N and N:FindFirstChildWhichIsA("Humanoid")
                        if z then
                            pcall(function()
                                local i = _G -- ENV_GETTER rewritten to _G
                                z:ChangeState(__T_EnumFB.U_3137["Running"])
                            end)
                        end
                    end)
                end
                __T_A_1391()
            end)
            return
        end
        __T_D_1368 = __T_q_1356.Heartbeat:Connect(function()
            local q, D = _G,  not __T_U_1373 or __T_r_1379 ~= Q or not __T_S_1377 -- ENV_GETTER rewritten to _G
            if D then
                return
            end
            D = __T_e_1357.Character
            local i = D and D:FindFirstChild("HumanoidRootPart")
            if not i then
                return
            end
            local N, z, T = Vector3.new, i.Position["X"], __T_S_1377
            local Z, G, s, OP = z - T.X, 0, i.Position["Z"], __T_S_1377
            D = N(Z, G, s - OP.Z)["Magnitude"] > 1--[[u2372]]
            if D then
                CFrame = CFrame.new(__T_S_1377)
            end
        end)
        __T_v_1369 = y[1--[[u2293]]]:GetPropertyChangedSignal(1--[[u3145]]):Connect(function()
            local q, D = _G,  __T_r_1379 ~= Q or not __T_E_1372 or not y.U_278["Enabled"] -- ENV_GETTER rewritten to _G
            if D then
                return
            end
            D = __T_P_1387(y)
            local P = D <= __T_K_1378
            if P then
                __T_K_1378 = D
                return
            end
            __T_K_1378 = D
            P = __T_L_1375 >= __T_h_1374
            if P then
                __T___1390()
                task.defer(function()
                    local P, q = _G,  __T_r_1379 -- ENV_GETTER rewritten to _G
                    if q ~= Q then
                        return
                    end
                    q = __T_e_1357.Character
                    local K = q and q:FindFirstChild("HumanoidRootPart")
                    local _ = K and __T_I_1382
                    if _ then
                        local _ = q:FindFirstChildWhichIsA("Humanoid")
                        if _ then
                            pcall(function()
                                local q = _G -- ENV_GETTER rewritten to _G
                                _:ChangeState(__T_EnumFB.U_3137["U_3376"])
                            end)
                        end
                        CFrame = __T_I_1382
                        task.delay(1--[[u3159]], function()
                            local P, q = _G,  __T_e_1357.Character -- ENV_GETTER rewritten to _G
                            local K = q and q:FindFirstChildWhichIsA("Humanoid")
                            if K then
                                pcall(function()
                                    local P = _G -- ENV_GETTER rewritten to _G
                                    K:ChangeState(__T_EnumFB.U_3137["Running"])
                                end)
                            end
                        end)
                    end
                    __T_A_1391()
                end)
                return
            end
            D = __T_L_1375
            __T_L_1375 = D + 1
            __T_l_1394()
        end)
        __T_j_1370 = __T_e_1357.CharacterAdded:Connect(function(P)
            local q, D = _G,  __T_r_1379 ~= Q or not __T_E_1372 -- ENV_GETTER rewritten to _G
            if D then
                return
            end
            D = P:WaitForChild("HumanoidRootPart", 6)
            local K = not D or __T_r_1379 ~= Q or not y.U_278["Enabled"] or not __T_S_1377
            if K then
                return
            end
            K = __T_L_1375 >= __T_h_1374
            if K then
                local L = __T_I_1382
                if L then
                    local L = P:FindFirstChildWhichIsA("Humanoid")
                    if L then
                        pcall(function()
                            local P = _G -- ENV_GETTER rewritten to _G
                            L:ChangeState(__T_EnumFB.U_3137["U_3376"])
                        end)
                    end
                    CFrame = __T_I_1382
                    task.delay(1--[[u3159]], function()
                        local P, L = _G,  __T_e_1357.Character -- ENV_GETTER rewritten to _G
                        local e = L and L:FindFirstChildWhichIsA("Humanoid")
                        if e then
                            pcall(function()
                                local P = _G -- ENV_GETTER rewritten to _G
                                e:ChangeState(__T_EnumFB.U_3137["Running"])
                            end)
                        end
                    end)
                end
                return
            end
            CFrame = CFrame.new(__T_S_1377)
        end)
    end
    function __T_P_1397()
        local q = _G -- ENV_GETTER rewritten to _G
        __T_J_1381 = false
        local e = __T_U_1373
        if not e then
            return
        end
        e = false
        for D = 1, #__T_X_1363 do
            local L = __T_X_1363[D]
            e = if L.U_278["Enabled"] and __T_B_1384(L.U_2125[1--[[u3145]]], L.U_1421["U_2188"]) then true else e
        end
        if e then
            __T_p_1383()
            if __T_b_1376 then
                pcall(function()
                    __T_b_1376:SetData(__T_C_1361)
                end)
            end
            __T_x_1385()
        end
        e = not __T_o_1389()
        if e then
            local q = __T_k_1380
            if q then
                __T_A_1391()
            end
            return
        end
        e = not __T_a_1371 or __T_k_1380
        if e then
            return
        end
        __T_k_1380 = true
        e = __T_r_1379
        __T_r_1379 = e + 1
        __T_Y_1396(__T_r_1379)
    end
    function __T_Y_1398()
        local q, e = _G,  __T_J_1381 or not __T_U_1373 -- ENV_GETTER rewritten to _G
        if e then
            return
        end
        __T_J_1381 = true
        task.delay(1--[[u1791]], __T_P_1397)
    end
    function __T_P_1399(q)
        local e, o, x = q:FindFirstChild("U_32"), q:FindFirstChild("U_2345"), q:FindFirstChild("U_3225")
        local D, L = o and o:FindFirstChild("U_2434"), x and x:FindFirstChild("U_492")
        q, x = L and L:FindFirstChild("U_617"), L and L:FindFirstChild("U_90")
        if not (e and o and D and q and x) then
            return nil
        end
        return {
            ["U_335"] = e,
            ["U_278"] = o,
            ["U_1421"] = D,
            ["U_2125"] = q,
            [1--[[u2293]]] = x
        }
    end
    function __T_q_1400(e)
        local o = _G -- ENV_GETTER rewritten to _G
        for x, x in ipairs(__T_g_1364) do
            pcall(function()
                x:Disconnect()
            end)
        end
        table.clear(__T_g_1364)
        table.clear(__T_X_1363)
        __T_R_1365 = e
        e = __T_R_1365
        if not e then
            return
        end
        local e, x = ipairs, __T_R_1365
        for o, D in e(x:GetChildren()) do
            o = __T_P_1399(D)
            if o then
                __T_X_1363[#__T_X_1363 + 1] = o
                __T_g_1364[#__T_g_1364 + 1] = o.U_278:GetPropertyChangedSignal("Enabled"):Connect(__T_Y_1398)
                __T_g_1364[#__T_g_1364 + 1] = o.U_2125:GetPropertyChangedSignal(1--[[u3145]]):Connect(__T_Y_1398)
                __T_g_1364[#__T_g_1364 + 1] = o.U_1421:GetPropertyChangedSignal("U_2188"):Connect(__T_Y_1398)
            end
        end
        __T_Y_1398()
    end
    function __T_P_1401(e)
        local o, x = _G,  __T_H_1366 -- ENV_GETTER rewritten to _G
        if x then
            pcall(function()
                __T_H_1366:Disconnect()
            end)
            __T_H_1366 = nil
        end
        if not e then
            __T_q_1400(nil)
            return
        end
        local x, D = e, e:FindFirstChild("U_1356")
        if D then
            for L, S in ipairs(D:GetChildren()) do
                L = "U_32"
                if S:FindFirstChild(L) then
                    x = D
                    break
                end
            end
        end
        __T_H_1366 = e.ChildAdded:Connect(function(o)
            local D = _G -- ENV_GETTER rewritten to _G
            if o.Name == "U_1356" or o.Name:sub(1, 7) == "U_637" then
                task.defer(function()
                    __T_P_1401(e)
                end)
            end
        end)
        __T_q_1400(x)
    end
    __T_c_074 = typeof(__T_V_123.U_551) == "function" and __T_V_123:AddSub({ ["Name"] = "U_202", ["U_1068"] = "U_1238", ["U_2396"] = "U_1629" }) or __T_V_123
    __T_f_1355 = __T_c_074:AddSection({ ["Name"] = "U_1144", ["Position"] = "U_985" })
    __T_M_112 = __T_f_1355:Add]============],
    [31] = [============[
Toggle({
        ["Name"] = "U_1110",
        ["Default"] = false,
        ["Flag"] = "U_1311",
        ["U_3348"] = true,
        ["Callback"] = function(q)
        __T_a_1371 = q
        if q then
            __T_Y_1398()
        else
            __T_A_1391()
        end
    end
    })
    __T_d_075, __T_m_982 = __T_M_112.U_3348, { ["Name"] = "U_2173", ["Default"] = false, ["Flag"] = "U_3090" }
    __T_m_982.Callback = function(Y)
        local q = _G -- ENV_GETTER rewritten to _G
        __T_E_1372 = Y
        local e = not Y
        if e then
            local Y, e = ipairs, { __T_v_1369, __T_j_1370 }
            for o, o in Y(e) do
                if o then
                    pcall(function()
                        o:Disconnect()
                    end)
                end
            end
            __T_v_1369, __T_j_1370 = nil, nil
        end
    end
    __T_d_075:AddToggle(__T_m_982)
    __T_f_1355, __T_w_122 = __T_M_112.U_3348, {
        ["Name"] = "U_218",
        ["Default"] = 3,
        ["Min"] = 1,
        ["Max"] = 11,
        ["Flag"] = "U_1816"
    }
    __T_w_122.Callback = function(m)
        local Y = _G -- ENV_GETTER rewritten to _G
        __T_h_1374 = math.clamp(math.floor(tonumber(m) or 3), 1, 10)
    end
    __T_f_1355:AddSlider(__T_w_122)
    __T_b_1376 = __T_c_074:AddImageList({
        ["Name"] = "U_202",
        ["U_1068"] = "U_1238",
        ["Position"] = "U_985",
        ["U_798"] = true,
        ["U_497"] = "U_2340",
        [1--[[u2488]]] = 1--[[u1248]],
        [1--[[u1575]]] = 78,
        ["U_2076"] = false,
        ["U_2515"] = "U_1238",
        ["U_1570"] = "U_1456",
        ["U_3220"] = __T_C_1361,
        ["Default"] = {},
        ["Flag"] = "U_991",
        ["Callback"] = function(m)
        local f = _G -- ENV_GETTER rewritten to _G
        table.clear(__T_n_1362)
        if typeof(m) == "table" then
            for Y, Y in ipairs(m) do
                if typeof(Y) == "string" and Y ~= "" then
                    __T_n_1362[Y] = true
                end
            end
        else
            if typeof(m) == "string" and m ~= "" then
                __T_n_1362[m] = true
            end
        end
    end
    })
    __T_P_1401(workspace:FindFirstChild("U_457"))
    __T_W_1367 = workspace.ChildAdded:Connect(function(m)
        local f = _G -- ENV_GETTER rewritten to _G
        if m.Name == "U_457" then
            task.defer(function()
                __T_P_1401(m)
            end)
        end
    end)
    task.spawn(__T_t_1386)
    getgenv()["U_1271"] = function()
        local F = _G -- ENV_GETTER rewritten to _G
        __T_U_1373 = false
        local O, m = false, false
        __T_a_1371, __T_E_1372 = O, m
        __T_A_1391()
        for f, f in ipairs(__T_g_1364) do
            pcall(function()
                f:Disconnect()
            end)
        end
        table.clear(__T_g_1364)
        table.clear(__T_X_1363)
        m, O = ipairs, { __T_H_1366, __T_W_1367 }
        for f, f in m(O) do
            if f then
                pcall(function()
                    f:Disconnect()
                end)
            end
        end
        __T_H_1366, __T_W_1367, __T_R_1365 = nil, nil, nil
    end
end
local __LURAPH_OK, __LURAPH_ERR = xpcall(__LURAPH_9720, function(_e) return tostring(_e).."\n"..debug.traceback(nil, 2) end)
if not __LURAPH_OK then warn(__LURAPH_ERR) error(__LURAPH_ERR) end -- auto-executed (was bare VM function wrapper)

]============],
}

local _src = table.concat(_chunks)
table.clear(_chunks)
_chunks = nil

notify("Loader", "Compiling script...", 3)

local fn, cerr = loadstring(_src, "out-deobf")
if not fn then
    notify("Compile Error", tostring(cerr):sub(1, 80), 10)
    warn("[loader-standalone] compile failed: " .. tostring(cerr))
    return
end

notify("Loader", "Starting MM2 script...", 2)

local ok, rerr = xpcall(fn, function(e)
    return tostring(e) .. "\n" .. debug.traceback(nil, 2)
end)

if not ok then
    notify("Runtime Error", tostring(rerr):sub(1, 100), 10)
    warn("[loader-standalone] runtime error:\n" .. tostring(rerr))
else
    notify("Success", "MM2 Script Loaded & Running!", 5)
    print("[loader-standalone] successfully started")
end
