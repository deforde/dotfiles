vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.winbar = "%f"
vim.wo.signcolumn = "yes"
vim.opt.laststatus = 3
-- vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt_local.spelloptions:append({"noplainbuffer", "camel"})
vim.opt.list = true
vim.opt.listchars:append({ trail = "⋅", tab = "> " })
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.vscode_style = "dark"
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd[[colorscheme vscode]]
vim.wo.colorcolumn = "80"
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd[[highlight Identifier guifg=#D4D4D4]]
vim.cmd[[highlight TSParameter guifg=#D4D4D4]]
vim.cmd[[highlight TSParameterReference guifg=#D4D4D4]]
vim.cmd[[highlight TSField guifg=#D4D4D4]]
vim.cmd[[highlight TSProperty guifg=#D4D4D4]]
vim.cmd[[highlight TSLabel guifg=#D4D4D4]]
vim.cmd[[highlight TSVariable guifg=#D4D4D4]]
vim.cmd[[highlight TSVariableBuiltin guifg=#D4D4D4]]

vim.api.nvim_create_autocmd("TermOpen", {
  command = "startinsert",
  pattern = "*",
})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "setf groovy",
  pattern = "Jenkinsfile*",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "%s/\\s\\+$//e",
  pattern = "*",
})

vim.api.nvim_exec([[
  augroup status_line
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line.inactive()
  augroup END
]], false)

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

