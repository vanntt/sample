DbStats = require('../common/dbstat')
User = require('../models/user')

dbStats = new DbStats()

exports.index = (req, data, render) ->
  dbStats.init()
  dbStats.beforeExecuteQuery()

  @user = new User()
  @user.getAllUsers((users) ->
    dbStats.afterExecuteQuery()
    data.users = users
    data.totalQueries = dbStats.getStats().totalQueries
    data.totalTimeSeconds = dbStats.getStats().totalTimeSeconds
    render(false)
    )
    
exports.add = (req, data, render) ->
  dbStats.init()
  dbStats.beforeExecuteQuery()

  @user.addUser(req.query.user_name, () ->
    data.success = true
    render(true)
  )
