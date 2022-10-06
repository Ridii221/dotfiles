local o = vim.o
local g = vim.g

vim.cmd('colorscheme dracula')

g.mapleader = ' '
g.maplocalleader = ' '

-- general
o.mouse = 'a'
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.ignorecase = true
o.smartcase = true
o.scrolloff = 7
o.foldcolumn = '1'
o.wrap = false
o.updatetime = 100
o.timeoutlen = 500
o.clipboard = 'unnamedplus'
o.shortmess = 'Sc'
o.whichwrap = '<,>,h,l'
o.termguicolors = true
o.showtabline = 2
o.helpheight = 30

-- tabs and indent
o.tabstop = 4
o.expandtab = true
o.shiftwidth = 0
o.autoindent = true
o.smartindent = true

-- backup settings
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- better buffer splitting
o.splitright = true
o.splitbelow = true

-- o.switchbuf = 'useopen,uselast'
