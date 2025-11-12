--Made by BlueColorsin#5597
--Inspired by Soulless DX

function onCreatePost()
    C4 = crochet / 1000 * (0.5)
	C1 = crochet / 1000 * (0.5)

    value1 = (downscroll and 15 or 584.8)
    value2 = (downscroll and -10 or 559.8)

    debugPrint(getProperty 'iconP1.y')
end
function onBeatHit()
        tempVar1 = RNG() --Yes I did this cause I hate naming things
        doTweenY(tempVar1, 'iconP1', value1, C1, 'sineIn')
        doTweenY(RNG(), 'iconP2', value1, C1, 'sineIn')
        doTweenY(RNG(), 'camHUD', 15, C1, 'sineIn')
end

TimesLol = 0
function onTweenCompleted(tag)
    if tag == tempVar1 then
        if TimesLol == 2 then TimesLol = 0 end
        TimesLol = TimesLol + 1 
        doTweenY(RNG(), 'iconP1', value2, C4, 'sineOut')
        doTweenY(RNG(), 'iconP2', value2, C4, 'sineOut')
        doTweenY(RNG(), 'camHUD', 0, C4, 'sineOut')
        if TimesLol == 1 then
            doTweenAngle(RNG(), 'iconP1', -3, C4)
            doTweenAngle(RNG(), 'iconP2', -3, C4)
            doTweenAngle(RNG(), 'camHUD', -0.5, C4)
        elseif TimesLol == 2 then
            doTweenAngle(RNG(), 'iconP1', 3, C4)
            doTweenAngle(RNG(), 'iconP2', 3, C4)
            doTweenAngle(RNG(), 'camHUD', 0.5, C4)
        end
    end
end

RNG = function () --returns a random number string
	return tostring(math.random())
end