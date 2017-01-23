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

require "Player"
anim8 = require "anim8/anim8"

require "mathFunction"                       --import libreries
require "Line"
require "cloud"
require "Rect"
require "Enemy"

--SYSTEM VARIABLES
game_over = false
fps = 1/25                                   -- Set Fps
--

player_index    = 1
next_frame      = 0
state = 0 -- 0 menu 1 game 2 gameover 3 nextlevel

function loadGame()
  tremors_math.fillVector()
  love.window.setTitle= "Tremors"
  Player.Load()
  tremors_math.setFunction(0.5,5)
  --soundTrackGame = love.audio.newSource("assets/music/Soundtrack2.mp3","static")
  --soundTrackGame:setLooping(true)
  --soundTrackGame:play()  
  fond = love.graphics.newImage("assets/sea-01.png")
  Enemy.Load()
  tremors_math.Load()
end -- loadGame

function loadMenu()
  case=1
  velocityY=15
  velocityX=20
  love.window.setTitle= "Endless Wave"
  soundTrackMenu = love.audio.newSource("assets/music/sound.mp3","static")
  soundTrackMenu:setLooping(true)
  soundTrackMenu:play()
  menu_bg = love.graphics.newImage('assets/menu/1.png')
  nuvolaDietro = {image = love.graphics.newImage('assets/menu/2.png'),x=800,y=0} --0
  nuvolaDavanti = {image = love.graphics.newImage('assets/menu/3.png'),x=-800,y=0} --1
  mare = {image = love.graphics.newImage('assets/menu/4.png'),x=0,y=450} --2
  sole = {image = love.graphics.newImage('assets/menu/5.png'),x=-800,y=0} --3
  palma= {image = love.graphics.newImage('assets/menu/6.png'),x=800,y=0} --4
  personaggio= {image = love.graphics.newImage('assets/menu/7.png'),x=-800,y=0}--5
  titolo=  {image = love.graphics.newImage('assets/menu/8.png'),x=0,y=-450} --6
  bottoni={image = love.graphics.newImage('assets/menu/9.png'),x=0,y=450,} --7
  cursor={x=-800,y=800,w=163,h=41}
  playCursor={y=305,h=36}
  optCursor={y=350,h=21}
  scoreCursor={y=380,h=25}
  cursorIndex=1
  booleanCursor=false
end

function  loadGameOver()
  velocityY=5
  velocityX=10
  case=1
  love.window.setTitle= "Endless Wave"
 soundTrackGameOver = love.audio.newSource("assets/music/menu.mp3","static")
  soundTrackGameOver:setLooping(true)
  --soundTrackGameOver:play(0)
  menu_bg = love.graphics.newImage('assets/gameover/1.png')
	primo= {image = love.graphics.newImage('assets/gameover/2.png'),x=800,y=0} --0
  secondo = {image = love.graphics.newImage('assets/gameover/3.png'),x=-800,y=0} --1
  terzo = {image = love.graphics.newImage('assets/gameover/4.png'),x=0,y=-450} --2
  quarto = {image = love.graphics.newImage('assets/gameover/5.png'),x=0,y=450} --3
end

function loadNextLevel()
--create Next Level
end

function loadCredits()
  case=1
  velocityY=5
  velocityX=10
   startTime = love.timer.getTime()
	love.window.setTitle= "Endless Wave"
--  soundTrack = love.audio.newSource("assets/music/menu.mp3","static")
--  soundTrack:setLooping(true)
--  soundTrack:play(0)
  menu_bg_credit = love.graphics.newImage('assets/credits/1.png')
	primo_credit= {image = love.graphics.newImage('assets/credits/2.png'),x=0,y=-450} --0
  secondo_credit = {image = love.graphics.newImage('assets/credits/3.png'),x=0,y=450} --1
end

function loadVideo()
  videostream = love.video.newVideoStream("assets/video/video.ogv" )
	video = love.graphics.newVideo( videostream)
	video:play()
end

