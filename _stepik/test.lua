local async = require("async")
local tagApi = require("simplight.api.channels")
local time = require('time')
local funcs = require("funcs")

local EventType = funcs.eventType
local tempAlTime = nil
local lastState = nil

setInterval(function()
    async(function()
        local tempAvg = (await(tagApi.readMany({"Тсред"})))[1].value

        if tempAvg > 10 then
            if not tempAlTime then
                tempAlTime = time.now() + 5 * 1000
            elseif time.now() > tempAlTime then
                await(tagApi.writeMany({
                    values = {{name = "Тсред.Авария", value = true, quality = 0xC0}}
                }))
                
                if lastState ~= "alarm" then
                    funcs.logEvents({
                        type = EventType.alarm,
                        text = "Превышение порогового значения средней температуры"
                    })
                    lastState = "alarm"
                end
                tempAlTime = nil
            end
        else
            local wasAlarm = (lastState == "alarm")
            tempAlTime = nil

            await(tagApi.writeMany({
                values = {{name = "Тсред.Авария", value = false, quality = 0xC0}}
            }))
            if wasAlarm then
                funcs.logEvents({
                    type = EventType.info,
                    text = "Средняя температура в норме"
                })
                lastState = "normal"
            end
        end
    end)
end, 1000)