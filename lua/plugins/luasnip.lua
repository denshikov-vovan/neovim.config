return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets"
  },

  config = function()
    local ls = require("luasnip")

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI"
    })

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {"./snippets/vscode/"}
    })

    -- require("luasnip.loaders.from_snipmate").lazy_load({
    --   paths = {"./snippets/snipmate/"}
    -- })
  end,
}
