local JestGlobals = require({{jestGlobalsRequirePath}})
local expect = JestGlobals.expect
type JestGlobals = typeof(JestGlobals)

return function()
    describe("{{ModuleName}}", function()
        it("{{behavior}}", function()
            local Module = require({{moduleRequirePath}})
            expect(Module.{{functionName}}({{args}})).toBe({{expected}})
        end)
    end)
end
