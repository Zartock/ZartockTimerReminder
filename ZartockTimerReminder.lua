local timers =
{
    {"01:00", "03:00", "05:00", "07:00", "09:00", "11:00", "13:00", "15:00", "17:00", "19:00", "21:00", "23:00"},
    {"02:00", "05:00", "08:00", "11:00", "14:00", "17:00", "20:00", "23:00"}
} 

local reminders = 
{
    {5, 10, 15},
    {5, 10, 15}
}

local events = 
{
    {"Maw tormenters", "GUILD"},
    {"Nazjatar skit", "PRINT"}
}
    

function table_has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function stringTime_to_numbers(s)
    x = Split(s, ":")
    return x[1], x[2]
end

function to_minutes(h)
    return h*60
end

function doAlert(timer, reminder)
    local c_hours, c_minutes = GetGameTime()
    for i = 1, table.getn(timer) do
        local t_hours, t_minutes = stringTime_to_numbers(timer[i])

        local diff = (to_minutes(t_hours) + t_minutes) - (to_minutes(c_hours) + c_minutes)

        if table_has_value(reminder, diff) or diff == 0 then
            return true, diff
        end
    end
    return false, -404
end

function check_time(event, timer, reminder)
    local gonna_alert, diff = doAlert(timer, reminder)
    if gonna_alert then
        local msg = ""
        if diff == 0 then
            msg = event[1] .. " starting now"
        else
            msg = event[1] .. " in " .. diff .. " minutes"
        end
        
        if event[2] == "PRINT" then
            print(msg)
        else
            SendChatMessage(msg, event[2], nil)
        end
        
        PlaySound(118491)
    end
end

for i = 1, table.getn(events) do
    check_time(events[i], timers[i], reminders[i])
    local myTicker = C_Timer.NewTicker(60, function() check_time(events[i], timers[i], reminders[i]); end )
end



