-- UI Get Key | By Chiriku
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

game.StarterGui:SetCore("SendNotification", {
    Title = "Get Key",
    Text = "Get key để sử dụng",
    Duration = 6
})

local key = "ChirikuNigga"
local link = "https://pastebin.com/6dTbNVck"

-- UI
local ui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ui.ResetOnSpawn = false

local main = Instance.new("Frame", ui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.48, 0)
main.Size = UDim2.new(0.3, 0, 0.42, 0)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BorderSizePixel = 0
main.BackgroundTransparency = 0.3

local title = Instance.new("TextLabel", main)
title.Text = "Get Key | By Chiriku"
title.Size = UDim2.new(1, 0, 0.2, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local getBtn = Instance.new("TextButton", main)
getBtn.Size = UDim2.new(0.45, 0, 0.2, 0)
getBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
getBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
getBtn.TextColor3 = Color3.new(1, 1, 1)
getBtn.Text = "Get Key"
getBtn.Font = Enum.Font.GothamBold
getBtn.TextScaled = true

local checkBtn = Instance.new("TextButton", main)
checkBtn.Size = UDim2.new(0.45, 0, 0.2, 0)
checkBtn.Position = UDim2.new(0.5, 0, 0.7, 0)
checkBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
checkBtn.TextColor3 = Color3.new(1, 1, 1)
checkBtn.Text = "Check Key"
checkBtn.Font = Enum.Font.GothamBold
checkBtn.TextScaled = true

local label = Instance.new("TextLabel", main)
label.Size = UDim2.new(1, 0, 0.15, 0)
label.Position = UDim2.new(0, 0, 0.9, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1, 1, 0)
label.TextScaled = true
label.Font = Enum.Font.Gotham
label.Text = ""
label.Visible = false

-- Functions
getBtn.MouseButton1Click:Connect(function()
    setclipboard(link)
    label.Text = "Link đã được copy!"
    label.Visible = true
end)

checkBtn.MouseButton1Click:Connect(function()
    local input = tostring(game:GetService("UserInputService"):GetStringForKeyCode(Enum.KeyCode.Unknown)) -- dummy input

    game.StarterGui:SetCore("SendNotification", {
        Title = "Nhập Key",
        Text = "Vui lòng nhập key vào textbox (hoặc trong source bạn gắn sẵn)",
        Duration = 4
    })

    local inputKey = key -- Giả lập key (bạn có thể đổi bằng textbox thực nếu muốn)

    if inputKey == key then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key đúng",
            Text = "Cảm ơn vì đã get key :3",
            Duration = 5
        })
        main:Destroy()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key sai",
            Text = "Hãy get key lại",
            Duration = 5
        })

        local originalPos = UDim2.new(0.5, 0, 0.48, 0)
        main.Position = originalPos

        local shake = TweenInfo.new(0.1, Enum.EasingStyle.Linear)

        TweenService:Create(main, shake, {Position = originalPos + UDim2.new(0, -10, 0, 0)}):Play()
        task.wait(0.05)
        TweenService:Create(main, shake, {Position = originalPos + UDim2.new(0, 10, 0, 0)}):Play()
        task.wait(0.05)
        TweenService:Create(main, shake, {Position = originalPos}):Play()
    end
end)
