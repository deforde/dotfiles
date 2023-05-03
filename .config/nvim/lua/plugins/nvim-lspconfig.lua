local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local util = require "lspconfig.util"

local servers = { "clangd", "pyright", "rust_analyzer", "zls", "golangci_lint_ls", "gopls", "kotlin_language_server", "lua_ls", "omnisharp" };

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
    if client.name == "omnisharp" then
        client.server_capabilities.semanticTokensProvider = {
          full = vim.empty_dict(),
          legend = {
            tokenModifiers = { "static_symbol" },
            tokenTypes = {
              "comment",
              "excluded_code",
              "identifier",
              "keyword",
              "keyword_control",
              "number",
              "operator",
              "operator_overloaded",
              "preprocessor_keyword",
              "string",
              "whitespace",
              "text",
              "static_symbol",
              "preprocessor_text",
              "punctuation",
              "string_verbatim",
              "string_escape_character",
              "class_name",
              "delegate_name",
              "enum_name",
              "interface_name",
              "module_name",
              "struct_name",
              "type_parameter_name",
              "field_name",
              "enum_member_name",
              "constant_name",
              "local_name",
              "parameter_name",
              "method_name",
              "extension_method_name",
              "property_name",
              "event_name",
              "namespace_name",
              "label_name",
              "xml_doc_comment_attribute_name",
              "xml_doc_comment_attribute_quotes",
              "xml_doc_comment_attribute_value",
              "xml_doc_comment_cdata_section",
              "xml_doc_comment_comment",
              "xml_doc_comment_delimiter",
              "xml_doc_comment_entity_reference",
              "xml_doc_comment_name",
              "xml_doc_comment_processing_instruction",
              "xml_doc_comment_text",
              "xml_literal_attribute_name",
              "xml_literal_attribute_quotes",
              "xml_literal_attribute_value",
              "xml_literal_cdata_section",
              "xml_literal_comment",
              "xml_literal_delimiter",
              "xml_literal_embedded_expression",
              "xml_literal_entity_reference",
              "xml_literal_name",
              "xml_literal_processing_instruction",
              "xml_literal_text",
              "regex_comment",
              "regex_character_class",
              "regex_anchor",
              "regex_quantifier",
              "regex_grouping",
              "regex_alternation",
              "regex_text",
              "regex_self_escaped_character",
              "regex_other_escape",
            },
          },
          range = true,
        }
    end
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

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").kotlin_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern("kotlinLspClasspath.sh")
}

require("lspconfig").omnisharp.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
