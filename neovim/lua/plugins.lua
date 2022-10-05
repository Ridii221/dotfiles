-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- required by others
    use 'nvim-lua/plenary.nvim'

    -- themes and looks
    use {'dracula/vim', as = 'dracula'}

    -- basic
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'sheerun/vim-polyglot'
    use 'fladson/vim-kitty'
    use 'ap/vim-css-color'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() 
            vim.g.indentLine_char_list = {'▏'}
        end,
    }
    use 'xolox/vim-misc'
    use {
        'xolox/vim-session',
        config = function()
            require('plugins.vim-session')
        end
    }
    use 'kyazdani42/nvim-web-devicons'

    -- movement
    use 'easymotion/vim-easymotion'

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine')
        end,
    }

    -- git integration
    use {
        'mhinz/vim-signify', 
        config = function()
            require('plugins.signify')
        end,
    }
    use {'tpope/vim-fugitive', {'tpope/vim-rhubarb', opt = false}, {'tommcdo/vim-fubitive', opt = false}}

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('plugins.nvim-tree')
        end,
    }

    -- telescope
    -- install ripgrep, bat
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('plugins.telescope')
        end,
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'xiyaowong/telescope-emoji.nvim'
    -- todo: use {'nvim-telescope/telescope-media-files.nvim', opt = false}

    -- LSP, completions and snippets
    use {
        'neoclide/coc.nvim', 
        branch = 'release',
        config = function()
            require('plugins.coc')
        end,
    }
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    
    -- todo: https://www.reddit.com/r/neovim/comments/jxub94/reload_lua_config/

end)
