local function default_header()
	return {
		"",
		"",
		"",
		"",
		"__     __                    ",
		"\\ \\   / /____   ____ _ _ __  ",
		" \\ \\ / / _ \\ \\ / / _` | '_ \\ ",
		"  \\ V / (_) \\ V / (_| | | | |",
		"   \\_/_\\___/_\\_/_\\__,_|_| |_|",
		"       / _` |/ _` |/ _` |    ",
		"      | (_| | (_| | (_| |    ",
		"       \\__, |\\__, |\\__, |    ",
		"          |_|   |_|   |_|    ",
		"",
		"",
		"",
		"",
	}
end

return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = default_header(),
				center = {
					{ icon = "󰙅 ", desc = "Open tree", key = "e", action = ":Neotree float" },
					{ icon = " ", desc = "Recent files", key = "r", action = ":Telescope oldfiles" },
					{ icon = " ", desc = "Find files", key = "f", action = ":Telescope find_files" },
					{ icon = " ", desc = "Find text", key = "w", action = ":Telescope live_grep" },
				},
			},
		})
	end,
}
