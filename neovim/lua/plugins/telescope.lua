local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.resume)
vim.keymap.set('n', '<leader>fr', builtin.builtin)
vim.keymap.set('n', '<leader>fm', builtin.marks)
vim.keymap.set('n', '<leader>fi', builtin.find_files)
vim.keymap.set('n', '<leader>fI', function () builtin.find_files({ cwd = vim.call("expand", "%:p:h"), hidden = true }) end)
vim.keymap.set('n', '<leader>fd', function () builtin.grep_string({ search = "", layout_strategy = 'horizontal' }) end)
vim.keymap.set('n', '<leader>fw', builtin.grep_string)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fs', builtin.git_status)
vim.keymap.set('n', '<leader>fg', builtin.git_branches)
vim.keymap.set('n', '<leader>fc', builtin.git_commits)
vim.keymap.set('n', '<leader>fC', builtin.git_bcommits)
vim.keymap.set('n', '<leader>fj', builtin.jumplist)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)

telescope.setup({
    defaults = {
        layout_strategy = 'flex',
        scroll_strategy = 'limit',
        mappings = {
            i = {
                -- todo: this is problem with other plugins
                ["<C-j>"] = "cycle_history_next",
                ["<C-k>"] = "cycle_history_prev",
            },
            n = {
                ["H"] = false,
                ["L"] = false,
            }
        },
        layout_config = {
          cursor = {
            height = 0.4,
            preview_cutoff = 10,
            width = 0.7
          },
        },
    },
    pickers = {
        find_files = {
            path_display = { shorten = 3 },
        },
        live_grep = {
            path_display = { 'tail' },
        },
        grep_string = {
            layout_strategy = 'cursor',
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

