vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append({ trail = "⋅", tab = "> " })
vim.opt.number = true
vim.api.nvim_exec([[ autocmd TermOpen * startinsert ]], false)
vim.g.vscode_style = "dark"
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd[[colorscheme vscode]]
vim.wo.colorcolumn = "80"

