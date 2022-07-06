local funcs = require'utils'
local gameOver = false
local guessed_letters = {}
local lives = 3
local progress = ''
local word_to_guess = funcs.choose_guessing_word()

funcs.say_hello()

for _ in word_to_guess:gmatch '.' do
    progress = progress .. '*'
end
print(progress)

while gameOver == false do
    print('please enter next letter to guess!')
    local char = io.read('*l')
    if string.find(word_to_guess, char) and funcs.contains(guessed_letters, char) == false then
        local occurences = funcs.get_occurences(word_to_guess, char)
        progress = funcs.get_renewed_progress(progress, occurences)
        print('you guessed the letter')
        print(progress)
        if string.find(progress, '*') == nil then
            print('Congratz, you won the game')
            gameOver = true
        end
    else
        lives = lives - 1
        print('wrong letter')
        print(lives .. ' lives left')
        if (lives == 0) then
            print('You lose, game over')
            gameOver = true
        end
    end
    table.insert(guessed_letters, char)
end
