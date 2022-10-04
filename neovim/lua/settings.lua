local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g

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
w.foldcolumn = '1'
w.wrap = false
o.updatetime = 300
o.timeoutlen = 500
o.clipboard = 'unnamedplus'
o.shortmess = 'Sc'
o.whichwrap = '<,>,h,l'
o.termguicolors = true
o.showtabline = 2
o.helpheight = 30

-- tabs and indent
b.tabstop = 4
b.expandtab = true
b.shiftwidth = 0
b.autoindent = true
b.smartindent = true

-- backup settings
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- better buffer splitting
o.splitright = true
o.splitbelow = true

-- not sure if i need this
-- o.switchbuf = 'useopen,uselast'
-- o.jumpoptions = 'view'
-- b.tw = 500
