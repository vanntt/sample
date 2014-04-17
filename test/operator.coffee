add = require('../target/operator').add
pow = require('../target/operator').pow
assert = require 'assert'
should = require 'should'

describe 'Operator', () ->
  describe 'add', () ->
    it 'should return sum of two numbers', (done) ->
      add( 2, 3).should.equal 5
      done()

  describe 'pow', () ->
    it 'should return the correct result', (done) ->
      pow( 2, 3).should.equal 9
      done()
