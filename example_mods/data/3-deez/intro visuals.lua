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



end

function onSongStart()
     songStarted = true;
     doTweenAlpha('fadeOut', 'introFade', 0, 1)
	runHaxeCode([[game.camGame.setFilters([new ShaderFilter(game.getLuaObject('theshader').shader)]);]])
     runHaxeCode([[game.camHUD.setFilters([new ShaderFilter(game.getLuaObject('theshader').shader)]);]])
end

function onCountdownTick()
     setObjectOrder('introFade', 9999)
end

function onUpdatePost()
     if songStarted and shaderExists then
          blockSize = blockSize - 1;
     end
     if blockSize <= 0 and shaderExists then
          shaderExists = false;
          runHaxeCode([[game.camGame.setFilters([]);]])
          runHaxeCode([[game.camHUD.setFilters([]);]])
     end
     setShaderFloatArray('theshader', 'uBlocksize', {blockSize, blockSize})
end