return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				on_attach = function(_, bufnr)
					local opts = { buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)       -- go to definition
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)             -- show docs
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)   -- rename symbol
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code actions
				end,
			},
		})
	end,
}
