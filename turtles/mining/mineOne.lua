-- Open rednet to send messages
rednet.open("left")
print("Empezando a picar...")

-- Variables
local idMainComputer = 0
rednet.send(idMainComputer, "Miner está empezando a picar.")
local utils = require("../modules.utils")

-- Functions

function mineOneUntilFull()
  while turtle.getItemCount(15) == 0 do
    if turtle.detect() then
      turtle.dig()
    end
  end
end

-- Main program

while(true) do
  turtle.select(1)
  mineOneUntilFull()

  turtle.turnLeft()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
  turtle.forward()

  utils.dumpAllInventoryForward()
  if turtle.suck() == false then
    break
  end
  turtle.turnLeft()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnRight()
  turtle.forward()
  turtle.forward()
end

rednet.send(idMainComputer, "Miner ha terminado de trabajar.")
