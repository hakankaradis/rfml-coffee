fs = require 'fs'
path = require 'path'
isfileexist = require './isfileexist'
getrfmlfiles = require './getrfmlfiles'
{ parseTestSteps,
  parseFileHeader,
  parseEmbeddedTestInfo } = require './parserfmlfile'


module.exports = ParseRFMLFiles = ->

  requiredJsonPath = path.join __dirname, '../required.json'
  required = JSON.parse fs.readFileSync requiredJsonPath, 'utf8'

  mapping = {}
  fileNames = getrfmlfiles()

  fileNames.forEach (fileName) ->
    body = fs.readFileSync path.join(required.rfmlPaths, "#{fileName}"), 'utf-8'
    body = body.split '\n\n'

    fileName = fileName.split('.')[0]
    # header parse
    header = parseFileHeader body[0].split('\n')

    embedded = parseEmbeddedTestInfo body[1].split('\n')

    # body parse
    startIndex = 1
    startIndex = 2  if embedded
    steps = parseTestSteps body, startIndex

    testCount = steps.length
    { id, startUri, tag } = header
    mapping[fileName] = { id, startUri, testCount, steps, tag, embedded: embedded if embedded? }

  mapping
