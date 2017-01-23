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
Ennemy={}

Ennemy_vector={}
width=100
height=100
Ennemy_x= {}
Ennemy_y = {}
Ennemy_alive= {false,false,false,false,false}
Ennemy_direction = {}

function Ennemy.Update(water_line)
  for i=0,5 do
    if(Ennemy_alive[i]) then
      if Ennemy_y[i]< water_line then
        Ennemy_y[i] = Ennemy_y[i] + velocity*2
      end -- waterline

      Ennemy_x[i] = Ennemy_x[i] + velocity * Ennemy_direction[i]
      if Ennemy_x[i] < math.random(-2500, -500) then
        Ennemy_direction[i] = 1
      end --math.random

      if Ennemy_x[i] > math.random (1500,3500) then
        Ennemy_direction[i]=-1
      end --math,random

      else
        god=math.random(0, 1000)
        if god<2 then
          Ennemy_alive[i]=true
          Ennemy_y[i]=0
          Ennemy_x[i]=1000
          Ennemy_direction[i]=-1
        end
      end
  end-- for
end
function Ennemy.Get_Position(index)
  return Ennemy_x[index], Ennemy_y[index]
end
function Ennemy.Get_Alive(index)
  return Ennemy_alive[index]
end

function Ennemy.getX(index)
  return  Ennemy_x[index]
end

function Ennemy.getY(index)
  return  Ennemy_y[index]
end

function Ennemy.getWidth()
  return  width
end

function Ennemy.getHeight()
  return  height
end

return Ennemy
