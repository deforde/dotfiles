local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local util = require "lspconfig.util"

local servers = { "clangd", "pyright", "rust_analyzer", "zls", "golangci_lint_ls", "gopls", "kotlin_language_server" };

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
}

require("lspconfig").pyright.setup {
    capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
}

require("lspconfig").zls.setup {
    capabilities = capabilities,
}

require("lspconfig").golangci_lint_ls.setup {
    capabilities = capabilities,
}

require("lspconfig").gopls.setup {
    capabilities = capabilities,
}

require("lspconfig").kotlin_language_server.setup {
    capabilities = capabilities,
    root_dir = util.root_pattern("kotlinLspClasspath.sh")
}
