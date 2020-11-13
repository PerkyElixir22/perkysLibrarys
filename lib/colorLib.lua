-- A library for handling colors

local function rgb(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r == nil then r = 0 end
  if g == nil then g = 0 end
  if b == nil then b = 0 end
  if r > 255 then r = 255 end
  if g > 255 then g = 255 end
  if b > 255 then b = 255 end
  if r < 0 then r = 0 end
  if g < 0 then g = 0 end
  if b < 0 then b = 0 end
  r = r*65536
  g = g*255
  b = b*1
  return r+g+b
end

clrLib = {}
clrLib.rgb = rgb
