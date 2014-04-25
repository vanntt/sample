module.exports = class User

  Config = require('../config/config')

  constructor: (@name) ->

  @setConnection: (@mysql) ->
  
  setConnection: (@mysql) ->

  getName: () ->
    @name

  setName: (_name) ->
    @name = _name

  @getAllUsers: (cb) ->
    if @mysql
      @mysql.query('select * from '+Config.DB_TABLE, (err, docs) ->
        if !err
          users = []
          for doc in docs
            users.push(new User(doc.name))
          cb(users)
      )

  @addUser: (user_name, cb) ->
    if @mysql
      queryStr = 'insert into '+Config.DB_TABLE+
          '(name) values (\''+user_name+'\')'
      @mysql.query(queryStr, (err,docs) ->
        if !err
          cb()
      )

  editUser: (newName, cb) ->
    if @mysql
      queryStr = 'update '+Config.DB_TABLE+
          ' set name = \''+newName+'\' where name = \''+@name+'\''
      @mysql.query(queryStr, (err,docs) ->
        if !err
          cb()
      )
