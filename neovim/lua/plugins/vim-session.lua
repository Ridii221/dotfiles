vim.keymap.set('n', '<leader>o', ':OpenSession<cr>')
vim.keymap.set('n', '<leader>O', ':OpenSession!<cr>')

vim.opt.sessionoptions:remove {'buffers'} 
vim.opt.sessionoptions:remove {'options'} 

vim.g.session_default_overwrite = 1

vim.g.session_autosave_periodic = 5
vim.g.session_autosave_silent = 1
vim.g.session_autosave = 'yes'
