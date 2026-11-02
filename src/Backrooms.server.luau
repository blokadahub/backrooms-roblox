-- BACKROOMS: VERSÃO 0.1
-- Script de construção automática

local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local antigo = Workspace:FindFirstChild("BackroomsMap")
if antigo then
    antigo:Destroy()
end

local mapa = Instance.new("Folder")
mapa.Name = "BackroomsMap"
mapa.Parent = Workspace

local function criarPeca(nome, tamanho, posicao, cor, material)
    local peca = Instance.new("Part")
    peca.Name = nome
    peca.Size = tamanho
    peca.Position = posicao
    peca.Color = cor
    peca.Material = material
    peca.Anchored = true
    peca.Parent = mapa
    return peca
end

local amarelo = Color3.fromRGB(194, 181, 105)
local bege = Color3.fromRGB(142, 125, 86)
local branco = Color3.fromRGB(230, 225, 195)

-- Piso
criarPeca(
    "Carpete",
    Vector3.new(80, 1, 80),
    Vector3.new(0, -0.5, 0),
    bege,
    Enum.Material.Fabric
)

-- Teto
criarPeca(
    "Teto",
    Vector3.new(80, 1, 80),
    Vector3.new(0, 15.5, 0),
    branco,
    Enum.Material.SmoothPlastic
)

-- Paredes externas
criarPeca("Parede Norte",
    Vector3.new(80, 15, 1),
    Vector3.new(0, 7.5, -40),
    amarelo,
    Enum.Material.SmoothPlastic
)

criarPeca("Parede Sul",
    Vector3.new(80, 15, 1),
    Vector3.new(0, 7.5, 40),
    amarelo,
    Enum.Material.SmoothPlastic
)

criarPeca("Parede Leste",
    Vector3.new(1, 15, 80),
    Vector3.new(40, 7.5, 0),
    amarelo,
    Enum.Material.SmoothPlastic
)

criarPeca("Parede Oeste",
    Vector3.new(1, 15, 80),
    Vector3.new(-40, 7.5, 0),
    amarelo,
    Enum.Material.SmoothPlastic
)

-- Paredes internas
for i = 1, 5 do
    local x = -30 + (i * 10)

    criarPeca(
        "Divisoria_" .. i,
        Vector3.new(1, 15, 35),
        Vector3.new(x, 7.5, 10),
        amarelo,
        Enum.Material.SmoothPlastic
    )
end

-- Iluminação
Lighting.ClockTime = 0
Lighting.Brightness = 2
Lighting.Ambient = Color3.fromRGB(155, 145, 105)
Lighting.OutdoorAmbient = Color3.fromRGB(100, 95, 70)

for x = -25, 25, 25 do
    for z = -25, 25, 25 do
        local lampada = criarPeca(
            "LuzFluorescente",
            Vector3.new(8, 0.2, 2),
            Vector3.new(x, 14.9, z),
            Color3.fromRGB(255, 250, 210),
            Enum.Material.Neon
        )

        local luz = Instance.new("PointLight")
        luz.Brightness = 1.5
        luz.Range = 30
        luz.Color = Color3.fromRGB(255, 245, 200)
        luz.Parent = lampada
    end
end

-- Ponto de nascimento
local spawn = Instance.new("SpawnLocation")
spawn.Name = "BackroomsSpawn"
spawn.Size = Vector3.new(6, 1, 6)
spawn.Position = Vector3.new(0, 0.5, -30)
spawn.Anchored = true
spawn.Neutral = true
spawn.Transparency = 1
spawn.CanCollide = false
spawn.Parent = mapa

print("Backrooms v0.1 carregado!")
