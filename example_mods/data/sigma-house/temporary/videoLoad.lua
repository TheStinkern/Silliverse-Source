local allowCountdown = false
function onStartCountdown()
	if not allowCountdown then --Block the first countdown
		startVideo('cutscene1Scene1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end