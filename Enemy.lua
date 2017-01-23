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

Enemy={}

Enemy_vector={}
width = 25
height= 70
Enemy_x= {}
Enemy_y = {}
Enemy_alive= {false,false,false,false,false}
Enemy_direction = {}


function Enemy.Load() 
  Enemy_alive={false,false,false,false,false}
  enemy_image = love.graphics.newImage('assets/Enemy.png')
end

function Enemy.Update(water_line)
  for i=0,5 do
    if(Enemy_alive[i]) then
      if Enemy_y[i] < water_line then
        Enemy_y[i] = Enemy_y[i] + velocity*2
      end -- waterline

      Enemy_x[i] = Enemy_x[i] + velocity * Enemy_direction[i]
      if Enemy_x[i] < math.random(-2500, -500) then
        Enemy_direction[i] = 1
      end --math.random

      if Enemy_x[i] > math.random (1500, 3500) then
        Enemy_direction[i] = -1
      end --math,random

      else
        god = math.random(0, 1000)
        if god < 2 then
          Enemy_alive[i]=true
          Enemy_y[i]=0
          Enemy_x[i]=1000
          Enemy_direction[i]=-1
        end
      end
  end-- for
end

function Has_Collided(index)
    voice= Player.Get_Attack_Collision_Rect()
    for i=0,5 do
    if(Enemy.Get_Alive(i)) then
      if(Rect.Check_Collision(voice, Enemy.getX(i), Enemy.getY(i), Enemy.getWidth(), Enemy.getHeight())) then
          collision(i)
      end--ceck
    end--alive
  end --for
end

function collision(index)
    Enemy_direction[index]=Enemy_direction[index]*-1
end

function Enemy.Draw()
  for i = 0,5 do
    if(Enemy.Get_Alive(i)) then
      love.graphics.draw(enemy_image, Enemy_x[i], Enemy_y[i])
    end
  end
end

function Enemy.Get_Position(index)
  return Enemy_x[index], Enemy_y[index]
end
function Enemy.Get_Alive(index)
  return Enemy_alive[index]
end

function Enemy.getX(index)
  return  Enemy_x[index]
end

function Enemy.getY(index)
  return  Enemy_y[index]
end

function Enemy.getWidth()
  return  width
end

function Enemy.getHeight()
  return  height
end

return Enemy
