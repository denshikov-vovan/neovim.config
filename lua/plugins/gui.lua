return {
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "vuki656/package-info.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
}
