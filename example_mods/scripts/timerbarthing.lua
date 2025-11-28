-- this fixes up the ui, do NOT delete - stinko
luaDebugMode = true;
local threeDeeSongs = {'3-Deez'};
function onCreate()
  if songName == '3-deez' then
    makeLuaSprite('fakeTimeBar','fakeTimeBar3D', 1, -8)
    scaryEnviroment = true;
  else
    makeLuaSprite('fakeTimeBar','fakeTimeBar', -3, 5)
  end
  addLuaSprite('fakeTimeBar', false)
  setObjectCamera('fakeTimeBar', 'camHUD')
  --screenCenter('fakeTimeBar', 'x')
end
function onCreatePost()
  setTimeBarColors('f441a6', '303030');
  setObjectOrder('timeBar', 2)
  setObjectOrder('fakeTimeBar', 65)
  setObjectOrder('timeTxt', 20)
  if scaryEnviroment then
    scaleObject('timeBar', 0.3, 5.1)
  else
    scaleObject('timeBar', 0.268, 5.1)
  end
  if downscroll then
    setProperty('timeBar.y', 20)
    setProperty('timeTxt.y', 53)
    setProperty('timeBar.x', -157)
    setProperty('timeTxt.x', -102)
  else
    setProperty('timeBar.y', 44)
    setProperty('timeTxt.y', 78)
    setProperty('fakeTimeBar.y', 25)
    setProperty('fakeTimeBar.x', 540)
    setProperty('timeTxt.x', 439)
    setProperty('timeBar.x', 380)
  end
end
--[[
function onCreatePost()
  if songName == '3-Deez' then
    setProperty('fakeTimeBar.y', getProperty('fakeTimeBar.y') - 8)
  end
end
]]
function onUpdate()
  setProperty('fakeTimeBar.alpha', getProperty('timeBar.alpha'))
end