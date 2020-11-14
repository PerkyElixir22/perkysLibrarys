-- A library used for security

local function genPass(length)
  length = tonumber(length)
  if length == nil then length = 0 end
  local password = ""
  math.randomseed(math.floor(os.clock()*10000))
  for i = 1, length do password = password .. string.char(math.random(33, 126)) end
  return password
end

local function hashFile(file, hashChoice)
  if file == nil then hashed = "no file specified" end
  if hashChoice == nil then hashed = "no hash type specified" end
  hashChoice = string.lower(hashChoice)
  local file = io.open(file, 'r')
  local contents = file:read("*all")
  file:close()
  local sha = require("sha2")
  if hashChoice == "md5" then
    hashed = sha.md5(contents)
  elseif hashChoice == "sha1" then
    hashed = sha.sha1(contents)
  elseif hashChoice == "sha224" then
    hashed = sha.sha224(contents)
  elseif hashChoice == "sha256" then
    hashed = sha.sha256(contents)
  elseif hashChoice == "sha384" then
    hashed = sha.sha384(contents)
  elseif hashChoice == "sha512" then
    hashed = sha.sha512(contents)
  elseif hashChoice == "sha512_224" then
    hashed = sha.sha512_224(contents)
  elseif hashChoice == "sha512_256" then
    hashed = sha.sha512_256(contents)
  elseif hashChoice == "sha3_224" then
    hashed = sha.sha3_224(contents)
  elseif hashChoice == "sha3_256" then
    hashed = sha.sha3_256(contents)
  elseif hashChoice == "sha3_384" then
    hashed = sha.sha3_384(contents)
  elseif hashChoice == "sha3_512" then
    hashed = sha.sha3_512(contents)
  else
    hashed = "invalid hash type"
  end
  return hashed
end

secLib = {}
secLib.genPass = genPass
secLib.hashFile = hashFile
