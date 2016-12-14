fs = require 'fs'
path = require 'path'
isfileexist = require './isfileexist'


module.exports = getRfmlFiles = ->

  requiredJsonPath = path.join __dirname, '../required.json'
  required = JSON.parse fs.readFileSync requiredJsonPath, 'utf8'

  files = fs.readdirSync required.rfmlPaths

  files.filter (file) -> file.indexOf('.rfml') != -1
