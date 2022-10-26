-- Standard awesome library
local awful = require("awful")
local lain = require("lain")

local l = awful.layout.suit
local _M = {}

local tagnames = { "⒈ editor", "⒉ browser", "⒊ dev", "⒋ spotify", "⒌ messages" }
local tag_layouts = { l.tile, l.tile, lain.layout.cascade.tile, l.floating, l.floating }

function _M.get ()
  local tags = {}

  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(
      tagnames, s, tag_layouts
    )
  end)

  return tags
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
