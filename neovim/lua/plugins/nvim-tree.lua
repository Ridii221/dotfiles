vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('', '<c-n>', ':NvimTreeToggle<cr>')
vim.keymap.set('', '<leader>fn', ':NvimTreeFindFile<cr>')

require("nvim-tree").setup({
    open_on_setup = true,
    focus_empty_on_setup = false,
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

