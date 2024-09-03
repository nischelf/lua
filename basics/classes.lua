Dog = {}

function Dog:new()
    newObj = { sound = "woof" } -- newObj is an instance of Dog
    self.__index = self -- class being instantiated
    return setmetatable(newObj, self)
end

function Dog:makeSound()
    print("I say " .. self.sound)
end

mrDog = Dog:new()
mrDog:makeSound() -- "I say woof"

msDog = Dog.new(Dog)
msDog.makeSound(mrDog) -- equivalent to mrDog:makeSound()

-- Inherit from Dog
LoudDog = Dog:new()

-- Override the makeSound method for LoudDog
function LoudDog:makeSound()
    s = self.sound .. " "
    print(s .. s .. s)
end

bigDog = LoudDog:new()
bigDog:makeSound() -- "woof woof woof"
mrDog:makeSound() -- "I say woof"
