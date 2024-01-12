local name = coroutine.create(function()
    io.write("Enter your name: ")
    return io.read()
end)

for j = 1, 10, 1 do
    print(j)
end

local stName, valName = coroutine.resume(name)

print(valName)
