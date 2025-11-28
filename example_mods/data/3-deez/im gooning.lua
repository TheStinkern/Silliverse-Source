function onCreatePost()
     makeLuaSprite('fadeBlack', image, -800, -600)
     setScrollFactor('fadeBlack', 0, 0)
     makeGraphic('fadeBlack', 4000, 4000, 'black')
     addLuaSprite('fadeBlack', true)
     setProperty('fadeBlack.alpha', 0)
end

function onBeatHit()
     if curBeat == 464 then
          setProperty('fakeBlack.alpha', 1)
          noteTweenAlpha('fadeOut', 0, 0, 0.3)
          noteTweenAlpha('fadeOut2', 1, 0, 0.3)
          noteTweenAlpha('fadeOut3', 2, 0, 0.3)
          noteTweenAlpha('fadeOut4', 3, 0, 0.3)
          noteTweenAlpha('fadeOut5', 4, 0, 0.3)
          noteTweenAlpha('fadeOut6', 5, 0, 0.3)
          noteTweenAlpha('fadeOut7', 6, 0, 0.3)
          noteTweenAlpha('fadeOut8', 7, 0, 0.3)

     end
end

function onUpdatePost()
     if curBeat == 492 then
          noteTweenAlpha('fadeIn', 0, 1, 0.3)
          noteTweenAlpha('fadeIn2', 1, 1, 0.3)
          noteTweenAlpha('fadeIn3', 2, 1, 0.3)
          noteTweenAlpha('fadeIn4', 3, 1, 0.3)
     end

     if curStep == 1973 then
          noteTweenAlpha('fadeIn', 4, 0.999, 0.3)
          noteTweenAlpha('fadeIn2', 5, 0.999, 0.3)
          noteTweenAlpha('fadeIn3', 6, 0.999, 0.3)
          noteTweenAlpha('fadeIn4', 7, 0.999, 0.3)
     end
end