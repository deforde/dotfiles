local opts = { silent=true }
local set_keymap = vim.keymap.set
-- General
set_keymap({"n", "v"}, "<Space>", "<Nop>", opts)
-- Term
set_keymap("t", "<C-\\><C-\\>", "<C-\\><C-n>", opts)
-- Windows
set_keymap("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
set_keymap("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
set_keymap("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
set_keymap("n", "<C-l>", "<cmd>wincmd l<CR>", opts)
set_keymap("n", "<C-Up>", "<cmd>wincmd +<CR>", opts)
set_keymap("n", "<C-Down>", "<cmd>wincmd -<CR>", opts)
set_keymap("n", "<C-Left>", "<cmd>wincmd <lt><CR>", opts)
set_keymap("n", "<C-Right>", "<cmd>wincmd ><CR>", opts)
set_keymap("n", "<C-q>", "<cmd>wincmd =<CR>", opts)
-- Tabs
-- set_keymap("n", "<C-n>", "<cmd>tabnew<cr>", opts)
-- set_keymap("n", "<C-x>", "<cmd>tabclose<cr>", opts)
-- Telescope
set_keymap("n", "<space>ff", function() return require("telescope.builtin").find_files({previewer=false}) end, {silent=true, desc="Telescope find files"})
set_keymap("n", "<space>fg", function() return require("telescope.builtin").live_grep() end, {silent=true, desc="Telescope live grep"})
set_keymap("n", "<space>fb", function() return require("telescope.builtin").buffers() end, {silent=true, desc="Telescope buffers"})
set_keymap("n", "<space>fh", function() return require("telescope.builtin").help_tags() end, {silent=true, desc="Telescope help tags"})
-- LSP
set_keymap("n", "<space>e", vim.diagnostic.open_float, {silent=true, desc="LSP open float"})
set_keymap("n", "[d", vim.diagnostic.goto_prev, {silent=true, desc="LSP goto prev"})
set_keymap("n", "]d", vim.diagnostic.goto_next, {silent=true, desc="LSP goto next"})
set_keymap("n", "<space>q", vim.diagnostic.setloclist, {silent=true, desc="LSP set loc list"})
set_keymap("n", "gD", vim.lsp.buf.declaration, {silent=true, desc="LSP declaration"})
set_keymap("n", "gd", vim.lsp.buf.definition, {silent=true, desc="LSP definition"})
set_keymap("n", "K", vim.lsp.buf.hover, {silent=true, desc="LSP hover"})
set_keymap("n", "gi", vim.lsp.buf.implementation, {silent=true, desc="LSP implementation"})
set_keymap("n", "gk", vim.lsp.buf.signature_help, {silent=true, desc="LSP signature help"})
set_keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {silent=true, desc="LSP add workspace folder"})
set_keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {silent=true, desc="LSP remove workspace folder"})
set_keymap("n", "<space>wl", function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end, {silent=true, desc="LSP inspect workspace folders"})
set_keymap("n", "<space>D", vim.lsp.buf.type_definition, {silent=true, desc="LSP type definition"})
set_keymap("n", "<space>rn", vim.lsp.buf.rename, {silent=true, desc="LSP rename"})
set_keymap("n", "<space>ca", vim.lsp.buf.code_action, {silent=true, desc="LSP code action"})
set_keymap("n", "gr", vim.lsp.buf.references, {silent=true, desc="LSP references"})
set_keymap("n", "<space>f", vim.lsp.buf.formatting, {silent=true, desc="LSP formatting"})
set_keymap("n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
-- DAP
set_keymap("n", "<F5>", function() return require("dap").continue() end, {silent=true, desc="Debugger launch/continue"})
set_keymap("n", "<F6>", function() return require("dap").step_over() end, {silent=true, desc="Debugger step over"})
set_keymap("n", "<F11>", function() return require("dap").step_into() end, {silent=true, desc="Debugger step into"})
set_keymap("n", "<F12>", function() return require("dap").step_out() end, {silent=true, desc="Debugger step out"})
set_keymap("n", "<space>b", function() return require("dap").toggle_breakpoint() end, {silent=true, desc="Debugger toggle breakpoint"})
set_keymap("n", "<space>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, {silent=true, desc="Debugger set conditional breakpoint"})
set_keymap("n", "<space>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, {silent=true, desc="Debugger set log point"})
set_keymap("n", "<space>dr", function() require"dap".repl.toggle({}, "vsplit") end, {silent=true, desc="Debugger toggle REPL"})
set_keymap("n", "<space>dl", function() return require("dap").run_last() end, {silent=true, desc="Debugger run last"})
set_keymap("n", "<space>dc", function() return require("dap").terminate() end, {silent=true, desc="Debugger terminate"})
set_keymap("n", "<space>di", function() return require("dap.ui.widgets").hover() end, {silent=true, desc="Debugger widget hover"})
set_keymap("n", "<space>d?", function()
                                local widgets=require("dap.ui.widgets")
                                widgets.centered_float(widgets.scopes)
                            end, {silent=true, desc="Debugger widget"})
set_keymap("n", "<space>dt", function() return require("dap-python").test_method() end, {silent=true, desc="Python debugger test method"})
set_keymap("n", "<space>do", function() return require("dap-python").test_class() end, {silent=true, desc="Python debugger test class"})
set_keymap("v", "<space>ds", function() return require("dap-python").debug_selection() end, {silent=true, desc="Python debugger debug selection"})
-- Trouble
set_keymap("n", "<space>xx", "<cmd>Trouble<cr>", opts)
set_keymap("n", "<space>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
set_keymap("n", "<space>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
set_keymap("n", "<space>xl", "<cmd>Trouble loclist<cr>", opts)
set_keymap("n", "<space>xq", "<cmd>Trouble quickfix<cr>", opts)
set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
-- zk
set_keymap("n", "<space>zn", "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", opts)
set_keymap("n", "<space>zt", "<cmd>:Telescope zk tags<cr>", opts)
set_keymap("n", "<space>zf", "<cmd>:Telescope zk notes<cr>", opts)

