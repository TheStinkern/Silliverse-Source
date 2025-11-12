function onCreatePost()
	makeLuaText('talk', (value1), 1250, 0, 480)
	setTextAlignment('talk', 'Center')
	setTextFont('talk', 'vcr.ttf')
	addLuaText('talk')
	setTextSize('talk', 28)
end
function onEvent(name, value1, value2)
	if name == 'talk' then
		setTextString('talk', (value1));
		if value2 == '' then
		    --do nothing lol
		else
		setTextColor('talk', (value2))
		end
	end
end