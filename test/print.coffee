printApple = require( '../target/common/print' ).printApple
printOrange = require( '../target/common/print' ).printOrange
should = require 'should'
assert = require 'assert'

describe 'Print', () ->
  describe 'printApple', () ->
    it 'should print Apple', () ->
      assert.equal( printApple(), 'Apple' )

  describe 'printOrange', () ->
    it 'should print Orange', () ->
      printOrange().should.equal 'Orange'
