{getAccountStats} = require './'
packageInfo = require '../package'
ArgumentParser = require('argparse').ArgumentParser

argparser = new ArgumentParser(
  version: packageInfo.version
  addHelp: true
  description: packageInfo.description
)

group = argparser.addMutuallyExclusiveGroup(required: true)
group.addArgument(
  ['--id']
  type: 'string'
  help: 'The userId of the account to scrape. This is an integer with about 18
  digits.'
  dest: 'userId'
)
group.addArgument(
  ['--username', '-u']
  type: 'string'
  help: 'Username of the account to scrape. Within Vine.co, this is the last
  segment of the "vanity URL"'
)

argv = argparser.parseArgs()
getAccountStats(argv).then((res) ->
  console.log(JSON.stringify(res))
)
