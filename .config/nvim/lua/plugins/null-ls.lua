local null_ls = require("null-ls")

null_ls.setup({
    -- debug = true,
    sources = {
        -- null_ls.builtins.diagnostics.pylint.with({
        --     timeout = 30000,
        -- }),
        null_ls.builtins.diagnostics.flake8,
    },
})

