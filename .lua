--[[
	2ww UI  |  v1.0.0
	LocalScript / executor script

	- Tabs: Main, Config, Info
	- PC: RightShift toggles the menu (changeable in Config)
	- Mobile: draggable paw button toggles the menu
	- HUD (Executor / FPS / Ping / Clock), toast notifications, config save/load

	Hook into your script:
		local UI = loadstring(...)()            -- or just read shared["2ww"]
		UI.Flags.ui_hud                         -- current values
		UI.Tabs.Config:Section("My Section"):Toggle({Name="X", Flag="x", Callback=function(v) end})
		UI:Notify("Title", "Text", 4)
]]

-- ───────────────────────────── Services ─────────────────────────────
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	task.wait()
	LocalPlayer = Players.LocalPlayer
end

local Camera = workspace.CurrentCamera
while not Camera do
	task.wait()
	Camera = workspace.CurrentCamera
end

if shared["2ww"] and shared["2ww"].Unload then
	pcall(function() shared["2ww"]:Unload(true) end)
end

-- ───────────────────────────── Library table ─────────────────────────────
local Promixity = {
	Name = "2ww",
	Version = "1.0.0",
	Flags = {},
	Tabs = {},
	ToggleKey = Enum.KeyCode.RightShift,
	NotificationsEnabled = true,
	Unloaded = false,
}

local Setters = {}
local Connections = {}
local Listening = false
local LastBind = 0

local PAW_ASSET = "rbxassetid://122093188327023"

local Theme = {
	Background = Color3.fromRGB(10, 10, 10),
	Sidebar    = Color3.fromRGB(14, 14, 14),
	Panel      = Color3.fromRGB(20, 20, 20),
	Element    = Color3.fromRGB(28, 28, 28),
	Hover      = Color3.fromRGB(40, 40, 40),
	Pressed    = Color3.fromRGB(22, 22, 22),
	Off        = Color3.fromRGB(60, 60, 60),
	Stroke     = Color3.fromRGB(48, 48, 48),
	StrokeSoft = Color3.fromRGB(40, 40, 40),
	Text       = Color3.fromRGB(245, 245, 245),
	SubText    = Color3.fromRGB(160, 160, 160),
	Muted      = Color3.fromRGB(110, 110, 110),
	Accent     = Color3.fromRGB(245, 245, 245),
	AccentText = Color3.fromRGB(10, 10, 10),
	Danger     = Color3.fromRGB(245, 245, 245),
}

local isTouch = UserInputService.TouchEnabled
local isMobile = isTouch and not UserInputService.KeyboardEnabled

local AutoY = Enum.AutomaticSize.Y
local AutoX = Enum.AutomaticSize.X
local Left, Right, Center = Enum.TextXAlignment.Left, Enum.TextXAlignment.Right, Enum.TextXAlignment.Center

-- ───────────────────────────── Helpers ─────────────────────────────
local function connect(signal, fn)
	local c = signal:Connect(fn)
	table.insert(Connections, c)
	return c
end

local function New(class, props, children)
	local inst = Instance.new(class)
	local parent
	for k, v in pairs(props or {}) do
		if k == "Parent" then
			parent = v
		else
			inst[k] = v
		end
	end
	for _, child in ipairs(children or {}) do
		child.Parent = inst
	end
	if parent then
		inst.Parent = parent
	end
	return inst
end

local function Corner(r)
	return New("UICorner", { CornerRadius = UDim.new(0, r or 8) })
end

local function Pill()
	return New("UICorner", { CornerRadius = UDim.new(1, 0) })
end

local function Stroke(color, thickness)
	return New("UIStroke", {
		Color = color or Theme.Stroke,
		Thickness = thickness or 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
end

local function Pad(l, t, r, b)
	return New("UIPadding", {
		PaddingLeft = UDim.new(0, l or 0),
		PaddingTop = UDim.new(0, t or 0),
		PaddingRight = UDim.new(0, r or 0),
		PaddingBottom = UDim.new(0, b or 0),
	})
end

local function Tween(obj, time, props, style, dir)
	local tw = TweenService:Create(obj, TweenInfo.new(time, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end

local function Text(props)
	local base = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextColor3 = Theme.Text,
		TextXAlignment = Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		Text = "",
	}
	for k, v in pairs(props) do
		base[k] = v
	end
	return New("TextLabel", base)
end

local function Flash(el)
	local o = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme.Accent,
		BackgroundTransparency = 0.78,
		BorderSizePixel = 0,
		ZIndex = 0,
		Parent = el,
	}, { Corner(8) })
	Tween(o, 0.5, { BackgroundTransparency = 1 })
	task.delay(0.55, function() o:Destroy() end)
end

local function isPress(input)
	return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
end

local function isMove(input)
	return input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
end

local function Register(flag, value, setter)
	if not flag then return end
	Promixity.Flags[flag] = value
	Setters[flag] = setter
end

-- ───────────────────────────── ScreenGui ─────────────────────────────
local gui = New("ScreenGui", {
	Name = "2ww",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	IgnoreGuiInset = true,
	DisplayOrder = 999,
})

do
	local targets = {
		function() return gethui() end,
		function() return game:GetService("CoreGui") end,
		function() return LocalPlayer:WaitForChild("PlayerGui") end,
	}
	for _, getter in ipairs(targets) do
		local ok, parent = pcall(getter)
		if ok and parent then
			local ok2 = pcall(function() gui.Parent = parent end)
			if ok2 and gui.Parent then break end
		end
	end
end

-- ───────────────────────────── Notifications ─────────────────────────────
local NotifyHolder = New("Frame", {
	Name = "Notifications",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -18, 1, -18),
	Size = UDim2.fromOffset(290, 520),
	BackgroundTransparency = 1,
	Parent = gui,
}, {
	New("UIListLayout", {
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
	}),
	New("UIScale", { Scale = isMobile and 0.85 or 1 }),
})

function Promixity:Notify(title, text, duration)
	if not self.NotificationsEnabled or self.Unloaded then return end
	duration = duration or 4

	local wrap = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		BackgroundTransparency = 1,
		Parent = NotifyHolder,
	})
	local toast = New("CanvasGroup", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		Position = UDim2.fromOffset(50, 0),
		GroupTransparency = 1,
		BackgroundColor3 = Theme.Panel,
		BorderSizePixel = 0,
		Parent = wrap,
	}, { Corner(10), Stroke(Theme.Stroke) })

	New("Frame", {
		Size = UDim2.new(0, 3, 1, 0),
		BackgroundColor3 = Theme.Accent,
		BorderSizePixel = 0,
		Parent = toast,
	})
	local body = New("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		BackgroundTransparency = 1,
		Parent = toast,
	}, {
		Pad(16, 11, 12, 14),
		New("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }),
	})
	Text({ LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 16), Text = title or "2ww", Font = Enum.Font.GothamBold, TextSize = 14, Parent = body })
	if text and text ~= "" then
		Text({
			LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = AutoY, Text = text,
			TextColor3 = Theme.SubText, TextSize = 12, TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top, Parent = body,
		})
	end
	local bar = New("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, 2),
		BackgroundColor3 = Theme.Accent,
		BackgroundTransparency = 0.35,
		BorderSizePixel = 0,
		Parent = toast,
	})

	Tween(toast, 0.45, { Position = UDim2.fromOffset(0, 0), GroupTransparency = 0 })
	Tween(bar, duration, { Size = UDim2.new(0, 0, 0, 2) }, Enum.EasingStyle.Linear)
	task.delay(duration, function()
		if not toast.Parent then return end
		Tween(toast, 0.35, { Position = UDim2.fromOffset(50, 0), GroupTransparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		task.wait(0.4)
		wrap:Destroy()
	end)
end

-- ───────────────────────────── Window ─────────────────────────────
local BASE_W, BASE_H = 640, 420
local SIDEBAR_W = 160
local UIScaleMul = 1
local isOpen = false

local Window = New("CanvasGroup", {
	Name = "Window",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(BASE_W, BASE_H),
	BackgroundColor3 = Theme.Background,
	BorderSizePixel = 0,
	GroupTransparency = 1,
	Visible = false,
	Parent = gui,
}, { Corner(14), Stroke(Theme.Stroke, 1) })
local WindowScale = New("UIScale", { Scale = 0.8, Parent = Window })

local function fitScale()
	local vp = Camera.ViewportSize
	local s = math.min(vp.X * 0.94 / BASE_W, vp.Y * (isTouch and 0.92 or 0.86) / BASE_H)
	return math.clamp(s, 0.45, 1.3) * UIScaleMul
end

local function ClampCenter(target, center, mode)
	local vp = Camera.ViewportSize
	local half = target.AbsoluteSize / 2
	local x, y
	if mode == "window" then
		x = math.clamp(center.X, -half.X + 140, vp.X + half.X - 140)
		y = math.clamp(center.Y, half.Y, math.max(half.Y, vp.Y + half.Y - 44))
	else
		x = math.clamp(center.X, half.X, math.max(half.X, vp.X - half.X))
		y = math.clamp(center.Y, half.Y, math.max(half.Y, vp.Y - half.Y))
	end
	return Vector2.new(x, y)
end

local function Reclamp(target, mode)
	local center = target.AbsolutePosition + target.AbsoluteSize / 2
	local c = ClampCenter(target, center, mode)
	if (c - center).Magnitude > 1 then
		Tween(target, 0.3, { Position = UDim2.fromOffset(c.X, c.Y) })
	end
end

local function MakeDraggable(handle, target, mode)
	local state = { Moved = false }
	local dragging, startMouse, startCenter = false, Vector2.zero, Vector2.zero
	handle.InputBegan:Connect(function(input)
		if isPress(input) then
			dragging = true
			state.Moved = false
			startMouse = Vector2.new(input.Position.X, input.Position.Y)
			startCenter = target.AbsolutePosition + target.AbsoluteSize / 2
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	connect(UserInputService.InputChanged, function(input)
		if not dragging or not isMove(input) then return end
		local delta = Vector2.new(input.Position.X, input.Position.Y) - startMouse
		if delta.Magnitude > 4 then state.Moved = true end
		if state.Moved then
			local c = ClampCenter(target, startCenter + delta, mode)
			Tween(target, 0.07, { Position = UDim2.fromOffset(c.X, c.Y) }, Enum.EasingStyle.Sine)
		end
	end)
	return state
end

-- Sidebar
local Sidebar = New("Frame", {
	Name = "Sidebar",
	Size = UDim2.new(0, SIDEBAR_W, 1, 0),
	BackgroundColor3 = Theme.Sidebar,
	BorderSizePixel = 0,
	Parent = Window,
})
New("Frame", {
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.fromScale(1, 0),
	Size = UDim2.new(0, 1, 1, 0),
	BackgroundColor3 = Theme.Stroke,
	BorderSizePixel = 0,
	Parent = Sidebar,
})

local SideHeader = New("Frame", {
	Name = "Header",
	Size = UDim2.new(1, 0, 0, 66),
	BackgroundTransparency = 1,
	Active = true,
	Parent = Sidebar,
})
local Logo = New("Frame", {
	Position = UDim2.fromOffset(14, 16),
	Size = UDim2.fromOffset(34, 34),
	BackgroundColor3 = Theme.Accent,
	BorderSizePixel = 0,
	Parent = SideHeader,
}, { Corner(10) })
New("ImageLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(22, 22),
	BackgroundTransparency = 1,
	Image = PAW_ASSET,
	ScaleType = Enum.ScaleType.Fit,
	Parent = Logo,
})
Text({ Position = UDim2.fromOffset(58, 14), Size = UDim2.new(1, -62, 0, 20), Text = "2ww", Font = Enum.Font.GothamBold, TextSize = 16, Parent = SideHeader })
Text({ Position = UDim2.fromOffset(58, 33), Size = UDim2.new(1, -62, 0, 14), Text = "v" .. Promixity.Version, TextColor3 = Theme.SubText, TextSize = 11, Parent = SideHeader })

Text({ Position = UDim2.fromOffset(20, 72), Size = UDim2.new(1, -20, 0, 14), Text = "NAVIGATION", TextColor3 = Theme.Muted, Font = Enum.Font.GothamBold, TextSize = 10, Parent = Sidebar })
local TopList = New("Frame", {
	Position = UDim2.fromOffset(0, 92),
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = AutoY,
	BackgroundTransparency = 1,
	Parent = Sidebar,
}, { Pad(10, 0, 10, 0), New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }) })

