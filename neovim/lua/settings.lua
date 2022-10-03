local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

o.mouse = 'a'
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.smartcase = true
o.scrolloff = 7
w.foldcolumn = '1'
w.wrap = false
b.autoindent = true
b.smartindent = true

o.updatetime = 300
o.timeoutlen = 500

o.clipboard = 'unnamedplus'
o.shortmess = 'Sc'
o.whichwrap = '<,>,h,l'

o.writebackup = false

-- not sure if i need this
-- o.history = 500
-- o.switchbuf = 'useopen,uselast'
-- b.tw = 500
