local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.clangd.setup {
    cmd = {
        "clangd",
        "--clang-tidy",
        "-j=8",
        "--compile-commands-dir=./build/",
    },
    flags = {
        debounce_text_changes = 150,
    },
}

require'lspconfig'.pyright.setup {
    flags = {
        debounce_text_changes = 150,
    },
}

