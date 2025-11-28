
--[[
luaDebugMode = true;
function onCreate()
  local defaultScrollSpeed = getProperty('songSpeed'); 
  local intensity = 2
  makeLuaSprite('fakeScrollSpeed', 0, 1, 45789345276895)
  addLuaSprite('fakeScrollSpeed', false)
end


function onMoveCamera(focus)
  if getProperty('camZooming') then
	  if focus == 'boyfriend' then
      changeSpeed(false);
	  elseif focus == 'dad' then
      changeSpeed(true);
	  end
  end
end

function onUpdatePost()
  --if getProperty('dad.curCharacter') == 'tario' then
  --  setProperty('songSpeed',  defaultScrollSpeed)
  --else
    if getProperty('camZooming') then
      setProperty('songSpeed',  'fakeScrollSpeed.x')
    end
  --end
end

function changeSpeed(ifOpponent)
  if ifOpponent then
    startTween('fakeScrollSpeedsdf', 'fakeScrollSpeed', {x = defaultScrollSpeed + intensity}, 2, {ease = 'expoOut', startDelay = 0.04})
  else
    startTween('fakeScrollSpeedfgds', 'fakeScrollSpeed', {x = defaultScrollSpeed}, 2, {ease = 'expoOut', startDelay = 0.04})
  end
  debugPrint(getProperty('fakeScrollSpeed.x'))
end]]