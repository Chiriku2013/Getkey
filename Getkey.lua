--// UI Get Key (v2)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local keySystem = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
keySystem.Name = "KeySystem"
keySystem.ResetOnSpawn = false

-- Main Frame
local main = Instance.new("Frame", keySystem)
main.Size = UDim2.new(0, 300, 0, 190)
main.Position = UDim2.new(0.5, -150, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.AnchorPoint = Vector2.new(0.5, 0.5)

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel", main)
title.Text = "KEY SYSTEM"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24

-- Info
local info = Instance.new("TextLabel", main)
info.Text = "Get your key at:\nhttps://pastebin.com/6dTbNVck"
info.Size = UDim2.new(1, -20, 0, 40)
info.Position = UDim2.new(0, 10, 0, 30)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.Font = Enum.Font.SourceSans
info.TextSize = 16
info.TextWrapped = true

-- TextBox
local keyBox = Instance.new("TextBox", main)
keyBox.PlaceholderText = "Enter your key here"
keyBox.Size = UDim2.new(1, -20, 0, 30)
keyBox.Position = UDim2.new(0, 10, 0, 80)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 16
keyBox.Font = Enum.Font.SourceSans
Instance.new("UICorner", keyBox)

-- Get Key Button (trái)
local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Text = "Get Key"
getKeyBtn.Size = UDim2.new(0.45, -15, 0, 30)
getKeyBtn.Position = UDim2.new(0, 10, 0, 120)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.TextSize = 16
getKeyBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", getKeyBtn)

-- Check Key Button (phải)
local checkBtn = Instance.new("TextButton", main)
checkBtn.Text = "Check Key"
checkBtn.Size = UDim2.new(0.45, -15, 0, 30)
checkBtn.Position = UDim2.new(0.55, 5, 0, 120)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.TextSize = 16
checkBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", checkBtn)

-- TextLabel hiển thị khi bấm nút Get Key
local keyLabel = Instance.new("TextLabel", main)
keyLabel.Text = ""
keyLabel.Size = UDim2.new(1, -20, 0, 20)
keyLabel.Position = UDim2.new(0, 10, 0, 160)
keyLabel.BackgroundTransparency = 1
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.TextSize = 14
keyLabel.Font = Enum.Font.SourceSans
keyLabel.Visible = false

-- Key đúng (bạn thay bằng key thật)
local correctKey = "ChirikuNigga"

-- Sự kiện bấm Check Key
checkBtn.MouseButton1Click:Connect(function()
	local userKey = keyBox.Text
	if userKey == correctKey then
		main:Destroy()
		-- Chạy script chính tại đây
		loadstring("print('Key đúng, chạy script chính')")()
	else
		checkBtn.Text = "Wrong Key!"
		wait(1)
		checkBtn.Text = "Check Key"
	end
end)

-- Sự kiện bấm Get Key
getKeyBtn.MouseButton1Click:Connect(function()
	keyLabel.Text = "Key link copied or opened!"
	keyLabel.Visible = true
	-- Mở link hoặc hướng dẫn copy
	setclipboard("https://pastebin.com/6dTbNVck") -- Đổi link key ở đây
end)
