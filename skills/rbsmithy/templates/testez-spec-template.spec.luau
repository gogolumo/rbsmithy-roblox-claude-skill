return function()
    describe("{{ModuleName}}", function()
        it("{{behavior}}", function()
            local Module = require({{moduleRequirePath}})

            local result = Module.{{functionName}}({{args}})

            expect(result).to.equal({{expected}})
        end)
    end)
end
