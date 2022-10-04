local keymap = vim.api.nvim_set_keymap

-- quit, save
keymap('n', '<leader>q', ':q<cr>', {})
keymap('', '<c-s>', ':w<cr>', {})
keymap('i', '<c-s>', '<c-o>:w<cr>', {})

-- edit and load config file
keymap('n', '<leader>C', ':tabe $MYVIMRC<cr>', {})
-- todo: lua require cashes file so no reload after this command
-- keymap('n', '<leader>CC', ':so $MYVIMRC<cr>', {})

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

-- move between tabs
keymap('', 'th', 'gT', {})
keymap('', '[t', 'gT', {})
keymap('', 'tl', 'gt', {})
keymap('', ']t', 'gt', {})

-- tabs managment
keymap('n', '<leader>tn', ':tabnew<cr>', {})
keymap('n', '<leader>to', ':tabonly<cr>', {})
keymap('n', '<leader>tc', ':tabclose<cr>', {})

-- move tab
keymap('n', '<leader>th', ':tabmove - <cr>', {})
keymap('n', '<leader>tl', ':tabmove + <cr>', {})

-- close all tabs to the right/left
keymap('n', '<leader>tL', ':.+1,$tabdo :q <cr>', {})
keymap('n', '<leader>tH', ':.-1,1tabdo :q <cr>', {})

-- switch cwd to current file path
keymap('', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {})

-- move to start/end of the line
keymap('n', 'H', 'g0', {})
keymap('n', 'L', 'g_', {})

-- help quick
keymap('n', '<leader>h', ':help ', {})