local BottomList = New("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 0, 0),
	AutomaticSize = AutoY,
	BackgroundTransparency = 1,
	Parent = Sidebar,
}, { Pad(10, 0, 10, 12), New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }) })
Text({ LayoutOrder = 0, Size = UDim2.new(1, 0, 0, 16), Text = "  SYSTEM", TextColor3 = Theme.Muted, Font = Enum.Font.GothamBold, TextSize = 10, Parent = BottomList })

-- Content
local Content = New("Frame", {
	Name = "Content",
	Position = UDim2.fromOffset(SIDEBAR_W, 0),
	Size = UDim2.new(1, -SIDEBAR_W, 1, 0),
	BackgroundTransparency = 1,
	Parent = Window,
})
local Topbar = New("Frame", {
	Name = "Topbar",
	Size = UDim2.new(1, 0, 0, 58),
	BackgroundTransparency = 1,
	Active = true,
	Parent = Content,
})
New("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = Theme.Stroke,
	BorderSizePixel = 0,
	Parent = Topbar,
})
local TitleLabel = Text({ Position = UDim2.fromOffset(22, 10), Size = UDim2.new(1, -80, 0, 22), Text = "", Font = Enum.Font.GothamBold, TextSize = 18, Parent = Topbar })
local SubtitleLabel = Text({ Position = UDim2.fromOffset(22, 32), Size = UDim2.new(1, -80, 0, 14), Text = "", TextColor3 = Theme.SubText, TextSize = 12, Parent = Topbar })

local CloseBtn = New("TextButton", {
	AnchorPoint = Vector2.new(1, 0.5),
	Position = UDim2.new(1, -16, 0.5, 0),
	Size = UDim2.fromOffset(28, 28),
	BackgroundColor3 = Theme.Element,
	AutoButtonColor = false,
	Text = "×",
	Font = Enum.Font.GothamBold,
	TextSize = 20,
	TextColor3 = Theme.SubText,
	BorderSizePixel = 0,
	Parent = Topbar,
}, { Corner(8) })
CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn, 0.18, { BackgroundColor3 = Theme.Danger, TextColor3 = Color3.new(0, 0, 0) }) end)
CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn, 0.2, { BackgroundColor3 = Theme.Element, TextColor3 = Theme.SubText }) end)

local Pages = New("Frame", {
	Name = "Pages",
	Position = UDim2.fromOffset(0, 58),
	Size = UDim2.new(1, 0, 1, -58),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Parent = Content,
})

MakeDraggable(Topbar, Window, "window")
MakeDraggable(SideHeader, Window, "window")

-- ───────────────────────────── Open / close ─────────────────────────────
local PageToken = 0
local CurrentTab
local PageIn
local OpenToken = 0

local ToggleButton, ToggleIcon -- mobile button, assigned later

local function wiggleIcon()
	if not ToggleIcon then return end
	ToggleIcon.Rotation = -28
	Tween(ToggleIcon, 0.7, { Rotation = 0 }, Enum.EasingStyle.Elastic)
end

local function SetOpen(state)
	if state == isOpen or Promixity.Unloaded then return end
	isOpen = state
	OpenToken += 1
	local token = OpenToken
	if state then
		Window.Visible = true
		WindowScale.Scale = fitScale() * 0.88
		Tween(Window, 0.35, { GroupTransparency = 0 })
		Tween(WindowScale, 0.55, { Scale = fitScale() }, Enum.EasingStyle.Back)
		if CurrentTab then PageIn(CurrentTab, 1, 0.12) end
	else
		Tween(Window, 0.22, { GroupTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		Tween(WindowScale, 0.25, { Scale = fitScale() * 0.9 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		task.delay(0.27, function()
			if token == OpenToken and not isOpen then Window.Visible = false end
		end)
	end
	wiggleIcon()
end

function Promixity:Toggle()
	SetOpen(not isOpen)
end

CloseBtn.MouseButton1Click:Connect(function() SetOpen(false) end)

local function applyScale()
	if isOpen then
		Tween(WindowScale, 0.3, { Scale = fitScale() })
	end
	task.delay(0.4, function()
		if not Promixity.Unloaded then Reclamp(Window, "window") end
	end)
end

local function hookCamera()
	connect(Camera:GetPropertyChangedSignal("ViewportSize"), applyScale)
end
hookCamera()
connect(workspace:GetPropertyChangedSignal("CurrentCamera"), function()
	if workspace.CurrentCamera then
		Camera = workspace.CurrentCamera
		hookCamera()
		applyScale()
	end
end)

-- ───────────────────────────── Executor detect (2ww) ─────────────────────────────
local ExecutorName = "Unknown"
pcall(function()
	if type(identifyexecutor) == "function" then
		local ok, res = pcall(identifyexecutor)
		if ok and res then
			if type(res) == "string" and res ~= "" then
				ExecutorName = res
			elseif type(res) == "table" then
				local n = res[1] or res.Name or res.name
				if type(n) == "string" and n ~= "" then ExecutorName = n end
			end
		end
	end
	if ExecutorName == "Unknown" and type(getexecutorname) == "function" then
		local ok, res = pcall(getexecutorname)
		if ok and type(res) == "string" and res ~= "" then ExecutorName = res end
	end
end)

-- ───────────────────────────── HUD ─────────────────────────────
local HUD = New("CanvasGroup", {
	Name = "HUD",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0, 34),
	Size = UDim2.fromOffset(0, 34),
	AutomaticSize = AutoX,
	BackgroundColor3 = Theme.Background,
	BorderSizePixel = 0,
	GroupTransparency = 1,
	Parent = gui,
}, {
	Corner(10),
	Stroke(Theme.Stroke),
	Pad(5, 0, 5, 0),
	New("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }),
	New("UIScale", { Scale = isMobile and 0.88 or 1 }),
})

local HudBrand = New("Frame", {
	LayoutOrder = 0,
	Size = UDim2.new(0, 0, 1, 0),
	AutomaticSize = AutoX,
	BackgroundTransparency = 1,
	Parent = HUD,
}, {
	Pad(0, 0, 8, 0),
	New("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 8) }),
})
local HudChip = New("Frame", {
	LayoutOrder = 1,
	Size = UDim2.fromOffset(24, 24),
	BackgroundColor3 = Theme.Accent,
	BorderSizePixel = 0,
	Parent = HudBrand,
}, { Corner(7) })
New("ImageLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(15, 15),
	BackgroundTransparency = 1,
	Image = PAW_ASSET,
	Parent = HudChip,
})
Text({ LayoutOrder = 2, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = AutoX, Text = "2ww", Font = Enum.Font.GothamBold, TextSize = 13, Parent = HudBrand })

local function HudSegment(order)
	local seg = New("Frame", {
		LayoutOrder = order,
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = AutoX,
		BackgroundTransparency = 1,
		Parent = HUD,
	}, {
		Pad(0, 0, 10, 0),
		New("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 10) }),
	})
	New("Frame", { LayoutOrder = 1, Size = UDim2.fromOffset(1, 14), BackgroundColor3 = Theme.Stroke, BorderSizePixel = 0, Parent = seg })
	local label = Text({
		LayoutOrder = 2, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = AutoX, RichText = true, Text = "",
		Font = Enum.Font.GothamSemibold, TextSize = 12, Parent = seg,
	})
	return seg, label
end

local HudFpsSeg, HudFps = HudSegment(1)
local HudPingSeg, HudPing = HudSegment(2)
local HudTimeSeg, HudTime = HudSegment(3)
local HudExecSeg, HudExec = HudSegment(4)

local hudEnabled = true
local function setHud(v)
	hudEnabled = v
	if v then HUD.Visible = true end
	Tween(HUD, 0.35, { GroupTransparency = v and 0 or 1 })
	task.delay(0.37, function()
		if not hudEnabled and not Promixity.Unloaded then HUD.Visible = false end
	end)
end

do
	local frames, last = 0, os.clock()
	local fps, ping = 60, 0
	local clockLast = 0
	local function upd()
		HudFps.Text = string.format('<font color="#8B8B9C">FPS</font>  %d', fps)
		HudPing.Text = string.format('<font color="#8B8B9C">PING</font>  %d ms', ping)
		HudTime.Text = os.date("%H:%M")
		HudExec.Text = string.format('<font color="#8B8B9C">EXEC</font>  %s', tostring(ExecutorName))
	end
	upd()
	connect(RunService.RenderStepped, function()
		frames += 1
		local now = os.clock()
		if now - last >= 0.5 then
			fps = math.floor(frames / (now - last) + 0.5)
			frames, last = 0, now
			local ok, v = pcall(function() return Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
			ping = ok and math.floor(v + 0.5) or 0
			upd()
		end
	end)
end

local HudDrag = MakeDraggable(HUD, HUD, "inside")

-- ───────────────────────────── Tabs ─────────────────────────────
local SectionMethods = {}
SectionMethods.__index = SectionMethods

local function Element(section, height, interactive)
	local props = {
		LayoutOrder = section:Next(),
		Size = UDim2.new(1, 0, 0, height),
		BackgroundColor3 = Theme.Element,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = section.Container,
	}
	local class = "Frame"
	if interactive then
		class = "TextButton"
		props.AutoButtonColor = false
		props.Text = ""
	end
	local el = New(class, props, { Corner(8), Stroke(Theme.StrokeSoft) })
	if interactive then
		el.MouseEnter:Connect(function() Tween(el, 0.15, { BackgroundColor3 = Theme.Hover }) end)
		el.MouseLeave:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Theme.Element }) end)
		el.MouseButton1Down:Connect(function() Tween(el, 0.08, { BackgroundColor3 = Theme.Pressed }) end)
		el.MouseButton1Up:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Theme.Hover }) end)
	end
	return el
