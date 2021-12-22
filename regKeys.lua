function tick()
    if InputPressed('u') then

        print('Keys:')

        recurPrintKeys("options")

        recurPrintKeys("game")

        recurPrintKeys("savegame")

        recurPrintKeys("level")

        recurPrintKeys("hud")

    end

    if InputPressed('i') then
        print('Words:')
        checkKey()
    end

end

function recurPrintKeys(key, n)

    if n == nil then
        local keyTitle = string.upper(key)
        local title = ''
        for i = 1, 10 do title = title .. keyTitle .. ' --- 'end
        print('\n'.. title)
    end

    local keys = ListKeys(key)
    for i=1, #keys do

        print(key .. '.' .. keys[i])

        local n = n or 0
        n = n+1
        recurPrintKeys(key .. '.' .. keys[i], n)

    end

end

function checkKey()

    local alph = {}
    for i = 97, 122 do
        table.insert(alph, string.char(i))
    end

    --[[
        words = {
            {a,b,c},
            {aa,ab,ac},
            {aaa,aab,aac},
        }
    ]]

    local length = 5
    local words = {}
    table.insert(words, TableClone(alph))
    for l = 1, length-1  do -- word length

        local wordSet = {}

        for a = 1, #alph do -- append each letter to each previous wordset element

            for w = 1, #words[l] do -- prev wordset

                local word = words[l][w] .. alph[a]
                -- table.insert(wordSet, word)
                if #ListKeys(word) >= 1 then
                    print('word: ' .. word)
                end

            end

        end

        table.insert(words, wordSet)
        print('Checked length: ' .. l)

    end

    -- for i = 1, #words do
    --     local wordSet = ''
    --     for j = 1, #words[i] do
    --         wordSet = wordSet .. ', ' .. words[i][j]
    --     end
    --     print('\n' .. wordSet)
    -- end

end

-- function recurLetter(alph, words, wordLength)

--     -- Base recursion
--     local words = words or {}
--     local wordLength = wordLength or 0

--     wordLength = wordLength + 1
--     recurLetter(alph, words, wordLength)

-- end

function TableClone(tb)
    local tbc = {}
    for k,v in pairs(tb) do tbc[k] = v end
    return tbc
end