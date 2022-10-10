vim.g.signify_sign_show_count = 0
vim.g.signify_sign_change = '~'

vim.keymap.set('n', '<leader>cu', ':SignifyHunkUndo<cr>')
vim.keymap.set('n', '<leader>cd', ':SignifyHunkDiff<cr>')
vim.keymap.set('n', '<leader>cf', ':SignifyFold<cr>')
vim.keymap.set('n', '<leader>ch', ':SignifyToggleHighlight<cr>')

