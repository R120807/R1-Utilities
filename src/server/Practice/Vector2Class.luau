const Vector2 = {}
Vector2.__index = Vector2

function Vector2.new(x, y)
    const instance = {x = x, y = y}
    setmetatable(instance, Vector2)
    return instance
end

function Vector2.__tostring(value)
    return "(" .. value.x .. ", " .. value.y .. ")"
end

function Vector2.__add(a, b)
    return Vector2.new(a.x + b.x, a.y + b.y)
end

function Vector2.__sub(a, b)
    return Vector2.new(a.x - b.x, a.y - b.y)
end

function Vector2.__eq(a, b)
    return a.x == b.x and a.y == b.y
end

function Vector2.__mul(a, b)
    if type(a) == "number" then
        return Vector2.new(a * b.x, a * b.y)
    elseif type(b) == "number" then
        return Vector2.new(a.x * b, a.y * b)
    else
        return Vector2.new(a.x * b.x, a.y * b.y)
    end
end

return Vector2