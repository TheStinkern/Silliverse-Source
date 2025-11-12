function onCreate()
  makeAnimatedLuaSprite("whos this guy", "characters/clowndave_stfu", -1400, 80)
  addAnimationByPrefix('whos this guy', 'idle', 'idle', 24, true)
	addAnimationByIndices("whos this guy", "stfu", "stfu", '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62,54,55,56,57,58,59,60,61,62')
	scaleObject("whos this guy", 1.4, 1.4)
	setScrollFactor("whos this guy", 1, 1)
	addLuaSprite("whos this guy", true)
  playAnim('whos this guy', 'idle', true)
  setObjectOrder('whos this guy' , 8)
end

function onStepHit()
  if curStep == 1135 then
    doTweenX('whos this guy 2', 'whos this guy', -600, 4, 'quadOut')
  end
  if curStep == 1162 then
    setProperty('cameraSpeed', 100)
    doTweenX('moveCamX', 'camFollow', 0, 0.6, 'elasticOut')
    playSound('cd-stfu')
    playAnim("whos this guy", "stfu", true)
    doTweenX('what the fuck', 'dad.scale', -1.4, 1, 'elasticOut')
  end
  if curStep == 1166 then
    setProperty('cameraSpeed', 0)
  end
  if curStep == 1185 then
    setProperty('cameraSpeed', 1)
    doTweenX('fuckkkkkkk', 'whos this guy', 1900, 7)
    doTweenY('fuckkkkkkk2', 'whos this guy', 230, 1.5, 'quadOut')
    startTween('wha t', 'whos this guy.scale', {x = 1.52, y = 1.52}, 1.5, {ease = 'quadOut'})
    doTweenX('what the fuck', 'dad.scale', 1.4, 0.5)
  end
end

function onTweenCompleted(tag)
  if tag == 'fuckkkkkkk' then
    setProperty('whos this guy.visible', false)
  end
end