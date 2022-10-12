local keymap = vim.keymap.set
vim.api.nvim_create_augroup("CocGroup", {})
-- after install
-- vim.cmd('CocInstall coc-tsserver coc-pyright coc-html coc-css coc-json coc-prettier coc-pairs coc-highlight coc-spell-checker coc-snippets')

-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- Use tab for trigger completion with characters ahead and navigate.
local opts = {silent = true, noremap = true, expr = true}
keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion.
keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window.
keymap("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Formatting selected code.
keymap("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keymap("n", "<leader>F", "<Plug>(coc-format)", {silent = true})

-- codeAction and refactor mappings
local opts = {silent = true, nowait = true}
keymap("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keymap("n", "<leader>a", "<Plug>(coc-codeaction)", opts)
keymap("n", "<leader>rn", "<Plug>(coc-rename)>", opts)
keymap("n", "<leader>rr", "<Plug>(coc-refactor)>", opts)

-- organize imports
keymap("n", "<leader>ai", ":OR", opts)

-- Apply AutoFix to problem on the current line.
keymap("n", "<leader>af", "<Plug>(coc-fix-current)", opts)

-- Run the Code Lens action on the current line.
-- todo: what is code lens
-- keymap("n", "<leader>al", "<Plug>(coc-codelens-action)", opts)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keymap("x", "if", "<Plug>(coc-funcobj-i)", opts)
keymap("o", "if", "<Plug>(coc-funcobj-i)", opts)
keymap("x", "af", "<Plug>(coc-funcobj-a)", opts)
keymap("o", "af", "<Plug>(coc-funcobj-a)", opts)
keymap("x", "ic", "<Plug>(coc-classobj-i)", opts)
keymap("o", "ic", "<Plug>(coc-classobj-i)", opts)
keymap("x", "ac", "<Plug>(coc-classobj-a)", opts)
keymap("o", "ac", "<Plug>(coc-classobj-a)", opts)

-- select ranges
-- Requires 'textDocument/selectionRange' support of language server.
keymap("n", "<leader>v", "<Plug>(coc-range-select)", {silent = true})
keymap("x", "<leader>v", "<Plug>(coc-range-select)", {silent = true})

-- Mappings for CoCList
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
keymap("n", "<Bslash>d", ":CocList diagnostics<cr>", opts)
-- Manage extensions.
keymap("n", "<Bslash>e", ":CocList extensions<cr>", opts)
-- Show commands.
keymap("n", "<Bslash>c", ":CocList commands<cr>", opts)
-- Find symbol of current document.
keymap("n", "<Bslash>a", ":CocList outline<cr>", opts)
-- Search workspace symbols.
keymap("n", "<Bslash>s", ":CocList symbols<cr>", opts)
-- Search for snippets
keymap("n", "<Bslash>o", ":CocList snippets<cr>", opts)
-- Resume latest coc list.
keymap("n", "<Bslash><Bslash>", ":CocListResume<cr>", opts)

-- Do default action for next item.
keymap("n", "<leader>j", ":CocNext<cr>", opts)
-- Do default action for previous item.
keymap("n", "<leader>k", ":CocPrev<cr>", opts)

-- coc-snippets
-- convert visual selected code to snippet
keymap('x', '<leader>x', '<Plug>(coc-convert-snippet)', { silent = true })
-- Use <c-j> to trigger snippets
keymap("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
vim.g.coc_snippet_prev = '<c-k>'

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s).
-- todo: i dont know what it does
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- show outline on open
-- vim.api.nvim_create_autocmd({"VimEnter", "Tabnew"}, {
--     group = "CocGroup",
--     pattern = "*",
--     command = "if empty(&buftype) | call CocActionAsync('showOutline', 1) | endif"
-- })

-- close outline when in last window
vim.api.nvim_create_autocmd("BufEnter", {
    group = "CocGroup",
    pattern = "*",
    callback = function ()
        if (vim.bo.filetype == "coctree") and (vim.fn.winnr("$") == 1) then
            if vim.fn.tabpagenr('$') ~= 1 then
                vim.cmd('close')
            else
                vim.cmd('bdelete')
            end
        end
    end
})

local function toggle_outline()
    local w_id = vim.fn['coc#window#find']('cocViewId', 'OUTLINE')
    if w_id == -1 then
        vim.fn.CocActionAsync('showOutline', 1)
    else
        vim.fn['coc#window#close'](w_id)
    end
end

keymap('', '<leader>ao', toggle_outline, { silent = true, nowait = true })

-- Remap <C-d> and <C-u> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
keymap("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keymap("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
keymap("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : ""', opts)
keymap("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : ""', opts)
keymap("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keymap("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
