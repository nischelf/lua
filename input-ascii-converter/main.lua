#!/usr/bin/env lua

local value = io.read()

for i = 1, #value do
    local char = value:sub(i, i)
    local ascii = char:byte()
    print(char .. ": " .. ascii)
end
