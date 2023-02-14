--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

-- Medal Images
iron = love.graphics.newImage('iron.png')
bronze = love.graphics.newImage('bronze.png')
silver = love.graphics.newImage('silver.png')
gold = love.graphics.newImage('gold.png')
diamond = love.graphics.newImage('diamond.png')

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score >= 5 and self.score < 10 then
        love.graphics.printf('You got bronze medal !', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(bronze, 225, 125, 0, 0.25, 0.25)
    elseif self.score >= 10 and self.score < 15 then
        love.graphics.printf('You got silver medal !', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(silver, 225, 125, 0, 0.25, 0.25)
    elseif self.score >= 15 and self.score < 20 then
        love.graphics.printf('You got gold medal !', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(gold, 225, 125, 0, 0.25, 0.25)
    elseif self.score >= 25 then
        love.graphics.printf('You got gold medal !', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(diamond, 225, 125, 0, 0.25, 0.25)
    else
        love.graphics.printf('You got iron medal !', 0, 200, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(iron, 225, 125, 0, 0.25, 0.25)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end
