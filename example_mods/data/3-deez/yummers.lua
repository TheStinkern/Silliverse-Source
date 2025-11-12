function onCreatePost()
  defdadY = getProperty('dad.y')
  --debugPrint(defdadY)
end
function onUpdate()
  if curStep == 1211 then
    camTwistWoaah(0.55)
  end
  if curStep == 2176 then
    doTweenY('woahhhhh', 'dad', -800, 19, 'quadOut')
  end
  if curStep == 2432 then
    setProperty('dad.y', -700)
    doTweenY('go back you fucking dick', 'dad', -130, 2, 'quadOut')
  end
end

function onUpdatePost()
  	if not mustHitSection then
	  	cameraSetTarget('dad')
    else
      cameraSetTarget('boyfriend')
    end
end

function camTwistWoaah(time)
  doTweenAngle('gay','camHUD', 360, time, 'expoOut')
end