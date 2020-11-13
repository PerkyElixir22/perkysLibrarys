-- A library for reading and writing to files.

local function fullWrite(file, text)
  file = tostring(file)
  text = tostring(text)
  if file == nil then os.exit() end
  if text == nil then os.exit() end
  local f = io.open(file, 'w')
  f:write(text.."\n")
  f:close()
end

fileLib = {}
fileLib.fullWrite = fullWrite
