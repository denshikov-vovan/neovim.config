return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"smartpde/telescope-recent-files",
			"vuki656/package-info.nvim",
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
					lazy = {},
					package_info = {
						theme = "ivy",
					},
				},
			})

			telescope.load_extension("recent_files")
			telescope.load_extension("package_info")
		end,
	},
}
