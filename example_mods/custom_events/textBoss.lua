function onCreate()
    makeLuaSprite('redPee', '', -1500, -1000)
    makeGraphic('redPee', 2000, 2000, '3b0000')
    scaleObject('redPee', 10, 10)
    addLuaSprite('redPee', false)
    setProperty('redPee.alpha', 0)

    makeLuaText('totakethetext', '', 2078, -345, -145)
    setTextFont('totakethetext', 'lunchds.ttf')
    setTextColor('totakethetext', 'db0000')
    setTextBorder('totakethetext', 6, '3d0000')
    setTextSize('totakethetext', 88);
    setObjectCamera('totakethetext', 'camGame')
    setObjectOrder('totakethetext', getObjectOrder('dadGroup') - 1)
    setTextAlignment('totakethetext', 'left')
end

function onEvent(name, value1, value2)
    if name == "textBoss" then
        if getProperty('redPee.alpha') == 0 then
            doTweenAlpha('pee', 'redPee', 1, 0.6)
        end
        healthbarToggle(true)
        setProperty('totakethetext.visible', true)
        setProperty('totaketheshadow.visible', true)
        setTextString('totakethetext', getProperty('totakethetext.text')..value1..' ')
        setProperty('totaketheshadow.text', getProperty('totakethetext.text'))
        addLuaText('totakethetext')
        triggerEvent('Screen Shake', '0.1, 0.0035', '0.1, 0.003')
        if value2 == 'tempClear' then
            doTweenAlpha('pee2', 'redPee', 0, 0.6)
            setProperty('totakethetext.visible', false)
            setProperty('totaketheshadow.visible', false)
            healthbarToggle(false)
        elseif value2 == 'clear' then
            doTweenAlpha('pee2', 'redPee', 0, 0.6)
            setTextString('totakethetext', '')
            setProperty('totaketheshadow.visible', false)
        end
    end
end

function healthbarToggle(porn)
    if porn == true then
        doTweenAlpha('bar1', 'healthBar', 0, 0.4, 'circInOut')
        doTweenAlpha('barbg', 'healthBarBG', 0, 0.4, 'circInOut')
        doTweenAlpha('bar2', 'staminaBar', 0, 0.4, 'circInOut')
    else
        doTweenAlpha('bar1', 'healthBar', 1, 0.4, 'circInOut')
        doTweenAlpha('barbg', 'healthBarBG', 1, 0.4, 'circInOut')
        doTweenAlpha('bar2', 'staminaBar', 1, 0.4, 'circInOut')
    end
end