return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local g = vim.g

		g.lazygit_floating_window_winblend = 0
		g.lazygit_floating_window_scaling_factor = 0.9
		g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
		g.lazygit_floating_window_use_plenary = 0
		g.lazygit_use_neovim_remote = 1
		g.lazygit_use_custom_config_file_path = 0
		g.lazygit_config_file_path = ""
	end,
}
