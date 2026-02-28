--// Kenyah Hub Ultra Premium

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Player = game.Players.LocalPlayer

-- THEME
local Accent = Color3.fromRGB(150,0,0)
local Dark = Color3.fromRGB(16,16,20)
local SidebarColor = Color3.fromRGB(20,20,25)
local ElementColor = Color3.fromRGB(30,30,35)

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui", Player.PlayerGui)
ScreenGui.Name = "KenyahHub"
ScreenGui.ResetOnSpawn = false

-- Blur
local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = Lighting

-- Shadow
local Shadow = Instance.new("ImageLabel", ScreenGui)
Shadow.Size = UDim2.new(0, 700, 0, 450)
Shadow.Position = UDim2.new(0.5,-350,0.5,-225)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10,10,118,118)

-- Main Frame
local Main = Instance.new("Frame", Shadow)
Main.Size = UDim2.new(1,-40,1,-40)
Main.Position = UDim2.new(0,20,0,20)
Main.BackgroundColor3 = Dark
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,20)

Main.Size = UDim2.new(0,0,0,0)

-- Open Animation
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
	Size = UDim2.new(1,-40,1,-40)
}):Play()

TweenService:Create(Blur, TweenInfo.new(0.4), {Size = 15}):Play()

-- Sidebar
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0,200,1,0)
Sidebar.BackgroundColor3 = SidebarColor
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0,20)

-- Title
local Title = Instance.new("TextLabel", Sidebar)
Title.Size = UDim2.new(1,0,0,70)
Title.BackgroundTransparency = 1
Title.Text = "Kenyah Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Accent

-- Indicator
local Indicator = Instance.new("Frame", Sidebar)
Indicator.Size = UDim2.new(0,4,0,40)
Indicator.Position = UDim2.new(1,-4,0,90)
Indicator.BackgroundColor3 = Accent
Indicator.BorderSizePixel = 0
Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1,0)

-- Tab Holder
local TabHolder = Instance.new("Frame", Sidebar)
TabHolder.Position = UDim2.new(0,0,0,80)
TabHolder.Size = UDim2.new(1,0,1,-80)
TabHolder.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", TabHolder)
Layout.Padding = UDim.new(0,10)

-- Content
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,220,0,20)
Content.Size = UDim2.new(1,-240,1,-40)
Content.BackgroundTransparency = 1

-- TAB SYSTEM
local function CreateTab(name)
	local Button = Instance.new("TextButton", TabHolder)
	Button.Size = UDim2.new(1,-20,0,40)
	Button.Position = UDim2.new(0,10,0,0)
	Button.BackgroundColor3 = ElementColor
	Button.Text = name
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.TextColor3 = Color3.fromRGB(220,220,220)
	Button.BorderSizePixel = 0
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,12)

	local Page = Instance.new("Frame", Content)
	Page.Size = UDim2.new(1,0,1,0)
	Page.Visible = false
	Page.BackgroundTransparency = 1

	local PageLayout = Instance.new("UIListLayout", Page)
	PageLayout.Padding = UDim.new(0,12)

	Button.MouseButton1Click:Connect(function()
		for _,v in pairs(Content:GetChildren()) do
			if v:IsA("Frame") then v.Visible = false end
		end

		Page.Visible = true

		TweenService:Create(Indicator, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
			Position = UDim2.new(1,-4,0,Button.Position.Y.Offset + 80)
		}):Play()
	end)

	return Page
end

-- BUTTON
local function CreateButton(parent,text,callback)
	local Button = Instance.new("TextButton", parent)
	Button.Size = UDim2.new(1,0,0,45)
	Button.BackgroundColor3 = ElementColor
	Button.Text = text
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.TextColor3 = Color3.fromRGB(255,255,255)
	Button.BorderSizePixel = 0
	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,14)

	Button.MouseEnter:Connect(function()
		TweenService:Create(Button,TweenInfo.new(0.15),{BackgroundColor3 = Accent}):Play()
	end)

	Button.MouseLeave:Connect(function()
		TweenService:Create(Button,TweenInfo.new(0.15),{BackgroundColor3 = ElementColor}):Play()
	end)

	Button.MouseButton1Click:Connect(callback)
end

-- TOGGLE
local function CreateToggle(parent,text)
	local Frame = Instance.new("Frame", parent)
	Frame.Size = UDim2.new(1,0,0,45)
	Frame.BackgroundColor3 = ElementColor
	Frame.BorderSizePixel = 0
	Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,14)

	local Label = Instance.new("TextLabel", Frame)
	Label.Size = UDim2.new(0.7,0,1,0)
	Label.BackgroundTransparency = 1
	Label.Text = text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(255,255,255)

	local Toggle = Instance.new("Frame", Frame)
	Toggle.Size = UDim2.new(0,50,0,25)
	Toggle.Position = UDim2.new(1,-60,0.5,-12)
	Toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
	Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1,0)

	local Circle = Instance.new("Frame", Toggle)
	Circle.Size = UDim2.new(0,20,0,20)
	Circle.Position = UDim2.new(0,3,0.5,-10)
	Circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)

	local state = false

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			state = not state
			if state then
				TweenService:Create(Circle,TweenInfo.new(0.2),{Position = UDim2.new(1,-23,0.5,-10)}):Play()
				TweenService:Create(Toggle,TweenInfo.new(0.2),{BackgroundColor3 = Accent}):Play()
			else
				TweenService:Create(Circle,TweenInfo.new(0.2),{Position = UDim2.new(0,3,0.5,-10)}):Play()
				TweenService:Create(Toggle,TweenInfo.new(0.2),{BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
			end
		end
	end)
end

-- Create Tabs
local MainTab = CreateTab("Main")
local CombatTab = CreateTab("Combat")
local SettingsTab = CreateTab("Settings")

MainTab.Visible = true

-- Elements
CreateButton(MainTab,"Start Farming",function() print("Farm") end)
CreateToggle(MainTab,"Auto Collect")

CreateButton(CombatTab,"Auto Attack",function() print("Attack") end)
CreateToggle(CombatTab,"God Mode")

CreateButton(SettingsTab,"Close Hub",function()
	Main.Visible = false
	Blur.Size = 0
end)

-- KEYBIND
UserInputService.InputBegan:Connect(function(input,gp)
	if not gp and input.KeyCode == Enum.KeyCode.RightShift then
		Main.Visible = not Main.Visible
		Blur.Size = Main.Visible and 15 or 0
	end
end)
