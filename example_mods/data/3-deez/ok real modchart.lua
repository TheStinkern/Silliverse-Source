function onCreatePost()
	luaDebugMode = true;
  makeLuaSprite('fatass', '', 0, 0)
  addLuaSprite('fatass', false)
  setProperty('fatass.visible', false)
end

function onBeatHit()
  if curBeat >= 48 and curBeat < 144 then
    setProperty('fatass.x', 65)
  elseif curBeat >= 144 and curBeat < 208 then
    setProperty('fatass.x', 80)
  elseif curBeat >= 14 and curBeat < 1920 then
    setProperty('fatass.x', 55)
  end
  if curBeat < 1920 and curBeat >= 16 then
    doTweenX('fatass', 'fatass', 30, 0.5, 'expoOut')
  end
  if curBeat == 1920 then
    setProperty('fatass.x', 145)
    doTweenX('fatass', 'fatass', 9, 4.5, 'expoOut')
  end
  if curBeat == 13 then
    setProperty('fatass.x', 0)
    doTweenX('fatass', 'fatass', 130, 0.89, 'expoIn')
  end
end

function onUpdatePost(elapsed)
curIntensity = getProperty('fatass.x');
songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(curBpm/24)
    local currentBeat1 = (songPos/3000)*(curBpm/24)
	

			for i = 0,3 do -- opponent
                    --setPropertyFromGroup('strumLineNotes',i,'x',-75+math.sin((currentBeat+i*6)*math.pi/8))
                    setPropertyFromGroup('strumLineNotes',i,'y',defaultPlayerStrumY0+math.cos((currentBeat+i*3)*math.pi/9)*curIntensity)
            end
               
            for i = 4,7 do -- player
                    --setPropertyFromGroup('strumLineNotes',i,'x',-75+math.sin((currentBeat+i*2)*math.pi/8)*-300)
                    setPropertyFromGroup('strumLineNotes',i,'y',defaultPlayerStrumY0+math.cos((currentBeat+i*3)*math.pi/9)*curIntensity)
            end

			for i = 4,7 do
				--setPropertyFromGroup('strumLineNotes',i,'y',-75+(6*110)+math.sin((currentBeat+i*10)*math.pi/8)*100)
			end
end

