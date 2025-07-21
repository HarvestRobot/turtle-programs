print("¿Cuántos bloques voy a minar?")
number = read()

for i=1,number,1 do
  turtle.dig()
  turtle.forward()
end
