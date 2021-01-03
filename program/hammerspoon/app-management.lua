-- AppManagement originally by jqno

local This = {}

-- Quickly move to and from a specific app
-- (Thanks Teije)
local previousApp = ""

function This.switchToAndFromApp(bundleID)
  local focusedWindow = hs.window.focusedWindow()

  if focusedWindow == nil then
    hs.application.launchOrFocusByBundleID(bundleID)
  elseif focusedWindow:application():bundleID() == bundleID then
    if previousApp == nil then
      hs.window.switcher.nextWindow()
    else
      previousApp:activate()
    end
  else
    previousApp = focusedWindow:application()
    hs.application.launchOrFocusByBundleID(bundleID)
  end
end

-- Open new windows

function This.newTerminalWindow()
  hs.applescript.applescript([[
    tell application "Terminal"
      do script ""
      activate
    end tell
  ]])
end

-- Show / Hide App

function This.showHideApp(bundleID)
  local app = hs.application.find(bundleID)

  if app then
    awin = app:mainWindow()
  end
  if awin and app and app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus(bundleID)
    app = hs.application.find(bundleID)
    app.setFrontmost(app)
    app.activate(app)
  end
end

return This
