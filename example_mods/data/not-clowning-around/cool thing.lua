luaDebugMode = true;
function onCreatePost()
  defDadX = getProperty('dad.x');
  defBfY = getProperty('boyfriend.x');
end
function onStepHit()
  if curStep == 1215 then
    startSketchEffect(true)
    setProperty('boyfriend.x', defBfY - 110)
		setProperty('dad.x', defDadX + 13)
    setProperty('cameraSpeed', 10000)
  end
  if curStep == 1216 then
    startSketchEffect(true)
    setProperty('boyfriend.x', defBfY - 110)
		setProperty('dad.x', defDadX + 13)
    setProperty('cameraSpeed', 0)
  end
  if curStep == 1408 then
    startSketchEffect(false)
    doTweenAlpha('bg1', 'bg', 0, 40)
    doTweenAlpha('bg2', 'bg2', 1, 40)
    doTweenAlpha('wa1', 'overlay', 0, 40)
    doTweenAlpha('wa1 5', 'overlay2', 0.8, 15)
    setProperty('boyfriend.x', defBfY)
		setProperty('dad.x', defDadX)
  end

  if curStep == 1532 then
    startSketchEffect(false)
    setProperty('cameraSpeed', 100)
  end
  if curStep == 1535 then
    startSketchEffect(false)
    setProperty('cameraSpeed', 1)
  end
end

function startSketchEffect(active)
	if active == true then
		setProperty('bg.alpha', 0)
		setProperty('fg.alpha', 0)
		setProperty('bd.alpha', 0)
		setProperty('overlay.alpha', 0)
    setProperty('gf.alpha', 0)
    setProperty('whiteBg.alpha', 1)
    setProperty('mogus.alpha', 0)
	else
		setProperty('bg.alpha', 1)
		setProperty('fg.alpha', 1)
		setProperty('bd.alpha', 1)
		setProperty('overlay.alpha', 0.7)
		setProperty('gf.alpha', 1)
    setProperty('whiteBg.alpha', 0)
    setProperty('mogus.alpha', 1)
	end
end