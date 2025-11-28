luaDebugMode = true;

function onCreatePost()
  makeLuaSprite('goodEnd', 'endings/goodEnd')
  addLuaSprite('goodEnd', true)
  setObjectCamera('goodEnd', 'camOther')
  setObjectOrder('goodEnd', 0)
  setProperty('goodEnd.alpha', 0)
  makeLuaSprite('badEnd', 'endings/badEnd')
  addLuaSprite('badEnd', true)
  setObjectCamera('badEnd', 'camOther')
  setObjectOrder('badEnd', 0)
  setProperty('badEnd.alpha', 0)
end
luaDebugMode = true;
function onBeatHit()
  if curBeat == 752 then
    showEnding()
  end
end

function showEnding()
  if ((getProperty('ratingPercent') * 100)) > 50 then
    doTweenAlpha('gaydfydyfs', 'goodEnd', 1, 0.7, 'expoOut')
  else
    doTweenAlpha('gaydfydyfs', 'badEnd', 1, 0.7, 'expoOut')
  end
end
