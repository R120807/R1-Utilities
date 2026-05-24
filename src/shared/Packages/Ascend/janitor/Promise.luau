--!optimize 2
--!strict
-- Partial types for Promise

const Packages = script.Parent.Parent
const Promise: any = if Packages:FindFirstChild("Promise") then (require :: any)(Packages.Promise) else nil 

export type Status = "Started" | "Resolved" | "Rejected" | "Cancelled"
export type ErrorKind = "ExecutionError" | "AlreadyCancelled" | "NotResolvedInTime" | "TimedOut"

type ErrorStaticAndShared = {
	Kind: {
		ExecutionError: "ExecutionError",
		AlreadyCancelled: "AlreadyCancelled",
		NotResolvedInTime: "NotResolvedInTime",
		TimedOut: "TimedOut",
	},
}

type ErrorOptions = {
    error: string,
    trace: string?,
    context: string,
    kind: ErrorKind
}

export type Error = typeof(setmetatable({}, _))