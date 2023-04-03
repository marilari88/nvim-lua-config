--[[ TODO
- do not block vim while running
- open quickfix list after running
- support monorepos
- notify results ]]

vim.cmd([[
  augroup strdr4605
    autocmd FileType typescript,typescriptreact compiler tsc | setlocal makeprg=npx\ tsc
  augroup END
]])
