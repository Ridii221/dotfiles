local keymap = vim.api.nvim_set_keymap

-- quit neovim
keymap('n', '<leader>q', ':q<cr>', {})

-- edit and load config file
keymap('n', '<leader>C', ':tabe $MYVIMRC<cr>', {})
keymap('n', '<leader>CC', ':so $MYVIMRC<cr>', {})

-- paste won't yank in normal
keymap('x', 'p', '"_dP', {})

-- hide highlight
keymap('n', '<leader><esc>', ':noh<cr>', {})

