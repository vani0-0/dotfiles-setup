local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

return {
	s("cl", {
		t("console.log("),
		i(1, ""),
		t(")"),
	}),

	s("cle", {
		t("console.error("),
		i(1, ""),
		t(")"),
	}),

	s("cons", {
		t("const "),
		i(1, "name"),
		t(" = "),
		i(2, "value"),
	}),

	s("let", {
		t("let "),
		i(1, "name"),
		t(" = "),
		i(2, "value"),
	}),

	s("fn", {
		t("function "),
		i(1, "name"),
		t("("),
		i(2, ""),
		t({ ") {", "\t" }),
		i(3, ""),
		t({ "", "}" }),
	}),

	s("afn", {
		t("const "),
		i(1, "name"),
		t(" = ("),
		i(2, ""),
		t({ ") => {", "\t" }),
		i(3, ""),
		t({ "", "}" }),
	}),

	s("imp", {
		t('import '),
		i(1, "name"),
		t(' from "'),
		i(2, "module"),
		t('"'),
	}),

	s("ife", {
		t("if ("),
		i(1, "condition"),
		t({ ") {", "\t" }),
		i(2, ""),
		t({ "", "} else {", "\t" }),
		i(3, ""),
		t({ "", "}" }),
	}),

	s("fore", {
		t("for (const "),
		i(1, "item"),
		t(" of "),
		i(2, "array"),
		t({ ") {", "\t" }),
		i(3, ""),
		t({ "", "}" }),
	}),
}
