--Created by RamenDominoes (Please credit if using this, thanks! <3)

--Created by RamenDominoes (Please credit if using this, thanks! <3)

HudAssets = {'healthBarBG','healthBar','scoreTxt','iconP1','iconP2','timeBar','timeBarBG','timeTxt'}
Index = 1

function onCreatePost()

    makeLuaSprite('UpperBar(Still Strum)', 'empty', -110, -350)
	makeGraphic('UpperBar(Still Strum)', 1500, 350, '000000')
	setObjectCamera('UpperBar(Still Strum)', 'HUD')
	addLuaSprite('UpperBar(Still Strum)', false)

    makeLuaSprite('LowerBar(Still Strum)', 'empty', -110, 720)
	makeGraphic('LowerBar(Still Strum)', 1500, 350, '000000')
	setObjectCamera('LowerBar(Still Strum)', 'HUD')
	addLuaSprite('LowerBar(Still Strum)', false)

    UpperBar = getProperty('UpperBar(Still Strum).y')
	LowerBar = getProperty('LowerBar(Still Strum).y')

    for Notes = 0,7 do 
        StrumY = getPropertyFromGroup('strumLineNotes', Notes, 'y')
    end
end


function onEvent(name, value1, value2)
	if name == 'Cinematics (OverLap)' then
	
		Speed = tonumber(value1)
		Distance = tonumber(value2)

--ENTRANCES

		if Speed and Distance > 0 then

			doTweenY('Still Strum1', 'UpperBar(Still Strum)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('Still Strum2', 'LowerBar(Still Strum)', LowerBar - Distance, Speed, 'QuadOut')

			for Alphas = 1,8 do
				doTweenAlpha('Alpha(Still Strum)'..Alphas, HudAssets[Index], 0, Speed - 0.1)
				Index = Index + 1
						
				if Index > #HudAssets then
					Index = 1
				end
			end
		end

		if downscroll and Speed and Distance > 0 then
		
			doTweenY('Still Strum1', 'UpperBar(Still Strum)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('Still Strum2', 'LowerBar(Still Strum)', LowerBar - Distance, Speed, 'QuadOut')
			
			for Alphas = 1,8 do
				doTweenAlpha('Alpha(Still Strum)'..Alphas, HudAssets[Index], 0, Speed - 0.1)
				Index = Index + 1
							
				if Index > #HudAssets then
					Index = 1
						
				end
			end
		end


		if Distance <= 0 then
			
			doTweenY('Still Strum1', 'UpperBar(Still Strum)', UpperBar, Speed, 'QuadIn')
			doTweenY('Still Strum2', 'LowerBar(Still Strum)', LowerBar, Speed, 'QuadIn')
			
			for Alphas = 1,8 do
				doTweenAlpha('Alpha(Still Strum)'..Alphas, HudAssets[Index], 1, Speed + 0.1)
				Index = Index + 1
							
				if Index > #HudAssets then
					Index = 1
						
				end
			end
		end
	end	
end



--[[
HudAssets = {'healthBarBG','healthBar','scoreTxt','iconP1','iconP2','timeBar','timeBarBG','timeTxt'}
Index = 1

function onCreatePost()

    makeLuaSprite('UpperBar(OverLap)', 'empty', -110, -350)
	makeGraphic('UpperBar(OverLap)', 1500, 350, '000000')
	setObjectCamera('UpperBar(OverLap)', 'other')
	addLuaSprite('UpperBar(OverLap)', false)

    makeLuaSprite('LowerBar(OverLap)', 'empty', -110, 720)
	makeGraphic('LowerBar(OverLap)', 1500, 350, '000000')
	setObjectCamera('LowerBar(OverLap)', 'other')
	addLuaSprite('LowerBar(OverLap)', false)

    UpperBar = getProperty('UpperBar(OverLap).y')
	LowerBar = getProperty('LowerBar(OverLap).y')

    for Notes = 0,7 do 
        StrumY = getPropertyFromGroup('strumLineNotes', Notes, 'y')
    end
end


function onEvent(name, value1, value2)
	if name == 'Cinematics (OverLap)' then
	
		Speed = tonumber(value1)
		Distance = tonumber(value2)


--ENTRANCES

	if Speed and Distance > 0 then

			doTweenY('OverLap1', 'UpperBar(OverLap)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('OverLap2', 'LowerBar(OverLap)', LowerBar - Distance, Speed, 'QuadOut')

			for Tweens = 0,7 do 
				noteTweenY('MoveIn(OverLap)'..Tweens, Tweens, (StrumY + Distance) - 35, Speed, 'QuadOut')

				for Alphas = 1,8 do
					doTweenAlpha('Alpha(OverLap)'..Alphas, HudAssets[Index], 0, Speed - 0.1)
					Index = Index + 1
						
					if Index > #HudAssets then
						Index = 1
					end
				end
			end
		end

		if downscroll and Speed and Distance > 0 then
		
			doTweenY('OverLap1', 'UpperBar(OverLap)', UpperBar + Distance, Speed, 'QuadOut')
			doTweenY('OverLap2', 'LowerBar(OverLap)', LowerBar - Distance, Speed, 'QuadOut')

				for Tweens = 0,7 do 
					noteTweenY('MoveIn(OverLap)'..Tweens, Tweens, (StrumY - Distance) + 35, Speed, 'QuadOut')
			
					for Alphas = 1,8 do
						doTweenAlpha('Alpha(OverLap)'..Alphas, HudAssets[Index], 0, Speed - 0.1)
						Index = Index + 1
							
						if Index > #HudAssets then
							Index = 1
						
						end
					end
				end
			end

		if Distance <= 0 then
			
			doTweenY('OverLap1', 'UpperBar(OverLap)', UpperBar, Speed, 'QuadIn')
			doTweenY('OverLap2', 'LowerBar(OverLap)', LowerBar, Speed, 'QuadIn')

			for Tweens = 0,7 do 
				noteTweenY('MoveOut(OverLap)'..Tweens, Tweens, StrumY , Speed, 'QuadIn')
			
				for Alphas = 1,8 do
					doTweenAlpha('Alpha(OverLap)'..Alphas, HudAssets[Index], 1, Speed + 0.1)
					Index = Index + 1
							
					if Index > #HudAssets then
						Index = 1
						
					end
				end
			end
		end	
	end
end
]]