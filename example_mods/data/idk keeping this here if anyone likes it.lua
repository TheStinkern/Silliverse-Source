--Script by Teniente Mantequilla#0139--
--SAM HERE i originally used this for the songs but it kept getting fucked up so im keeping this here but it wont look good--
luaDebugMode = true;
--change this ones--
local camMovement = 20
local velocity = 3

--leave this ones alone--
local campointx = 0
local campointy = 0
local camlockx = 0
local camlocky = 0
local camlock = false
local bfturn = false
local camon = true


function onCreatePost()
	stageSpeed = getProperty('cameraSpeed');
end
function onMoveCamera(focus)
	if camon == true then
	if focus == 'boyfriend' then
	campointx = 0
	campointy = 0
	bfturn = true
	camlock = false
	setProperty('cameraSpeed', 1)
	
	elseif focus == 'dad' then
	campointx = 0
	campointy = 0
	bfturn = false
	camlock = false
	setProperty('cameraSpeed', 1)
	
	end
end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if camon == true then
	if bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy
		end
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
	end	
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if camon == true then
	if not bfturn then
		if direction == 0 then
			camlockx = campointx - camMovement
			camlocky = campointy
		elseif direction == 1 then
			camlocky = campointy + camMovement
			camlockx = campointx
		elseif direction == 2 then
			camlocky = campointy - camMovement
			camlockx = campointx
		elseif direction == 3 then
			camlockx = campointx + camMovement
			camlocky = campointy

		end
		debugPrint('im shititng')
	runTimer('camreset', 1)
	setProperty('cameraSpeed', velocity)
	camlock = true
	end	
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if camon == true then
	if tag == 'camreset' then
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('camFollow.offset.x', campointx)
	setProperty('camFollow.offset.y', campointy)

	end
end
end

function onUpdatePost()
	if camlock and camon == true then
		setProperty('camFollow.offset.x', camlockx)
		setProperty('camFollow.offset.y', camlocky)
		
	end
end
