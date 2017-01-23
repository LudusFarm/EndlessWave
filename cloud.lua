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

tremors_cloud = {}
x=0
y=0
image="assets/img/cloud.png"

function tremors_cloud.getX()
  return x
end

function tremors_cloud.getY()
  return y
end

function tremors_cloud.setX(value)
  x=value
end

function tremors_cloud.getY(value)
  y=value
end

function tremors_cloud.image()
    return image
end

return tremors_cloud
