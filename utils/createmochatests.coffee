fs = require 'fs'
path = require 'path'
async = require 'async'
isfileexist = require './isfileexist'
getrfmlfiles = require './getrfmlfiles'
createmochatest = require './createmochatest'
{ initializeEssentialFiles, fillEssentialFiles } = require './essentialfiles'


module.exports = CreateMochaTests = (callback = ->) ->

  requiredJsonPath = path.join __dirname, '../required.json'
  required = JSON.parse fs.readFileSync requiredJsonPath, 'utf8'

  # initializeNeccessaryFiles
  initializeEssentialFiles()

  # read mapping json
  mappingJsonPath = path.join __dirname, '../mapping.json'
  isMappingJsonExist = isfileexist mappingJsonPath
  return console.info 'mapping.json doesn\'t found'  unless isMappingJsonExist

  mapping = JSON.parse fs.readFileSync mappingJsonPath, 'utf8'

  fileNames = getrfmlfiles()

  func = (fileName, next) =>
    fileName = fileName.split('.')[0]
    if not isfileexist path.join(required.mochaPaths, "#{fileName}.coffee")
      createmochatest mapping, fileName, next
      fillEssentialFiles fileName

  queue = fileNames.map (fileName) -> (next) -> func fileName, next
  async.series queue, callback
