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
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"gbprod/yanky.nvim",
		opts = {
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 300,
			},
		},
	},
}
