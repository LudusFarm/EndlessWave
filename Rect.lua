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

Rect = {}

--function Rect.Ceck_Collision(rect_a, rect_b)    --check collision between 2 rect
  --return rect_a.x < rect_b.x + rect_b.width  and
    --     rect_b.x < rect_a.x + rect_a.width  and
      --   rect_a.y < rect_b.y + rect_b.height and
        -- rect_b.y < rect_a.x + rect_a.height
--end

function Rect.Check_Collision(rect1, x,y,w,h)    --check collision between 2 rect
  return rect1.x < x + w           and
         rect1.x + rect1.width > x and
         rect1.y < y + h           and
         rect1.height + rect1.y > y 
end


return Rect