function love.load()
  if state == 0 then
    loadMenu()
  elseif state == 1 then
    loadGame()
  elseif state == 2 then
    loadGameOver()
  elseif state == 3 then
    loadNextLevel()
    elseif state ==  4 then
    loadCredits()
    elseif state == 5 then
    loadVideo()
  end  
end

function nextLevel()
  state=0
  --da vedere
end

function updateGame()
   if tremors_math.isEqual() then
    nextLevel()
  end
  Enemy.Update(230)
  x = Player.Get_Position()
  
  Player.Update((tremors_math.return_array()[x] or 1)-140)
  
  if love.keyboard.isDown('escape') then
    love.window.close()
  end --love.keyboard

  for i=0,5 do
    if(Enemy.Get_Alive(i)) then
      if(Rect.Check_Collision(player_rect, Enemy.getX(i), Enemy.getY(i), Enemy.getWidth(), Enemy.getHeight())) then
        Player.Subtract_Life()
        death()
      end--ceck
    end--alive
  end --for

  if Player.Is_Alive() == false then
    game_over = true
  end

end --updateGame

function updateMenu()
  if case==1 then
    nuvolaDietro.x=nuvolaDietro.x-velocityX
    nuvolaDavanti.x=nuvolaDavanti.x+velocityX
    if nuvolaDavanti.x==0 then
      case=2
    end
--case==1
 elseif case==2 then
    mare.y=mare.y-velocityY
    if mare.y==0 then
      case=3
    end
  --case==2
  elseif case==3 then
    personaggio.x=personaggio.x+velocityX
    if personaggio.x==0 then
       case=4
     end
     --case==3
   elseif case==4 then
      palma.x=palma.x-velocityX
      if palma.x==0 then
        case=5
      end
      --case==4
    elseif case==5 then
      sole.x=sole.x+velocityX
      if sole.x==0 then
         case=6
       end
       --case==5
     elseif case==6 then
        titolo.y=titolo.y+velocityY
        if titolo.y==0 then
          case=7
        end
        --case==6
      elseif case==7 then
         bottoni.y=bottoni.y-velocityY
         if bottoni.y==0 then
           case=8
         end
      elseif case==8 then
          cursor.x=400-cursor.w/2
          cursor.y=305
          case=9
      elseif case==9 then
        booleanCursor=true
      end
end

function updateGameOver()
  if case==1 then
    secondo.x=secondo.x+velocityX
    primo.x=primo.x-velocityX
    if primo.x==0 then
      case=2
    end
  --case==1
 elseif case==2 then
    terzo.y=terzo.y+velocityY
		quarto.y=quarto.y-velocityY
    if terzo.y==0 then
      case=3
    	end
    end
end

function updateNextLevel()
end

function updateCredits()
if(love.timer.getTime()-startTime > 15) then
  loadMenu()
  state=0
  end
 if case==1 then
    primo_credit.y=primo_credit.y+velocityY
    if primo_credit.y==0 then
      case=2
    end
--case==1
 elseif case==2 then
    secondo_credit.y=secondo_credit.y-velocityY
    if secondo_credit.y==0 then
      case=3
    end
  end
end

function updateVideo()
    if(videostream:isPlaying()) then
    else 
    loadMenu()
    state=0
	end
end 

function love.update()
  if state == 0 then
    updateMenu()
  elseif state == 1 then
    updateGame()
  elseif state == 2 then
    updateGameOver()
  elseif state == 3 then
    updateNextLevel()
  elseif state == 4  then
    updateCredits()
  elseif state == 5 then
    updateVideo()
  end   
end --update

function death()
  --soundTrackGame:stop()
  state=2
  loadGameOver()
end

