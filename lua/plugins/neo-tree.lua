return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      opts = {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
        other_win_hl_color = "#e35e4f",
      },
    },
  },
  config = function()
    local define = vim.fn.sign_define

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            -- Status type
            uuntracked = "",
            ignored = "",
            unstaged = "󰀥",
            staged = "",
            conflict = "",
          },
        },
      },
    })
  end,
  cmd = "Neotree",
}
