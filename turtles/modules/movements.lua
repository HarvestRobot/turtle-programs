local movements = {}

-- Movement library

function movements.goForward(steps)
  if steps == nil then
    while not turtle.detect() do
      turtle.forward()
    end
  else
    for i=0,steps-1,1 do
      turtle.forward()
    end
  end
end

function movements.goUp(steps)
  if steps == nil then
    while not turtle.detectUp() do
      turtle.up()
    end
  else
    for i=0,steps-1,1 do
      turtle.up()
    end
  end
end

function movements.goDown(steps)
  if steps == nil then
    while not turtle.detectDown() do
      turtle.down()
    end
  else
    for i=0,steps-1,1 do
      turtle.down()
    end
  end
end

return movements
