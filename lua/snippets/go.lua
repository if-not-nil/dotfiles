local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("nn", {
		t("if err != nil {"),
		t({ "", "\t" }),
		i(1, "// handle"),
		t({ "", "}" }),
	}),

	s("foot", {
		t('w.Header().Set("Content-Type", "application/json")'),
	}),
	s("jsonresponse", {
		t("json.NewEncoder(w).Encode("),
		i(1, "struct"),
		t(")"),
	}),
}
