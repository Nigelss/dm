---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local

return {
	s(
		{ trig = "bash ", snippetType = "autosnippet" },
		fmta(
			[[
      #!/usr/bin/env bash
      <>
          ]],
			i(0)
		)
	),
}
