function onCreatePost() --messy af
    makeLuaText('reversed', '', 1500, -125, -45)
    setTextFont('reversed', 'lunchds.ttf')
    setTextColor('reversed', 'ff0000')
    setTextSize('reversed', 62);
    setObjectCamera('reversed', 'camGame')
    setObjectOrder('reversed', getObjectOrder('dadGroup') - 1)
    setTextAlignment('reversed', 'left')
    setProperty('reversed.flipX', true)

    runHaxeCode([[
        var shaderName = "deform";
        
        game.initLuaShader(shaderName);
        
        shader0 = game.createRuntimeShader(shaderName);
    ]])
end

function onUpdatePost()
    runHaxeCode([[
        shader0.setFloat("iTime", ]] .. os.clock() .. [[);
    ]])
end

function onEvent(name, value1, value2)
    if name == "text2" then
        runHaxeCode([[game.camGame.setFilters([new ShaderFilter(shader0)]);]])
        setShaderFloat('deform', 'stongth', lerp(0,0.2,2))
        doTweenAlpha('hudbye', 'camHUD', 0, 1)
        doTweenAlpha('bfbye', 'boyfriend', 0, 0.01)
        doTweenAlpha('bgbye', 'hallway', 0, 0.01)
        followchars = false
        triggerEvent('Play Animation', 'static', 'dad')
        setProperty('reversed.visible', true)
        addLuaText('reversed')

        if value2 == 'nospace' then
            setTextString('reversed', getProperty('reversed.text')..string.upper(value1))
        else
            setTextString('reversed', getProperty('reversed.text')..string.upper(value1)..' ')
        end

        zooming = true;

        if value2 == 'clear' then
            setTextString('reversed', '')
            removeSpriteShader('reversed')
            removeLuaText('reversed')
        end
    end
end

function lerp(a, b, t)
	return a + (b - a) * t
end