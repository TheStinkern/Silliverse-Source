luaDebugMode = true;

function onCreatePost()
  defdadY = getProperty('dad.y')
  --debugPrint(defdadY)
end
function onUpdate()
  if curStep == 1211 then
    camTwistWoaah(0.55)
  end
  --if curStep == 3008 then
  --  setProperty('dad.y', -700)
  --  doTweenY('go back you fucking dick', 'dad', -130, 0.5, 'quadOut')
  --end
end

function onStepHit()  
  if curStep == 2499 then
    doTweenY('im shitting ok', 'dad', -1300, 13)
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