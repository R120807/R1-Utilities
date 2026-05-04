const Counter = {}
Counter.__index = Counter

function Counter.new(start)
    return setmetatable({
        count = start
    }, Counter)
end

function Counter:increment()
    self.count += 1
end

function Counter:decrement()
    self.count -= 1
end

function Counter:reset()
    self.count = 0
end

function Counter:value()
    return self.count
end

return Counter
