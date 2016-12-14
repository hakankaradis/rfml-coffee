fs = require 'fs'
path = require 'path'
savefile = require './savefile'
getrfmlfiles = require './getrfmlfiles'
parserfmlfiles = require './parserfmlfiles'

module.exports = CreateMappingJson = (callback = ->) ->
   mappingPath = path.join __dirname, '../mapping.json'
   mapping = parserfmlfiles()
   savefile mappingPath, JSON.stringify mapping, null, 2, callback
