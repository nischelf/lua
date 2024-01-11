#!/usr/bin/env lua
-- ANSI escape codes for text formatting
local styles = {
    reset = "\27[0m",
    bold = "\27[1m",
    underline = "\27[4m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
}

local todoList = {}

local optionsList = {
    { command = "h help", desc = "show help display" },
    { command = "q exit", desc = "exits todoList" },
    { command = "add", desc = "add a new task" },
    { command = "list", desc = "list all tasks" },
    { command = "lsc 'list --showcase'", desc = "lists tasks with dummy data" },
}

while true do
    io.write("Exec a command: ")
    local whatToDo = io.read()

    local function addTask()
        local task = {}

        io.write("Task name: ")
        task["title"] = io.read()

        io.write("Description: ")
        task["desc"] = io.read()

        return table.insert(todoList, task)
    end

    local function listTodos(list)
        for key, task in ipairs(list) do
            print(styles.green .. styles.underline .. styles.bold .. "Task " .. key .. ":" .. styles.reset)
            print(styles.yellow .. "Name:" .. styles.reset, task["title"])
            print(styles.yellow .. "Description:" .. styles.reset, task["desc"])
            print() -- Add an empty line for better readability
        end
    end

    local function listShowcase()
        local showCaseList = {}
        local initialVal1 = { title = "initVal 1", desc = "initial Value 1" }
        local initialVal2 = { title = "initVal 2", desc = "initial Value 2" }

        table.insert(showCaseList, initialVal1)
        table.insert(showCaseList, initialVal2)

        listTodos(showCaseList)
    end

    local function listOptions(options)
        for _, option in ipairs(options) do
            print(styles.yellow .. styles.bold .. option["command"] .. styles.reset, option["desc"])
        end
    end

    -- Input Control menu
    if whatToDo == "add" then
        addTask()
    elseif whatToDo == "list" or whatToDo == "ls" then
        listTodos(todoList)
    elseif whatToDo == "exit" or whatToDo == "q" then
        print(styles.green .. "Good bye 󱠡")
        os.exit()
    elseif whatToDo == "h" or whatToDo == "help" then
        listOptions(optionsList)
    elseif whatToDo == "list --showcase" or whatToDo == "lsc" then
        listShowcase()
    else
        print(styles.red .. styles.bold .. "unknown option")
        listOptions(optionsList)
    end
end
