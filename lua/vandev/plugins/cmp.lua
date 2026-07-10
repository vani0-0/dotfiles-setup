return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",  -- LSP completions
		"hrsh7th/cmp-buffer",    -- completions from current file
		"hrsh7th/cmp-path",      -- file path completions
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),   -- trigger manually
				["<C-e>"] = cmp.mapping.abort(),          -- close the popup
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
				["<Tab>"] = cmp.mapping.select_next_item(), -- next item
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous item
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
