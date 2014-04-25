express = require('express')
logfmt = require('logfmt')
config = require('./config/config')
config.setEnvironment('development')

app = express()

app.use(logfmt.requestLogger())

app.set('view engine', 'coffee')
app.engine('coffee', require('coffeecup').__express)
app.set('views', process.cwd() + '/views')

app.use(express.static(process.cwd() + "/public"))

routes = require('./routes')
routes(app)

port = Number(process.env.PORT || 8000)

app.listen(port, () ->
  console.log('Listening on ' + port))

module.exports = app
