express = require 'express'
logfmt = require 'logfmt'
add = require( './operator' ).add
Mysql = require './mysql'

app = express()
mysql = new Mysql
mysql.openConnection 'us-cdbr-east-05.cleardb.net','b7c77e2cd0996c','b043648d','heroku_c02074c7e207b16'

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

port = Number(process.env.PORT || 8000)

app.listen port, () ->
  console.log 'Listening on ' + port

module.exports = app
