return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local on_attach = require("vandev.lsp_on_attach").on_attach

		require("flutter-tools").setup({
			widget_guides = { enabled = false },
			closing_tags = { enabled = false },
			dev_log = { enabled = false },
			lsp = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = on_attach,
				settings = {
					dart = {
						enableSdkFormatter = false,
						onlyAnalyzeProjectsWithOpenFiles = true,
						analysisExcludedFolders = {
							vim.fn.expand("$HOME/.pub-cache"),
							vim.fn.expand("$FLUTTER_ROOT/packages"),
							vim.fn.expand("$FLUTTER_ROOT/bin/cache"),
						},
					},
				},
			},
		})
	end,
}
