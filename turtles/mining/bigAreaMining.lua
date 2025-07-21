rednet.open("left")
local idMainComputer = 0
local movements = require("../modules.movements")
local utils = require("../modules.utils")

print("    ______")
print("   |      |")
print("   |      |")
print("20 |      |")
print("   |      |")
print("   |______|")
print("   ^  20   ")
print("Yo empezaré por la flecha.")
print("Acuérdate de poner un cofre grande detrás de mí.")
print("Presiona ENTER para continuar...")
read()
rednet.send(idMainComputer, "Miner dice: Minando minerales...")

for k=1,20,1 do
 for i=1,20,1 do
    for j=1,20,1 do
      while turtle.detect() do
        turtle.dig()
      end
      turtle.forward()
    end
    if i ~= 20 then
      if i % 2 == 0 then
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
      else
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
      end
    else
      turtle.turnRight()
      movements.goForward(19)
      turtle.turnLeft()
    end
    
    if turtle.getFuelLevel() == 0 then
      rednet.send(idMainComputer, "Miner dice: Me he quedado sin fuel...")
    end
  end
  
  if k ~= 20 then
    movements.goUp(k-1)
    utils.dumpAllInventoryForward()
    movements.goDown(k-1) 
    turtle.digDown()
    turtle.down()
    turtle.turnRight()
    turtle.turnRight()
  end
end

movements.goUp(20)
rednet.send(idMainComputer, "Miner ha terminado de minar el área.")

