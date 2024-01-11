local t1 = { "a", "b", "c" }
local t2 = { "d", "e", "f" }

print("Concat")
print(table.concat(t1, ",", 1, 3)) -- a,b,c

print("Move")
table.move(t1, 1, #t1, #t2 + 1, t2) -- source table, first index source table, last index source table, first index destination table, destination table
print(table.unpack(t2)) -- d e f a b c
print(table.unpack(t1)) -- a b c

print("Insert")
table.insert(t2, "g")
print(table.unpack(t2))

print("Remove")
print(table.remove(t2, #t2)) -- returns deleted value
print(table.unpack(t2))

print("Sort")
-- number and string mixed table fails
local t3 = { "x", "a", "p", "d", "e" }
local t4 = { 1, -12, 44, 245, 3, -41, 5.3 }
print(table.sort(t3))
print(table.unpack(t3))
print(table.sort(t4))
print(table.unpack(t4))
