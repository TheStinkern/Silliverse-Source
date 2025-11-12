boomspeed = 4
bam = 1
function onEvent(n,v1,v2)

if n == "bump_speed" then

boomspeed = tonumber(v1)
bam = tonumber(v2)

end

end
function onBeatHit()
	if curBeat % boomspeed == 0 and getProperty('camZooming') then
		triggerEvent("Add Camera Zoom",0.015*bam,0.03*bam)
    --debugPrint('test')
	end
end