end

function SectionMethods:Next()
	self.Count += 1
	return self.Count
end

local function CreateSection(tab, title)
	tab.SectionCount += 1
	local card = New("Frame", {
		Name = title,
		LayoutOrder = tab.SectionCount,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		BackgroundColor3 = Theme.Panel,
		BorderSizePixel = 0,
		Parent = tab.Scroll,
	}, {
		Corner(12),
		Stroke(Theme.Stroke),
		Pad(12, 12, 12, 12),
		New("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }),
	})
	local section = setmetatable({ Tab = tab, Container = card, Count = 0 }, SectionMethods)
	local head = New("Frame", { LayoutOrder = section:Next(), Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Parent = card })
	New("Frame", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, 12), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = head }, { Pill() })
	Text({ Position = UDim2.fromOffset(11, 0), Size = UDim2.new(1, -11, 1, 0), Text = title, Font = Enum.Font.GothamBold, TextSize = 14, Parent = head })
	return section
end

-- Toggle
function SectionMethods:Toggle(o)
	local value = o.Default == true
	local el = Element(self, 38, true)
	local lbl = Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -70, 1, 0), Text = o.Name, Parent = el })
	local track = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Size = UDim2.fromOffset(40, 22),
		BackgroundColor3 = Theme.Off, BorderSizePixel = 0, Parent = el,
	}, { Pill() })
	local knob = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 3, 0.5, 0), Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(240, 240, 245), BorderSizePixel = 0, Parent = track,
	}, { Pill() })

	local obj = {}
	local function render(animate)
		local t = animate and 0.28 or 0
		Tween(track, t, { BackgroundColor3 = value and Theme.Accent or Theme.Off })
		Tween(knob, t, { Position = value and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0), BackgroundColor3 = value and Color3.new(1, 1, 1) or Color3.fromRGB(190, 190, 202) }, Enum.EasingStyle.Back)
		Tween(lbl, t, { TextColor3 = value and Theme.Text or Theme.SubText })
	end
	function obj:Set(v, silent)
		value = v == true
		if o.Flag then Promixity.Flags[o.Flag] = value end
		render(true)
		if not silent and o.Callback then task.spawn(o.Callback, value) end
	end
	function obj:Get() return value end

	el.MouseButton1Down:Connect(function() Tween(knob, 0.1, { Size = UDim2.fromOffset(20, 16) }) end)
	el.MouseButton1Up:Connect(function() Tween(knob, 0.25, { Size = UDim2.fromOffset(16, 16) }, Enum.EasingStyle.Back) end)
	el.MouseLeave:Connect(function() Tween(knob, 0.2, { Size = UDim2.fromOffset(16, 16) }) end)
	el.MouseButton1Click:Connect(function()
		Flash(el)
		obj:Set(not value)
	end)
	render(false)
	lbl.TextColor3 = value and Theme.Text or Theme.SubText
	Register(o.Flag, value, function(v) obj:Set(v) end)
	return obj
end

-- Button
function SectionMethods:Button(o)
	local accent = o.Accent == true
	local el = Element(self, 36, true)
	if accent then
		el.BackgroundColor3 = Theme.Accent
		el.MouseEnter:Connect(function() Tween(el, 0.15, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }) end)
		el.MouseLeave:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Theme.Accent }) end)
		el.MouseButton1Down:Connect(function() Tween(el, 0.08, { BackgroundColor3 = Color3.fromRGB(200, 200, 200) }) end)
		el.MouseButton1Up:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }) end)
	end
	local lbl = Text({
		Size = UDim2.fromScale(1, 1), Text = o.Name, TextXAlignment = Center, Font = Enum.Font.GothamSemibold,
		TextColor3 = accent and Theme.AccentText or Theme.Text, Parent = el,
	})
	el.MouseButton1Down:Connect(function() Tween(lbl, 0.08, { TextSize = 12 }) end)
	el.MouseButton1Up:Connect(function() Tween(lbl, 0.3, { TextSize = 13 }, Enum.EasingStyle.Back) end)
	el.MouseButton1Click:Connect(function()
		if not accent then Flash(el) end
		if o.Callback then task.spawn(o.Callback) end
	end)
	return { SetText = function(_, t) lbl.Text = t end }
end

