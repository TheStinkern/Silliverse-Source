local blockSize = 350;
     local shaderExists = true;

luaDebugMode = true;

function onCreate()
     makeLuaSprite('introFade')
     makeGraphic('introFade', screenWidth, screenHeight, '000000')
     addLuaSprite('introFade', true)
     setObjectCamera('introFade', 'camHUD')
     setObjectOrder('introFade', 34)
     initLuaShader('mosaic')
     makeLuaSprite('theshader')
     makeGraphic('theshader', screenWidth, screenHeight)
     setSpriteShader('theshader', 'mosaic')

     makeLuaSprite('none')
     addLuaSprite('none', false)
     setProperty('none.visible', false)

     makeLuaSprite('shaderValue', null, 350, 0)
     addLuaSprite('shaderValue', false)
     setProperty('shaderValue.alpha', 0)

end

function onSongStart()
     songStarted = true;
     doTweenAlpha('fadeOut', 'introFade', 0, 1)
	runHaxeCode([[game.camGame.setFilters([new ShaderFilter(game.getLuaObject('theshader').shader)]);]])
     runHaxeCode([[game.camHUD.setFilters([new ShaderFilter(game.getLuaObject('theshader').shader)]);]])
     doTweenX('decreaseValue', 'shaderValue', 0, 4.7)
end

function onCountdownTick()
     setObjectOrder('introFade', 9999)
end

function onUpdatePost()
     if getProperty('shaderValue.x') <= 0 and shaderExists then
          shaderExists = false;
          runHaxeCode([[game.camGame.setFilters([]);]])
          runHaxeCode([[game.camHUD.setFilters([]);]])
     end
     setShaderFloatArray('theshader', 'uBlocksize', {getProperty('shaderValue.x'), getProperty('shaderValue.x')})
end