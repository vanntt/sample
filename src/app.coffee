express = require 'express'
logfmt = require 'logfmt'
add = require( './operator' ).add

app = express()

app.use logfmt.requestLogger()

app.get '/',(req, res) ->
  res.send 'Hello World!' + add( 2, 3 )

port = Number(process.env.PORT || 5000)

app.listen port, () ->
  console.log 'Listening on ' + port

module.exports = app
