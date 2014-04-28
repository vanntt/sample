module.exports = class User

  Config = require('../config/config')

  constructor: (@name) ->

  @setConnection: (@mysql) ->
  
  setConnection: (@mysql) ->

  getName: () ->
    @name

  setName: (name) ->
    @name = name

  @getAllUsers: (callback) ->
    if @mysql
      @mysql.query("select * from #{Config.DB_TABLE}", (err, docs) ->
        if !err
          users = []
          for doc in docs
            users.push(new User(doc.name))
          callback(users)
      )

  @addUser: (userName, callback) ->
    if @mysql
      queryString = "insert into #{Config.DB_TABLE}(name) values (\'#{userName}\')"
      @mysql.query(queryString, (err,docs) ->
        if !err
          callback()
      )

  editUser: (newName, callback) ->
    if @mysql
      queryString = "update #{Config.DB_TABLE} set name = \'#{newName}\' where name = \'#{@name}\'"
      @mysql.query(queryString, (err,docs) ->
        if !err
          callback()
      )
