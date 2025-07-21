local utils = {}

function utils.dumpAllInventoryForward()
  for i=1,16,1 do
    turtle.select(i)
    turtle.drop()
  end
end

return utils
