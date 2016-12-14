fs = require 'fs'

module.exports = SaveFile = (filename, content, callback = ->) ->
  fs.writeFile filename, content, -> callback()