function onCreate()
	makeLuaSprite('bg','ohioYAYbg',-400, -400.45)
	addLuaSprite('bg',false)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject("bg", 1.7, 1.2)

	luaDebugMode = true;
		--playAnim("ferb", "bop", true)

	makeLuaSprite('bd','theohio2',-703.15, -255.45)
	addLuaSprite('bd',false)
	setScrollFactor("bd", 0.4, 0.4)
	scaleObject("bd", 1, 1)

	makeAnimatedLuaSprite("ferb", "characters/ferb", 750, 0)
	addAnimationByPrefix("ferb", "danceLeft", "idleL", 24, false)
	addAnimationByPrefix("ferb", "danceRight", "idleR", 24, false)
	--addOffset('ferb', 'danceRight', -18, 4)
	scaleObject("ferb", 1.2, 1.2)
	addLuaSprite("ferb", false)
	if getRandomInt(1, 10) == 1 then
		setProperty('ferb.visible', true)
	else
		setProperty('ferb.visible', false)
	end
	makeLuaSprite('fg','theohio',-703.15, -295.45)
	addLuaSprite('fg',false)



	if not lowQuality then
		makeLuaSprite('overlay','3deeAAH',-980.15, -1400.45)
		addLuaSprite('overlay',true)
		setScrollFactor("overlay", 1.9, 1.9)
		scaleObject("overlay", 1.3, 1.3)
    setBlendMode('overlay', 'screen')
    	setProperty('overlay.alpha', 0.5)
		makeAnimatedLuaSprite("mogus", "Mogus", -600, 200)
		addAnimationByPrefix("mogus", "bop", "bop", 24, false)
		scaleObject("mogus", 0.85, 0.85)
		addLuaSprite("mogus", false)
		playAnim("mogus", "bop", true)
	end


	makeAnimatedLuaSprite('fakeGF', 'characters/Tv_GF_Assets', 450, -200)
  addAnimationByPrefix('fakeGF', 'danceLeft', 'left', 24)
	addAnimationByPrefix('fakeGF', 'danceRight', 'right', 24)
  addLuaSprite('fakeGF', false)
  --setObjectOrder('fakeGF', 5)
end
function onBeatHit()
	playAnim("mogus", "bop", true)
	--playAnim("fakeGF", "danceLeft", true)
	if curBeat %2 == 0 then
		playAnim('fakeGF', 'danceLeft', true)
		playAnim('ferb', 'danceLeft', true)
		setProperty('ferb.offset.y', 0)
		setProperty('ferb.offset.x', 0)
	end
	if curBeat %2 == 1 then
		playAnim('fakeGF', 'danceRight', true)
		playAnim('ferb', 'danceRight', true)
		setProperty('ferb.offset.y', 4)
		setProperty('ferb.offset.x', -18)
	end
end

function onCreatePost()
	setProperty('gf.visible', false)
end