return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup({})

		wk.register({
			e = { "<cmd>Neotree float reveal<cr>", "Neotree" },

			f = {
				name = "File",

				r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
				f = { "<cmd>Telescope find_files<cr>", "Find files" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				s = { "<cmd>Telescope live_grep<cr>", "Find string" },
				y = { "<cmd>lua require('telescope').extensions.yank_history.yank_history()<cr>", "Find yank" },
			},

			t = {
				name = "Terminal",

				f = { "<cmd>ToggleTerm direction=float<cr>", "Terminal float" },
				h = { "<cmd>ToggleTerm direction=horizontal", "Terminal horizontal" },
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
			},

			g = {
				name = "Git",

				g = { "<cmd>LazyGit<cr>", "Lazy git" },
				p = { "<cmd>LazyGitFilter<cr>", "Project commits" },
				f = { "<cmd>LazyGitFilterCurrentFile<cr>", "File commits" },
			},
		}, { prefix = "<leader>" })
	end,
}
