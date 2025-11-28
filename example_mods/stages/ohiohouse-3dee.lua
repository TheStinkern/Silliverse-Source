local shadname = "FLAG"
luaDebugMode = true;

local loopBgY = 0;
local loopBgX = 0;

function onCreate()
	makeLuaSprite('bg','3deeG',-1000.15, -780.45)
	addLuaSprite('bg',false)
	setScrollFactor("bg", 0.5, 0)
	scaleObject("bg", 1, 1)

	--[[makeAnimatedLuaSprite('bgLoop','3dBgLoop',loopBgX, loopBgY)
	--addLuaSprite('bgLoop',false)
	setScrollFactor("bgLoop", 0.5, 0)
	scaleObject("bgLoop", 4, 4)]]

	makeLuaSprite('bd','3deeBack',-800, -400)
	addLuaSprite('bd',false)
	setScrollFactor("bd", 0.7, 0.7)
	scaleObject("bd", 2.5, 2.5)
	setProperty('bd.antialiasing', false);
	
	makeAnimatedLuaSprite('bd2','3deezBd2',-900, -1200)
	addLuaSprite('bd2',false)
	setScrollFactor("bd2", 0.7, 0.7)
	scaleObject("bd2", 9, 9)
	setProperty('bd2.antialiasing', false);
	addAnimationByPrefix('bd2', 'realIdle', 'realIdle', 24, true)
	playAnim('bd2', 'realIdle', true)

	makeLuaSprite('mg','3deeOhio',-990, -785.45)
	addLuaSprite('mg',false)
	setScrollFactor("mg", 1, 1)
	scaleObject("mg", 3, 3)
	setProperty('mg.antialiasing', false);

	makeAnimatedLuaSprite("mogus3d", "mogus3d", -200, 60)
	addLuaSprite("mogus3d", false)
	
	makeLuaSprite('fg','3dfront',-620, -975.45)
	addLuaSprite('fg',true)
	setScrollFactor("fg", 1.3, 1.3)
	scaleObject("fg", 4.5, 4.5)



	if not lowQuality then
		makeLuaSprite('overlay','3deeAAH',-980.15, -1000)
		addLuaSprite('overlay',true)
		setScrollFactor("overlay", 0.3, 0)
		scaleObject("overlay", 1.3, 1.3)
    setBlendMode('overlay', 'overlay')
    setProperty('overlay.alpha', 0.5)

		addAnimationByPrefix("mogus3d", "mogus3d idle", "mogus3d idle", 2, true)
		scaleObject("mogus3d", 2, 2)
		setScrollFactor("mogus3d", 1, 1)

		playAnim("mogus3d", "mogus3d idle", true)
		
	end
end
function onCreatePost()
	defaultDad_Y = getProperty('dad.y');
	defaultBf_Y = getProperty('boyfriend.y');
	initLuaShader("FLAG")
	setSpriteShader('bg', shadname)
end

function onUpdate(elapsed)
	setShaderFloat('bg', 'uWaveAmplitude', 0.05)
	setShaderFloat('bg', 'uFrequency', 10)
	setShaderFloat('bg', 'uSpeed', 2)
end

function onUpdatePost(elapsed)
	setShaderFloat('bg', 'uTime', os.clock())
	if not lowQuality then
		doTweenY('thingy', 'bd.offset', -30*math.sin((((getSongPosition()/600)*(bpm/160))*0.1)*math.pi),0.001)
		if (string.lower(songName .. '')) == '3-deez' then
			if curStep < 2496 then
				doTweenY('dadTweenY2', 'dad', defaultDad_Y-80*math.sin((((getSongPosition()/600)*(bpm/160))*0.1)*math.pi),0.001)
			end
		else
			doTweenY('dadTweenY21', 'dad', defaultDad_Y-80*math.sin((((getSongPosition()/600)*(bpm/160))*0.1)*math.pi),0.001)
		end
		doTweenY('dadTweenY3', 'boyfriend', defaultBf_Y-80*math.sin((((getSongPosition()/800)*(bpm/160))*0.1)*math.pi),0.001)
	end
end
