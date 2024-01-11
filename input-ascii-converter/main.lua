#!/usr/bin/env lua
local styles = {
    reset = "\27[0m",
    bold = "\27[1m",
    underline = "\27[4m",
    yellow = "\27[33m",
}

print(styles.bold .. styles.underline .. "ASCII Table" .. styles.reset)
io.write("Enter Text: ")
local value = io.read()

print(styles.bold .. string.format("%-4s| %-4s| %-4s| %-4s", "char", "dec", "hex", "oct") .. styles.reset)
for i = 1, #value do
    local char = value:sub(i, i)
    local dec = tonumber(char:byte())
    local hex = string.format("%x", dec)
    local oct = string.format("%o", dec)
    -- print(char .. ": " .. dec .. ": " .. hex .. ": " .. oct)
    if i % 2 == 0 then
        print(styles.yellow .. string.format("%-4s| %-4d| %-4s| %-3s", char, dec, hex, oct) .. styles.reset)
    else
        print(string.format("%-4s| %-4d| %-4s| %-3s", char, dec, hex, oct))
    end
end
