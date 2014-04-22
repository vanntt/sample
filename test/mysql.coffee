Mysql = require '../target/common/mysql'
should = require 'should'
assert = require 'assert'

describe 'Mysql', () ->
  describe 'openConnection', () ->
    it 'no error', (done) ->
      mysql = new Mysql()
      mysql.openConnection()
      done()

  describe 'query', () ->
    it 'no error', (done) ->
      mysql = new Mysql()
      mysql.query 'select * from '+Mysql.TABLE
      done()
