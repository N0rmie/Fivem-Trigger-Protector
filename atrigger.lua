print("[github.com/N0rmie] Triggers protected on resource: "..GetCurrentResourceName()) -- Please, dont remove <3

--
-- Trigger Obfuscator (Bytecode)
--

function genTrigger(str)
    return (str:gsub('.', function (c)
        return string.format('!N0rmie-%02X-', string.byte(c))
    end))
end

local mainEvents = {
    'playerEnteredScope',
    'playerLeftScope',
    'entityRemoved',
    'entityCreating',
    'entityCreated',
    'ptfxEvent',
    'clearPedTasksEvent',
    'giveWeaponEvent',
    'removeWeaponEvent',
    'ptFxEvent',
    'explosionEvent',
    'startProjectileEvent',
    'startprojectileevent',
    'onServerResourceStop',
    'onResourceListRefresh',
    'onResourceStart',
    'onServerResourceStart',
    'onResourceStarting',
    'onResourceStop',
    'playerConnecting',
    'playerDropped',
    'rconCommand',
    '__cfx_internal:commandFallback',
    'commandLoggerDiscord:commandWasExecuted',
    'playerJoining'
}

--
-- Main
--

if IsDuplicityVersion() then

    --
    -- Server-Side
    --

    local CachedTriggersSV = {}

    function secured_TriggerEvent(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        for trig in pairs(mainEvents) do
            if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                customTrigger = false
                break
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            TriggerEvent(__trigger, args)
        else
            TriggerEvent(trigger, args)
        end
    end

    function secured_TriggerClientEvent(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            TriggerClientEvent(__trigger, args)
        else
            TriggerClientEvent(trigger, args)
        end
    end

    function secured_RegisterServerEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterServerEvent(__trigger, args)
                RegisterServerEvent(trigger, function(...)
                    
                end)
                triggered = true
            end
            if triggered == false then
                RegisterServerEvent(trigger, function(...)
                    local _src = source
                    local isplayer = true
                    if type(_src) ~= 'number' then
                        isplayer = false
                    end
                    if isplayer == true then
                        if _src < 0 or GetPlayerPed(_src) < 0 then
                            isplayer = false
                        end
                    end
                    if isplayer == true then
                        print("Executor Detected! User: ".._src.." Trigger: "..trigger.." Resource : '"..GetCurrentResourceName())
                        DropPlayer(_src, "[!N0rmie Trigger Protector] Trigger execution detected!")
                        CancelEvent()
                    end
                end)
                RegisterServerEvent(__trigger, args)
            end
        else
            RegisterServerEvent(trigger, args)
        end
    end
    
    function secured_RegisterNetEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterNetEvent(__trigger, args)
                RegisterNetEvent(trigger, function(...)
                    
                end)
                triggered = true
            end
            if triggered == false then
                RegisterNetEvent(trigger, function(...)
                    local _src = source
                    local isplayer = true
                    if type(_src) ~= 'number' then
                        isplayer = false
                    end
                    if isplayer == true then
                        if _src < 0 or GetPlayerPed(_src) < 0 then
                            isplayer = false
                        end
                    end
                    if isplayer == true then
                        print("Executor Detected! User: ".._src.." Trigger: "..trigger.." Resource : '"..GetCurrentResourceName())
                        DropPlayer(_src, "[!N0rmie Trigger Protector] Trigger execution detected!")
                        CancelEvent()
                    end
                end)
                RegisterNetEvent(__trigger, args)
            end
        else
            RegisterNetEvent(trigger, args)
        end
    end

    function secured_AddEventHandler(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end
        
        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersSV[trigger] then
                __trigger = CachedTriggersSV[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersSV[trigger] = __trigger
            end
            AddEventHandler(trigger, function(...)
                local _src = source
                local isplayer = true
                if type(_src) ~= 'number' then
                    isplayer = false
                end
                if isplayer == true then
                    if _src < 0 or GetPlayerPed(_src) < 0 then
                        isplayer = false
                    end
                end
                if isplayer == true then
                    print("Executor Detected! User: ".._src.." Trigger: "..trigger.." Resource : '"..GetCurrentResourceName())
                    DropPlayer(_src, "[!N0rmie Trigger Protector] Trigger execution detected!")
                    CancelEvent()
                end
            end)
            AddEventHandler(__trigger, args)
        else
            AddEventHandler(trigger, args)
        end
    end
    
else
    
    --
    -- Client-Side
    --
    
    local CachedTriggersCL = {}

    function secured_TriggerServerEvent(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            TriggerServerEvent(__trigger, args)
        else
            TriggerServerEvent(trigger, args)
        end
    end

    function secured_TriggerEvent(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        for trig in pairs(mainEvents) do
            if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                customTrigger = false
                break
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            TriggerEvent(__trigger, args)
        else
            TriggerEvent(trigger, args)
        end
    end

    function secured_RegisterNetEvent(trigger, ...)
        local customTrigger = true
        local triggered = false
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            if not args or type(args) ~= 'function' then
                RegisterNetEvent(__trigger, args)
                triggered = true
            end
            if triggered == false then
                RegisterNetEvent(__trigger, args)
            end
        else
            RegisterNetEvent(trigger, args)
        end
    end

    function secured_AddEventHandler(trigger, ...)
        local customTrigger = true
        local args = ...
        if string.find(trigger, "txsv") and string.find(trigger, "txAdmin") and string.find(trigger, "cfx") and string.find(trigger, "cs-") then
            customTrigger = false
        end

        if customTrigger == true then
            for trig in pairs(mainEvents) do
                if(string.gsub(string.gsub(string.gsub(string.gsub(trigger:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(mainEvents[trig])) then
                    customTrigger = false
                    break
                end
            end
        end

        if customTrigger == true then
            local __trigger = trigger
            if CachedTriggersCL[trigger] then
                __trigger = CachedTriggersCL[trigger]
            end
            if __trigger == trigger then
                __trigger = genTrigger(trigger)
                CachedTriggersCL[trigger] = __trigger
            end
            AddEventHandler(__trigger, args)
        else
            AddEventHandler(trigger, args)
        end
    end
end