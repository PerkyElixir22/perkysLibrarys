-- A library used for security

local function generatePassword(length)
  length = tonumber(length)
  if length == nil then length = 0 end
  local password = ""
  math.randomseed(math.floor(os.clock()*10000))
  for i = 1, length do password = password .. string.char(math.random(33, 126)) end
  return password
end

secLib = {}
secLib.generatePassword = generatePassword
