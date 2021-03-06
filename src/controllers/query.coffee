DbStats = require('../common/dbstat')
User = require('../models/user')
Mysql = require('../common/mysql')

dbStats = new DbStats()

mysql = new Mysql
mysql.openConnection()
User.setConnection(mysql)

exports.index = (req, data, render) ->
  dbStats.init()
  dbStats.beforeExecuteQuery()

  User.getAllUsers((users) ->
    dbStats.afterExecuteQuery()
    data.users = users
    data.totalQueries = dbStats.getStats().totalQueries
    data.totalTimeSeconds = dbStats.getStats().totalTimeSeconds
    render(false)
  )
    
exports.add = (req, data, render) ->
  dbStats.init()
  dbStats.beforeExecuteQuery()

  User.addUser(req.query.userName, () ->
    data.success = true
    render(true)
  )

exports.edit = (req, data, render) ->
  user = new User(req.query.beforeUserName)
  user.setConnection(mysql)
  user.editUser(req.query.afterUserName, () ->
    data.success = true
    render(true)
  )
