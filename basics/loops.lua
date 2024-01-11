print("while")
local x = 0
while x < 10 do
    print(x)
    x = x + 1
end

print("repeat until")
local i = 0
repeat
    print(i)
    i = i + 1
until i == 10

print("for")
for y = 0, 10 do
    print(y)
end

print("for in")
list = { "a", "b", "c" }

for Index, Value in pairs(list) do
    print(Index, Value)
end
