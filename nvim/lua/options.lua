vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.wo.signcolumn = "yes"
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append({ trail = "⋅", tab = "> " })
vim.opt.number = true
vim.g.vscode_style = "dark"
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd[[colorscheme vscode]]
-- vim.cmd[[colorscheme sitruuna]]
vim.wo.colorcolumn = "80"
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.winbar = "%f"

vim.api.nvim_create_autocmd("TermOpen", {
  command = "startinsert",
  pattern = "*",
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

