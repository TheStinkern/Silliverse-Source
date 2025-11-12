local healthToTake;
function onEvent(name, value1, value2)
    if name == 'ProtagHit' and getPropertyFromClass('ClientPrefs', 'mechanics') then
        triggerEvent('Play Animation', 'preattack', 'dad')
        runTimer('hit', 0.3)

        health = getProperty('health')

        if value1 == '' then
            healthToTake = 1;
        else
            healthToTake = value1;
        end
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'hit' then
        triggerEvent('Play Animation', 'attack', 'dad')
        if getProperty('songMisses') < 20 then
            characterPlayAnim('boyfriend', 'hurt', true);
            triggerEvent('Play Animation', 'scared', 'gf')
        else
            characterPlayAnim('boyfriend', 'hurt-losing', true);
            triggerEvent('Play Animation', 'scared', 'gf')
        end
        setProperty('boyfriend.specialAnim', true);
        setProperty('health', health - healthToTake)
        playSound('hit')
    end
end