-- Slider
function SectionMethods:Slider(o)
	local min, max, inc = o.Min or 0, o.Max or 100, o.Increment or 1
	local decimals = 0
	local frac = tostring(inc):match("%.(%d+)")
	if frac then decimals = #frac end
	local suffix = o.Suffix or ""
	local value = math.clamp(o.Default or min, min, max)
	local scroll = self.Tab.Scroll

	local el = Element(self, 54, false)
	Text({ Position = UDim2.fromOffset(12, 8), Size = UDim2.new(1, -110, 0, 16), Text = o.Name, Parent = el })
	local valLbl = Text({
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 8), Size = UDim2.fromOffset(96, 16),
		TextXAlignment = Right, TextColor3 = Theme.SubText, Font = Enum.Font.GothamSemibold, Parent = el,
	})
	local hit = New("TextButton", { Position = UDim2.fromOffset(12, 30), Size = UDim2.new(1, -24, 0, 18), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = el })
	local track = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(1, 0, 0, 6),
		BackgroundColor3 = Theme.Off, BorderSizePixel = 0, Parent = hit,
	}, { Pill() })
	local fill = New("Frame", { Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = track }, { Pill() })
	local knob = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(0, 0),
		BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = fill,
	}, { Pill() })

	local function fmt(v)
		return (decimals > 0 and string.format("%." .. decimals .. "f", v) or tostring(math.floor(v + 0.5))) .. suffix
	end
	local function snap(v)
		v = math.floor((v - min) / inc + 0.5) * inc + min
		v = math.clamp(v, min, max)
		return tonumber(string.format("%." .. decimals .. "f", v))
	end
	local function render(animate)
		local a = (value - min) / math.max(max - min, 1e-9)
		Tween(fill, animate and 0.1 or 0, { Size = UDim2.new(a, 0, 1, 0) }, Enum.EasingStyle.Quad)
		valLbl.Text = fmt(value)
	end

	local obj = {}
	function obj:Set(v, silent)
		v = snap(v)
		local changed = v ~= value
		value = v
		if o.Flag then Promixity.Flags[o.Flag] = value end
		render(true)
		if changed and not silent and o.Callback then task.spawn(o.Callback, value) end
	end
	function obj:Get() return value end

	local dragging, hovering = false, false
	local function knobState()
		Tween(knob, 0.2, { Size = (dragging or hovering) and UDim2.fromOffset(14, 14) or UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back)
	end
	local function update(x)
		local a = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
		obj:Set(min + (max - min) * a)
	end
	hit.MouseEnter:Connect(function() hovering = true knobState() end)
	hit.MouseLeave:Connect(function() hovering = false knobState() end)
	hit.InputBegan:Connect(function(input)
		if isPress(input) then
			dragging = true
			scroll.ScrollingEnabled = false
			knobState()
			update(input.Position.X)
		end
	end)
	connect(UserInputService.InputChanged, function(input)
		if dragging and isMove(input) then update(input.Position.X) end
	end)
	connect(UserInputService.InputEnded, function(input)
		if dragging and isPress(input) then
			dragging = false
			scroll.ScrollingEnabled = true
			knobState()
		end
	end)

	render(false)
	Register(o.Flag, value, function(v) obj:Set(v) end)
	return obj
end

-- Dropdown (single / multi)
function SectionMethods:Dropdown(o)
	local multi = o.Multi == true
	local options = o.Options or {}
	local selected
	if multi then
		selected = {}
		for _, v in ipairs(o.Default or {}) do selected[v] = true end
	else
		selected = o.Default or options[1]
	end
	local open = false

	local el = Element(self, 38, false)
	local header = New("TextButton", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = el })
	Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(0.45, -12, 1, 0), Text = o.Name, Parent = header })
	local valLbl = Text({
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -32, 0, 0), Size = UDim2.new(0.55, -36, 1, 0),
		TextXAlignment = Right, TextColor3 = Theme.SubText, TextTruncate = Enum.TextTruncate.AtEnd, TextSize = 12, Parent = header,
	})
	local arrow = Text({
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -18, 0.5, 0), Size = UDim2.fromOffset(16, 16),
		Text = "›", TextXAlignment = Center, TextColor3 = Theme.SubText, Font = Enum.Font.GothamBold, TextSize = 20, Parent = header,
	})
	header.MouseEnter:Connect(function() Tween(el, 0.15, { BackgroundColor3 = Theme.Hover }) end)
	header.MouseLeave:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Theme.Element }) end)

	local list = New("ScrollingFrame", {
		Position = UDim2.fromOffset(8, 44), Size = UDim2.new(1, -16, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 2, ScrollBarImageColor3 = Theme.Muted, CanvasSize = UDim2.new(), AutomaticCanvasSize = AutoY, Parent = el,
	}, { New("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }) })

	local obj = {}
	local rows = {}

	local function getValue()
		if multi then
			local out = {}
			for _, opt in ipairs(options) do
				if selected[opt] then table.insert(out, opt) end
			end
			return out
		end
		return selected
	end
	local function display()
		if multi then
			local v = getValue()
			valLbl.Text = #v > 0 and table.concat(v, ", ") or "None"
		else
			valLbl.Text = selected ~= nil and tostring(selected) or "None"
		end
	end
	local function isSel(opt)
		if multi then return selected[opt] == true end
		return selected == opt
	end
	local function paintRows(animate)
		for opt, r in pairs(rows) do
			local on = isSel(opt)
			local t = animate and 0.2 or 0
			Tween(r.Label, t, { TextColor3 = on and Theme.Text or Theme.SubText })
			Tween(r.Mark, t, { BackgroundTransparency = on and 0 or 1, Size = on and UDim2.fromOffset(6, 6) or UDim2.fromOffset(0, 0) }, Enum.EasingStyle.Back)
		end
	end
	local function listHeight()
		local n = math.min(#options, 6)
		return n * 30 + math.max(n - 1, 0) * 4
	end
	local function openHeight() return 44 + listHeight() + 8 end

	local function fire()
		if o.Flag then Promixity.Flags[o.Flag] = getValue() end
		if o.Callback then task.spawn(o.Callback, getValue()) end
	end
	local function setOpenState(state)
		open = state
		Tween(el, 0.35, { Size = UDim2.new(1, 0, 0, open and openHeight() or 38) })
		Tween(arrow, 0.3, { Rotation = open and 90 or 0, TextColor3 = open and Theme.Accent or Theme.SubText }, Enum.EasingStyle.Back)
		list.Size = UDim2.new(1, -16, 0, listHeight())
	end

	local function rebuild()
		for _, r in pairs(rows) do r.Button:Destroy() end
		rows = {}
		for i, opt in ipairs(options) do
			local b = New("TextButton", {
				LayoutOrder = i, Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme.Panel, BackgroundTransparency = 1,
				Text = "", AutoButtonColor = false, BorderSizePixel = 0, Parent = list,
			}, { Corner(6) })
			local l = Text({ Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -30, 1, 0), Text = tostring(opt), TextSize = 12, Parent = b })
			local mark = New("Frame", {
				AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(0, 0),
				BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1, BorderSizePixel = 0, Parent = b,
			}, { Pill() })
			b.MouseEnter:Connect(function() Tween(b, 0.15, { BackgroundTransparency = 0 }) end)
			b.MouseLeave:Connect(function() Tween(b, 0.2, { BackgroundTransparency = 1 }) end)
			b.MouseButton1Click:Connect(function()
				if multi then
					selected[opt] = not selected[opt] or nil
				else
					selected = opt
				end
				display()
				paintRows(true)
				fire()
				if not multi then setOpenState(false) end
			end)
			rows[opt] = { Button = b, Label = l, Mark = mark }
		end
		paintRows(false)
		if open then setOpenState(true) end
	end

	function obj:Set(v, silent)
		if multi then
			selected = {}
			for _, x in ipairs(type(v) == "table" and v or {}) do selected[x] = true end
		else
			selected = v
		end
		display()
		paintRows(true)
		if o.Flag then Promixity.Flags[o.Flag] = getValue() end
		if not silent and o.Callback then task.spawn(o.Callback, getValue()) end
	end
	function obj:Get() return getValue() end
	function obj:SetOptions(newOptions)
		options = newOptions or {}
		if multi then
			for k in pairs(selected) do
				if not table.find(options, k) then selected[k] = nil end
			end
		elseif not table.find(options, selected) then
			selected = options[1]
		end
		rebuild()
		display()
		if o.Flag then Promixity.Flags[o.Flag] = getValue() end
	end

	header.MouseButton1Click:Connect(function()
		Flash(el)
		setOpenState(not open)
	end)

	rebuild()
	display()
	Register(o.Flag, getValue(), function(v) obj:Set(v) end)
	return obj
end

-- Keybind
function SectionMethods:Keybind(o)
	local key = o.Default
	local listening = false
	local el = Element(self, 38, true)
	Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -110, 1, 0), Text = o.Name, Parent = el })
	local pill = New("TextLabel", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.fromOffset(0, 24), AutomaticSize = AutoX,
		BackgroundColor3 = Theme.Panel, BorderSizePixel = 0, Font = Enum.Font.GothamSemibold, TextSize = 12,
		TextColor3 = Theme.SubText, Text = "None", Parent = el,
	}, { Corner(6), Pad(10, 0, 10, 0), Stroke(Theme.StrokeSoft) })

	local obj = {}
	local function render()
		pill.Text = listening and "..." or (key and key.Name or "None")
		Tween(pill, 0.2, {
			TextColor3 = listening and Theme.Accent or Theme.SubText,
			BackgroundColor3 = listening and Theme.Pressed or Theme.Panel,
		})
	end
	function obj:Set(v, silent)
		if typeof(v) == "string" then
			local ok, k = pcall(function() return Enum.KeyCode[v] end)
			v = ok and k or nil
		end
		key = typeof(v) == "EnumItem" and v or nil
		if o.Flag then Promixity.Flags[o.Flag] = key or false end
		render()
		if not silent and o.Changed then task.spawn(o.Changed, key) end
	end
	function obj:Get() return key end

	el.MouseButton1Click:Connect(function()
		Flash(el)
		listening = not listening
		Listening = listening
		render()
	end)
	connect(UserInputService.InputBegan, function(input, gpe)
		if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
		if listening then
			listening = false
			Listening = false
			LastBind = os.clock()
			if input.KeyCode == Enum.KeyCode.Escape then
				obj:Set(nil)
			else
				obj:Set(input.KeyCode)
			end
		elseif not gpe and key and input.KeyCode == key and o.Callback then
			task.spawn(o.Callback)
		end
	end)

	render()
	if o.Flag then Promixity.Flags[o.Flag] = key or false end
	Register(o.Flag, key or false, function(v) obj:Set(v) end)
	return obj
end

-- TextBox
function SectionMethods:TextBox(o)
	local el = Element(self, 38, false)
	Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -170, 1, 0), Text = o.Name, Parent = el })
	local box = New("TextBox", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(150, 26),
		BackgroundColor3 = Theme.Panel, BorderSizePixel = 0, ClearTextOnFocus = false, Font = Enum.Font.GothamMedium, TextSize = 12,
		TextColor3 = Theme.Text, PlaceholderText = o.Placeholder or "", PlaceholderColor3 = Theme.Muted, Text = o.Default or "",
		TextXAlignment = Left, ClipsDescendants = true, Parent = el,
	}, { Corner(6), Pad(8, 0, 8, 0) })
	local stroke = Stroke(Theme.StrokeSoft)
	stroke.Parent = box
	box.Focused:Connect(function() Tween(stroke, 0.2, { Color = Theme.Accent }) end)
	local obj = {}
	function obj:Get() return box.Text end
	function obj:Set(v, silent)
		box.Text = tostring(v or "")
		if o.Flag then Promixity.Flags[o.Flag] = box.Text end
		if not silent and o.Callback then task.spawn(o.Callback, box.Text, false) end
	end
	box.FocusLost:Connect(function(enter)
		Tween(stroke, 0.2, { Color = Theme.StrokeSoft })
		if o.Flag then Promixity.Flags[o.Flag] = box.Text end
		if o.Callback then task.spawn(o.Callback, box.Text, enter) end
	end)
	Register(o.Flag, box.Text, function(v) obj:Set(v) end)
	return obj
