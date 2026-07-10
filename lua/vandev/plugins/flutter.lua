return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			widget_guides = { enabled = false },
			closing_tags = { enabled = false },
			dev_log = { enabled = false },
			lsp = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					local opts = { buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
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
