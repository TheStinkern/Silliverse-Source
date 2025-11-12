function onStepHit()
  if curStep == 1040 then
    setProperty('gf.visible', true)
  end
  if curStep == 1360 then
    setProperty('gf.visible', false)
    playSound('slap thingy', 1)
  end
end