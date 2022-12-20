local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local util = require "lspconfig.util"

local servers = { "clangd", "pyright", "rust_analyzer", "zls", "golangci_lint_ls", "gopls", "kotlin_language_server" };

local set_keymap = vim.keymap.set
local on_attach = function(client, bufnr)
    set_keymap("n", "<space>e", vim.diagnostic.open_float, {noremap=true, buffer=bufnr, silent=true, desc="LSP open float"})
    set_keymap("n", "[d", vim.diagnostic.goto_prev, {noremap=true, buffer=bufnr, silent=true, desc="LSP goto prev"})
    set_keymap("n", "]d", vim.diagnostic.goto_next, {noremap=true, buffer=bufnr, silent=true, desc="LSP goto next"})
    set_keymap("n", "<space>q", vim.diagnostic.setloclist, {noremap=true, buffer=bufnr, silent=true, desc="LSP set loc list"})
    set_keymap("n", "gD", vim.lsp.buf.declaration, {noremap=true, buffer=bufnr, silent=true, desc="LSP declaration"})
    set_keymap("n", "gd", vim.lsp.buf.definition, {noremap=true, buffer=bufnr, silent=true, desc="LSP definition"})
    set_keymap("n", "K", vim.lsp.buf.hover, {noremap=true, buffer=bufnr, silent=true, desc="LSP hover"})
    set_keymap("n", "gi", vim.lsp.buf.implementation, {noremap=true, buffer=bufnr, silent=true, desc="LSP implementation"})
    set_keymap("n", "gk", vim.lsp.buf.signature_help, {noremap=true, buffer=bufnr, silent=true, desc="LSP signature help"})
    set_keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {noremap=true, buffer=bufnr, silent=true, desc="LSP add workspace folder"})
    set_keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {noremap=true, buffer=bufnr, silent=true, desc="LSP remove workspace folder"})
    set_keymap("n", "<space>wl", function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end, {noremap=true, buffer=bufnr, silent=true, desc="LSP inspect workspace folders"})
    set_keymap("n", "<space>D", vim.lsp.buf.type_definition, {noremap=true, buffer=bufnr, silent=true, desc="LSP type definition"})
    set_keymap("n", "<space>rn", vim.lsp.buf.rename, {noremap=true, buffer=bufnr, silent=true, desc="LSP rename"})
    set_keymap("n", "<space>ca", vim.lsp.buf.code_action, {noremap=true, buffer=bufnr, silent=true, desc="LSP code action"})
    set_keymap("n", "gr", vim.lsp.buf.references, {noremap=true, buffer=bufnr, silent=true, desc="LSP references"})
    set_keymap("n", "<space>fm", vim.lsp.buf.format, {noremap=true, buffer=bufnr, silent=true, desc="LSP formatting"})
    set_keymap("n", "gh", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
end

require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = servers,
}

require("lspconfig").clangd.setup {
    cmd = {
        "clangd",
        "--clang-tidy",
        "-j=8",
        "--compile-commands-dir=./build/",
        "--fallback-style=llvm",
        "--enable-config",
    },
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").zls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").golangci_lint_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").kotlin_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern("kotlinLspClasspath.sh")
}
