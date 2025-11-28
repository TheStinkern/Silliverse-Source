font = 'vcr'; -- dont add ttf at the end, script already handles it
diskBop_Intensity = 0.42; -- default is 0.42, post-tween size is 0.4
songCreator = 'Nex'; -- please make it a string

advancedCredits = true; -- explainable, adds three more credit lines



--- advanced credits ---

coder = 'Stinko';
visuals = 'SamStrawberrie, TimmyBurter';
charter = 'SamStrawberrie, Stinko';



--[[
scroll down to see the code

this is made for D&B: Silliverse
]]









































function onCreate()
	makeLuaSprite('shit', 'creditSprites/diskibmab', 1200, -200)
	  addLuaSprite('shit', true)
    setProperty('shit.scale.x',0.4)
    setProperty('shit.scale.y',0.4)
	  setObjectCamera('shit', 'camHUD')

  makeLuaText('creditText', '', 0, screenWidth, 25)
    addLuaText('creditText')
    setTextSize('creditText', 25)
    setTextFont('creditText', font .. '.ttf')
    setTextAlignment('creditText', 'right')

  if getRandomInt(1, 100) == 1 then
    coderText = '\n Coder by ';
  else
    coderText = '\n Coded by ';
  end
end

function onCreatePost()
  if advancedCredits then
    setProperty('creditText.text', songName .. ' composed by ' .. songCreator .. coderText .. coder .. '\n Visuals by ' .. visuals .. '\n Charted by ' .. charter)
  else
    setProperty('creditText.text', songName .. ' composed by ' .. songCreator)
  end
end
-------------------------------------------------------------------------------

function onBeatHit()
  setProperty('shit.scale.x', diskBop_Intensity)
  setProperty('shit.scale.y', diskBop_Intensity)
  doTweenX('tweenSize1', 'shit.scale', 0.4, 0.75, 'expoOut')
  doTweenY('tweenSize2', 'shit.scale', 0.4, 0.75, 'expoOut')  
end

-------------------------------------------------------------------------------

function onUpdate()
  if curStep == 216 then
    doTweenX('tweenIn1', 'shit', 981, 1, 'expoOut')
    doTweenX('tweenIn2', 'creditText', (screenWidth - getProperty('creditText.width') - 10), 1, 'expoOut')
    runTimer('fuck', 6)
  end
end

-------------------------------------------------------------------------------

function onTimerCompleted(r)
  if r == 'fuck' then
    doTweenX('tweenIn1', 'shit', 1200, 1, 'expoIn')
    doTweenX('tweenIn2', 'creditText', screenWidth, 1, 'expoIn')  
    doTweenAlpha('gay', 'shit', 0, 1)
    doTweenAlpha('gay2', 'creditText', 0, 1)
  end
end