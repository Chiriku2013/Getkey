--// UI Get Key (Trung tâm màn hình)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- Notify khi vào game
StarterGui:SetCore("SendNotification", {
    Title = "Vui lòng get key để sử dụng",
    Text = "Không get key thì không dùng được đâu",
    Duration = 6
})

-- Tạo UI
local keySystem = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
keySystem.Name = "KeySystem"
keySystem.ResetOnSpawn = false

local main = Instance.new("Frame", keySystem)
main.Size = UDim2.new(0.3, 0, 0.35, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

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

-- Get Key Button
local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Text = "Get Key"
getKeyBtn.Size = UDim2.new(0.45, -10, 0, 30)
getKeyBtn.Position = UDim2.new(0, 10, 0, 120)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.TextSize = 16
getKeyBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", getKeyBtn)

-- Check Key Button
local checkBtn = Instance.new("TextButton", main)
checkBtn.Text = "Check Key"
checkBtn.Size = UDim2.new(0.45, -10, 0, 30)
checkBtn.Position = UDim2.new(0.55, 0, 0, 120)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.TextSize = 16
checkBtn.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", checkBtn)

-- Label hiện sau khi bấm Get Key
local keyLabel = Instance.new("TextLabel", main)
keyLabel.Text = ""
keyLabel.Size = UDim2.new(1, -20, 0, 20)
keyLabel.Position = UDim2.new(0, 10, 0, 160)
keyLabel.BackgroundTransparency = 1
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.TextSize = 14
keyLabel.Font = Enum.Font.SourceSans
keyLabel.Visible = false

-- Key đúng
local correctKey = "ChirikuNigga"

-- Check Key
checkBtn.MouseButton1Click:Connect(function()
	local userKey = keyBox.Text
	if userKey == correctKey then
		StarterGui:SetCore("SendNotification", {
			Title = "Key đúng",
			Text = "Cảm ơn vì đã get key :3",
			Duration = 5
		})
		main:Destroy()
		loadstring("print('Chạy script chính tại đây')")()
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Key sai",
			Text = "Hãy get key lại",
			Duration = 5
		})
	end
end)

-- Get Key (copy link)
getKeyBtn.MouseButton1Click:Connect(function()
	keyLabel.Text = "Link đã được copy!"
	keyLabel.Visible = true
	setclipboard("https://pastebin.com/6dTbNVck")
end)
