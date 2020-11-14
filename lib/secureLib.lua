-- A library used for security

local function genPass(length)
  length = tonumber(length)
  if length == nil then length = 0 end
  local password = ""
  math.randomseed(math.floor(os.clock()*10000))
  for i = 1, length do password = password .. string.char(math.random(33, 126)) end
  return password
end

local function hashFile(file, hash)
  if file == nil then os.exit() end
  if hash == nil then os.exit() end
  hash = string.lower(hash)
  local file = io.open(file, 'r')
  local contents = file:read("*all")
  file:close()
  local sha = require("sha2")
  if hash == "md5" then
    hashed = sha.md5(content)
  elseif hash == "sha1" then
    hashed = sha.sha1(content)
  elseif hash == "sha224" then
    hashed = sha.sha224(content)
  elseif hash == "sha256" then
    hashed = sha.sha256(content)
  elseif hash == "sha384" then
    hashed = sha.sha384(content)
  elseif hash == "sha512" then
    hashed = sha.sha512(content)
  elseif hash == "sha512_224" then
    hashed = sha.sha512_224(content)
  elseif hash == "sha512_256" then
    hashed = sha.sha512_256(content)
  elseif hash == "sha3_224" then
    hashed = sha.sha3_224(content)
  elseif hash == "sha3_256" then
    hashed = sha.sha3_256(content)
  elseif hash == "sha3_384" then
    hashed = sha.sha3_384(content)
  elseif hash == "sha3_512" then
    hashed = sha.sha3_512(content)
  else
    os.exit()
  end
  return hashed
end

secLib = {}
secLib.genPass = genPass
secLib.hashFile = hashFile
