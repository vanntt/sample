printApple = require( '../target/print' ).printApple
printOrange = require( '../target/print' ).printOrange
should = require 'should'
assert = require 'assert'

describe 'Print', () ->
  describe 'printApple', () ->
    it 'should print Apple', () ->
      assert.equal( printApple(), 'Applec' )

  describe 'printOrange', () ->
    it 'should print Orange', () ->
      printOrange().should.equal 'Orangee'
