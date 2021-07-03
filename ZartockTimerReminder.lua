local timers = {"01:00",
                "03:00",
                "05:00",
                "07:00",
                "09:00",
                "11:00",
                "13:00",
                "15:00",
                "17:00",
                "19:00",
                "21:00",
                "16:47",
                "23:00"}

function table_has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function check_time()
    local hours, minutes = GetGameTime()

    if table_has_value(timers, tostring(hours+1) .. ":00" ) and (minutes == 45 or minutes == 50 or minutes == 55) then
        SendChatMessage("Maw tormenters event in " .. 60-minutes .. " minutes", "GUILD", nil)
    end
end

check_time()
local myTicker = C_Timer.NewTicker(60, check_time)


