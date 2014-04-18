class Mysql
  mysql = require 'mysql'
  connection = null

  Mysql.HOST = 'us-cdbr-east-05.cleardb.net'
  Mysql.USER = 'b7c77e2cd0996c'
  Mysql.PASSWORD = 'b043648d'
  Mysql.DB = 'heroku_c02074c7e207b16'
  Mysql.TABLE = 'users'

  Mysql.DB_CONFIG = 'mysql://'+
    Mysql.USER+
    ':'+
    Mysql.PASSWORD+
    '@'+
    Mysql.HOST+
    '/'+
    Mysql.DB

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
