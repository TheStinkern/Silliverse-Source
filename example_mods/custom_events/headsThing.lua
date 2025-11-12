local numbertable = {1,2,3,4,5,6}
local scrambled = {}
    
    

function onCreatePost()
    luaDebugMode = true
    for i = 1,6 do
        precacheImage('whiteface/Face0'..i)
    end
end

function onEvent(n,v1,v2)
    if n == 'headsThing' then
        for i = 1,6 do
            if v1 == 'down' then
                if i <= 3 then
                    makeLuaSprite('head'..i, 'song specific and bgs/whiteface/Face0'..getRandomInt(1,6), 60, -50 + (180*i))
                    scaleObject('head'..i, 0.6, 0.6)
                    setScrollFactor('head'..i, 1.2, 1.2)
                    addLuaSprite('head'..i)
                    setProperty('head'..i..'.alpha', 0)
                    doTweenAlpha('faceSpawn'..i, 'head'..i, 1, 0.3, 'quadInOut')
                    doTweenX('faceX'..i, 'head'..i, getProperty('head'..i..'.x') + getRandomInt(-15, 15), 0.6, 'quadInOut')
                    if i == 2 then
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') + 25, 0.6, 'quadInOut')
                    else
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') - 25, 0.6, 'quadInOut')
                    end
                    doTweenAngle('faceAngle'..i, 'head'..i, getProperty('head'..i..'.angle') + getRandomInt(-10, 10), 0.6, 'quadInOut')
                elseif i >= 4 then
                    makeLuaSprite('head'..i, 'song specific and bgs/whiteface/Face0'..getRandomInt(1,6), 560, -50 + (180*(i-3)))
                    scaleObject('head'..i, 0.6, 0.6)
                    setScrollFactor('head'..i, 1.2, 1.2)
                    addLuaSprite('head'..i)
                    setProperty('head'..i..'.alpha', 0)
                    doTweenAlpha('faceSpawn'..i, 'head'..i, 1, 0.3, 'quadInOut')
                    doTweenX('faceX'..i, 'head'..i, getProperty('head'..i..'.x') + getRandomInt(-15, 15), 0.6, 'quadInOut')
                    if i == 5 then
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') - 25, 0.6, 'quadInOut')
                    else
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') + 25, 0.6, 'quadInOut')
                    end
                    doTweenAngle('faceAngle'..i, 'head'..i, getProperty('head'..i..'.angle') + getRandomInt(-10, 10), 0.6, 'quadInOut')
                end
            elseif v1 == 'up' then
                if i <= 3 then
                    makeLuaSprite('head'..i, 'song specific and bgs/whiteface/Face0'..getRandomInt(1,6), 60, -50 + (180*i))
                    scaleObject('head'..i, 0.6, 0.6)
                    setScrollFactor('head'..i, 1.2, 1.2)
                    addLuaSprite('head'..i)
                    setProperty('head'..i..'.alpha', 0)
                    doTweenAlpha('faceSpawn'..i, 'head'..i, 1, 0.3, 'quadInOut')
                    doTweenX('faceX'..i, 'head'..i, getProperty('head'..i..'.x') + getRandomInt(-15, 15), 0.6, 'quadInOut')
                    if i == 2 then
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') - 25, 0.6, 'quadInOut')
                    else
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') + 25, 0.6, 'quadInOut')
                    end
                    doTweenAngle('faceAngle'..i, 'head'..i, getProperty('head'..i..'.angle') + getRandomInt(-10, 10), 0.6, 'quadInOut')
                elseif i >= 4 then
                    makeLuaSprite('head'..i, 'song specific and bgs/whiteface/Face0'..getRandomInt(1,6), 560, -50 + (180*(i-3)))
                    scaleObject('head'..i, 0.6, 0.6)
                    setScrollFactor('head'..i, 1.2, 1.2)
                    addLuaSprite('head'..i)
                    setProperty('head'..i..'.alpha', 0)
                    doTweenAlpha('faceSpawn'..i, 'head'..i, 1, 0.3, 'quadInOut')
                    doTweenX('faceX'..i, 'head'..i, getProperty('head'..i..'.x') + getRandomInt(-15, 15), 0.6, 'quadInOut')
                    if i == 5 then
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') + 25, 0.6, 'quadInOut')
                    else
                        doTweenY('faceY'..i, 'head'..i, getProperty('head'..i..'.y') - 25, 0.6, 'quadInOut')
                    end
                    doTweenAngle('faceAngle'..i, 'head'..i, getProperty('head'..i..'.angle') + getRandomInt(-10, 10), 0.6, 'quadInOut')
                end
            end
        end
    end
end

function onTweenCompleted(t)
    for i = 1,6 do
        if t == 'faceSpawn'..i then
            doTweenAlpha('faceKill'..i, 'head'..i, 0, 0.3, 'quadInOut')
        end
        if t == 'faceKill'..i then
            cancelTween('faceX'..i)
            cancelTween('faceY'..i)
            cancelTween('faceAngle'..i)
            removeLuaSprite('head'..i)
        end
    end
end