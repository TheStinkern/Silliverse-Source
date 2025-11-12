function onEvent(n,v1,v2)


	if n == 'Flash BlackCamFAST' then

	   makeLuaSprite('flashBL', '', 0, 0);
        makeGraphic('flashBL',1280,720,'000000')
	      addLuaSprite('flashBL', true);
	      setLuaSpriteScrollFactor('flashBL',0,0)
	      setProperty('flashBL.scale.x',1.1)
	      setProperty('flashBL.scale.y',1.1)
		setProperty('flashBL.alpha',0.8)
		setObjectCamera('flashBL', 'other')
		doTweenAlpha('flTwBL','flashBL',0,0.3,'linear')
	end



end