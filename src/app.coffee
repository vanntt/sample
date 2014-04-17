express = require 'express'
logfmt = require 'logfmt'
add = require( './operator' ).add
Mysql = require './mysql'

app = express()
mysql = new Mysql
mysql.openConnection()

app.use logfmt.requestLogger()

app.get '/',(req, res) ->
  str = ''
  str += 'Hello World!'
  str += add( 2, 5 )

  mysql.query "select * from cun", (err, docs) ->
    if !err
      for doc in docs
        str += doc.name
      res.send str
    else
      res.send 'Cha co gi ca'

port = Number(process.env.PORT || 5000)

app.listen port, () ->
  console.log 'Listening on ' + port

module.exports = app
