parseTestSteps = (body, index = 1) ->

  steps = []
  [index..body.length - 1].forEach (i) ->
    step = body[i]
    if step.length
      # remove redirect line
      if step.indexOf('redirect') > -1
        s = step.split('\n')
        s.shift()
        step = s.join('\n')

      # get descritions and assertions
      [description, asserts...] = step.split('\n')
      step = { description, asserts: asserts[0].trim().split('? ') }
      steps.push step

  steps


parseFileHeader = (header) ->

  id = header[0].split(' ')[1]
  startUri = header[2].split(':')[1].trim()
  tag = header[3].split(':')[1]

  if id and startUri and tag then { id, startUri, tag }
  else throw new Error('Parse failed! while parsing file header')


parseEmbeddedTestInfo = (embeddedInfo) ->

  return null  unless embeddedInfo[1].indexOf('-') is 0

  embedded =
    name: embeddedInfo[0].split(' ')[1]
    id: embeddedInfo[1].split(' ')[1]


module.exports = {
  parseTestSteps
  parseFileHeader
  parseEmbeddedTestInfo
}
