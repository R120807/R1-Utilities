--[[
    

]]

local module = {}

const function withDefaults(defaults: {})
    return setmetatable({}, {__index = defaults})
end
const config = withDefaults({timeout = 30, retries = 5})

print(config.timeout)
print(config.retries)
config.retries = 5
print(config.retries)

return module