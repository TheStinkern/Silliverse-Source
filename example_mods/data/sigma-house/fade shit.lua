function onCreatePost()
  makeLuaSprite('i fucking hate', image, -5000, -5000)
	makeGraphic('i fucking hate', 300000, 300000, '000000')
	setProperty('i fucking hate.alpha', 1)
	addLuaSprite('i fucking hate', true)
	setObjectCamera('i fucking hate', 'camGame')
end

function onSongStart()
  doTweenAlpha('fade', 'i fucking hate', 0.45, 5)
end

function onStepHit()
  if curStep == 48 then
    doTweenAlpha('fade', 'i fucking hate', 1, 1)
  end
  if curStep == 64 then
    setProperty('i fucking hate.alpha', 0)
  end
end