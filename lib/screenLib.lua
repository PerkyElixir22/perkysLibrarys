-- A library to make your life easier when doing stuff with screens and colors

local function clrScreen(color)
  color = tonumber(color)
  if color == nil then color = 0 end
  if color < 0 then color = 0 end
  if color > 16843008 then color = 16843008 end
  local gpu = require("component").gpu
  local temp = gpu.getBackground()
  local w, h = gpu.getResolution()
  gpu.setBackground(color)
  gpu.fill(1, 1, w, h, " ")
  gpu.setBackground(temp)
end

local function cntText(text, y)
  local gpu = require("component").gpu
  local w, h = gpu.getResolution()
  text = tostring(text)
  y = tonumber(y)
  if text == nil then text = " " end
  if y == nil then y = 1 end
  if #text > w then text = string.sub(text, 1, (w-#text)) end
  gpu.set((w/2)-(#text/2), y, text)
end

scrLib = {}
scrLib.clrScreen = clrScreen
scrLib.cntText = cntText
