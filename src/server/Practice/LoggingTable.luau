const function logged(original)
    local proxy = {}

    setmetatable(proxy, {
        __index = original,
        
        __newindex = function(table, key, value)
            print(`setting key {key} to {value}`)
            rawset(original, key, value)
        end
    })

    return proxy
end

local t = logged({x = 1})
print(t.x)
t.x = 99
print(t.x)

return {}