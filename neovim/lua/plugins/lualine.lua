local lualine = require('lualine')

-- from dracula
local colors = {
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  gray       = '#44475a',
  lightgray  = '#5f6a8e',
  orange     = '#ffb86c',
  purple     = '#bd93f9',
  red        = '#ff5555',
  yellow     = '#f1fa8c',
  green      = '#50fa7b',
  blue       = '#51afef',
  white      = '#f8f8f2',
  black      = '#282a36',
}

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

-- Config
local config = {
  extensions = {
    'quickfix',
    'symbols-outline',
  },
  options = {
    globalstatus = false,
    component_separators = '',
    section_separators = '',
    theme = 'auto',
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

function _get_section_name(section_id)
    if section_id ~= nil then
        return 'section_' .. section_id
    else
        return nil
    end
end

-- Inserts a component in lualine_c at left section
local function ins_left(component, options)
  local section = 'lualine_c'
  if options ~= nil and options.section ~= nil then
      section = 'lualine_' .. options.section
  end
  table.insert(config.sections[section], component)
  if (options ~= nil) and (options.inactive == true) then
    table.insert(config.inactive_sections[section], component)
  end
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component, options)
  local section = 'lualine_y'
  if options ~= nil and options.section ~= nil then
      section = 'lualine_' .. options.section
  end
  table.insert(config.sections[section], component)
  if (options ~= nil) and (options.inactive == true) then
    table.insert(config.inactive_sections[section], component)
  end
end

ins_left {
  -- mode component
    function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = '😎',
      no = '😎',
      i = '😨',
      ic = '😨',
      v = '😯',
      [''] = '😯',
      V = '😯',
      s = '🔍',
      S = '🔍',
      [''] = '🔍',
      R = '😰',
      Rv = '😰',
      c = '🤔',
      cv = '🤔',
      ce = '🤔',
      r = '👍',
      ['r?'] = '👍',
      rm = '😑',
      ['!'] = '🏃',
      t = '🤓',
    }
    return mode_color[vim.fn.mode()]
  end,
  padding = {left = 2, right = 1 },
}

ins_left({
  'filename',
  color = { fg = colors.purple, gui = 'bold' },
  symbols = {
    modified = '~',
    readonly = '-',
    unnamed = 'No Name',
    newfile = '+',
  }
}, {inactive = true})

ins_left({
    'filetype',
    colored = true,
    icon_only = true,
}, {inactive = true})

ins_left { 'location', color = { gui = 'bold'} }

ins_left {
  'diagnostics',
  sources = { 'coc' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  cond = hide_in_width,
}

ins_left {
    function()
        return "%="
    end
}

ins_left({
  function()
    return vim.g.coc_status;
  end,
  icon = ' ',
  color = { gui = 'bold' },
})

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.white, gui = 'bold' },
}

ins_right {
  'diff',
  cond = hide_in_width,
}

lualine.setup(config)

