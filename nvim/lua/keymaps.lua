local opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap
-- Term
set_keymap("t", "<space><Esc>", "<C-\\><C-n>", opts)
-- Windows
set_keymap("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
set_keymap("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
set_keymap("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
set_keymap("n", "<C-l>", "<cmd>wincmd l<CR>", opts)
-- Tabs
set_keymap("n", "<C-n>", "<cmd>tabnew<cr>", opts)
set_keymap("n", "<C-x>", "<cmd>tabclose<cr>", opts)
-- NERDTree
set_keymap("n", "<C-b>", "<cmd>NERDTreeToggle<cr>", opts)
-- Telescope
set_keymap("n", "<space>ff", "<cmd>Telescope find_files<cr>", opts)
set_keymap("n", "<space>fg", "<cmd>Telescope live_grep<cr>", opts)
set_keymap("n", "<space>fb", "<cmd>Telescope buffers<cr>", opts)
set_keymap("n", "<space>fh", "<cmd>Telescope help_tags<cr>", opts)
-- LSP
set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
set_keymap("n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
-- DAP
set_keymap("n", "<F5>", "<cmd>lua require\"dap\".continue()<CR>", opts)
set_keymap("n", "<F6>", "<cmd>lua require\"dap\".step_over()<CR>", opts)
set_keymap("n", "<F11>", "<cmd>lua require\"dap\".step_into()<CR>", opts)
set_keymap("n", "<F12>", "<cmd>lua require\"dap\".step_out()<CR>", opts)
set_keymap("n", "<space>b", "<cmd>lua require\"dap\".toggle_breakpoint()<CR>", opts)
set_keymap("n", "<space>B", "<cmd>lua require\"dap\".set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>", opts)
set_keymap("n", "<space>lp", "<cmd>lua require\"dap\".set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>", opts)
set_keymap("n", "<space>dr", "<cmd>lua require\"dap\".repl.toggle({}, \"vsplit\")<CR><C-w>l", opts)
set_keymap("n", "<space>dl", "<cmd>lua require\"dap\".run_last()<CR>", opts)
set_keymap("n", "<space>dc", "<cmd>lua require\"dap\".terminate()<CR>", opts)
set_keymap("n", "<space>di", "<cmd>lua require\"dap.ui.widgets\".hover()<CR>", opts)
set_keymap("n", "<space>d?", "<cmd>lua local widgets=require\"dap.ui.widgets\";widgets.centered_float(widgets.scopes)<CR>", opts)
-- Trouble
set_keymap("n", "<space>xx", "<cmd>Trouble<cr>", opts)
set_keymap("n", "<space>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
set_keymap("n", "<space>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
set_keymap("n", "<space>xl", "<cmd>Trouble loclist<cr>", opts)
set_keymap("n", "<space>xq", "<cmd>Trouble quickfix<cr>", opts)
set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

