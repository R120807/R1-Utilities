--!native
--!optimize 2
--!strict
 
const FreeThreads: {thread} = table.create(500)

const function RunFunction<Arguments...>(callback: (Arguments...) -> (), thread: thread, ...: Arguments...)
    callback(...)
    table.insert(FreeThreads, thread)
end

const function Yield()
    while true do
        RunFunction(coroutine.yield())
    end
end

const function FastDefer<Arguments...>(callback: (Arguments...) -> (), ...: Arguments...): thread
	local thread: thread
	const freeAmount = #FreeThreads

	if freeAmount > 0 then
		thread = FreeThreads[freeAmount]
        FreeThreads[freeAmount] = nil
	else
        thread = coroutine.create(Yield)
        coroutine.resume(thread)
	end

    return task.defer(thread, callback, thread, ...)
end

return FastDefer