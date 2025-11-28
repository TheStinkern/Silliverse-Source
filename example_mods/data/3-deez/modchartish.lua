luaDebugMode = true;
im_shitting = true;

function onUpdate()
if modchartEnabled then
function onBeatHit()
  if curBeat >= 272 and curBeat < 334 then
    setProperty('camHUD.y', 30)
    doTweenY('gay1','camHUD', 0, 0.6, 'elasticOut')
    weirdCamThing(0.5, 18)
  end
  if curBeat == 334 then
    if modchartEnabled then
    doTweenY('woahhh', 'camHUD', 720, 0.7, 'expoIn')
    end
  end
  if curBeat == 335 then
    camTwistWoaah(0.75)
  end
  if curBeat == 336 then
    if modchartEnabled then
    doTweenY('gay1','camHUD', 0, 4, 'expoOut')
    end
    triggerEvent('Flash Camera', '1')
  end
end
end
end
function camTwistWoaah(time)
if modchartEnabled then
  setProperty('camHUD.angle', 0)
  doTweenAngle('gay','camHUD', 360, time, 'expoOut')
end
end

function weirdCamThing(time, strength)
  if modchartEnabled then
  if im_shitting then
    setProperty('camHUD.x', -strength)
    im_shitting = false;
  else
    setProperty('camHUD.x', strength)
    im_shitting = true;
  end
  doTweenX('gay2','camHUD', 0, time, 'expoOut')
  --doTweenX('gay3','camHUD.scale', 0, time, 'expoOut')
end
end