return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]], -- Ctrl+\ to toggle
			direction = "horizontal", -- opens at the bottom
			size = 15, -- height of the terminal
		})
	end,
}
