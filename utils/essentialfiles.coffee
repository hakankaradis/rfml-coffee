fs = require 'fs'
path = require 'path'

# read required json
requiredJsonPath = path.join __dirname, '../required.json'
required = JSON.parse fs.readFileSync requiredJsonPath, 'utf8'


initializeEssentialFiles = ->

  fs.writeFile path.join(required.mochaPaths, 'index.coffee'), 'module.exports = {\n'
  fs.writeFile path.join(required.mochaPaths, 'filenames.coffee'), 'module.exports = {\n'


fillEssentialFiles = (fileName) ->

  fs.appendFile path.join(required.mochaPaths, "index.coffee"), "  #{fileName}: require './#{fileName}'\n"
  fs.appendFile path.join(required.mochaPaths, "filenames.coffee"), "  '#{fileName}'\n"


closeEssentialFiles = ->

  fs.appendFile path.join(required.mochaPaths, 'index.coffee'), "}\n"
  fs.appendFile path.join(required.mochaPaths, 'filenames.coffee'), "}\n"


module.exports = {
  initializeEssentialFiles
  fillEssentialFiles
  closeEssentialFiles
}
