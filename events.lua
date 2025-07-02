local async = require("async")
local events = require("simp-events")
local tagApi = require("simplight.api.channels")
local funcs = require("funcs")

local EventType = funcs.eventType

events.on("channelWrite", function(event)
  local writes = event.writes

  if writes[1].name == "Actions.LogEvents" then
    Actions_LogEvents(writes[1].value)
  end
end)

function Actions_LogEvents(newValue)
  return
  async(function()
    print("Actions.LogEvents")

    if newValue == 0 then
      funcs.logEvents({
        type=EventType.info,
        text="Info event",
      })
    elseif newValue == 1 then
      funcs.logEvents({
        type=EventType.warning,
        text="Warning event",
      })
    elseif newValue == 2 then
      funcs.logEvents({
        type=EventType.alarm,
        text="Alarm event",
      })
    end

  end):catch(function(err)
    print("error", err)
  end)
end

