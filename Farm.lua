local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("DBU Script (No Key)", "Ocean")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farming")

local autofarm = false
local autorebirth = false

Section:NewToggle("Auto Farm", "Farms nearby enemies", function(state)
    autofarm = state
end)

Section:NewToggle("Auto Rebirth", "Rebirths automatically", function(state)
    autorebirth = state
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if autofarm then
        local enemies = workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("NPCs")
        if enemies then
            for _, enemy in ipairs(enemies:GetChildren()) do
                if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                    game:GetService("ReplicatedStorage").Remotes.Damage:FireServer(enemy, math.huge)
                    break
                end
            end
        end
    end
end)

while true do
    if autorebirth then
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.Rebirth:InvokeServer()
        end)
    end
    wait(3)
end
