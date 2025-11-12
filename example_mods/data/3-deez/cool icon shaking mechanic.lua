strength = 4.5;

function onUpdatePost()
  if getProperty('healthBar.percent') > 80 then
    setProperty('iconP2.offset.y', getRandomInt(-strength, strength))
    setProperty('iconP2.offset.x', getRandomInt(-strength, strength))
  else
    setProperty('iconP2.offset.y', 0)
    setProperty('iconP2.offset.x', 0)
  end
end