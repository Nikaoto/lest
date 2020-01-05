-- functions.test.lua (tests for the sample functions)

package.path = package.path .. ";../?.lua"

local print_table = require ("print_table")
local funcs = require ("example/functions")
local lest = require ("lest")

local expect = lest.expect
local group = lest.group

expect(funcs.fib(1)).to_be(0)
expect(funcs.fib(2)).to_be(1)
expect(funcs.fib(20)).to_be(4181)
expect(funcs.fib(10)).to_be(34)
expect(funcs.palindromize("a")).to_be("aa")

group("fibonacci", function ()
         expect(funcs.fib(1)).to_be(0)
         expect(funcs.fib(10)).to_be(34)
         expect(funcs.fib(20)).to_be(4181)
end)

group("palindromize", function()
         expect(funcs.palindromize("a")).to_be("aa")
         expect(funcs.palindromize("ab")).to_be("abba")
         expect(funcs.palindromize("ma")).to_be("maam")
         expect(funcs.palindromize("mama")).to_be("mamaamam")
         expect(funcs.palindromize("mama mia")).to_be("mama miaaim amam")
end)

group("shallow_copy", function()
         expect(funcs.shallow_copy({ 1, 2, 3, 4 })).to_be({ 1, 2, 3, 4 })
         local t = { 1, 2, 3 }
         expect(funcs.shallow_copy({ "hey", t })).to_be({ "hey", t })
         expect(funcs.shallow_copy({ "hey", { 1, 2, 3 } })).to_be({ "hey", t })
         expect(funcs.shallow_copy({ "hey", t })).to_be({ "hey", { 1, 2, 3 } })
         expect(funcs.shallow_copy({ 1 })).to_subset({ 1, 2 })
         expect(funcs.shallow_copy({ 1 })).to_superset({ })
         expect(funcs.shallow_copy({ 1, 2 })).to_superset({ 1 })
         expect(funcs.shallow_copy({ 1, 2 })).to_superset({ [2] = 2 })
         expect(funcs.shallow_copy({ 2, 1 })).to_superset({ 2 })
end)

group("n_depth_copy", function()
         local t = { 1, 2, 3, {"veni", {"vidi", {"vici"} } } }
         expect(funcs.n_depth_copy(t, 0)).to_be({1, 2, 3, {}})
         expect(funcs.n_depth_copy(t, 1)).to_be(
            {1, 2, 3, {"veni", {} } })
         expect(funcs.n_depth_copy(t, 2)).to_be(
            {1, 2, 3, {"veni", {"vidi", {} } } })
         expect(funcs.n_depth_copy(t, 3)).to_be(
            {1, 2, 3, {"veni", {"vidi", {"vici"} } } })
end)

lest.print_stats()
