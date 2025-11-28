luaDebugMode = true; -- debug purposes. enable it if you want to.
forceNumber = 6; -- ditto. set it to either 0 or a non-number value if you want it to randomize.
maxVal = 6; -- this will get overwritten by forceNumber's value, if forceNumber is over the number zero.



--[[ after this point will be the code ]] --














































function onCreate()
  penis = true;
end

function onGameOver()
  penis = false;
end

function onGameOverConfirm()
  penis = true;
end

function onUpdate()
  if penis then
    if forceNumber > 0 then
      randomNum = getRandomInt(1, forceNumber);
    else
      randomNum = getRandomInt(1, maxVal);
    end
  end

end

function onUpdatePost()
  --setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'death3D/3die-' .. randomNum);
end
