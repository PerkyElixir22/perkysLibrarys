-- A library to make your life easier when doing stuff with screens and colors

local function rgb(r, g, b)
  r = tonumber(r)
  g = tonumber(g)
  b = tonumber(b)
  if r = nil then r = 0 end
  if g = nil then g = 0 end
  if b = nil then b = 0 end
  if r > 256 then r = 256 end
  if g > 256 then g = 256 end
  if b > 256 then b = 256 end
  if r < 0 then r = 0 end
  if g < 0 then g = 0 end
  if b < 0 then b = 0 end
  r = r*65536
  g = g*256
  b = b*1
  return r+g+b
end

local function clearScreen(color)
  color = tonumber(color)
  if color = nil then color = 0 end
  if color < 0 then color = 0 end
  if color > 16843008 then color = 16843008 end
  local gpu = require("component").gpu
  local temp = gpu.getBackground()
  local w, h = gpu.getResolution()
  gpu.setBackground(color)
  gpu.fill(1, 1, w, h, " ")
  gpu.setBackground(temp)
end

local function centreText(text, y)
  local gpu = require("component").gpu
  local w, h = gpu.getResolution()
  text = tostring(text)
  y = tonumber(y)
  if text = nil then text = " " end
  if y = nil then y = 1 end
  if #text > w then text = string.sub(text, 1, w-#text) end
  gpu.set(w/2-#text/2, text)
end

screenLib = {}
screenLib.rgb = rgb
screenLib.clearScreen = clearScreen
screenLib.centreText = centreText
