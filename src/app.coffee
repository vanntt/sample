express = require 'express'
logfmt = require 'logfmt'
add = require( './operator' ).add
Mysql = require './mysql'
DbStats = require './dbstat'

app = express()
mysql = new Mysql
mysql.openConnection()

dbStats = new DbStats()

app.use logfmt.requestLogger()

app.get '/',(req, res) ->
  queryStr = 'create table IF NOT EXISTS '+
    Mysql.TABLE+
    '(name varchar(400))'

  dbStats.init()
  dbStats.beforeExecuteQuery()
  mysql.query queryStr, (err, docs) ->
    dbStats.afterExecuteQuery()
    if !err
      res.send 'Hello World! Create a table'+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds
    else
      res.send 'Create table failed'+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds

app.get '/add',(req, res) ->
  possible = 'abcdefghijklmnopqrstuvwxyz'
  name = ''
  for i in [0..5]
    name += possible.charAt Math.floor Math.random() * possible.length

  queryStr = 'insert into '+
    Mysql.TABLE+
    '(name) values(\''+name+'\')'

  dbStats.init()
  dbStats.beforeExecuteQuery()
  mysql.query queryStr, (err, docs) ->
    dbStats.afterExecuteQuery()
    if !err
      res.send 'Create a row'+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds
    else
      res.send 'Create a row failed'+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds

app.get '/get',(req, res) ->
  str = ''
  str += 'Hello World!'
  str += add( 2, 5 )

  dbStats.init()
  dbStats.beforeExecuteQuery()
  mysql.query 'select * from '+Mysql.TABLE, (err, docs) ->
    dbStats.afterExecuteQuery()
    if !err
      for doc in docs
        str += doc.name
      res.send str+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds
    else
      res.send 'Cha co gi ca'+
        '<br/>DB Queries: '+dbStats.getStats().totalQueries+
        '<br/>Total Time: '+dbStats.getStats().totalTimeSeconds

port = Number(process.env.PORT || 5000)

app.listen port, () ->
  console.log 'Listening on ' + port

module.exports = app
