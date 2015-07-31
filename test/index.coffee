should = require 'should'
{validate} = require('json-schema')

{getAccountStats} = require '../lib'
responseSchema = require '../lib/response.schema'

describe 'scrape account stats', ->
  it 'should return properly structured data', ->
    getAccountStats(userId: '969179904094908416').then((account) ->
      validate(account, responseSchema).errors.should.eql([])
    )