end

-- ColorPicker
function SectionMethods:ColorPicker(o)
	local color = o.Default or Color3.fromRGB(255, 255, 255)
	local h, s, v = color:ToHSV()
	local open = false
	local scroll = self.Tab.Scroll

	local el = Element(self, 38, false)
	local header = New("TextButton", { Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, Text = "", AutoButtonColor = false, Parent = el })
	Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -70, 1, 0), Text = o.Name, Parent = header })
	local swatch = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Size = UDim2.fromOffset(32, 18),
		BackgroundColor3 = color, BorderSizePixel = 0, Parent = header,
	}, { Corner(5), Stroke(Color3.fromRGB(255, 255, 255), 1) })
	swatch:FindFirstChildOfClass("UIStroke").Transparency = 0.85
	header.MouseEnter:Connect(function() Tween(el, 0.15, { BackgroundColor3 = Theme.Hover }) end)
	header.MouseLeave:Connect(function() Tween(el, 0.2, { BackgroundColor3 = Theme.Element }) end)

	local sv = New("TextButton", {
		Position = UDim2.fromOffset(12, 46), Size = UDim2.new(1, -56, 0, 90), BackgroundColor3 = Color3.fromHSV(h, 1, 1),
		Text = "", AutoButtonColor = false, BorderSizePixel = 0, Parent = el,
	}, { Corner(6) })
	New("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = sv }, {
		Corner(6),
		New("UIGradient", { Transparency = NumberSequence.new(0, 1) }),
	})
	New("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, Parent = sv }, {
		Corner(6),
		New("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0) }),
	})
	local svCursor = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(s, 1 - v), Size = UDim2.fromOffset(12, 12),
		BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 3, Parent = sv,
	}, { Pill(), Stroke(Color3.new(0, 0, 0), 1.5) })

	local hue = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 46), Size = UDim2.fromOffset(20, 90),
		BackgroundColor3 = Color3.new(1, 1, 1), Text = "", AutoButtonColor = false, BorderSizePixel = 0, Parent = el,
	}, {
		Corner(6),
		New("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
				ColorSequenceKeypoint.new(1 / 6, Color3.fromHSV(1 / 6, 1, 1)),
				ColorSequenceKeypoint.new(2 / 6, Color3.fromHSV(2 / 6, 1, 1)),
				ColorSequenceKeypoint.new(3 / 6, Color3.fromHSV(3 / 6, 1, 1)),
				ColorSequenceKeypoint.new(4 / 6, Color3.fromHSV(4 / 6, 1, 1)),
				ColorSequenceKeypoint.new(5 / 6, Color3.fromHSV(5 / 6, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1)),
			}),
		}),
	})
	local hueCursor = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, h), Size = UDim2.new(1, 4, 0, 5),
		BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 3, Parent = hue,
	}, { Corner(2), Stroke(Color3.new(0, 0, 0), 1.5) })

	local obj = {}
	local function apply(animate, silent)
		color = Color3.fromHSV(h, s, v)
		Tween(swatch, animate and 0.12 or 0, { BackgroundColor3 = color })
		sv.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
		Tween(svCursor, 0.05, { Position = UDim2.fromScale(s, 1 - v) }, Enum.EasingStyle.Sine)
		Tween(hueCursor, 0.05, { Position = UDim2.fromScale(0.5, h) }, Enum.EasingStyle.Sine)
		if o.Flag then Promixity.Flags[o.Flag] = color end
		if not silent and o.Callback then task.spawn(o.Callback, color) end
	end
	function obj:Set(c, silent)
		if typeof(c) ~= "Color3" then return end
		h, s, v = c:ToHSV()
		apply(true, silent)
	end
	function obj:Get() return color end

	local mode
	local function updateDrag(pos)
		if mode == "sv" then
			s = math.clamp((pos.X - sv.AbsolutePosition.X) / math.max(sv.AbsoluteSize.X, 1), 0, 1)
			v = 1 - math.clamp((pos.Y - sv.AbsolutePosition.Y) / math.max(sv.AbsoluteSize.Y, 1), 0, 1)
		elseif mode == "hue" then
			h = math.clamp((pos.Y - hue.AbsolutePosition.Y) / math.max(hue.AbsoluteSize.Y, 1), 0, 0.999)
		end
		apply(false)
	end
	local function begin(which)
		return function(input)
			if isPress(input) then
				mode = which
				scroll.ScrollingEnabled = false
				updateDrag(Vector2.new(input.Position.X, input.Position.Y))
			end
		end
	end
	sv.InputBegan:Connect(begin("sv"))
	hue.InputBegan:Connect(begin("hue"))
	connect(UserInputService.InputChanged, function(input)
		if mode and isMove(input) then updateDrag(Vector2.new(input.Position.X, input.Position.Y)) end
	end)
	connect(UserInputService.InputEnded, function(input)
		if mode and isPress(input) then
			mode = nil
			scroll.ScrollingEnabled = true
		end
	end)

	header.MouseButton1Click:Connect(function()
		Flash(el)
		open = not open
		Tween(el, 0.38, { Size = UDim2.new(1, 0, 0, open and 148 or 38) })
	end)

	Register(o.Flag, color, function(c) obj:Set(c) end)
	if o.Flag then Promixity.Flags[o.Flag] = color end
	return obj
end

-- Label (paragraph)
function SectionMethods:Label(text)
	local lbl = Text({
		LayoutOrder = self:Next(), Size = UDim2.new(1, 0, 0, 0), AutomaticSize = AutoY, Text = text, TextColor3 = Theme.SubText,
		TextSize = 12, TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top, Parent = self.Container,
	})
	return { Set = function(_, t) lbl.Text = t end }
end

-- Key / value row
function SectionMethods:Info(key, value)
	local el = Element(self, 34, false)
	Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(0.4, 0, 1, 0), Text = key, TextColor3 = Theme.SubText, Parent = el })
	local val = Text({
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 0), Size = UDim2.new(0.6, -12, 1, 0), Text = tostring(value or ""),
		TextXAlignment = Right, TextTruncate = Enum.TextTruncate.AtEnd, Font = Enum.Font.GothamSemibold, Parent = el,
	})
	return { Set = function(_, t) val.Text = tostring(t) end }
end

-- Custom element container
function SectionMethods:Custom(height)
	return Element(self, height, false)
end

