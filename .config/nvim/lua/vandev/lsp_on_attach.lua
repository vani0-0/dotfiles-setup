local M = {}

M.on_attach = function(_, bufnr)
	local map = function(mode, keys, func, desc)
		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
	end

	-- Navigation
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	map("n", "gr", function() require("telescope.builtin").lsp_references() end, "References")
	map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

	-- Docs
	map("n", "K", vim.lsp.buf.hover, "Hover docs")
	map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

	-- Actions
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

	-- Diagnostics
	map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
	map("n", "<leader>dd", vim.diagnostic.open_float, "Show diagnostic")
end

return M
