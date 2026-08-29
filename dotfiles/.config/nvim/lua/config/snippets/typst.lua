---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local
return {
	s(
		{ trig = "math ", snippetType = "autosnippet" },
		fmta(
			[[
         $
            <>
         $
         ]],
			i(0)
		)
	),
	s(
		{ trig = "begin_src ", snippetType = "autosnippet" },
		fmta(
			[[
         ```<>
            <>
         ```
         ]],
			{ i(1, "lang"), i(0) }
		)
	),
}
