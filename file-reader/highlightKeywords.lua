local colors = require("colors")

local luaKeywords = {
    "if",
    "then",
    "else",
    "elseif",
    "local",
    "end",
    "return",
    "function",
    "for",
    "do",
    "require",
    "nil",
    "print",
}

local M = {}

function M.highlightLua(content)
    -- Iterate through the target strings and replace them with #target#
    for _, keyword in ipairs(luaKeywords) do
        content = content:gsub(keyword, colors.yellow .. keyword .. colors.reset)
    end
    return content
end

return M
