function onCreate()
	makeLuaSprite('bg','ohioSUNSETbg',-200.15, -400.45)
	addLuaSprite('bg',false)
	setScrollFactor("bg", 0.1, 0.1)
	scaleObject("bg", 1.4, 1.2)

	makeLuaSprite('bg2','skynight',-200.15, -750)
	addLuaSprite('bg2', false)
	setScrollFactor("bg2", 0.1, 0.1)
	setProperty('bg2.alpha', 0)
	scaleObject("bg2", 0.75, 0.75)

	makeLuaSprite('bd','theohio2',-703.15, -255.45)
	addLuaSprite('bd',false)
	setScrollFactor("bd", 0.4, 0.4)
	scaleObject("bd", 1, 1)
	makeLuaSprite('fg','theohio',-703.15, -295.45)
	addLuaSprite('fg',false)
	setScrollFactor("fg", 1, 1)
	scaleObject("fg", 1, 1)
	makeLuaSprite('overlay','madsunset',-980.15, -800.45)
	addLuaSprite('overlay',true)
	setScrollFactor("overlay", 0.5, 0)
	scaleObject("overlay", 1.2, 1.2)
    setBlendMode('overlay', 'multiply')
        setProperty('overlay.alpha', 0.7)

	makeLuaSprite('overlay2','3deeovernight',-980.15, -800.45)
	addLuaSprite('overlay2',true)
	setScrollFactor("overlay2", 0.5, 0)
	scaleObject("overla2y", 1.2, 1.2)
  setBlendMode('overlay2', 'multiply')
    setProperty('overlay2.alpha', 0)

	if not lowQuality then
		makeAnimatedLuaSprite("mogus", "Mogus", -600, 200)
		addAnimationByPrefix("mogus", "bop", "bop", 24, false)
		scaleObject("mogus", 0.85, 0.85)
		setScrollFactor("mogus", 1, 1)
		addLuaSprite("mogus", false)
		playAnim("mogus", "bop", true)
	end

	makeLuaSprite("whiteBg","white",-703,-400);
	scaleObject("whiteBg",5, 5)
  setScrollFactor("whiteBg",0,0);
  setProperty('whiteBg.alpha', 0);
  addLuaSprite("whiteBg",false);
end
function onBeatHit()
	playAnim("mogus", "bop", true)
end


