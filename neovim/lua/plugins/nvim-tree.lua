vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('', '<c-n>', ':NvimTreeToggle<cr>')
vim.keymap.set('', '<leader>fn', ':NvimTreeFindFile<cr>')

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "h", action = "close_node" },
                { key = "l", action = "edit" },
                { key = "<C-t>", action = "" },
                { key = "t", action = "tabnew" },
                { key = "cd", action = "cd" },
                { key = "f", action = "" },
                { key = "?", action = "live_filter" },
            },
        },
    },
})

-- TODO zamyka nvim jesli jest ostatnie ale otwierasz plik
-- local group = vim.api.nvim_create_augroup('user_nvim-tree', { clear = true })
-- vim.api.nvim_create_autocmd("BufLeave", {
--     group = group,
--     nested = true,
--     callback = function()
--       if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--         vim.cmd "quit"
--       end
--     end
-- })
