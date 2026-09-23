---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local

-- local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep

return {
	s(
		{ trig = "main ", snippetType = "autosnippet" },
		fmta(
			[[
            int main (int argc, char *argv[])
            {
                <>
                return 0;
            }
      ]],
			i(1)
		)
	),
	s({ trig = "nodi ", snippetType = "autosnippet" }, t("[[nodiscard]] ")),
	s({ trig = "nodic ", snippetType = "autosnippet" }, t("[[nodiscard]] constexpr ")),
	s({ trig = "cexpr ", snippetType = "autosnippet" }, t("constexpr ")),
	s(
		{ trig = "clas ", snippetType = "autosnippet" },
		fmta(
			[[
      class <>
      {
         <>
      };
      ]],
			{ i(1, "Class"), i(2) }
		)
	),
	s(
		{ trig = "stru ", snippetType = "autosnippet" },
		fmta(
			[[
      struct <>
      {
         <>
      };
      ]],
			{ i(1, "Struct"), i(2) }
		)
	),
	s(
		{ trig = "doxy ", snippetType = "autosnippet" },
		fmta(
			[[
         /**
          *  <>
          */
      ]],
			{ i(0) }
		)
	),
}
