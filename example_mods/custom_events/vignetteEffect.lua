luaDebugMode = true;

function onCreatePost()
	makeLuaSprite('vignette', 'vignette')
	setProperty('vignette.alpha', 0)
	addLuaSprite('vignette', true)
	setObjectCamera('vignette', 'camHud')
	setObjectOrder('vignette', 1)
end

function onEvent(name, value1, value2)
  if name == 'vignetteEffect' then
    doTweenAlpha('fuck','vignette',value1,value2,'expoOut')
  end
end