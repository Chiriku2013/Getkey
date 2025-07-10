--// Dịch vụ
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

StarterGui:SetCore("SendNotification", {
    Title = "Get Key",
    Text = "Get key để sử dụng",
    Duration = 6
})

--// UI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystem"
gui.ResetOnSpawn = false

-- Nền chính
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 200)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

-- Title
local title = Instance.new("TextLabel", main)
title.Text = "KEY SYSTEM"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.Position = UDim2.new(0.5, 0, 0, 5)
title.AnchorPoint = Vector2.new(0.5, 0)

-- Image trái
local leftImage = Instance.new("ImageLabel", main)
leftImage.Size = UDim2.new(0, 50, 0, 50)
leftImage.Position = UDim2.new(0, 5, 0, 5)
leftImage.Image = "rbxassetid://119198835819797"
leftImage.BackgroundTransparency = 1

-- Image phải
local rightImage = Instance.new("ImageLabel", main)
rightImage.Size = UDim2.new(0, 50, 0, 50)
rightImage.Position = UDim2.new(1, -55, 0, 5)
rightImage.Image = "rbxassetid://119198835819797"
rightImage.BackgroundTransparency = 1

-- Info
local info = Instance.new("TextLabel", main)
info.Text = "Get your key at:\nhttps://pastebin.com/6dTbNVck"
info.Size = UDim2.new(1, -20, 0, 40)
info.Position = UDim2.new(0, 10, 0, 40)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.Font = Enum.Font.SourceSans
info.TextSize = 16
info.TextWrapped = true

-- Nhập key
local keyBox = Instance.new("TextBox", main)
keyBox.PlaceholderText = "Enter your key here"
keyBox.Size = UDim2.new(1, -20, 0, 30)
keyBox.Position = UDim2.new(0, 10, 0, 80)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 16
keyBox.Font = Enum.Font.SourceSans
Instance.new("UICorner", keyBox)

-- Label dưới
local keyLabel = Instance.new("TextLabel", main)
keyLabel.Text = ""
keyLabel.Size = UDim2.new(1, -20, 0, 20)
keyLabel.Position = UDim2.new(0, 10, 0, 110)
keyLabel.BackgroundTransparency = 1
keyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
keyLabel.TextSize = 14
keyLabel.Font = Enum.Font.SourceSans
keyLabel.Visible = false

-- Nút Get Key
local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Text = "Get Key"
getKeyBtn.Size = UDim2.new(0, 120, 0, 35)
getKeyBtn.Position = UDim2.new(0.5, -125, 0, 145)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Font = Enum.Font.SourceSansBold
getKeyBtn.TextSize = 16
Instance.new("UICorner", getKeyBtn)

-- Nút Check Key
local checkBtn = Instance.new("TextButton", main)
checkBtn.Text = "Check Key"
checkBtn.Size = UDim2.new(0, 120, 0, 35)
checkBtn.Position = UDim2.new(0.5, 5, 0, 145)
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.Font = Enum.Font.SourceSansBold
checkBtn.TextSize = 16
Instance.new("UICorner", checkBtn)

-- Hover effect
for _, btn in pairs({getKeyBtn, checkBtn}) do
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
	end)
end

-- Key logic
local correctKey = "ChirikuNigga"
local debounce = false

checkBtn.MouseButton1Click:Connect(function()
	if debounce then return end
	debounce = true

	if keyBox.Text == correctKey then
		StarterGui:SetCore("SendNotification", {
			Title = "Key đúng",
			Text = "Cảm ơn vì đã get key!",
			Duration = 5
		})
		_G.KeyCorrect = true
		gui:Destroy()
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Key sai",
			Text = "Vui lòng kiểm tra lại!",
			Duration = 5
		})

		local orig = main.Position
		local shake1 = TweenService:Create(main, TweenInfo.new(0.05), {Position = orig + UDim2.new(0, -10, 0, 0)})
		local shake2 = TweenService:Create(main, TweenInfo.new(0.05), {Position = orig + UDim2.new(0, 10, 0, 0)})
		local reset = TweenService:Create(main, TweenInfo.new(0.05), {Position = orig})
		shake1:Play()
		shake1.Completed:Wait()
		shake2:Play()
		shake2.Completed:Wait()
		reset:Play()
	end

	debounce = false
end)

getKeyBtn.MouseButton1Click:Connect(function()
	keyLabel.Text = "Link đã copy!"
	keyLabel.Visible = true
	setclipboard("https://pastebin.com/6dTbNVck")
end)
