local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'FadeScreenButGood' and value1 == 'a' and hasSpawned == false then
		makeLuaSprite('blacker', '', -100, -100)
		scaleObject('blacker', 5, 5)
		setScrollFactor('blacker', 0, 0)
		makeGraphic('blacker', 5000, 5000, '000000')
		addLuaSprite('blacker', false)
		setProperty('blacker.alpha', 0)
		doTweenAlpha('applebadxd69', 'blacker', 1, value2, 'linear')
		doTweenColor('badapplexd', 'boyfriend', '000000', value2, 'linear')
		doTweenColor('badapplexd1', 'dad', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'gf', '000000', value2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', value2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', value2, 'linear')
		hasSpawned = true
	end
	if name == 'FadeScreenButGood' and value1 == 'a' and hasSpawned == true then
		doTweenAlpha('applebadxd69', 'blacker', 1, value2, 'linear')
		doTweenColor('badapplexd', 'boyfriend', '000000', value2, 'linear')
		doTweenColor('badapplexd1', 'dad', '000000', value2, 'linear')
		doTweenColor('badapplexd2', 'gf', '000000', value2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', value2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', value2, 'linear')
	end
	if name == 'FadeScreenButGood' and value1 == 'b' then
		doTweenAlpha('applebadxd', 'blacker', 0, value2, 'linear')
		doTweenColor('badapplexd3', 'boyfriend', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd4', 'dad', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', value2, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', value2, 'linear')
	end
end