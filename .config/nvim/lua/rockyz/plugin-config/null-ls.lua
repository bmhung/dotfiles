local null_ls = require("null-ls")
null_ls.setup({
  debug = true,
  sources = {
    -- JS
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,

    -- Markdown
    -- null_ls.builtins.diagnostics.markdownlint,
  },
})
