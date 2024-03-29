local keymap = vim.api.nvim_set_keymap

-- quit, save
keymap('n', '<leader>q', ':q<cr>', {})
keymap('n', '<leader>Q', ':qa!<cr>', {})
keymap('n', '<leader>wq', ':q<cr>', {})
keymap('n', '<leader>tq', ':tabclose<cr>', {})
keymap('', '<c-s>', ':w<cr>', {})
keymap('i', '<c-s>', '<c-o>:w<cr>', {})

-- delete word OS style
keymap('!', '<c-BS>', '<c-w>', {})

-- edit and load config file
keymap('n', '<leader>C', ':tabe $MYVIMRC<cr>', {})

-- paste won't yank in normal
keymap('x', 'p', '"_dP', {})

-- move between windows
keymap('', '<leader>wh', '<C-W>h', {})
keymap('', '<leader>wj', '<C-W>j', {})
keymap('', '<leader>wk', '<C-W>k', {})
keymap('', '<leader>wl', '<C-W>l', {})

-- resize windows
keymap('', '<leader>w-', ':resize -5<cr>', {})
keymap('', '<leader>w+', ':resize +5<cr>', {})
keymap('', '<leader>w<', ':vertical resize +5<cr>', {})
keymap('', '<leader>w>', ':vertical resize +5<cr>', {})
keymap('', '<leader>w=', '<C-W>=', {})

-- windows managment
keymap('n', '<leader>wt', '<C-W>T', {})
keymap('n', '<leader>wo', '<C-W>o', {})
keymap('n', '<leader>wv', '<C-W>v', {})
keymap('n', '<leader>ws', '<C-W>s', {})

-- move windows
keymap('n', '<leader>wH', '<C-W>H', {})
keymap('n', '<leader>wJ', '<C-W>J', {})
keymap('n', '<leader>wK', '<C-W>K', {})
keymap('n', '<leader>wL', '<C-W>L', {})
keymap('n', '<leader>wr', '<C-W>x', {})

-- move between tabs
keymap('', '<leader>th', 'gT', {})
keymap('', '<leader>tl', 'gt', {})
keymap('', '[t', 'gT', {})
keymap('', ']t', 'gt', {})

-- tabs managment
keymap('n', '<leader>T', '<C-W>T', {})
keymap('n', '<leader>tn', ':tabnew<cr>', {})
keymap('n', '<leader>to', ':tabonly<cr>', {})
keymap('n', '<leader>tc', ':tabclose<cr>', {})

-- move tabs
keymap('n', '<leader>tH', ':tabmove - <cr>', {})
keymap('n', '<leader>tL', ':tabmove + <cr>', {})

-- close all tabs to the right/left
keymap('n', '<leader>tr', ':.+1,$tabdo :q <cr>', {})
keymap('n', '<leader>tR', ':.-1,1tabdo :q <cr>', {})

-- scroll horizontal/vertical
keymap('n', '<C-h>', 'zh', {})
keymap('n', '<C-l>', 'zl', {})
keymap('n', '<C-j>', '<C-e>', {})
keymap('n', '<C-k>', '<C-y>', {})

-- move to start/end of the line
keymap('n', 'H', '0', { noremap = true })
keymap('n', 'L', 'g_', { noremap = true })

-- cycle commands history
keymap('c', '<c-j>', '<c-n>', {})
keymap('c', '<c-k>', '<c-p>', {})

-- clear highlights
keymap('', '<leader><Esc>', '<Cmd>nohlsearch<CR>', {})

