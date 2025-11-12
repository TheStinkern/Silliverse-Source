function onCreate()
	makeLuaSprite('bg','screw4',-600, -300)
	addLuaSprite('bg',false)
	setScrollFactor("bg", 0, 0)
	scaleObject("bg", 1, 1)
	makeLuaSprite('bd','screw3',-600, -400)
	addLuaSprite('bd',false)
	setScrollFactor("bd", 0.2, 0.2)
	scaleObject("bd", 1, 1)
	makeLuaSprite('be','screw2',-600, -400)
	addLuaSprite('be',false)
	setScrollFactor("be", 0.5, 0.5)
	scaleObject("be", 1, 1)
	makeLuaSprite('mg','screw1',-1000, -500)
	addLuaSprite('mg',false)
	setScrollFactor("mg", 1, 1)
	scaleObject("mg", 1.25, 1.25)
	makeLuaSprite('fg','ScrewCorn',-1000, -650)
	addLuaSprite('fg',true)
	setScrollFactor("fg", 1.3, 1.3)
	scaleObject("fg", 1.25, 1.25)
	setObjectOrder('fg' , 100)

		if not lowQuality then
		makeLuaSprite('overlay','bambover',-1200, -300)
	addLuaSprite('overlay',true)
	setScrollFactor("overlay", 0.7, 0.7)
	scaleObject("overlay", 2, 2)
	setObjectOrder("overlay" , 1000)
    setBlendMode('overlay', 'multiply')
        setProperty('overlay.alpha', 0.3)
		
	end
end

local shadname = "stridentCrisisWavy"


	function onCreatePost()
		initLuaShader("stridentCrisisWavy")
		setSpriteShader('bg', shadname)
	end
	
	function onUpdate(elapsed)
	setShaderFloat('bg', 'uWaveAmplitude', 0.005)
	setShaderFloat('bg', 'uFrequency', 5)
	setShaderFloat('bg', 'uSpeed', 2)
		end

	function onUpdatePost(elapsed)
	setShaderFloat('bg', 'uTime', os.clock())
	
	end

