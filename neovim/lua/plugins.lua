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
    --use 'itchyny/lightline.vim'

    -- basic
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'ap/vim-css-color'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'sheerun/vim-polyglot'
    use 'fladson/vim-kitty'
    use 'xolox/vim-misc'
    use 'xolox/vim-session'
    use 'ryanoasis/vim-devicons'

    -- file tree
    -- use 'preservim/nerdtree'

    -- movement
    use 'easymotion/vim-easymotion'

    -- LSP, completions and snippets
    -- use 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-tsserver coc-pyright coc-html coc-css coc-json coc-prettier coc-pairs coc-highlight coc-spell-checker coc-snippets'}
    -- use 'SirVer/ultisnips'
    -- use 'honza/vim-snippets'

    -- git integration
    -- use 'airblade/vim-gitgutter'
    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-rhubarb'
    -- use 'tommcdo/vim-fubitive'
    
    -- todo: https://www.reddit.com/r/neovim/comments/jxub94/reload_lua_config/

end)
