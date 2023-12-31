--Formats the seconds it is given
function formatSecs(secs)
    if tonumber(secs)<10 then return "0"..tostring(secs) end
    return tostring(secs)
end
--Plays a sound effect
function playSound(sfx)
    local sound = sounds[sfx]:clone()
    love.audio.play(sound)
end
--Takes points away from player
function deductPoints(num)
    save.points=math.max(0,save.points-num)
end
--Adds points to the player
function addPoints(num)
    save.points=save.points+num
end
-- see if the file exists
function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end
-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function linesFrom(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do 
        lines[#lines + 1] = line
    end
    return lines
end
--checks if all cards in lists are visible and does shit accordingly
function checkAllVisible()
    for k,v in ipairs(cardlists) do
        for i,c in ipairs(v) do
            if c.visible==false then return false end
        end
    end
   return true
end
--Splits strings into a table of strings based on a separator char
function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in string.gmatch(str,regex) do
       table.insert(result, each)
    end
    return result
end
