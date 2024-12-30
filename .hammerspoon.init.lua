local appShortcutMap = {
    a = "Microsoft Teams",
    b = "Google Chrome",
    c = "GCalendar",
    e = "Google Meet",
    f = "Salesforce",
    g = "Glean",
    m = "Gmail",
    n = "Noteszzz",
    o = "Emojis",
    p = "Perplexity",
    r = "reload",
    s = "Slack",
    t = "iTerm",
    v = "Visual Studio Code",
    z = "Zoom.us"
}
local hyperKey = {'shift', 'control', 'option', 'command'}
local mehKey = {'shift', 'control', 'option'}

--------------------------------------------------
-- load spoons
--------------------------------------------------
hs.loadSpoon("Emojis")

--------------------------------------------------
-- app launcher - launch apps based on a hotkey combination
--------------------------------------------------
for key, val in pairs(appShortcutMap) do
  -- emojis
  if val == "Emojis" then
    spoon.Emojis:bindHotkeys({
      toggle = { hyperKey, "o" }
    })
  -- reloader
  elseif val == "reload" then
    hs.hotkey.bind(hyperKey, "r", function()
      hs.reload()
    end)
  -- app launcher
  else
    hs.hotkey.bind(hyperKey, key, function()
    hs.application.launchOrFocus(val)
    end)
  end
end

--------------------------------------------------
-- mute microphone
--------------------------------------------------
function toggleMute()
  local teams = hs.application.find("com.microsoft.teams2")
  local zoom = hs.application.find("us.zoom.xos")
  local googleMeet = hs.application.find("Google Meet") -- assumes that a chrome web app is saved of this name
  if zoom then
    --hs.alert.show("found zoom")
    hs.eventtap.keyStroke({"cmd","shift"}, "a", 0, zoom)
  end
  if teams then
    --hs.alert.show("found teams")
    hs.eventtap.keyStroke({"cmd", "shift"}, "m", 0, teams)
  end
  if googleMeet then
    --hs.alert.show("found google meet")
    hs.eventtap.keyStroke({"cmd"}, "d", 0, googleMeet)
  end
end

-- Bind the hotkey to the toggleMute function
hs.hotkey.bind(mehKey, "m", toggleMute)

--------------------------------------------------
--
--------------------------------------------------
hs.hotkey.bind(hyperKey, "w", function()
  hs.alert.show("Hello World!")
end)

hs.alert.show("settings reloaded")
