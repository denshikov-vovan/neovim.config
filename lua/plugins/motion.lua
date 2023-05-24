return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection

		hop.setup()

		local map = vim.keymap.set

		map("", "f", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })

		map("", "F", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })

		map("", "t", function()
			hop.hint_char2({ direction = directions.AFTER_CURSOR })
		end, { remap = true })

		map("", "T", function()
			hop.hint_char2({ direction = directions.BEFORE_CURSOR })
		end, { remap = true })
	end,
}
