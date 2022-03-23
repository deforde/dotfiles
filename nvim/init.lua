local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn


-- Bootstrap Packer START --
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
-- Bootstrap Packer END --


-- Add plugins START --
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:
  -- use 'neovim/nvim-lspconfig'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'Mofiqul/vscode.nvim'
  use 'ntpeters/vim-better-whitespace'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'preservim/nerdtree'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, { 'BurntSushi/ripgrep' } }
  }
  use 'mfussenegger/nvim-dap'
  use 'ray-x/lsp_signature.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lualine/lualine.nvim'
  use 'rcarriga/nvim-dap-ui'
--  use {
--    "folke/trouble.nvim",
--    requires = "kyazdani42/nvim-web-devicons",
--    config = function()
--      require("trouble").setup {
--        -- your configuration comes here
--        -- or leave it empty to use the default settings
--        -- refer to the configuration section below
--      }
--    end
--  }
  end
)
-- Add plugins END --


-- General key mappings START --
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap
set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
set_keymap('n', '<space>ff', '<cmd>Telescope find_files<cr>', opts)
set_keymap('n', '<space>fg', '<cmd>Telescope live_grep<cr>', opts)
set_keymap('n', '<space>fb', '<cmd>Telescope buffers<cr>', opts)
set_keymap('n', '<space>fh', '<cmd>Telescope help_tags<cr>', opts)
set_keymap('n', '<C-n>', '<cmd>tabnew<cr>', opts)
set_keymap('n', '<C-x>', '<cmd>tabclose<cr>', opts)
set_keymap('n', '<C-b>', '<cmd>NERDTreeToggle<cr>', opts)
set_keymap('n', '<F5>', '<cmd>lua require\'dap\'.continue()<CR>', opts)
set_keymap('n', '<F6>', '<cmd>lua require\'dap\'.step_over()<CR>', opts)
set_keymap('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<CR>', opts)
set_keymap('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<CR>', opts)
set_keymap('n', '<space>b', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
set_keymap('n', '<space>B', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts)
set_keymap('n', '<space>lp', '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts)
set_keymap('n', '<space>dr', '<cmd>lua require\'dap\'.repl.toggle({}, "vsplit")<CR><C-w>l', opts)
set_keymap('n', '<space>dl', '<cmd>lua require\'dap\'.run_last()<CR>', opts)
set_keymap('n', '<space>dc', '<cmd>lua require\'dap\'.terminate()<CR>', opts)
set_keymap('n', '<space>di', '<cmd>lua require\'dap.ui.widgets\'.hover()<CR>', opts)
set_keymap('n', '<space>d?', '<cmd>lua local widgets=require\'dap.ui.widgets\';widgets.centered_float(widgets.scopes)<CR>', opts)
-- set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
-- set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
-- set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
-- set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
-- set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
-- set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
set_keymap('n', '<C-h>', '<cmd>wincmd h<CR>', opts)
set_keymap('n', '<C-j>', '<cmd>wincmd j<CR>', opts)
set_keymap('n', '<C-k>', '<cmd>wincmd k<CR>', opts)
set_keymap('n', '<C-l>', '<cmd>wincmd l<CR>', opts)
-- General key mappings END --


-- LSP configuration START --
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.clangd.setup {
    cmd = {
        "clangd",
        "--clang-tidy",
        "-j=8",
        "--compile-commands-dir=./build/",
    },
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

require'lspconfig'.pyright.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}
-- LSP configuration END --


-- Autocomplete configuration START --
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup {
--  completion = {
--      autocomplete = false,
--  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
--      elseif has_words_before() then
--        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- Autoconfiguration END --


-- DAP configuration START --
local dap = require('dap')
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/danielforde/apps/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    setupCommands = {
        {
            text = '-enable-pretty-printing',
            description =  'enable pretty printing',
            ignoreFailures = false,
        },
    },
  },
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}
-- DAP configuration END --


-- DAP UI configuration START --
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- DAP UI configuration END --


-- LSP signature configuration START --
require'lsp_signature'.setup{
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    },
    hint_prefix = "",
    floating_window_above_cur_line = false,
    hint_enable = false,
    toggle_key = '<C-x>',
}
-- LSP signature configuration END --


-- Treesitter configuration START --
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
-- Treesitter configuration END --


-- Lualine configuration START --
require('lualine').setup()
-- Lualine configuration END --


-- General VIM config START --
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.opt.list = true
vim.opt.listchars:append({ space = "⋅", eol = "¬", tab = "> " })

vim.opt.number = true
-- General VIM config END --


-- Colour scheme config START --
-- For dark theme
vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- Enable transparent background.
-- vim.g.vscode_transparent = 1
-- Enable italic comment
-- vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd[[colorscheme vscode]]
vim.wo.colorcolumn = "80"
-- Colour scheme config END --

