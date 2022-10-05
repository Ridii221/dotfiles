vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('', '<c-n>', ':NvimTreeToggle<cr>')
vim.keymap.set('', '<leader>fn', ':NvimTreeFindFile<cr>')

-- todo: close neovim if the only window left open is a NvimTree

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "h", action = "close_node" },
                { key = "l", action = "edit" },
                { key = "<C-o>", action = "system_open" },
                { key = "<C-t>", action = "" },
                { key = "t", action = "tabnew" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
