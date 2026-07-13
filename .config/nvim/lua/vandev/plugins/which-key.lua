return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>f",  group = "Find (Telescope)" },
			{ "<leader>g",  group = "Git" },
			{ "<leader>l",  group = "LSP" },
			{ "<leader>p",  group = "Explorer" },
		{ "<leader>s",  group = "Splits" },
		},
	},
}
