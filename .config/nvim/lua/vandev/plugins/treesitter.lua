return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "dart", "javascript", "typescript", "python" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
