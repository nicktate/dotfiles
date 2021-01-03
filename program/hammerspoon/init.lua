config = {}
config.applications = {
  ['io.alacritty'] = {
    bundleID = 'io.alacritty',
    hyper_key = 't',
    rules = {
      kill = true
    }
  },
  ['com.google.Chrome'] = {
    bundleID = 'com.google.Chrome',
    hyper_key = 'b'
  },
  ['com.microsoft.VSCode'] = {
    bundleID = 'com.microsoft.VSCode',
    hyper_key = 'v'
  }
}

local hyper = require('hyper')
hyper.start(config)

-- Hammerspoon bindings
hyper:bind({}, 'r', nil, function()
  hs.application.launchOrFocusByBundleID('org.hammerspoon.Hammerspoon')
end)
hyper:bind({'shift'}, 'r', nil, function() hs.reload() end)

-- hs.dockIcon(false)
