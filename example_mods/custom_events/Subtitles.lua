local createdText = false;
function onEvent(n,v1,v2)
    if n == 'Subtitles' then
        if not createdText then
            makeLuaText('subText', '', getProperty('FlxG.width'), 0, 550)
            setTextFont('subText', 'lunchds.ttf')
            screenCenter('subText', 'x')
            setTextAlignment('subText', 'center')
            setTextSize('subText', 36)
            setObjectCamera('subText', 'camOther')
            setTextString('subText', v1)
            addLuaText('subText')
            createdText = true;
        else
            if v2 == 'destroy' then
                removeLuaText('subText', true)
                createdText = false;
            else
                if v2 == 'clear' then
                    setTextString('subText', '')
                    setTextString('subText', v1)
                else
                    setTextString('subText', getTextString('subText')..' '..v1)
                end
                updateHitbox('subText')
                screenCenter('subText', 'x')
            end
        end
    end
end