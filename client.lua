Name = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    ESX.TriggerServerCallback('NATCHKUNG:server:getdata', function(data)
        Wait(1000)
        Name = data.name
    end)
end)

RegisterNetEvent('NATCHKUNG:Getname')
AddEventHandler('NATCHKUNG:Getname', function()
    ESX.TriggerServerCallback('NATCHKUNG:server:getdata', function(data)
        Wait(1000)
        Name = data.name
    end)
end)

local status = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = GetPlayerPed(-1)
        SetPedMaxTimeUnderwater(GetPlayerPed(-1), 10.00)
		SetPedMaxHealth(playerPed, 200)		
        local playerId = PlayerId()
        local ped = GetPlayerPed(-1)
        local health = GetEntityHealth(ped)
        local armor = GetPedArmour(ped)
        local playerStamina = 100 - GetPlayerSprintStaminaRemaining(playerId)
        local playerDive = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10.0

        TriggerEvent('esx_status:getStatus', 'sleep', function(status)
            sleep = status.getPercent()
        end)

        TriggerEvent('esx_status:getStatus', 'dirty', function(status)
            dirty = status.getPercent()
        end)
        
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = (GetEntityHealth(GetPlayerPed(-1))-100),
            stamina = playerStamina,
            dive = playerDive,
            heal = health,
            armor = armor,
            hunger = hunger,
            -- thirst = thirst,
            name = Name,
            dirty = dirty,
            sleep = sleep,
            id = GetPlayerServerId(PlayerId())
        })
    end
end)

RegisterNetEvent("7K_StatusHud:updateStatus")
AddEventHandler("7K_StatusHud:updateStatus", function(status)
    hunger, thirst, dirty, sleep  = status[1].percent, status[2].percent, status[3].percent, status[4].percent
end)