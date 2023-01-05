local opts = { silent=true }

-- General
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", opts)

-- Term
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>", opts)

-- Buffers
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", opts)
vim.keymap.set("n", "]B", "<cmd>blast<CR>", opts)
vim.keymap.set("n", "[B", "<cmd>bfirst<CR>", opts)

-- Windows
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)
vim.keymap.set("n", "<C-Up>", "<cmd>wincmd +<CR>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>wincmd -<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>wincmd <lt><CR>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>wincmd ><CR>", opts)
vim.keymap.set("n", "<C-q>", "<cmd>wincmd =<CR>", opts)

-- Tabs
-- vim.keymap.set("n", "<C-n>", "<cmd>tabnew<cr>", opts)
-- vim.keymap.set("n", "<C-x>", "<cmd>tabclose<cr>", opts)

-- Telescope
vim.keymap.set("n", "<space>ff", function() return require("telescope.builtin").find_files({previewer=false}) end, {silent=true, desc="Telescope find files"})
vim.keymap.set("n", "<space>fg", function() return require("telescope.builtin").live_grep() end, {silent=true, desc="Telescope live grep"})
vim.keymap.set("n", "<space>fb", function() return require("telescope.builtin").buffers() end, {silent=true, desc="Telescope buffers"})
vim.keymap.set("n", "<space>fh", function() return require("telescope.builtin").help_tags() end, {silent=true, desc="Telescope help tags"})

-- DAP
vim.keymap.set("n", "<F5>", function() return require("dap").continue() end, {silent=true, desc="Debugger launch/continue"})
vim.keymap.set("n", "<F6>", function() return require("dap").step_over() end, {silent=true, desc="Debugger step over"})
vim.keymap.set("n", "<F11>", function() return require("dap").step_into() end, {silent=true, desc="Debugger step into"})
vim.keymap.set("n", "<F12>", function() return require("dap").step_out() end, {silent=true, desc="Debugger step out"})
vim.keymap.set("n", "<space>b", function() return require("dap").toggle_breakpoint() end, {silent=true, desc="Debugger toggle breakpoint"})
vim.keymap.set("n", "<space>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, {silent=true, desc="Debugger set conditional breakpoint"})
vim.keymap.set("n", "<space>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, {silent=true, desc="Debugger set log point"})
vim.keymap.set("n", "<space>dr", function() require"dap".repl.toggle({}, "vsplit") end, {silent=true, desc="Debugger toggle REPL"})
vim.keymap.set("n", "<space>dl", function() return require("dap").run_last() end, {silent=true, desc="Debugger run last"})
vim.keymap.set("n", "<space>dd", function() return require("dap").terminate() end, {silent=true, desc="Debugger terminate"})
vim.keymap.set("n", "<space>di", function() return require("dap.ui.widgets").hover() end, {silent=true, desc="Debugger widget hover"})
vim.keymap.set("n", "<space>d?", function()
    local widgets=require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
  end, {silent=true, desc="Debugger widget"})
vim.keymap.set("n", "<space>dc", function() return require("dapui").close() end, {silent=true, desc="Debugger terminate"})
vim.keymap.set("n", "<space>dt", function() return require("dap-python").test_method() end, {silent=true, desc="Python debugger test method"})
vim.keymap.set("n", "<space>do", function() return require("dap-python").test_class() end, {silent=true, desc="Python debugger test class"})
vim.keymap.set("v", "<space>ds", function() return require("dap-python").debug_selection() end, {silent=true, desc="Python debugger debug selection"})

-- Trouble
vim.keymap.set("n", "<space>xx", "<cmd>Trouble<cr>", opts)
vim.keymap.set("n", "<space>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<space>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
vim.keymap.set("n", "<space>xl", "<cmd>Trouble loclist<cr>", opts)
vim.keymap.set("n", "<space>xq", "<cmd>Trouble quickfix<cr>", opts)
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- Quickfix List
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "]Q", "<cmd>clast<cr>", opts)
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", opts)
vim.keymap.set("n", "[Q", "<cmd>cfirst<cr>", opts)

-- zk
vim.keymap.set("n", "<space>zn", "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", opts)
vim.keymap.set("n", "<space>zt", "<cmd>:Telescope zk tags<cr>", opts)
vim.keymap.set("n", "<space>zf", "<cmd>:Telescope zk notes<cr>", opts)

-- undo tree
vim.keymap.set("n", "<space>u", "<cmd>UndotreeToggle<cr>", opts)

-- utility
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>P", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
