class Mysql
  mysql = require 'mysql'
  connection = null

  Mysql.HOST = 'us-cdbr-east-05.cleardb.net'
  Mysql.USER = 'b7c77e2cd0996c'
  Mysql.PASSWORD = 'b043648d'
  Mysql.DB = 'heroku_c02074c7e207b16'
  Mysql.TABLE = 'users'
  
  openConnection: (host, user, password, dbName) ->
    connection =
      mysql.createConnection 'mysql://'+
        Mysql.USER+
        ':'+
        Mysql.PASSWORD+
        '@'+
        Mysql.HOST+
        '/'+
        Mysql.DB
    connection.connect()

  query: (mysqlQuery, callback) ->
    connection.query mysqlQuery, (err, docs) ->
      callback err, docs

   end: () ->
     connection.end()
        
module.exports = Mysql
