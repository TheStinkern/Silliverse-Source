luaDebugMode = true;

function onCreatePost()
  makeLuaSprite('trisio n', 'trisio n 3deez', -1200, -400)
  addLuaSprite('trisio n', true)
  setProperty('trisio n.antialiasing', false)
  scaleObject('trisio n', 3.67, 3.67)
  setObjectOrder('trisio n', getObjectOrder('fg'))
  setScrollFactor('trisio n', 1.1, 1.1)
  --setObjectCamera('trisio n', 'camHUD')
end

function onUpdatePost()
  setProperty('trisio n.angle', getProperty('trisio n.angle') + 0.28)
  if curStep > 576 then
    setProperty('trisio n.x', getProperty('trisio n.x') + 3)
  end
end