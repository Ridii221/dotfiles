vim.g.signify_sign_show_count = 0
vim.g.signify_sign_change = '~'

vim.keymap.set('n', '<leader>cu', ':SignifyHunkUndo<cr>')
vim.keymap.set('n', '<leader>cd', ':SignifyHunkDiff<cr>')
vim.keymap.set('n', '<leader>cf', ':SignifyFold<cr>')
vim.keymap.set('n', '<leader>ch', ':SignifyToggleHighlight<cr>')

-- todo
--
-- autocmd User SignifyHunk call s:show_current_hunk()
-- 
-- function! s:show_current_hunk() abort
--   let h = sy#util#get_hunk_stats()
--   if !empty(h)
--     echo printf('[Hunk %d/%d]', h.current_hunk, h.total_hunks)
--   endif
-- endfunction

