Mysql = require '../target/mysql'
should = require 'should'
assert = require 'assert'

describe 'Mysql', () ->
  describe 'openConnection', () ->
    it 'no error', (done) ->
      mysql = new Mysql()
      mysql.openConnection()
      done()

  describe 'openConnection', () ->
    it 'throw error', (done) ->
      mysql = new Mysql()
      assert.ifError mysql.openConnection()
      done()

  describe 'query', () ->
    it 'no error', (done) ->
      mysql = new Mysql()
      mysql.query 'select * from '+Mysql.TABLE
      done()
