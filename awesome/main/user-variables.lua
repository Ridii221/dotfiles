-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

-- local home = os.getenv("HOME")

local _M = {
  -- This is used later as the default terminal and editor to run.
  terminal = "x-terminal-emulator",
  editor = "nvim",
  browser = "firefox",

  -- Default modkey.
  modkey = "Mod4",
  altkey = "Mod1",


  -- user defined wallpaper
  wallpaper = nil,
  --wallpaper = home .. "/Pictures/your-wallpaper-here.jpg",
}

return _M

