strength = 7;
luaDebugMode = true;

function onCreate()
  makeLuaSprite('strengthFake', null, 0, 0)
  addLuaSprite('strengthFake', false)
  setProperty('strengthFake.visible', false)
end

function noteMiss()
  --if combo > 5 then
    doFunnyThing()
  --end
end

function noteMissPress()
  --if combo > 5 then
    doFunnyThing() 
  --end
end

function doFunnyThing() 
  if getProperty('iconP1.alpha') == 1 then
--if luaDebugMode then
    --debugPrint('missed a note')
--end
    setProperty('strengthFake.x', (9))
    setProperty('iconP1.color', '0xFFFFDDDD');
    doTweenColor('im shitting right now', 'iconP1', 'FFFFFF', 1, 'expoOut')
    doTweenX('dgko;s', 'strengthFake', 0, 1, 'expoOut')
  end
end

function onUpdate()
  strength = getProperty('strengthFake.x');
  --debugPrint(strength)
end
function onUpdatePost()
  setProperty('iconP1.offset.y', getRandomInt(-strength, strength))
  setProperty('iconP1.offset.x', getRandomInt(-strength, strength))
end