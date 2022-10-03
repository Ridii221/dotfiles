"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"	Table of content
"	1. General
"	2. Colors, fonts and looks
"	3. Tabs / Windows / Buffers
"	4. Editing mappings
"	5. Plugins configs
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plug.vim
" https://github.com/junegunn/vim-plug

call plug#begin(stdpath('data') . '/plugged')

" Theme
Plug 'iCyMind/NeoSolarized'
Plug 'dracula/vim', { 'as': 'dracula' }

" Basic
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ap/vim-css-color'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'fladson/vim-kitty'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'

" Snippets
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'

" requires 
" https://github.com/sharkdp/bat
" https://github.com/BurntSushi/ripgrep
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-tsserver coc-pyright coc-html coc-css coc-json coc-prettier coc-pairs coc-highlight coc-spell-checker coc-snippets'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	1. General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on

" Close 
nnoremap <leader>q :q<cr>

" Paste don't yank in normal
xnoremap p "_dP

" set tabs
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab 
" autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType scss setlocal iskeyword+=@-@

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><ESC> :noh<cr>

" edit and load .vimrc
map <leader>C :tabe ~/.vimrc<cr>
map <leader>CC :so ~/.vimrc<cr>

" Quick use @q makro
nnoremap <leader>h :normal @q<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	2. Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
" let g:neosolarized_contrast = "high"
" let g:neosolarized_visibility = "high"
" colorscheme NeoSolarized
colorscheme dracula

" Set guicolors
set termguicolors

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Always show the tab line
set stal=2

" lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	3. Tabs / Windows / Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move between tabs
map [t gT
map ]t gt

" Useful mappings for managing tabs
nnoremap T <C-W>T
nmap <leader>tn :tabnew<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>

" toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader><TAB> :exe "tabn ".g:lasttab<CR>

au TabLeave * let g:lasttab = tabpagenr()

nnoremap <leader>wt <C-W>T
nnoremap <leader>wo <C-W>o

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	4. Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" H to move to the first character in a line
noremap H ^
" L to move to the last character in a line
noremap L g_

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	5. Plugins configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['▏']

"""""""""""""""""""""""""""""""""
"	NERDTree
"""""""""""""""""""""""""""""""""

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Find current file in tree
nnoremap <leader>fn :NERDTreeFind %<CR>

" reopen NERDTree
nmap FF :NERDTree <CR>

" NERDTree ui
let g:NERDTreeMinimalUI = 1

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree on the left
let g:NERDTreeWinPos = "left"

" Open and close node with l and h"
let g:NERDTreeMapActivateNode = "l"
let g:NERDTreeMapOpenRecursively = "L"
let g:NERDTreeMapCloseDir = "h"
let g:NERDTreeMapCloseChildren = "H"

let g:NERDTreeMapToggleHidden = "."

"""""""""""""""""""""""""""""""""
"	CoC
"""""""""""""""""""""""""""""""""
let g:coc_disable_startup_warning = 1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)

nmap <leader>ff <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>a  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <leader>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <leader>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <leader>s :<C-u>CocList outline<cr>
" Find snippets.
nnoremap <silent> <leader>\ :<C-u>CocList snippets<cr>
" Search workspace symbols.
" nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> <leader>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>p :<C-u>CocListResume<CR>

" coc-snippets

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

"""""""""""""""""""""""""""""""""
"	vim-session
"""""""""""""""""""""""""""""""""

nnoremap <leader>o :OpenSession<cr>
nnoremap <leader>O :OpenSession!<cr>

" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers

" Don't persist options and mappings because it can corrupt sessions.
set sessionoptions-=options

let g:session_default_overwrite = 1

" Autosave
let g:session_autosave_periodic=5
let g:session_autosave_silent=1
let g:session_autosave='yes'

"""""""""""""""""""""""""""""""""
"	0.4 FZF
"""""""""""""""""""""""""""""""""

" Search in code
nnoremap <leader>fd :Rg<CR>

" Search file
nnoremap <leader>fi :Files<CR>

" Search buffer
nnoremap <leader>fb :Buffers<CR>

" Search git status
nnoremap <leader>fc :GFiles?<CR>

