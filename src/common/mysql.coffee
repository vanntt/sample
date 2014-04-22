class Mysql
  mysql = require('mysql')
  config = require('../config/config')
  connection = null


  Mysql.DB_CONFIG = 'mysql://'+
    config.DB_USER+
    ':'+
    config.DB_PASS+
    '@'+
    config.DB_HOST+
    '/'+
    config.DB_NAME

  handleDisconnect: () ->
    self = this
    try
      connection = mysql.createConnection Mysql.DB_CONFIG
      connection.connect (err) ->
        if err
          setTimeout @handleDisconnect, 1000

      connection.on 'error', (err) ->
        if err.code is 'PROTOCOL_CONNECTION_LOST'
          self.handleDisconnect()
        else
          throw err
    catch error
      'Error'
  
  openConnection: () ->
    @handleDisconnect()

  query: (mysqlQuery, callback) ->
    try
      connection.query mysqlQuery, (err, docs) ->
        callback err, docs
    catch error
      'Error'

module.exports = Mysql
