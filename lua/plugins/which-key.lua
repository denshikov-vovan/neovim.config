return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({})

    wk.register({
      e = { "<cmd>Neotree float reveal<cr>", "Neotree" },

      s = {
        name = "Search",

        r = { "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Recent files" },
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        s = { "<cmd>Telescope live_grep<cr>", "Find string" },
        y = { "<cmd>Telescope yank_history<cr>", "Find yank" },
        p = { "<cmd>Telescope package_info<cr>", "NPM package info" },
        d = { "<cmd>lua require('telescope.builtin').diagnostics({ bufnr = 0 })<cr>", "Diagnostic" },
        D = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "Full diagnostic" },
      },

      h = {
        a = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Add file" },
        h = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Show files" },
      },

      t = {
        name = "Terminal",

        f = { "<cmd>ToggleTerm direction=float<cr>", "Terminal float" },
        h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Terminal horizontal" },
      },

      b = {
        name = "Buffers",

        n = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
        p = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
        x = { "<cmd>BufferLinePickClose<cr>", "Pick to close" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
        r = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
        j = { "<cmd>BufferLinePick<cr>", "Pick to jump" },
        c = { "<cmd>bdelete %<cr>", "Close currernt" },
      },

      u = {
        name = "Util",

        l = { "<cmd>Lazy<cr>", "Lazy" },
        m = { "<cmd>Mason<cr>", "Mason" },
        e = { "<cmd>Neotree reveal<cr>", "Explorer" },
        g = { "<cmd>VimBeGood<cr>", "Game VIM be good" },
      },

      g = {
        name = "Git",

        g = { "<cmd>LazyGit<cr>", "Lazy git" },
        p = { "<cmd>LazyGitFilter<cr>", "Project commits" },
        f = { "<cmd>LazyGitFilterCurrentFile<cr>", "File commits" },
        b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Git blame" },
        d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
      },
    }, { prefix = "<leader>" })
  end,
}
