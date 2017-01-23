--[[
	This file is part of EndlessWave.

    EndlessWave is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    EndlessWave is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with EndlessWave.  If not, see <http://www.gnu.org/licenses/>.
--]]

require "Rect"

Player = {}

player_rect        = {x = 0, y = 0, width = 70, height = 90}
jumping            = false
velocity           = 10
jump_times         = 20
normal_velocity    = 10
faster_velocity    = 25
attacking          = false
attack_direction   = 0 -- 0 = left 1 = right
attack_times       = 10
attack_rect        = {x = 0, y = 0, width = 95, height = 65}
lifes              = 5

function Player.Load()
  image = love.graphics.newImage('pavarottimotion-01.png')
  local g = anim8.newGrid(110, 150, image:getWidth(), image:getHeight())
  animation_left_static = anim8.newAnimation(g('1-1',1), 0.1)
  animation_left_jump   = anim8.newAnimation(g('1-4',1), 0.1)
  wave = love.graphics.newImage('assets/Wave.png')
  player_rect.x = 10
  player_rect.y = 0
  
end

function Player.Update(water_line)
  if attacking == false then
    if love.keyboard.isDown('left')  then
      if player_rect.x >= 0 then
        player_rect.x = player_rect.x - velocity
        attack_direction = 1
      end
    end

    if love.keyboard.isDown('right') then
      w = love.window.getMode()
      if player_rect.x < w - 110 then
        player_rect.x = player_rect.x + velocity
        attack_direction = 0
      end
    end

    if player_rect.y >= water_line then
      if love.keyboard.isDown('x') then
        if jumping == false then
          jumping = true
        end
      end
    end
  end
  
  if love.keyboard.isDown('z') then
    if attacking == false then
      attacking = true
      attack_rect.x = player_rect.x
      attack_rect.y = player_rect.y + 75
    end
  end

  if jumping == false and player_rect.y < water_line then
    player_rect.y = player_rect.y + velocity
  elseif jumping == true then
    if jump_times > 0 then
      player_rect.y = player_rect.y - velocity
      jump_times = jump_times - 1
    else
      jump_times = 12
      jumping = false
    end
  end
  
  if attacking == true then
    if attack_direction == 0 then
      attack_rect.x = attack_rect.x + faster_velocity
    elseif attack_direction == 1 then 
      attack_rect.x = attack_rect.x - faster_velocity
    end
    attack_times = attack_times - 1
    if attack_times == 0 then
      attacking = false
      attack_times = 16
    end
  end
end

function Player.Is_Singing()
  return attacking
end

function Player.Get_Attack_Collision_Rect()
  return attack_rect
end

function Player.Get_Position()
  return player_rect.x, player_rect.y
end

function Player.Is_Jumping()
  return jumping
end

function Player.Subtract_Life()
  if in_damge == false then
    lifes = lifes - 1
  end
end

function Player.Is_Alive()
  return lifes > 0
end

function Player.Draw()
  if attacking == true then
    love.graphics.draw(wave, attack_rect.x, attack_rect.y)
  end
  
  animation_left_jump:gotoFrame(player_index)
  animation_left_jump:draw(image, player_rect.x, player_rect.y)
  
  if next_frame == 3 then
    player_index = player_index + 1
    next_frame = 0
  else
    next_frame = next_frame + 1
  end
  
  if player_index == 5 then
    player_index = 1
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key=="x" then
    tremors_math.jumpMath()
  end
  if key=="z" then
    tremors_math.singMath()
  end
end

return Player
