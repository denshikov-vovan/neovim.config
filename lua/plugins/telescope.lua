return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "smartpde/telescope-recent-files", opts = {} },
      { "vuki656/package-info.nvim",       opts = {} },
      "gbprod/yanky.nvim",
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          recent_files = {
            only_cwd = true,
            show_current_file = true,
            ignore_patterns = {
              "/vim/",
              "/node_modules",
            },
          },
          package_info = {},
          yank_history = {},
        },
      })

      telescope.load_extension("yank_history")
      telescope.load_extension("recent_files")
      telescope.load_extension("package_info")
    end,
  },
}
