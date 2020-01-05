-- functions to test

local funcs = {}

local function fib(n)
   if n == 1 then
      return 0
   elseif n == 2 then
      return 1
   end
   return fib(n - 1) + fib(n - 2)
end
funcs.fib = fib

local function palindromize(str)
   return string.format("%s%s", str, string.reverse(str))
end
funcs.palindromize = palindromize

-- Copies first layer of the table and returns it
local function shallow_copy(tbl)
   local ret = {}
   for k, v in pairs(tbl) do
      ret[k] = v
   end
   return ret
end
funcs.shallow_copy = shallow_copy

-- -- Copies the table to nth depth and returns it
local function n_depth_copy(tbl, n)
   if n == -1 then return {} end

   local ret = {}
   for k, v in pairs(tbl) do
      if type(v) == "table" then
         ret[k] = n_depth_copy(v, n - 1)
      else
         ret[k] = v
      end
   end
   return ret
end
funcs.n_depth_copy = n_depth_copy

return funcs
