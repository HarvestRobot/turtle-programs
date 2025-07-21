rednet.open("left")
local idMainComputer = 0
local movements = require("../modules.movements")

print("   ______")
print("  |      |")
print("  |      |")
print("  |      |")
print("A |      |")
print("  |      |")
print("  |      |")
print("  |______|")
print("  ^  B    ")
print("")
print("Yo empezaré por la flecha.")
print("Introduce el número del lado A:")
a = tonumber(read())
print("Introduce el número del lado B:")
b = tonumber(read())
print("Introduce la profundidad (1 por defecto):")
c = read()
if c == "" then
  c = 1
else 
  c = tonumber(c)
end

rednet.send(idMainComputer, "Miner dice: Voy a minar un área de "..a.."x"..b.."x"..c)

for k=1,c,1 do
  for i=1,b,1 do
    for j=1,a,1 do
      turtle.dig()
      turtle.forward()
    end
    if i ~= b then
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
    end
    if (i == b) and (i % 2 == 0) then
      turtle.turnRight()
      movements.goForward(b-1)
      turtle.turnLeft()
    end
    
    if turtle.getFuelLevel() == 0 then
      rednet.send(idMainComputer, "Miner dice: Me he quedado sin fuel...")
    end
  end
  
  if k ~= c then 
    turtle.digDown()
    turtle.down()
    turtle.turnRight()
    turtle.turnRight()
  end
end

rednet.send(idMainComputer, "Miner ha terminado de minar el área.")

