local lives = 10
local range
local nRange
print("Welcome to GUESS THE NUMBER!")
print("The range starts from 0")
local function readRange()
    io.write("Input a number for the guess range: ")
    range = io.read()
    nRange = tonumber(range)
end
readRange()

local function game(rng)
    local randomNumber = math.random(0, rng)
    print(randomNumber)

    while lives > 0 do
        io.write("Guess the number: ")
        local guess = tonumber(io.read())

        if guess then
            if guess == randomNumber then
                print("You won!! The number was " .. randomNumber)
                break
            elseif guess < randomNumber then
                lives = lives - 1
                print("You have " .. lives .. " guesses left.")
                print("The number is higher!")
            elseif guess > randomNumber then
                lives = lives - 1
                print("You have " .. lives .. " guesses left.")
                print("The number is smaller!")
            end

            if lives == 0 then
                print("You lost! The number was: " .. randomNumber)
                break
            end
        else
            print("Enter a number!")
        end
    end
end

if nRange then
    game(nRange)
else
    print("Invalid input. Please enter a number.")
    readRange()
end
