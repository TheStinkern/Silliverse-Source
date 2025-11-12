function onUpdate()
    if ratingName == '?' then
        setRatingName('No Notes Hit') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Womp Womp') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Stinky') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Skill Issue') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Bruh') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('GRRGHGH') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('So Good') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('So Good') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('So Good') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('So Good') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('You Dun It!') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Pumpkin Eater') --When the botplay is activated
    end
end