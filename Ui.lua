-- ============================================
-- ROBLOX LUA UI HUB BASE
-- Clean, Mobile-Friendly for Delta Executor
-- ============================================

-- Get the player's screen
local Players = game:GetService("Players")
local UserInputService = game: GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============================================
-- CREATE THE MAIN SCREENGUI
-- ============================================
-- ScreenGui is the container that holds everything on the player's screen

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HubGui"
screenGui.ResetOnSpawn = false  -- Keeps the UI even when you respawn
screenGui.Parent = playerGui

-- ============================================
-- CREATE THE MAIN FRAME (HUB BASE)
-- ============================================
-- Frame is like a big box that holds buttons and other UI elements

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 50)  -- Dark gray
mainFrame.BorderSizePixel = 0  -- No border
mainFrame.Size = UDim2.new(0, 300, 0, 400)  -- Width: 300px, Height: 400px
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)  -- Centered on screen
mainFrame.Parent = screenGui

-- Add a title label to the frame
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Text = "SCRIPT HUB"
titleLabel. TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 40)  -- Darker gray header
titleLabel.BorderSizePixel = 0
titleLabel.Size = UDim2.new(1, 0, 0, 50)  -- Full width, 50px height
titleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Top-left corner
titleLabel.Parent = mainFrame

-- ============================================
-- BUTTON TEMPLATE FUNCTION
-- ============================================
-- This function creates buttons so we don't repeat code

local function createButton(parent, buttonName, buttonText, positionY, onClickFunction)
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Text = buttonText
    button.TextSize = 16
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    button.BackgroundColor3 = Color3.fromRGB(70, 150, 255)  -- Blue button
    button.BorderSizePixel = 0
    button. Size = UDim2.new(0, 260, 0, 50)  -- Width: 260px, Height: 50px
    button.Position = UDim2.new(0, 20, 0, positionY)  -- 20px padding from left
    button.Parent = parent
    
    -- Add mouse hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 180, 255)  -- Lighter blue on hover
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 150, 255)  -- Back to normal blue
    end)
    
    -- Button click event
    button.MouseButton1Click:Connect(function()
        onClickFunction()
    end)
    
    return button
end

-- ============================================
-- CREATE THE 3 BUTTONS
-- ============================================

-- Button 1: Print to Console
createButton(mainFrame, "Button1", "PRINT MESSAGE", 70, function()
    print("Button 1 Clicked!  This is placeholder action #1")
end)

-- Button 2: Toggle a Value
createButton(mainFrame, "Button2", "TOGGLE STATE", 130, function()
    print("Button 2 Clicked!  This is placeholder action #2")
end)

-- Button 3: Execute Action
createButton(mainFrame, "Button3", "EXECUTE", 190, function()
    print("Button 3 Clicked! This is placeholder action #3")
end)

-- ============================================
-- CLOSE BUTTON (Optional)
-- ============================================
-- Simple button to hide/show the UI with a keyboard shortcut

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)  -- Red button
closeButton.BorderSizePixel = 0
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -45, 0, 5)  -- Top-right corner
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- ============================================
-- KEYBOARD SHORTCUT
-- ============================================
-- Press "P" to toggle the UI visibility

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum. KeyCode.P then
        mainFrame.Visible = not mainFrame.Visible
        print("UI Toggled!  Press P again to show/hide")
    end
end)

-- ============================================
-- STARTUP MESSAGE
-- ============================================
print("✓ Script Hub UI Loaded!")
print("✓ Press 'P' to hide/show the UI")
print("✓ Click buttons to test actions")
