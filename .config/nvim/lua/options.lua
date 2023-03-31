vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = true

-- vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50

vim.opt.winbar = "%f"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.laststatus = 3

vim.opt.undofile = true

-- vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt_local.spelloptions:append({"noplainbuffer", "camel"})

vim.opt.list = true
vim.opt.listchars:append({ trail = "⋅", tab = "> " })

vim.opt.number = true

vim.g.vscode_style = "dark"
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd("colorscheme vscode")

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

vim.cmd[[highlight Identifier guifg=#D4D4D4]]
vim.cmd[[highlight @parameter guifg=#D4D4D4]]
vim.cmd[[highlight @parameterReference guifg=#D4D4D4]]
vim.cmd[[highlight @field guifg=#D4D4D4]]
vim.cmd[[highlight @property guifg=#D4D4D4]]
vim.cmd[[highlight @label guifg=#D4D4D4]]
vim.cmd[[highlight @variable guifg=#D4D4D4]]
vim.cmd[[highlight @variableBuiltin guifg=#D4D4D4]]
vim.cmd[[highlight @punctuation.bracket guifg=#D4D4D4]]

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

