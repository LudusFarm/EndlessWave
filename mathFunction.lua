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

tremors_math = {}

valueY = {}
valueSin = {}
alfa=0
beta=0
amp=0
betaIncrease=true
gammaIncrease=true
betaWater=0
ampWater=0

function tremors_math.Load()
  ampWater=0
  betaWater=0
  end

function tremors_math.setFunction(valueBeta,valueGamma)
  beta=valueBeta -- da 0 a 2
  amp=valueGamma -- da -10 a 10
  index=0
  counter=0
  w= love.window.getMode()
    for i= 0,w do
      counter = counter + 1
        value = amp*((math.sin(index*beta)+math.cos(index/10)))+50
        valueSin[i] = value
          if counter==2 then
            counter=0
            index= index +1
          end
        end
  end

function tremors_math.return_target()
  return valueSin
end
  
function tremors_math.fillVector()
  index=0
  counter=0
  w= love.window.getMode()
    for i = 0,w do
      counter= counter + 1
        value=ampWater*((math.sin(index*betaWater)+math.cos(index/10)))
        valueY[i] = (value or 1) + 340
          if counter==2 then
            counter=0
            index= index +1
          end
        end
  end

function tremors_math.printVector()
  for i=1, 50 do
      print(valueY[i])
    end
end

function tremors_math.jumpMath()
  if betaIncrease and betaWater<0.5 then
       betaWater=betaWater+0.1
       tremors_math.fillVector()
        if(betaWater==0.5) then
         betaIncrease= false
       end
    else
      betaWater=betaWater-0.1
        tremors_math.fillVector()
        if(betaWater<= 0.11) then
          betaIncrease= true
        end


    end
end

function tremors_math.singMath()
  if gammaIncrease and ampWater < 5 then
      ampWater= ampWater+1
      tremors_math.fillVector()
       if(ampWater==5) then
        gammaIncrease= false
      end
   else
     ampWater=ampWater-1
       tremors_math.fillVector()
       if(ampWater==0) then
         gammaIncrease= true
       end
   end
end

function tremors_math.return_array()
  return valueY
end

function tremors_math.isEqual()
  return beta==betaWater and amp==ampWaterNextLevel
end  


return tremors_math
