--Script By Nickpoke00 And Santex
function onCreate()
    makeLuaSprite('vignette','VignetteBlue', 0, 0)
    addLuaSprite('vignette', true);
    setObjectCamera("vignette", 'hud')
    screenCenter("vignette", 'xy')
    setProperty("vignette.visible", false)
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'vignette' and string.lower(value1) == 'on' then
        setProperty("vignette.visible", true)
    end
    if eventName == 'vignette' and string.lower(value1) == 'off' then
        setProperty("vignette.visible", false)
    end
end
