local async = require("async")
local tagApi = require("simplight.api.channels")

setInterval(function()
  async(function()
    local tags = await(tagApi.readMany({ "plc.Температура", "plc.Уставка"}))
    local plc_temp = tags[1].value
    local plc_sp = tags[2].value

if plc_temp > plc_sp then
    await(tagApi.writeMany({values = {{ name="plc.Насос", value=true }}
    }))
    print("успешно")
elseif plc_temp < plc_sp then
    await(tagApi.writeMany({values = {{ name="plc.Насос", value=false }}
    }))
    print("успешно")
  end
  end)
end, 1000)