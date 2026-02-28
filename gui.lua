--// Kenyah Hub - Dark & Red Edition

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.Name = "KenyahHub"
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 540, 0, 370)
Main.Position = UDim2.new(0.5, -270, 0.5, -185)
Main.BackgroundColor3 = Color3.fromRGB(15,15,18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)

-- Red Glow
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(170,0,0)
Stroke.Thickness = 2
Stroke.Transparency = 0.3

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,55)
Title.BackgroundTransparency = 1
Title.Text = "Kenyah Hub"
Title.TextColor3 = Color3.fromRGB(255,60,60)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Tabs Holder
local Tabs = Instance.new("Frame")
Tabs.Parent = Main
Tabs.Size = UDim2.new(0,160,1,-60)
Tabs.Position = UDim2.new(0,10,0,60)
Tabs.BackgroundColor3 = Color3.fromRGB(20,20,24)
Tabs.BorderSizePixel = 0

Instance.new("UICorner", Tabs).CornerRadius = UDim.new(0,14)

local TabLayout = Instance.new("UIListLayout", Tabs)
TabLayout.Padding = UDim.new(0,8)

-- Content Holder
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Size = UDim2.new(1,-190,1,-70)
Content.Position = UDim2.new(0,180,0,65)
Content.BackgroundTransparency = 1

-- Create Tab Function
local function CreateTab(name)
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = Tabs
    TabButton.Size = UDim2.new(1,-10,0,42)
    TabButton.BackgroundColor3 = Color3.fromRGB(30,30,35)
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(220,220,220)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.BorderSizePixel = 0

    Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0,12)

    local Page = Instance.new("Frame")
    Page.Parent = Content
    Page.Size = UDim2.new(1,0,1,0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0,10)

    TabButton.MouseEnter:Connect(function()
        TweenService:Create(TabButton, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(45,0,0)
        }):Play()
    end)

    TabButton.MouseLeave:Connect(function()
        if not Page.Visible then
            TweenService:Create(TabButton, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(30,30,35)
            }):Play()
        end
    end)

    TabButton.MouseButton1Click:Connect(function()
        for _,v in pairs(Content:GetChildren()) do
            if v:IsA("Frame") then
                v.Visible = false
            end
        end

        for _,v in pairs(Tabs:GetChildren()) do
            if v:IsA("TextButton") then
                TweenService:Create(v, TweenInfo.new(0.15), {
                    BackgroundColor3 = Color3.fromRGB(30,30,35)
                }):Play()
            end
        end

        Page.Visible = true
        TweenService:Create(TabButton, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(120,0,0)
        }):Play()
    end)

    return Page
end

-- Create Button Function
local function CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.Size = UDim2.new(1,-10,0,40)
    Button.BackgroundColor3 = Color3.fromRGB(35,35,40)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.BorderSizePixel = 0

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0,12)

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(90,0,0)
        }):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(35,35,40)
        }):Play()
    end)

    Button.MouseButton1Click:Connect(callback)
end

-- Tabs
local MainTab = CreateTab("Main")
local CombatTab = CreateTab("Combat")
local SettingsTab = CreateTab("Settings")

-- Default Tab
MainTab.Visible = true

-- Buttons Example
CreateButton(MainTab, "Example Button 1", function()
    print("Clicked 1")
end)

CreateButton(MainTab, "Example Button 2", function()
    print("Clicked 2")
end)

CreateButton(CombatTab, "Auto Attack", function()
    print("Auto Attack Enabled")
end)

CreateButton(SettingsTab, "Close UI", function()
    Main.Visible = false
end)
