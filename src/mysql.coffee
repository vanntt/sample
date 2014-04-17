class Mysql
  mysql = require 'mysql'
  connection = null
  
  openConnection: (host, user, password, dbName) ->
    connection =
      mysql.createConnection 'mysql://'+user+':'+password+'@'+host+'/'+dbName

  query: (mysqlQuery, callback) ->
    connection.connect (error) ->
      if !error
        connection.query mysqlQuery, (err, docs) ->
          callback err, docs
        
module.exports = Mysql
