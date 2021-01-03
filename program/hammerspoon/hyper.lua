-- HYPER
--
-- Hyper is a hyper shortcut modal.
--
-- Feel free to modify... I use karabiner-elements.app on my laptop and QMK on
-- my mech keyboards to bind a single key to `F19`, which fires all this
-- Hammerspoon-powered OSX automation.
--
-- I chiefly use it to launch applications quickly from a single press,
-- although I also use it to create "universal" local bindings inspired by
-- Shawn Blanc's OopsieThings.
-- https://thesweetsetup.com/oopsiethings-applescript-for-things-on-mac/

local hyper = hs.hotkey.modal.new({}, nil)
hs.application.enableSpotlightForNameSearches(true)

hyper.pressed  = function() hyper:enter() end
hyper.released = function() hyper:exit() end

-- Set the key you want to be HYPER to F19 in karabiner or keyboard
-- Bind the Hyper key to the hammerspoon modal
hs.hotkey.bind({}, 'F19', hyper.pressed, hyper.released)

hyper.showHide = function(app) 
  local a = hs.application.find(app.bundleID)
  if not a then
    a = hs.application.open(app.bundleID, 3, true)
    a:activate()
    return
  end

  if a:isHidden() then
      a:activate()
  else
    if app.rules and app.rules.kill then
      a:kill()
    else
      a:hide()
    end
  end
end

-- Expects a configuration table with an applications key that has the
-- following form:
-- config_table.applications = {
--   ['com.culturedcode.ThingsMac'] = {
--     bundleID = 'com.culturedcode.ThingsMac',
--     hyper_key = 't',
--     rules = {
--       kill: false
--     }
--   },
-- }
hyper.start = function(config_table)
  -- Use the hyper key with the application config to use the `hyper_key`
  hs.fnutils.map(config_table.applications, function(app)
    -- Apps that I want to jump to
    if app.hyper_key then
      hyper:bind({}, app.hyper_key, function() hyper.showHide(app); end)
    end
  end)
end

return hyper
