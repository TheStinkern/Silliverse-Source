function onCreatePost()
	if not lowQuality then
		addCharacterToList("bf-dead")
		precacheSound("fnf_loss_sfx")
	end
end

-- crash prevention
function onUpdate() end
function onUpdatePost() end
