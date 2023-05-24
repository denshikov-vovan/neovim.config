return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		opts = {
			context_commentstring = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,

				disable = function(lang, bufnr)
					return lang == "typescript" and vim.api.nvim_buf_line_count(bufnr) > 5000
				end,
			},
			ensure_installed = {
				"gitignore",
				"gitcommit",
				"html",
				"css",
				"scss",
				"pug",
				"javascript",
				"typescript",
				"tsx",
				"vue",
				"svelte",
				"dockerfile",
				"json",
				"python",
				"lua",
				"vim",
				"markdown",
				"markdown_inline",
				"query",
				"sql",
				"regex",
				"bash",
				"diff",
				"dot",
				"yaml",
				"toml",
			},
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<c-backspace>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			local ts_utils = require("nvim-treesitter.ts_utils")

			ts_utils.get_node_text = vim.treesitter.query.get_node_text
		end,
	},
}
