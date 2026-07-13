return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local on_attach = require("vandev.lsp_on_attach").on_attach

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
				automatic_installation = true,
			})

			vim.lsp.config("lua_ls", { on_attach = on_attach })
			vim.lsp.enable("lua_ls")
		end,
	},
}
