--!strict
-- Dev-only test runner. Place under ServerScriptService/Tests or run from a Rojo-managed test place.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.Packages.TestEZ)
local tests = script.Parent

local results = TestEZ.TestBootstrap:run({ tests }, TestEZ.Reporters.TextReporter)

if results.failureCount > 0 then
    error(`Tests failed: {results.failureCount}`)
end
