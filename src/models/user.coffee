module.exports = class User

  config = require('../config/config')
  Mysql = require('../common/mysql')

  users = []
  mysql = null

  openConnection: () ->
    mysql = new Mysql
    mysql.openConnection()

  constructor: (@name) ->

  getName: () ->
    @name

  getAllUsers: (cb) ->
    @openConnection()
    mysql.query('select * from '+config.DB_TABLE, (err, docs) ->
      if !err
        for doc in docs
          users.push(new User(doc.name))
        cb(users)
        )

  addUser: (user_name, cb) ->
    queryStr = 'insert into '+config.DB_TABLE+
        '(name) values (\''+user_name+'\')'
    mysql.query(queryStr, (err,docs) ->
      if !err
        cb()
    )
