function changeCamangle(val,time,tween)
  if modchartEnabled then
    doTweenAngle('changeCamHUDangle', 'camHUD', val, time, tween)
  end
end

function onStepHit()
  if curStep == 687 then
    changeCamangle(180, 0.15, 'elasticOut');
  end
  if curStep == 689 then
    changeCamangle(360, 0.2, 'elasticOut');
  end
  if curStep == 692 then
    changeCamangle(0, 0.4, 'bounceOut');
  end
end