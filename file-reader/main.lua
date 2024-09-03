-- Get file
local tArgs = { ... }
-- Check if file was given
if #tArgs == 0 then
    print("Usage: lua main.lua <file>")
    return
end

-- chek if file exists
function DoesFileExists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local existsFile = DoesFileExists(tArgs[1])
if existsFile == false then
    print("File not found")
    return
end

local file = io.open(tArgs[1], "r")
if file == nil then
    print("Error opening file")
    return
end
local content = file:read("*a")

file:close()

function Get_file_extension(filename)
    return filename:match("^.+(%..+)$")
end

local fileExtension = Get_file_extension(tArgs[1])

local highligther = require("highlightKeywords")

if fileExtension == ".lua" then
    local highlightedContent = highligther.highlightLua(content)
    print(highlightedContent)
else
    print(content)
end
