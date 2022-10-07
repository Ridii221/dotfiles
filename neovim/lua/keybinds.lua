local keymap = vim.api.nvim_set_keymap

-- quit, save
keymap('n', '<leader>q', ':q<cr>', {})
keymap('', '<c-s>', ':w<cr>', {})
keymap('i', '<c-s>', '<c-o>:w<cr>', {})

-- edit and load config file
keymap('n', '<leader>C', ':tabe $MYVIMRC<cr>', {})

-- paste won't yank in normal
keymap('x', 'p', '"_dP', {})

-- move between windows
keymap('', '<leader>wh', '<C-W>h', {})
keymap('', '<leader>wj', '<C-W>j', {})
keymap('', '<leader>wk', '<C-W>k', {})
keymap('', '<leader>wl', '<C-W>l', {})

-- windows managment
keymap('n', '<leader>wt', '<C-W>T', {});
keymap('n', '<leader>wo', '<C-W>o', {});

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
keymap('n', '<leader>tn', ':tabnew<cr>', {})
keymap('n', '<leader>to', ':tabonly<cr>', {})
keymap('n', '<leader>tc', ':tabclose<cr>', {})

-- move tabs
keymap('n', '<leader>tH', ':tabmove - <cr>', {})
keymap('n', '<leader>tL', ':tabmove + <cr>', {})

-- close all tabs to the right/left
keymap('n', '<leader>tr', ':.+1,$tabdo :q <cr>', {})
keymap('n', '<leader>tR', ':.-1,1tabdo :q <cr>', {})

-- move to start/end of the line
keymap('n', 'H', 'g0', {})
keymap('n', 'L', 'g_', {})

-- help quick
keymap('n', '<leader>h', ':help ', {})