local mouseX = 0
local mouseY = 0

function onCreate()
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
    makeLuaSprite('customCursor', 'cursor', 0, 0)
    addLuaSprite('customCursor', true)
    setObjectCamera('customCursor', 'other')
    scaleObject("customCursor", 0.5, 0.5)
end

function onUpdate()
    mouseX = getMouseX('other')
    mouseY = getMouseY('other')

    setProperty('customCursor.x', mouseX)
    setProperty('customCursor.y', mouseY)
    setProperty('customCursor.visible', getPropertyFromClass('flixel.FlxG', 'mouse.visible'))
    setProperty('customCursor.antialiasing', false);

--[[
    You could also, instead of
    using setProperty() to set the
    cursor's position, do a tween or
    something like that :)
]]
end