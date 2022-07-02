local o = vim.o
local wo = vim.wo
local opt = vim.opt

o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = false
o.scrolloff = 12
o.swapfile = false

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.wrap = false

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2

wo.number = true
wo.relativenumber = true


local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)
