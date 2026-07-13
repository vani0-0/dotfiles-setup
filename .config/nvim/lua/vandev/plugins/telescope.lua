return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = " ",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				preview = {
					treesitter = false,
				},
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-d>"] = actions.delete_buffer,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
				},
				live_grep = {
					additional_args = { "--hidden" },
				},
			},
		})
	end,
}
