local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- JS
    null_ls.builtins.diagnostics.eslint_d,

    -- Markdown
    -- null_ls.builtins.diagnostics.markdownlint,
  },
})
