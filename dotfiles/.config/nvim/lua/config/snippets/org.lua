---@diagnostic disable: undefined-global
---@diagnostic disable: unused-local

return {
    s(
        { trig = "src ", snippetType = "autosnippet" },
        fmta(
            [[
         #+begin_src <>
              <>
         #+end_src
         ]],
            { i(1, "lang"), i(0) }
        )
    ),
}
