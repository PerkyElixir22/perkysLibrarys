-- A library used for using the internet card easier

local function sendFile(file, port, address)
  local modem = require("component").modem
  local file = io.open(file, 'r')
  local content = file:read("*all")
  file:close()
  modem.send(address, port, content, file)
end

local function broadcastFile(file, port)
  local modem = require("component").modem
  local file = io.open(file, 'r')
  local content = file:read("*all")
  file:close()
  modem.broadcast(port, content, file)
end

modemLib = {}
modemLib.sendFile = sendFile
modemLib.broadcastFile = broadcastFile
