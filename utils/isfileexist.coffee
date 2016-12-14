fs = require 'fs'

module.exports = isFileExist = (filename) ->

  exists = no

  try
    stats = fs.lstatSync "#{filename}"
    exists = stats.isFile()
  catch
    console.info "#{filename} doesnt exist at all. Proceeding..."

  exists
