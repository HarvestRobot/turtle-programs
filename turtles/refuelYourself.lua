rednet.open("left")
local idMainComputer = 0

print("¡Vamos a llenar este depósito!")
print("Deja un cubo vacío en el primer slot de mi inventario.")
print("")
print("¿Cuántas veces hago refuel?")
times = tonumber(read())
rednet.send(idMainComputer, "Miner está llenando su depósito.")

turtle.up()

for i=1,times,1 do
  turtle.drop()
  sleep(4)
  turtle.forward()
  turtle.suckDown()
  turtle.refuel()
  turtle.back()
end

rednet.send(idMainComputer, "Miner ha terminado de llenar su depósito.")
print("¡Hecho! Ahora puedo dar ".. turtle.getFuelLevel().." pasos.")

