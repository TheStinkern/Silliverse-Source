local hasSpawned = false
function onEvent(name, value1, value2)
	if name == 'screenRed' and value1 == 'a' and hasSpawned == false then
		doTweenColor('badapplexd', 'camGame', 'FFFFFF', value2, 'linear')
		hasSpawned = true
	end
	if name == 'screenRed' and value1 == 'a' and hasSpawned == true then
		doTweenColor('badapplexd', 'camGame', 'FF0000', value2, 'linear')
	end
	if name == 'screenRed' and value1 == 'b' then
		doTweenColor('badapplexd3', 'camGame', 'FFFFFF', value2, 'linear')
	end
end