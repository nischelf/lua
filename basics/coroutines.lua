local coGetYear = coroutine.create(function()
    return tonumber(os.date("%Y"))
end)

local coBirthyear = coroutine.create(function()
    io.write("Birthyear: ")
    return tonumber(io.read())
end)

local name = coroutine.create(function()
    io.write("Name: ")
    return io.read()
end)

local statusBirthyear, valueBirthyear = coroutine.resume(coBirthyear)
local statusGetYear, valueGetYear = coroutine.resume(coGetYear)
local statusName, valueName = coroutine.resume(name)
-- print(valueGetYear)
-- print(valueBirthyear)

local coGetAge = coroutine.create(function(byear, year)
    --  print(year, byear)
    return tonumber(year) - tonumber(byear)
end)

local statusGetAge, valueGetAge = coroutine.resume(coGetAge, valueBirthyear, valueGetYear)
print(valueGetAge)
print(valueName)
-- print(coroutine.resume(coGetAge, valueBirthyear, valueGetYear))