-- Function card: toggle + arrow to expand settings.
-- PC: left-click name/switch toggles, right-click header/arrow expands. Mobile: tap arrow expands.
function SectionMethods:FunctionCard(o)
	local enabled = o.Default == true
	local expanded = o.Expanded == true

	local card = New("Frame", {
		LayoutOrder = self:Next(),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		BackgroundColor3 = Theme.Element,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = self.Container,
	}, { Corner(8), Stroke(Theme.StrokeSoft) })
	New("UIListLayout", { Padding = UDim.new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder, Parent = card })

	local header = New("Frame", {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 38),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = card,
	})
	-- left zone toggles the function, right arrow expands; siblings, no nested buttons
	local mainHit = New("TextButton", {
		Position = UDim2.fromOffset(0, 0), Size = UDim2.new(1, -44, 1, 0),
		BackgroundTransparency = 1, Text = "", AutoButtonColor = false,
		Parent = header,
	})
	local lbl = Text({ Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -64, 1, 0), Text = o.Name, Parent = mainHit })

	local track = New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(40, 22),
		BackgroundColor3 = Theme.Off, BorderSizePixel = 0, Parent = mainHit,
	}, { Pill() })
	local knob = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 3, 0.5, 0), Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(190, 190, 202), BorderSizePixel = 0, Parent = track,
	}, { Pill() })

	local arrow = New("TextButton", {
		AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 0), Size = UDim2.fromOffset(44, 38),
		BackgroundTransparency = 1, Text = "›", Font = Enum.Font.GothamBold, TextSize = 22,
		TextColor3 = Theme.SubText, AutoButtonColor = false, Parent = header,
	})

	local body = New("Frame", {
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = AutoY,
		BackgroundTransparency = 1,
		Visible = expanded,
		Parent = card,
	}, {
		Pad(8, 8, 8, 8),
		New("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }),
	})

	local obj = {}
	local function renderToggle(animate)
		local t = animate and 0.28 or 0
		Tween(track, t, { BackgroundColor3 = enabled and Theme.Accent or Theme.Off })
		Tween(knob, t, { Position = enabled and UDim2.new(1, -19, 0.5, 0) or UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
		Tween(lbl, t, { TextColor3 = enabled and Theme.Text or Theme.SubText })
	end
	local function renderArrow(animate)
		Tween(arrow, animate and 0.3 or 0, { Rotation = expanded and 90 or 0, TextColor3 = expanded and Theme.Text or Theme.SubText }, Enum.EasingStyle.Back)
	end
	local function setExpanded(v)
		expanded = v == true
		body.Visible = expanded
		renderArrow(true)
	end
	function obj:Set(v, silent)
		enabled = v == true
		if o.Flag then
			Promixity.Flags[o.Flag] = enabled
			if Functions and Functions.Config and o.ConfigKey then
				Functions.Config[o.ConfigKey] = enabled
			end
		end
		renderToggle(true)
		if not silent and o.Callback then task.spawn(o.Callback, enabled) end
	end
	function obj:Get() return enabled end
	function obj:SetExpanded(v) setExpanded(v) end
	function obj:IsExpanded() return expanded end

	mainHit.MouseEnter:Connect(function() Tween(card, 0.15, { BackgroundColor3 = Theme.Hover }) end)
	mainHit.MouseLeave:Connect(function() Tween(card, 0.2, { BackgroundColor3 = Theme.Element }) end)
	arrow.MouseEnter:Connect(function() Tween(arrow, 0.15, { TextColor3 = Theme.Text }) end)
	arrow.MouseLeave:Connect(function() Tween(arrow, 0.2, { TextColor3 = expanded and Theme.Text or Theme.SubText }) end)
	mainHit.MouseButton1Click:Connect(function()
		obj:Set(not enabled)
	end)
	-- right mouse button on PC expands/collapses
	mainHit.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			setExpanded(not expanded)
		end
	end)
	-- tap / left-click on arrow expands (mobile + PC)
	arrow.MouseButton1Click:Connect(function()
		setExpanded(not expanded)
	end)

	renderToggle(false)
	renderArrow(false)
	Register(o.Flag, enabled, function(v) obj:Set(v) end)

	-- sub-section bound to body so we can reuse Toggle/Slider/Dropdown/Keybind
	local sub = setmetatable({ Tab = self.Tab, Container = body, Count = 0 }, SectionMethods)
	if o.Build then
		pcall(o.Build, sub, obj)
	end
	return obj
end

-- Tab buttons / pages
local TabIndex = 0
local Tabs = {}

local function setTabButton(tab, active)
	local b = tab.Button
	Tween(b, 0.25, { BackgroundTransparency = active and 0 or 1 })
	Tween(tab.Bar, 0.3, { Size = UDim2.fromOffset(3, active and 18 or 0) }, Enum.EasingStyle.Back)
	Tween(tab.Dot, 0.25, { BackgroundColor3 = active and Theme.Accent or Theme.Muted, Size = active and UDim2.fromOffset(8, 8) or UDim2.fromOffset(6, 6) }, Enum.EasingStyle.Back)
	Tween(tab.Label, 0.25, { TextColor3 = active and Theme.Text or Theme.SubText })
end

PageIn = function(tab, dir, delay)
	PageToken += 1
	local token = PageToken
	tab.Page.Visible = true
	tab.Page.Position = UDim2.fromOffset(0, 18 * dir)
	tab.Page.GroupTransparency = 1
	task.delay(delay or 0.08, function()
		if token ~= PageToken or Promixity.Unloaded then return end
		Tween(tab.Page, 0.45, { Position = UDim2.fromOffset(0, 0), GroupTransparency = 0 })
	end)
end

local function SelectTab(tab)
	if CurrentTab == tab then return end
	local prev = CurrentTab
	CurrentTab = tab
	local dir = (prev and tab.Index < prev.Index) and -1 or 1

	for _, t in pairs(Tabs) do
		setTabButton(t, t == tab)
		if t ~= tab and t ~= prev then t.Page.Visible = false end
	end
	if prev then
		Tween(prev.Page, 0.18, { GroupTransparency = 1, Position = UDim2.fromOffset(0, -14 * dir) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		task.delay(0.2, function()
			if CurrentTab ~= prev then prev.Page.Visible = false end
		end)
	end
	PageIn(tab, dir, prev and 0.12 or 0.1)

	TitleLabel.Position = UDim2.fromOffset(22, 18)
	TitleLabel.TextTransparency = 1
	SubtitleLabel.TextTransparency = 1
	TitleLabel.Text = tab.Name
	SubtitleLabel.Text = tab.Subtitle
	Tween(TitleLabel, 0.4, { Position = UDim2.fromOffset(22, 10), TextTransparency = 0 })
	Tween(SubtitleLabel, 0.5, { TextTransparency = 0 })
end

local function CreateTab(name, subtitle, area)
	TabIndex += 1
	local tab = { Name = name, Subtitle = subtitle, Index = TabIndex, SectionCount = 0 }

	local btn = New("TextButton", {
		Name = name, LayoutOrder = TabIndex, Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = Theme.Element, BackgroundTransparency = 1,
		Text = "", AutoButtonColor = false, BorderSizePixel = 0, Parent = area == "bottom" and BottomList or TopList,
	}, { Corner(10) })
	tab.Button = btn
	tab.Bar = New("Frame", {
		AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, 0),
		BackgroundColor3 = Theme.Accent, BorderSizePixel = 0, Parent = btn,
	}, { Pill() })
	tab.Dot = New("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 20, 0.5, 0), Size = UDim2.fromOffset(6, 6),
		BackgroundColor3 = Theme.Muted, BorderSizePixel = 0, Parent = btn,
	}, { Pill() })
	tab.Label = Text({ Position = UDim2.fromOffset(38, 0), Size = UDim2.new(1, -42, 1, 0), Text = name, TextColor3 = Theme.SubText, TextSize = 14, Parent = btn })

	btn.MouseEnter:Connect(function()
		if CurrentTab ~= tab then Tween(btn, 0.15, { BackgroundTransparency = 0.55 }) end
	end)
	btn.MouseLeave:Connect(function()
		if CurrentTab ~= tab then Tween(btn, 0.2, { BackgroundTransparency = 1 }) end
	end)
	btn.MouseButton1Down:Connect(function()
		Tween(tab.Dot, 0.1, { Size = UDim2.fromOffset(12, 12) })
	end)
	btn.MouseButton1Click:Connect(function()
		SelectTab(tab)
	end)

	tab.Page = New("CanvasGroup", {
		Name = name, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, GroupTransparency = 1, Visible = false, Parent = Pages,
	})
	tab.Scroll = New("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, CanvasSize = UDim2.new(),
		AutomaticCanvasSize = AutoY, ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Muted, ScrollBarImageTransparency = 0.3,
		ScrollingDirection = Enum.ScrollingDirection.Y, Parent = tab.Page,
	}, { Pad(20, 14, 20, 18), New("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }) })

	function tab:Section(title) return CreateSection(self, title) end
	Tabs[name] = tab
	Promixity.Tabs[name] = tab
	return tab
end

-- ───────────────────────────── Modules (2ww/*.lua) ─────────────────────────────
local function LoadModule(file, defaults)
	local loaded = nil
	pcall(function()
		if type(readfile) == "function" and type(isfile) == "function" then
			local okFile = false
			pcall(function() okFile = isfile(file) end)
			if okFile then
				local src = readfile(file)
				if type(src) == "string" and src ~= "" then
					local fn = loadstring(src)
					if fn then loaded = fn() end
				end
			end
		end
	end)
	if type(loaded) ~= "table" then loaded = { Config = {} } end
	loaded.Config = loaded.Config or {}
	if defaults then
		for k, v in pairs(defaults) do
			if loaded.Config[k] == nil then loaded.Config[k] = v end
		end
	end
	return loaded
end

Functions = LoadModule("2ww/functions.lua", {
	SilentEnabled = true,
	Prediction = true,
	Wallbang = false,
	WallbangDist = 15,
	HitChance = 1.0,
	RampTime = 0,
	ShootDelay = 0,
	AutoShoot = false,
	FOVEnabled = true,
	FOVRadius = 150,
	ShowFOV = true,
})
ESP = LoadModule("2ww/esp.lua", {
	Enabled = true,
	Box = true, BoxColor = Color3.fromRGB(255, 255, 255),
	Name = true, NameColor = Color3.fromRGB(255, 255, 255),
	Health = true, Distance = true,
	Tracer = false, TracerColor = Color3.fromRGB(255, 255, 255), TracerFrom = "Bottom",
	MaxDistance = 2000, TeamCheck = false,
	GunESP = true, Chams = false,
})
AutoPickGun = LoadModule("2ww/autopickgun.lua", {
	Enabled = false, Delay = 0.25, Mode = "Touch", MaxDistance = 1e9,
	IgnoreIfMurderer = true, IgnoreIfDead = true,
})
do
	-- FOV circle redraw (safe if Drawing missing)
	pcall(function()
		connect(RunService.RenderStepped, function()
			pcall(function()
				if Functions and Functions.DrawFOV then Functions.DrawFOV() end
			end)
		end)
	end)
	-- start ESP + autopick render loops
	pcall(function() if ESP and ESP.Start then ESP.Start() end end)
	pcall(function() if AutoPickGun and AutoPickGun.Start then AutoPickGun.Start() end end)
end

local MainTab = CreateTab("Main", "Functions", "top")
local ConfigTab = CreateTab("Config", "Interface & profiles", "top")
local InfoTab = CreateTab("Info", "Session & account", "top")

-- ───────────────────────────── Page: Main (functions, one card each) ─────────────────────────────
do
	local funcs = MainTab:Section("Functions")
	funcs:FunctionCard({
		Name = "Silent Aim", Flag = "fn_silent", ConfigKey = "SilentEnabled",
		Default = Functions.Config.SilentEnabled == true, Expanded = true,
		Callback = function(v) Functions.Config.SilentEnabled = v end,
		Build = function(sub)
			sub:Toggle({ Name = "Prediction", Flag = "fn_prediction", Default = Functions.Config.Prediction == true,
				Callback = function(v) Functions.Config.Prediction = v end })
			sub:Slider({ Name = "Hit Chance", Flag = "fn_hitchance", Min = 0, Max = 100, Default = math.floor((Functions.Config.HitChance or 1) * 100 + 0.5), Suffix = "%",
				Callback = function(v) Functions.Config.HitChance = v / 100 end })
			sub:Slider({ Name = "Ramp Time", Flag = "fn_ramptime", Min = 0, Max = 2000, Increment = 10, Default = math.floor((Functions.Config.RampTime or 0) * 1000 + 0.5), Suffix = " ms",
				Callback = function(v) Functions.Config.RampTime = v / 1000 end })
			sub:Slider({ Name = "Shoot Delay", Flag = "fn_delay", Min = 0, Max = 1000, Increment = 10, Default = math.floor((Functions.Config.ShootDelay or 0) * 1000 + 0.5), Suffix = " ms",
				Callback = function(v) Functions.Config.ShootDelay = v / 1000 end })
			sub:Toggle({ Name = "Auto Shoot", Flag = "fn_autoshoot", Default = Functions.Config.AutoShoot == true,
				Callback = function(v) Functions.Config.AutoShoot = v end })
			sub:Toggle({ Name = "Wallbang", Flag = "fn_wallbang", Default = Functions.Config.Wallbang == true,
				Callback = function(v) Functions.Config.Wallbang = v end })
			sub:Slider({ Name = "Wallbang Dist", Flag = "fn_wbdist", Min = 3, Max = 100, Default = Functions.Config.WallbangDist or 15,
				Callback = function(v) Functions.Config.WallbangDist = v end })
			sub:Toggle({ Name = "FOV Check", Flag = "fn_fov", Default = Functions.Config.FOVEnabled == true,
				Callback = function(v) Functions.Config.FOVEnabled = v end })
			sub:Slider({ Name = "FOV Radius", Flag = "fn_fovr", Min = 50, Max = 500, Increment = 5, Default = Functions.Config.FOVRadius or 150,
				Callback = function(v) Functions.Config.FOVRadius = v end })
			sub:Toggle({ Name = "Show FOV", Flag = "fn_showfov", Default = Functions.Config.ShowFOV == true,
				Callback = function(v) Functions.Config.ShowFOV = v end })
		end,
	})

	funcs:FunctionCard({
		Name = "ESP", Flag = "esp_enabled", ConfigKey = nil,
		Default = ESP.Config.Enabled == true, Expanded = false,
		Callback = function(v) ESP.Config.Enabled = v end,
		Build = function(sub)
			sub:Toggle({ Name = "Boxes", Flag = "esp_boxes", Default = ESP.Config.Box == true,
				Callback = function(v) ESP.Config.Box = v end })
			sub:Toggle({ Name = "Names", Flag = "esp_names", Default = ESP.Config.Name == true,
				Callback = function(v) ESP.Config.Name = v end })
			sub:Toggle({ Name = "Health Bar", Flag = "esp_health", Default = ESP.Config.Health == true,
				Callback = function(v) ESP.Config.Health = v end })
			sub:Toggle({ Name = "Distance", Flag = "esp_distance", Default = ESP.Config.Distance == true,
				Callback = function(v) ESP.Config.Distance = v end })
			sub:Toggle({ Name = "Tracers", Flag = "esp_tracers", Default = ESP.Config.Tracer == true,
				Callback = function(v) ESP.Config.Tracer = v end })
			sub:Toggle({ Name = "Chams", Flag = "esp_chams", Default = ESP.Config.Chams == true,
				Callback = function(v) ESP.Config.Chams = v end })
			sub:Toggle({ Name = "Gun ESP", Flag = "esp_gun", Default = ESP.Config.GunESP == true,
				Callback = function(v) ESP.Config.GunESP = v end })
			sub:Toggle({ Name = "Team Check", Flag = "esp_team", Default = ESP.Config.TeamCheck == true,
				Callback = function(v) ESP.Config.TeamCheck = v end })
			sub:Slider({ Name = "Max Distance", Flag = "esp_maxdist", Min = 100, Max = 5000, Increment = 50, Default = ESP.Config.MaxDistance or 2000, Suffix = " studs",
				Callback = function(v) ESP.Config.MaxDistance = v end })
			sub:Dropdown({ Name = "Tracer Origin", Flag = "esp_origin", Options = { "Bottom", "Center", "Mouse" }, Default = ESP.Config.TracerFrom or "Bottom",
				Callback = function(v) ESP.Config.TracerFrom = v end })
			sub:ColorPicker({ Name = "Box Color", Flag = "esp_box_color", Default = ESP.Config.BoxColor or Color3.fromRGB(255, 255, 255),
				Callback = function(v) ESP.Config.BoxColor = v end })
			sub:ColorPicker({ Name = "Name Color", Flag = "esp_name_color", Default = ESP.Config.NameColor or Color3.fromRGB(255, 255, 255),
				Callback = function(v) ESP.Config.NameColor = v end })
			sub:ColorPicker({ Name = "Tracer Color", Flag = "esp_tracer_color", Default = ESP.Config.TracerColor or Color3.fromRGB(255, 255, 255),
				Callback = function(v) ESP.Config.TracerColor = v end })
		end,
	})

	funcs:FunctionCard({
		Name = "Auto Pick Gun", Flag = "ap_enabled", ConfigKey = nil,
		Default = AutoPickGun.Config.Enabled == true, Expanded = false,
		Callback = function(v)
			AutoPickGun.Config.Enabled = v
			if v then pcall(function() AutoPickGun.Start() end) end
		end,
		Build = function(sub)
			sub:Dropdown({ Name = "Mode", Flag = "ap_mode", Options = { "Touch", "Teleport" }, Default = AutoPickGun.Config.Mode or "Touch",
				Callback = function(v) AutoPickGun.Config.Mode = v end })
			sub:Slider({ Name = "Retry Delay", Flag = "ap_delay", Min = 10, Max = 200, Default = math.floor((AutoPickGun.Config.Delay or 0.25) * 100 + 0.5), Suffix = " x10ms",
				Callback = function(v) AutoPickGun.Config.Delay = v / 100 end })
			sub:Toggle({ Name = "Ignore If Murderer", Flag = "ap_nomurder", Default = AutoPickGun.Config.IgnoreIfMurderer == true,
				Callback = function(v) AutoPickGun.Config.IgnoreIfMurderer = v end })
			sub:Toggle({ Name = "Ignore If Dead", Flag = "ap_nodead", Default = AutoPickGun.Config.IgnoreIfDead == true,
				Callback = function(v) AutoPickGun.Config.IgnoreIfDead = v end })
		end,
	})
end

-- ───────────────────────────── Page: Config ─────────────────────────────
do
	local ui = ConfigTab:Section("Interface")
	ui:Keybind({
		Name = "Menu Key", Flag = "ui_key", Default = Enum.KeyCode.RightShift,
		Changed = function(k) Promixity.ToggleKey = k or Enum.KeyCode.RightShift end,
	})
	ui:Slider({
		Name = "UI Scale", Flag = "ui_scale", Min = 50, Max = 150, Default = 100, Suffix = "%",
		Callback = function(v)
			UIScaleMul = v / 100
			applyScale()
		end,
	})
	ui:Toggle({ Name = "Show HUD", Flag = "ui_hud", Default = true, Callback = setHud })
	ui:Toggle({ Name = "HUD · FPS", Flag = "ui_hud_fps", Default = true, Callback = function(v) HudFpsSeg.Visible = v end })
	ui:Toggle({ Name = "HUD · Ping", Flag = "ui_hud_ping", Default = true, Callback = function(v) HudPingSeg.Visible = v end })
	ui:Toggle({ Name = "HUD · Clock", Flag = "ui_hud_time", Default = true, Callback = function(v) HudTimeSeg.Visible = v end })
	ui:Toggle({ Name = "HUD · Executor", Flag = "ui_hud_exec", Default = true, Callback = function(v) HudExecSeg.Visible = v end })
	ui:Toggle({ Name = "Notifications", Flag = "ui_notify", Default = true, Callback = function(v) Promixity.NotificationsEnabled = v end })

	-- config manager (workspace/2ww + 2ww/config)
	local FOLDER = "2ww"
	local CONFIGS = "2ww/config"
	local function fsReady()
		return type(writefile) == "function" and type(readfile) == "function" and type(isfolder) == "function" and type(makefolder) == "function"
	end
	local function ensureFolders()
		if not fsReady() then return false end
		local ok = pcall(function()
			if not isfolder(FOLDER) then makefolder(FOLDER) end
			if not isfolder(CONFIGS) then makefolder(CONFIGS) end
		end)
		return ok
	end
	-- create workspace folders right away so they appear in executor file manager
	pcall(ensureFolders)
	local function listConfigs()
		local out = {}
		if fsReady() and type(listfiles) == "function" then
			pcall(function()
				ensureFolders()
				for _, path in ipairs(listfiles(CONFIGS)) do
					local name = path:match("([^/\\]+)%.json$")
					if name then table.insert(out, name) end
				end
			end)
		end
		table.sort(out)
		return out
	end
	local function encode(val)
		local t = typeof(val)
		if t == "Color3" then return { __color = { val.R, val.G, val.B } } end
		if t == "EnumItem" then return { __key = val.Name } end
		return val
	end
	local function decode(val)
		if type(val) == "table" then
			if val.__color then return Color3.new(val.__color[1], val.__color[2], val.__color[3]) end
			if val.__key then return val.__key end
		end
		return val
	end

	local cfgSection = ConfigTab:Section("Configs")
	local cfgList = cfgSection:Dropdown({ Name = "Saved Configs", Options = listConfigs() })
	local cfgName = cfgSection:TextBox({ Name = "Config Name", Placeholder = "my_config" })

	local function currentName()
		local n = (cfgName:Get() or ""):gsub("[^%w_%-]", "")
		if n == "" then n = cfgList:Get() or "" end
		return n
	end

	cfgSection:Button({
		Name = "Save Config", Accent = true,
		Callback = function()
			if not fsReady() then return Promixity:Notify("Config", "Your executor doesn't support file saving.", 4) end
			local name = currentName()
			if name == "" then return Promixity:Notify("Config", "Enter a config name first.", 3) end
			local data = {}
			for flag, val in pairs(Promixity.Flags) do data[flag] = encode(val) end
			local ok, err = pcall(function()
				ensureFolders()
				writefile(CONFIGS .. "/" .. name .. ".json", HttpService:JSONEncode(data))
			end)
			if ok then
				cfgList:SetOptions(listConfigs())
				cfgList:Set(name, true)
				Promixity:Notify("Config saved", name, 3)
			else
				Promixity:Notify("Config", "Failed to save: " .. tostring(err), 5)
			end
		end,
	})
	cfgSection:Button({
		Name = "Load Config",
		Callback = function()
			if not fsReady() then return Promixity:Notify("Config", "Your executor doesn't support file loading.", 4) end
			local name = cfgList:Get()
			if not name or name == "" then name = currentName() end
			if name == "" then return Promixity:Notify("Config", "Select a config first.", 3) end
			local ok, data = pcall(function()
				return HttpService:JSONDecode(readfile(CONFIGS .. "/" .. name .. ".json"))
			end)
			if not ok or type(data) ~= "table" then return Promixity:Notify("Config", "Could not read '" .. name .. "'.", 4) end
			for flag, val in pairs(data) do
				local setter = Setters[flag]
				if setter then pcall(setter, decode(val)) end
			end
			Promixity:Notify("Config loaded", name, 3)
		end,
	})
	cfgSection:Button({
		Name = "Delete Config",
		Callback = function()
			if not fsReady() or type(delfile) ~= "function" then return Promixity:Notify("Config", "Deleting isn't supported by your executor.", 4) end
			local name = cfgList:Get()
			if not name or name == "" then return Promixity:Notify("Config", "Select a config first.", 3) end
			local ok = pcall(function() delfile(CONFIGS .. "/" .. name .. ".json") end)
			cfgList:SetOptions(listConfigs())
			Promixity:Notify(ok and "Config deleted" or "Config", ok and name or "Failed to delete.", 3)
		end,
	})
	cfgSection:Button({
		Name = "Refresh List",
		Callback = function()
			if not fsReady() then return Promixity:Notify("Config", "Your executor doesn't support files.", 4) end
			ensureFolders()
			cfgList:SetOptions(listConfigs())
			Promixity:Notify("Config", "List refreshed.", 2)
		end,
	})
end

-- ───────────────────────────── Page: Info ─────────────────────────────
do
	local profile = InfoTab:Section("Profile")
	local card = profile:Custom(76)
	local avatar = New("ImageLabel", {
		Position = UDim2.fromOffset(12, 10), Size = UDim2.fromOffset(56, 56), BackgroundColor3 = Theme.Off,
		BorderSizePixel = 0, Image = "", Parent = card,
	}, { Corner(12) })
	task.spawn(function()
		local ok, img = pcall(function()
			return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		end)
		if ok and avatar.Parent then avatar.Image = img end
	end)
	Text({ Position = UDim2.fromOffset(80, 12), Size = UDim2.new(1, -92, 0, 20), Text = LocalPlayer.DisplayName, Font = Enum.Font.GothamBold, TextSize = 16, TextTruncate = Enum.TextTruncate.AtEnd, Parent = card })
	Text({ Position = UDim2.fromOffset(80, 33), Size = UDim2.new(1, -92, 0, 14), Text = "@" .. LocalPlayer.Name, TextColor3 = Theme.SubText, TextSize = 12, Parent = card })
	Text({ Position = UDim2.fromOffset(80, 50), Size = UDim2.new(1, -92, 0, 14), Text = "ID " .. LocalPlayer.UserId .. "  ·  " .. LocalPlayer.AccountAge .. " days old", TextColor3 = Theme.Muted, TextSize = 11, Parent = card })

	local session = InfoTab:Section("Session")
	local gameRow = session:Info("Game", "Loading...")
	session:Info("Place ID", game.PlaceId)
	local playersRow = session:Info("Players", "")
	local uptimeRow = session:Info("Uptime", "00:00:00")
	session:Info("Platform", isMobile and "Mobile" or (isTouch and "Touch / PC" or "PC"))
	session:Info("Executor", ExecutorName)
	session:Info("UI Version", Promixity.Version)

	task.spawn(function()
		local ok, info = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
		gameRow:Set(ok and info and info.Name or "Unknown")
	end)
	local function updPlayers()
		playersRow:Set(#Players:GetPlayers() .. " / " .. Players.MaxPlayers)
	end
	updPlayers()
	connect(Players.PlayerAdded, updPlayers)
	connect(Players.PlayerRemoving, function() task.defer(updPlayers) end)

	local startTime, lastTick = os.clock(), 0
	connect(RunService.Heartbeat, function()
		local now = os.clock()
		if now - lastTick >= 1 then
			lastTick = now
			local t = math.floor(now - startTime)
			uptimeRow:Set(string.format("%02d:%02d:%02d", math.floor(t / 3600), math.floor(t % 3600 / 60), t % 60))
		end
	end)

	local function copy(text, what)
		local fn = setclipboard or toclipboard
		if fn then
			fn(text)
			Promixity:Notify("Copied", what, 2.5)
		else
			Promixity:Notify("Clipboard", "Your executor doesn't support clipboard access.", 3.5)
		end
	end
	local actions = InfoTab:Section("Actions")
	actions:Button({ Name = "Copy Job ID", Callback = function() copy(game.JobId, "Job ID copied") end })
	actions:Button({ Name = "Copy Place ID", Callback = function() copy(tostring(game.PlaceId), "Place ID copied") end })
	actions:Button({ Name = "Unload 2ww", Accent = true, Callback = function() Promixity:Unload() end })
end

-- ───────────────────────────── Mobile toggle button ─────────────────────────────
ToggleButton = New("TextButton", {
	Name = "MobileToggle",
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromOffset(46, 130),
	Size = UDim2.fromOffset(52, 52),
	BackgroundColor3 = Theme.Accent,
	Text = "",
	AutoButtonColor = false,
	BorderSizePixel = 0,
	Visible = isMobile,
	ZIndex = 5,
	Parent = gui,
}, { Pill(), Stroke(Color3.fromRGB(255, 255, 255), 2) })
ToggleButton:FindFirstChildOfClass("UIStroke").Transparency = 0.8
local ToggleButtonScale = New("UIScale", { Parent = ToggleButton })
ToggleIcon = New("ImageLabel", {
	AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(30, 30),
	BackgroundTransparency = 1, Image = PAW_ASSET, ScaleType = Enum.ScaleType.Fit, ZIndex = 6, Parent = ToggleButton,
})
local ToggleDrag = MakeDraggable(ToggleButton, ToggleButton, "inside")
ToggleButton.MouseButton1Down:Connect(function() Tween(ToggleButtonScale, 0.1, { Scale = 0.88 }) end)
ToggleButton.InputEnded:Connect(function(input)
	if isPress(input) then Tween(ToggleButtonScale, 0.45, { Scale = 1 }, Enum.EasingStyle.Back) end
end)
ToggleButton.MouseButton1Click:Connect(function()
	if not ToggleDrag.Moved then SetOpen(not isOpen) end
end)

-- ───────────────────────────── Input ─────────────────────────────
connect(UserInputService.InputBegan, function(input, gpe)
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if gpe or Listening or os.clock() - LastBind < 0.25 then return end
	if input.KeyCode == Promixity.ToggleKey then
		SetOpen(not isOpen)
	end
end)

-- ───────────────────────────── Unload ─────────────────────────────
function Promixity:Unload(silent)
	if self.Unloaded then return end
	self.Unloaded = true
	Tween(Window, 0.25, { GroupTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	Tween(WindowScale, 0.25, { Scale = WindowScale.Scale * 0.9 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	Tween(HUD, 0.25, { GroupTransparency = 1 })
	pcall(function() if ESP and ESP.Destroy then ESP.Destroy() elseif ESP and ESP.Stop then ESP.Stop() end end)
	pcall(function() if AutoPickGun and AutoPickGun.Stop then AutoPickGun.Stop() end end)
	pcall(function()
		if Functions and Functions.GetFOVCircle then
			local c = Functions.GetFOVCircle()
			if c then c.Visible = false end
		end
	end)
	for _, c in ipairs(Connections) do
		pcall(function() c:Disconnect() end)
	end
	table.clear(Connections)
	if shared["2ww"] == self then shared["2ww"] = nil end
	if silent then
		gui:Destroy()
	else
		task.delay(0.35, function() gui:Destroy() end)
	end
end

-- ───────────────────────────── Start ─────────────────────────────
shared["2ww"] = Promixity
shared.Promixity = Promixity -- backward compat

SelectTab(MainTab)
SetOpen(true)

HUD.Position = UDim2.new(0.5, 0, 0, 14)
Tween(HUD, 0.6, { Position = UDim2.new(0.5, 0, 0, 34), GroupTransparency = 0 }, Enum.EasingStyle.Back)

task.delay(0.6, function()
	Promixity:Notify("2ww loaded", (isMobile and "Tap the paw button to open or close the menu." or "Press RightShift to open or close the menu.") .. "  [" .. tostring(ExecutorName) .. "]", 5)
end)

return Promixity
