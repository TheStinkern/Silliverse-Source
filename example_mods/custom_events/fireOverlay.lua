--Script By Santex
function onCreate()
    makeAnimatedLuaSprite('fire','fireStuff', 0, 0)
    addAnimationByPrefix('fire','fireStuff','burn',24,true)
    addLuaSprite('fire', true);
    setObjectCamera("fire", 'hud')
    scaleObject("fire", 1, 1)
    screenCenter("fire", 'xy')
    setProperty("fire.visible", false)
    setBlendMode('fire', 'screen')
    setProperty('fire.alpha', 0)
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'fireOverlay' and string.lower(value1) == 'on' then
        setProperty("fire.visible", true)
        setProperty('fire.alpha', 65)
    end
    if eventName == 'fireOverlay' and string.lower(value1) == 'off' then
        setProperty("fire.visible", false)
        setProperty('fire.alpha', 0)
    end
end
