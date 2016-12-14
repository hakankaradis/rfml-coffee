path = require 'path'
savefile = require './savefile'


module.exports = CreateMochaTest = (mapping, fileName, callback = ->) ->

  embedded = mapping[fileName]?.embedded

  mocha = "$ = require 'jquery'\n"
  mocha += "assert = require 'assert'\n\n"
  # mocha += "#{embedded.name} = require './#{embedded.name}'\n\n"  if embedded
  mocha += "module.exports = ->\n\n"

  # mocha += "  #{embedded.name}()\n\n"  if embedded
  mocha += "  describe '#{fileName}', ->\n"
  steps = mapping[fileName].steps
  steps.forEach (step) ->
    description = step.description
    description = description.replace /"/g, "'"
    asserts = step.asserts
    mocha += "    describe \"#{description}?\", ->\n"
    mocha += '      before (done) -> \n'
    mocha += '        # implement before hook \n        done()\n\n\n'

    asserts.forEach (it) ->
      it = it.replace /"/g, "'"
      mocha += "      it \"#{it}?\", (done) -> \n"
      mocha += "        assert(false, 'Not Implemented')\n        done()\n\n"

  filePath = path.join 'mochafiles', "#{fileName}.coffee"
  savefile filePath, mocha, callback
