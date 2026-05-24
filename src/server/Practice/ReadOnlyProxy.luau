--[[
    The proxy is created inside of the function, so each call to readOnly makes a fresh one (local proxy = {})

    For __index = t, the original table is utilized instead of a function. When a key is missng on proxy, luau looks it up directly on `t`

    error("...", 2) blames the caller's line, not the line inside the function

    setmetatable(proxy, mt) then return proxy - is setting the metatable directly on the proxyTable
]]

local normalTbl = {}

const function readOnly(t)
   local mt = {
        __index = t,

        __newindex = function(table, key, value)  
            error("Attempting to modify a read-only table", 2)
        end,
   }

   setmetatable(normalTbl, mt)
   return normalTbl
end

local original = {x = 10, y = 10}
local safeTable = readOnly(original)

print(safeTable.x)
original.x = 99
print(safeTable.x)
safeTable.x = 1

return {}