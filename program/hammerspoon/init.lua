-- local am = require('app-management')

config = {}
config.applications = {
  ['io.alacritty'] = {
    bundleID = 'io.alacritty',
    hyper_key = 't',
    tags = {'coding'},
    rules = {
      {nil, 1, hs.layout.maximized}
    }
  }
}

local hyper = require('hyper')
hyper.start(config)

-- Random bindings
hyper:bind({}, 'r', nil, function()
  hs.application.launchOrFocusByBundleID('org.hammerspoon.Hammerspoon')
end)
hyper:bind({'shift'}, 'r', nil, function() hs.reload() end)

hyper:bind({'shift'}, 'a', nil, function()
  hs.application.open('Alacritty')
end)
