Mysql = require('../common/mysql')
DbStats = require('../common/dbstat')
config = require('../config/config')

dbStats = new DbStats()

mysql = new Mysql
mysql.openConnection()

exports.index = (req, data, render) ->
  dbStats.init()
  dbStats.beforeExecuteQuery()
  mysql.query('select * from '+config.DB_TABLE, (err, docs) ->
    dbStats.afterExecuteQuery()
    if !err
      data.docs = docs
      data.totalQueries = dbStats.getStats().totalQueries
      data.totalTimeSeconds = dbStats.getStats().totalTimeSeconds
    else
      data.docs = null
      data.totalQueries = dbStats.getStats().totalQueries
      data.totalTimeSeconds = dbStats.getStats().totalTimeSeconds
    render(false)
  )
