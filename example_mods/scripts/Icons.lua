-- Me when we have now settings :)
local pref = {
    LinkIcons = false, --Links icons to healthBar sides
    OppoAngle = 8, --Angle to rotate on bop (Opponent)
    PlayerAngle = 8, --Angle to rotate on bop (Player)
    Duration = 0.75,  --Duration of rotation bop
    OppoScale = 1.35, --Scale icon on bop (Opponent)
    PlayerScale = 1.35, --Scale icon on bop (Player)
    ScaleDuration = 0.75, --Duration of scale 
    Easing = 'ElasticOut', -- Easing of Booping
    HideIcons = false -- Hides le icons
}
-- Code Block --
function onUpdatePost()
    if(pref.LinkIcons) then
        setProperty('iconP1.x', getMidpointX('healthBar')+224)
        setProperty('iconP2.x', getMidpointX('healthBar')-374)
        setProperty('iconP1.y', getMidpointY('healthBar')-75)
        setProperty('iconP2.y', getMidpointY('healthBar')-75)
    end
    if(pref.HideIcons) then
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
    end
end

function onBeatHit()
    if curBeat % 1 == 0 then
        setProperty('iconP2.angle', pref.OppoAngle);
        doTweenAngle('bip', 'iconP2', 0, pref.Duration, pref.Easing);
        scaleObject('iconP2', pref.OppoScale, pref.Duration, true)
        doTweenX('bipX', 'iconP2.scale', 1, pref.ScaleDuration, pref.Easing)
        doTweenY('bipY', 'iconP2.scale', 1, pref.ScaleDuration, pref.Easing)

        setProperty('iconP1.angle', -pref.PlayerAngle);
        doTweenAngle('bop', 'iconP1', 0,pref.Duration, pref.Easing);
        scaleObject('iconP1', pref.PlayerScale, pref.Duration, true)
        doTweenX('bopX', 'iconP1.scale', 1, pref.ScaleDuration, pref.Easing)
        doTweenY('bopY', 'iconP1.scale', 1, pref.ScaleDuration,  pref.Easing)
    end
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        setProperty('iconP2.angle', -pref.OppoAngle);
        doTweenAngle('bip', 'iconP2', 0,pref.Duration, pref.Easing);

        setProperty('iconP1.angle', pref.PlayerAngle);
        doTweenAngle('bop', 'iconP1', 0,pref.Duration, pref.Easing);
    end
    updateHitbox('iconP1')
    updateHitbox('iconP2')
end