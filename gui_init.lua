local ZTR = _G["ZTR"]

local addon = LibStub("AceAddon-3.0"):NewAddon("ZartockTimerReminder")
local icon = LibStub("LibDBIcon-1.0")
local ztrLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Zartock Timer Reminder",
{
    type = "data source",
    text = "Timer Reminder",
    icon = "Interface\\Addons\\ZartockTimerReminder\\Media\\Icons\\frank",
    OnTooltipShow = function(tooltip)
        tooltip:SetText("Zartock Timer Reminder")
        tooltip:AddLine("To help remind the player of events that occur at certain times of the day", 1, 1, 1)
        tooltip:Show()
   end,
    OnClick = function()
        ZTR.GUI_Renderer:showGUI()
    end,
})

function addon:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("ZartockTimerReminderDB", { profile = { minimap = { hide = false, }, }, }) 
    icon:Register("Zartock Timer Reminder", ztrLDB, self.db.profile.minimap)
    icon:Show("Zartock Timer Reminder") 
end

ZTR.Addon = addon