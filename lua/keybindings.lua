vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map esc
map('i', 'jj', '<Esc>')
map('c', 'jj', '<C-C>')

-- move lines
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
map('n', '<A-k>', ':m .-2<CR>==')
map('n', '<A-j>', ':m .+1<CR>==')
map('v', '<A-k>', ':m \'<-2<CR>gv=gv')
map('v', '<A-j>', ':m \'>+1<CR>gv=gv')

-- move between panes
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- save
map('n', '<Leader>w', ':w<CR>')

-- quit
map('n', '<Leader>q', ':q<CR>')

-- jump to last buffer
map('n', '<Leader><space>', '<C-^>')

map('n', '<C-p>', '<cmd>bprev<CR>')
map('n', '<C-n>', '<cmd>bnext<CR>')

-- open terminal
map('n', '<Leader>t', ':vsplit +term<CR> i')

-- terminal mappings
map('t', 'jj', '<C-\\><C-n>')

-- Windows resizing
map('n', '<C-left>', '<C-w>5<')
map('n', '<C-right>', '<C-w>5>')
map('n', '<C-down>', '<C-w>5+')
map('n', '<C-up>', '<C-w>5-')

map('t', '<C-left>', '<C-w>5<')
map('t', '<C-right>', '<C-w>5>')
map('t', '<C-down>', '<C-w>5+')
map('t', '<C-up>', '<C-w>5-')

map('n', 'Y', 'y$')

map('n', '<Leader>n', '<cmd>NvimTreeToggle<CR>')

map('n', '<Leader>g', '<cmd>Git<CR>')

map('n', '<Leader>jn', '<cmd>lua require("neotest").summary.toggle()<CR>')
map('n', '<Leader>jt', '<cmd>lua require("neotest").run.run()<CR>')
map('n', '<Leader>jf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
-- map('n', '<Leader>jp', '<cmd>TestSuite<CR>')

--vim.keymap.set({'n', 'v'}, '<Leader>ll', vim.lsp.buf.rename, { buffer=true, desc="LSP rename"})
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- --[[
--
-- -- Remove line number in terminal
-- autocmd TermOpen * setlocal nonumber norelativenumber
--
-- -- open coc-explorer
-- nmap <space>n <Cmd>CocCommand explorer<CR>
--
-- -- open yank list
-- nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
--
-- -- open most recent  used
-- nnoremap <silent> <C-p> :<C-u>CocList mru<cr>
--
-- -- coc diagnostic
-- nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
-- nmap <silent> [g <Plug>(coc-diagnostic-prev)
-- nmap <silent> ]g <Plug>(coc-diagnostic-next)
--
-- -- coc apply codeaction
-- xmap <leader>a  <Plug>(coc-codeaction-selected)<cr>
-- nmap <leader>a  <Plug>(coc-codeaction-selected)<cr>
--
-- -- GoTo code navigation.
-- nmap <silent> gd <Plug>(coc-definition)
-- nmap <silent> gy <Plug>(coc-type-definition)
-- nmap <silent> gi <Plug>(coc-implementation)
-- nmap <silent> gr <Plug>(coc-references)
--
-- -- Symbol renaming.
-- nmap <leader>rn <Plug>(coc-rename)
--
-- -- Highlight the symbol and its references when holding the cursor.
-- autocmd CursorHold * silent call CocActionAsync('highlight')
--
-- -- Requires 'textDocument/selectionRange' support of language server.
-- nmap <silent> <C-s> <Plug>(coc-range-select)
-- xmap <silent> <C-s> <Plug>(coc-range-select)
--
-- -- autocomplete trigger
-- inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
--                               \: --\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>--
--
--
--
-- -- set colorscheme
-- if (has(--termguicolors--))
-- 	set termguicolors
-- endif
-- -- For Neovim 0.1.3 and 0.1.4
-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- colorscheme dracula
-- let g:lightline = { 'colorscheme': 'dracula'}
-- let g:airline_theme='dracula'
-- set background=dark
--
-- let g:airline#extensions#tabline#enabled = 1
-- let g:airline_powerline_fonts = 1
--
-- -- colorscheme gruvbox
-- -- let g:gruvbox_contrast_dark='hard'
-- -- let g:airline_theme='gruvbox'
--
-- -- Use K to show documentation in preview window
-- nnoremap <silent> K :call <SID>show_documentation()<CR>
--
-- function! s:show_documentation()
--   if (index(['vim','help'], &filetype) >= 0)
--     execute 'h '.expand('<cword>')
--   else
--     call CocAction('doHover')
--   endif
-- endfunction
--
-- -- Git mapping
-- nmap <leader>g :G<CR>
--
--
-- -- Find files using Telescope command-line sugar.
-- nnoremap <leader>p <cmd>Telescope find_files<cr>
-- nnoremap <leader>r <cmd>Telescope live_grep<cr>
-- nnoremap <leader>b <cmd>Telescope buffers<cr>
-- nnoremap <leader>h <cmd>Telescope help_tags<cr>
--
-- -- enable rainbox
-- let g:rainbow_active = 1
--
-- inoremap <silent><expr> <c-space> coc#refresh()
--
-- -- vnoremap y mxy'x
--
-- -- Jest test
-- nnoremap <leader>jt :call CocAction('runCommand', 'jest.singleTest')<CR>
-- nnoremap <leader>jf :call CocAction('runCommand', 'jest.fileTest')<CR>
-- nnoremap <leader>jp :call CocAction('runCommand', 'jest.projectTest')<CR>
--
-- -- Show commands.
-- nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
-- -- Find symbol of current document.
-- nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
-- -- Search workspace symbols.
-- nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
-- ]]
