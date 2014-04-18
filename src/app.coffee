express = require 'express'
logfmt = require 'logfmt'
add = require( './operator' ).add
Mysql = require './mysql'

app = express()
mysql = new Mysql
mysql.openConnection()

app.use logfmt.requestLogger()

app.get '/',(req, res) ->
  queryStr = 'create table IF NOT EXISTS '+
    Mysql.TABLE+
    '(name varchar(400))'

  mysql.query queryStr, (err, docs) ->
    if !err
      res.send 'Hello World! Create a table'
    else
      res.send 'Create table failed'
    mysql.end()

app.get '/add',(req, res) ->
  possible = 'abcdefghijklmnopqrstuvwxyz'
  name = ''
  for i in [0..5]
    name += possible.charAt Math.floor Math.random() * possible.length

  queryStr = 'insert into '+
    Mysql.TABLE+
    '(name) values(\''+name+'\')'

  mysql.query queryStr, (err, docs) ->
    if !err
      res.send 'Create a row'
    else
      res.send 'Create a row failed'
    mysql.end()

app.get '/get',(req, res) ->
  str = ''
  str += 'Hello World!'
  str += add( 2, 5 )

  mysql.query 'select * from '+Mysql.TABLE, (err, docs) ->
    if !err
      for doc in docs
        str += doc.name
      res.send str
    else
      res.send 'Cha co gi ca'
    mysql.end()

port = Number(process.env.PORT || 5000)

app.listen port, () ->
  console.log 'Listening on ' + port

module.exports = app
