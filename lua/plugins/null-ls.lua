return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "andrejlevkovitch/vim-lua-format", "davidmh/cspell.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local cspell = require("cspell")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local c_spell_config = {
      find_json = function()
        return "/Users/vovan/.config/nvim/vim/spell/cspell.json"
      end,
    }

    null_ls.setup({
      sources = {
        cspell.diagnostics.with({ config = c_spell_config }),
        null_ls.builtins.diagnostics.tsc,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.puglint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.flake8,

        null_ls.builtins.code_actions.eslint_d,
        cspell.code_actions.with({ config = c_spell_config }),

        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
