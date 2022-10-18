local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', ':Telescope<cr>')
vim.keymap.set('n', 'fi', builtin.find_files)
vim.keymap.set('n', 'fI', function () builtin.find_files({ cwd = os.getenv("HOME"), hidden = true }) end)
vim.keymap.set('n', 'fd', builtin.live_grep)
vim.keymap.set('n', 'fw', builtin.grep_string)
vim.keymap.set('n', 'fb', builtin.buffers)
vim.keymap.set('n', 'fh', builtin.help_tags)
vim.keymap.set('n', 'fs', builtin.git_status)
vim.keymap.set('n', 'fc', builtin.git_commits)
vim.keymap.set('n', 'fC', builtin.git_bcommits)
vim.keymap.set('n', '<leader>fp', builtin.resume)

telescope.setup({
    defaults = {
        mappings = {
            i = {
                -- todo: this is problem with other plugins
                ["<C-j>"] = "cycle_history_next",
                ["<C-k>"] = "cycle_history_prev",
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})

telescope.load_extension('fzy_native')
telescope.load_extension("emoji")

