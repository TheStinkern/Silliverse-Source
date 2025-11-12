function onCreate()
  luaDebugMode = true;
  makeLuaSprite('blackaadsads', 'black', 0, 0)
	addLuaSprite('blackaadsads', true);
  makeLuaSprite('sigmaLight', 'spotlight', 0, -400)
  addLuaSprite('sigmaLight', true)
end

function onCreatePost()
  setBlendMode('sigmaLight', 'add')
  setProperty('blackaadsads.alpha', 0)
  setProperty('blackaadsads.scale.x', 3)
  setProperty('blackaadsads.scale.y', 3)
  setProperty('sigmaLight.scale.x', 1.3)
  setProperty('sigmaLight.scale.y', 1.3)
  setProperty('sigmaLight.alpha', 0) -- i bought a property in egypt, and what the do for you is they give you the property.
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		doTweenX('penis', 'sigmaLight', (getProperty('boyfriend.x') - 100), 1.5, 'expoOut')
	elseif focus == 'dad' then
		doTweenX('penis2', 'sigmaLight', (getProperty('dad.x') - 200), 1.5, 'expoOut')
	end
end

function onUpdatePost()
  if curStep == 784 then
    showSpotlight()
    fade(0.5,true,'linear',0.5)
  end
  if curStep == 1040 then
    hideSpotlight()
    hideNotes(0.5,true)
  end
  if curStep == 1152 then
    hideNotes(0.5,false)
    fade(0.5,false)
  end
end

function showSpotlight()
  doTweenAlpha('hello', 'sigmaLight', 1, 0.5, 'linear')
end

function hideSpotlight()
  doTweenAlpha('hello', 'sigmaLight', 0, 0.5, 'linear')
end

function hideNotes(time,enabled)
  if enabled == true then
    noteTweenAlpha('a1', 0, 0, time)
    noteTweenAlpha('a2', 1, 0, time)
    noteTweenAlpha('a3', 2, 0, time)
    noteTweenAlpha('a4', 3, 0, time)
    noteTweenAlpha('a5', 4, 0, time)
    noteTweenAlpha('a6', 5, 0, time)
    noteTweenAlpha('a7', 6, 0, time)
    noteTweenAlpha('a8', 7, 0, time)
  else
    noteTweenAlpha('aa1', 0, 1, time);
    noteTweenAlpha('aa2', 1, 1, time);
    noteTweenAlpha('aa3', 2, 1, time);
    noteTweenAlpha('aa4', 3, 1, time);
    noteTweenAlpha('aa5', 4, 1, time);
    noteTweenAlpha('aa6', 5, 1, time);
    noteTweenAlpha('aa7', 6, 1, time);
    noteTweenAlpha('aa8', 7, 1, time); 
  end
end
function fade(time,enabled,tween,fadeTo)
  if enabled == true then
    doTweenAlpha('a11', 'blackaadsads', fadeTo, time, tween)
  else
    doTweenAlpha('aa13', 'blackaadsads', 0, time,tween)
  end
end
