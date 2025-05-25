local s = 'Hello, World!'
local x = string.sub(s, 0, 0)
assert(x ~= nil)
assert(x == '')
