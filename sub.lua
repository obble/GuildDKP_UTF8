


    -- http://wowprogramming.com/snippets/UTF-8_aware_stringsub_7

    assert(IsAddOnLoaded'GuildDKP', 'you havent installed GuildDKP!')

    local size = function(c)
        if not c then return 0
        elseif c > 240 then return 4
        elseif c > 225 then return 3
        elseif c > 192 then return 2
        else return 1
        end
    end

    local function utf8sub(msg, start, num)
        local i = 1
        while start > 1 do
            local c = string.byte(msg, i)
            i = i + size(c)
            start = start - 1
        end
        local currentIndex = i
        while num > 0 and currentIndex <= string.len(msg) do
            local c = string.byte(msg, currentIndex)
            currentIndex = currentIndex + size(c)
            num = num - 1
        end
        return string.sub(msg, i, currentIndex - 1)
    end

    function UCFirst(msg)
    	if not msg then return '' end
    	local f = utf8sub(msg, 1, 1)
    	local r = utf8sub(msg, 2, string.len(msg))
    	return string.upper(f)..string.lower(r)
    end

    --