function drawGame()
  love.graphics.setBackgroundColor( 185, 217, 234 )
  love.graphics.draw(fond, 0,60)
  --love.graphics.draw(menu_bg)
  love.graphics.draw(nuvolaDietro.image,nuvolaDietro.x,nuvolaDietro.y)
  love.graphics.draw(sole.image,sole.x,sole.y)
  love.graphics.draw(nuvolaDavanti.image,nuvolaDavanti.x,nuvolaDavanti.y)
  
  draw_line(tremors_math.return_array())
  draw_line(tremors_math.return_target())
  
  px, py = Player.Get_Position()
  Player.Draw()
  Enemy.Draw()

  if fps - love.timer.getDelta() < fps then
    love.timer.sleep(fps - love.timer.getDelta())
  end
end

function drawMenu()
  love.graphics.draw(menu_bg)
  love.graphics.draw(nuvolaDietro.image,nuvolaDietro.x,nuvolaDietro.y)
  love.graphics.draw(sole.image,sole.x,sole.y)
  love.graphics.draw(nuvolaDavanti.image,nuvolaDavanti.x,nuvolaDavanti.y)
  love.graphics.draw(mare.image,mare.x,mare.y)
  love.graphics.draw(palma.image,palma.x,palma.y)
  love.graphics.draw(personaggio.image,personaggio.x,personaggio.y)
  love.graphics.draw(titolo.image,titolo.x,titolo.y)
  love.graphics.draw(bottoni.image,bottoni.x,bottoni.y)
  love.graphics.rectangle("line",cursor.x,cursor.y, cursor.w, cursor.h)
end

function drawGameOver()
 	love.graphics.draw(menu_bg)
  love.graphics.draw(primo.image,primo.x,primo.y)
  love.graphics.draw(secondo.image,secondo.x,secondo.y)
  love.graphics.draw(terzo.image,terzo.x,terzo.y)
  love.graphics.draw(quarto.image,quarto.x,quarto.y)
end

function drawNextLevel()

end

function drawCredits()
print("cane")
  love.graphics.draw(menu_bg_credit)
  love.graphics.draw(primo_credit.image,primo_credit.x,primo_credit.y)
  love.graphics.draw(secondo_credit.image,secondo_credit.x,secondo_credit.y)
end

function drawVideo()
   love.graphics.draw(video, 90, 50)
end

function love.draw()
  if state==0 then
    drawMenu()
  elseif state==1 then
    drawGame()
  elseif state==2 then
    drawGameOver()
  elseif state==3 then 
    drawNextLevel()
  elseif state==4 then 
    drawCredits()
  elseif state==5 then
    
    drawVideo()
  end
end

function cursorDown()
  if(cursorIndex==1) then
      cursor.y=optCursor.y
      cursor.h=optCursor.h
      cursorIndex=4
    elseif(cursorIndex==4) then
      cursor.y=scoreCursor.y
      cursor.h=scoreCursor.h
      cursorIndex=5
    elseif (cursorIndex==5) then
      cursor.y=playCursor.y
      cursor.h=playCursor.h
      cursorIndex=1
  end
end

function cursorUp()
  if(cursorIndex==1) then
      cursor.y=scoreCursor.y
      cursor.h=scoreCursor.h
      cursorIndex=5
    elseif(cursorIndex==4) then
      cursor.y=playCursor.y
      cursor.h=playCursor.h
      cursorIndex=1
    elseif (cursorIndex==5) then
      cursor.y=optCursor.y
      cursor.h=optCursor.h
      cursorIndex=4
  end
end

function love.keypressed(key , scancode , isrepeat)
    if state==0 then
      if(key=="down") then
        cursorDown()
      elseif (key=="up") then
        cursorUp()
      elseif(key=="x") then
        if(cursorIndex==1) then
            state=cursorIndex
            loadGame()
         elseif cursorIndex==4 then
              state=cursorIndex
              loadCredits()
          elseif cursorIndex==5 then
              state=cursorIndex
              soundTrackMenu:stop()
              loadVideo()
        end
        end
    end
    if state==1 then
      if key=="x" then
    tremors_math.jumpMath()
    end
    if key=="z" then
      tremors_math.singMath()
    end
    end
    if state==2  then
      if key=="x" then
        loadMenu()
        state=0
      end
     end 
end


