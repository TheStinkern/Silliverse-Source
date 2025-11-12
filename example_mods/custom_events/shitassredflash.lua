function onEvent(n,v1,v2)
    if n == 'shitassredflash' then
        makeLuaSprite('red', '', -1500, -1000)
        makeGraphic('red', 2000, 2000, '3b0000')
        scaleObject('red', 10, 10)
        addLuaSprite('red', false)
        doTweenAlpha('pee', 'red', 0, 0.6)
    end
end

function onTweenCompleted(t)
    if t == 'pee' then
        removeLuaSprite('red')
    end
end