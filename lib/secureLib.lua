-- A library used for security

local function genPass(length)
  length = tonumber(length)
  if length == nil then length = 0 end
  local password = ""
  math.randomseed(math.floor(os.clock()*10000))
  for i = 1, length do password = password .. string.char(math.random(33, 126)) end
  return password
end

local function hashFile(file, hashFunction)
  if file == nil then os.exit() end
  if hashFunction == nil then
    local component = require("component")
    hashFunction = component.data.md5
  end
  local file = io.open(file, 'r')
  local contents = file:read("*all")
  file:close()
  local hash = hashFunction(file)
  return hash
end

secLib = {}
secLib.genPass = genPass
secLib.hashFile = hashFile
