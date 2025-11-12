function onCreate()
	makeLuaSprite('bg','skynight',-200.15, -560.45)
	addLuaSprite('bg',false)
	setScrollFactor("bg", 0.07, 0.07)
	scaleObject("bg", 1.4, 1.2)
	makeLuaSprite('bd','theohio2night',-703.15, -255.45)
	addLuaSprite('bd',false)
	setScrollFactor("bd", 0.5, 0.5)
	scaleObject("bd", 1, 1)
	makeLuaSprite('fg','theohionight',-703.15, -345.45)
	addLuaSprite('fg',false)
	setScrollFactor("fg", 1, 1)
	scaleObject("fg", 1, 1)

	if not lowQuality then
		makeLuaSprite('overlay','3deeovernight',-980.15, -1400.45)
		addLuaSprite('overlay',true)
		setScrollFactor("overlay", 1.9, 1.9)
		scaleObject("overlay", 1.3, 1.3)
    setBlendMode('overlay', 'normal')
    	setProperty('overlay.alpha', 0.3)
		makeAnimatedLuaSprite("mogus", "Mogus", -600, 200)
		addAnimationByPrefix("mogus", "bop", "bop", 24, false)
		scaleObject("mogus", 0.85, 0.85)
		setScrollFactor("mogus", 1, 1)
		addLuaSprite("mogus", false)
		playAnim("mogus", "bop", true)
	end


	makeAnimatedLuaSprite('fakeGF', 'characters/Tv_GF_Assets', 450, -200)
  addAnimationByPrefix('fakeGF', 'danceLeft', 'left', 24)
	addAnimationByPrefix('fakeGF', 'danceRight', 'right', 24)
  addLuaSprite('fakeGF', false)
  setObjectOrder('fakeGF', 5)


end
function onBeatHit()
	playAnim("mogus", "bop", true)
	playAnim("fakeGF", "danceLeft", true)
	if curBeat %1 == 0 then
		objectPlayAnimation('fakeGF', 'danceLeft', true)
	end
	if curBeat %2 == 0 then
		objectPlayAnimation('fakeGF', 'danceRight', true)
	end
end

function onCreatePost()
	setProperty('gf.visible', false)
	doTweenColor('mogus color', 'mogus', '7766DD', 0.01)
	doTweenColor('dave color', 'dad', '7766DD', 0.01)
	doTweenColor('gf color', 'fakeGF', '7766DD', 0.01)
	doTweenColor('bf color', 'boyfriend', '7766DD', 0.01)
end

-- crash prevention
function onUpdate() 
end
function onUpdatePost()
end
-- for what?? - stinko