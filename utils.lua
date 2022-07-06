local funcs = {}


function funcs.say_hello()
    io.write('Please enter your name \n')
    --local name = io.read('*l')
    local name = 'ches'

    print('Hello ' .. name .. ", let's play hangman :)");
end

function funcs.choose_guessing_word()
    math.randomseed(os.time())
    _ = math.random()

    local words = { 'assumption', 'tool', 'extinct', 'absorption', 'wife' }
    local index = math.random(#words)
    local word = words[index]

    return word
end

function funcs.get_occurences(wordToGuess, letter)
    local res = {}
    for i = 1, #wordToGuess do
        if letter == wordToGuess:sub(i, i) then
            res[i] = letter
        end
    end
    return res
end

function funcs.contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end
function funcs.get_renewed_progress(progress, occurences)
    local tb = {}
    local res = ''
    for i = 1, #progress do
        tb[i] = progress:sub(i, i)
    end
    for key, value in pairs(occurences) do
        tb[key] = value
    end
    for _, value in ipairs(tb) do
        res = res .. value
    end
    return res
end


return funcs





















