-- A library used for security

local function genPass(length)
  length = tonumber(length)
  if length == nil then length = 0 end
  local password = ""
  math.randomseed(math.floor(os.clock()*10000))
  for i = 1, length do password = password .. string.char(math.random(33, 126)) end
  return password
end

local function advGenPass(length, check)
  check = tonumber(check)
  if check == nil then check = 8 end
  if check > 64 then check = 64 end
  if check < 1 then check = 1 end
  
  checkBack = check
    
  local pass = ""
  local check = {}
  for i = 1, checkBack do check[i] = "a" end
  for i = 1, length do
    math.randomseed(math.floor(os.clock()*10000000))
    local new = string.char(math.random(33, 126))
  
    local tmp = false
    while true do
      for j = 1, checkBack do
        if new == check[j] then new = string.char(math.random(33, 126)) tmp = false else tmp = true end
      end
      if tmp == true then
        for j = 1, checkBack do
          if new == check[j] then tmp = false end
        end
      end
      if tmp == true then break end
    end
  
    pass = pass .. new
  
    for j = checkBack, 2, -1 do
      check[j] = check[j-1]
    end
    check[1] = new
  end
 return pass
end


local function hashFile(file, hashChoice)
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
secLib.advGenPass = advGenPass
