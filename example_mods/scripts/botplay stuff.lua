local botplayMessages = {
	'biograft.', 'im gonna kill myself if you enable this again', 'YOU STINK!!!!', 'Dude, this isn’t silly at all.', 'jipfrijru&)&n&ms,aawiwe3fcnkfvmenfv.d.ws,,l', 'you are the worst fnf player on this fucking earth, you probably have 1k misses on week fucking 1 and a score of 0 like how the fuck do you do that??', 'babababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa', 'I AM GOING TO GET YOU.', 'There are microplastics in my testicles.','you will be robbed', '+ULTRABOT', ':poop all', 'Im gonna eat your cock.', 'Accept Jesus as your savior and win a FREE PSP', 'Accept DNB: SILLIVERSE as your saviour and you win a FREE STEAMDECK', 'My name is sergio soofus joofus the 8th and i am 3 years old', 'GD fans in hell when the demons start tearing them apart instead of giving them 12 stars and an icon', 'https://discord.gift/qsPeZ8u4Kf6UCNUW', 'discord.gift/Udzwm3hrQECQBnEEFFCEwdSq', 'johm cena', 

	--you can add more here and the botplay text will pick one at random
}

local options = {
	['Show BOTPLAY'] = false, -- Default = true
	['Text Size'] = 26, -- Default = 20
	['Text Color'] = 'ffffff', -- Default = 'ffffff'
	['Text Font'] = 'vcr', -- Default = 'vcr' (Don't add ".ttf", script will do it automatically)
	['Static Text'] = true, -- Default = false
		['Text Transparency'] = 100, -- Default = 100 (Needs Static Text Enabled)
}

--main part of the script under here, don't change stuff unless you know what you're doing

function onCreatePost()
	chosenBotMessage = getRandomInt(1, #(botplayMessages))
	setTextString('botplayTxt', (options['Show BOTPLAY'] and 'BOTPLAY\n'..botplayMessages[chosenBotMessage]) or botplayMessages[chosenBotMessage])
	setTextSize('botplayTxt', options['Text Size'])
	setTextColor('botplayTxt', options['Text Color'])
	if options['Text Font'] ~= 'None' then
		setTextFont('botplayTxt', options['Text Font']..'.ttf')
	end
end
function onUpdatePost()
	if options['Static Text'] then
		setProperty('botplayTxt.alpha', options['Text Transparency']/100)
		setProperty('botplayTxt.y', 170)
setProperty('botplayTxt.antialiasing', true);
	end
end