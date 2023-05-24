return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
	},
	cmd = "Telescope",
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("yank_history")
	end,
}
