-- Dragon Blox Ultimate Script (Full Version)

repeat wait() until game:IsLoaded()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Remotes
local remotes = ReplicatedStorage:WaitForChild("Remotes")
local attackRemote = remotes:WaitForChild("AttackRemote")
local rebirthRemote = remotes:WaitForChild("RebirthRemote")
local transformRemote = remotes:WaitForChild("TransformRemote")
local teleportRemote = remotes:WaitForChild("TeleportRemote")

-- Flags
local autoFarm = false
local autoRebirth = false
local autoTransform = false
local autoTeleport = false
