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

function love.conf(t)                  --SET
	t.window.title = "Endless Wave"                -- -The window name  (sting)
	t.window.width = 800               -- -The window width (number)
  t.window.height = 450							 -- -The window height  "   "
	t.window.resizable =true
	t.window.fullscreen = false         -- Enable fullscreen (boolean)
	t.window.fullscreentype = "exclusive"
--t.window.fullscreentype = "desktop"
end
