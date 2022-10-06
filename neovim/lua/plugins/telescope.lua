local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', ':Telescope<cr>')
vim.keymap.set('n', 'fi', builtin.find_files)
vim.keymap.set('n', 'fg', builtin.live_grep)
vim.keymap.set('n', 'fd', builtin.grep_string)
vim.keymap.set('n', 'fb', builtin.buffers)
vim.keymap.set('n', 'fh', builtin.help_tags)
vim.keymap.set('n', 'fs', builtin.git_status)
vim.keymap.set('n', 'fC', builtin.git_commits)
vim.keymap.set('n', 'fc', builtin.git_bcommits)

telescope.setup({
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
})

telescope.load_extension('fzy_native')
telescope.load_extension("emoji")

