return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "andrejlevkovitch/vim-lua-format",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.puglint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.flake8,
      },
    })
  end,
}
