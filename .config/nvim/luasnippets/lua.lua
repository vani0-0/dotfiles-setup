local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

return {
	s("fn", {
		t("local function "),
		i(1, "name"),
		t("("),
		i(2, ""),
		t({ ")", "\t" }),
		i(3, ""),
		t({ "", "end" }),
	}),

	s("req", {
		t("local "),
		i(1, "name"),
		t(' = require("'),
		i(2, "module"),
		t('")'),
	}),

	s("p", {
		t("print("),
		i(1, ""),
		t(")"),
	}),

	s("map", {
		t('vim.keymap.set("'),
		i(1, "n"),
		t('", "'),
		i(2, "<leader>"),
		t('", '),
		i(3, ""),
		t(', { desc = "'),
		i(4, "description"),
		t('" })'),
	}),
}
