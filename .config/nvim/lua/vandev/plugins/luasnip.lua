local M = {}

function M.setup()
	local ls = require('luasnip')

	ls.config.setup {
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	}

	require('luasnip.loaders.from_vscode').lazy_load()
end

return M

