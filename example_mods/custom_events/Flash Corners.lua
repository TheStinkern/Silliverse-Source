function onEvent(n,v1,v2)


	if n == 'Flash Corners' then

	   makeLuaSprite('flashC', 'flashcorners', 0, 0);
	      addLuaSprite('flashC', true);
	      setLuaSpriteScrollFactor('flashC',0,0)
		setProperty('flashC.alpha',0.5)
		setObjectCamera('flashC', 'other')
		doTweenAlpha('flTwC','flashC',0,v1,'linear')
		doTweenColor('flTwColor','flashC',v2,0.00001,'linear')
	end



end