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

Line = {}     --library for draw line using the y array
w=love.window.getMode()
function draw_line(array)
  for pic_i=0,w do
    love.graphics.setPointSize(6)
    love.graphics.setColor(19, 60, 76)
    love.graphics.points(pic_i, (array[pic_i]or 1))
    love.graphics.setColor(185, 217, 234)
    love.graphics.points(pic_i, (array[pic_i]or 1)+6)
    love.graphics.setColor(75, 162, 223)
    love.graphics.points(pic_i, (array[pic_i]or 1)+12)
    love.graphics.setColor(255, 255, 255, 255)
  end
end

return Line
