local ZTR = _G["ZTR"]

local gui_renderer = {}
local AceGUI = LibStub("AceGUI-3.0")

function gui_renderer:showGUI()
    local frame = AceGUI:Create("Frame")
    frame:SetTitle("Zartock Timer Reminder")
    frame:SetStatusText("AceGUI-3.0 Example Container Frame")
end

ZTR.GUI_Renderer = gui_renderer