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
      userName = User.mysqlRealEscapeString(userName)
      queryString = "insert into #{Config.DB_TABLE}(name) values (\'#{userName}\')"
      @mysql.query(queryString, (err,docs) ->
        if !err
          callback()
      )

  editUser: (newName, callback) ->
    if @mysql
      newName = User.mysqlRealEscapeString(newName)
      tmpName = User.mysqlRealEscapeString(@name)
      queryString = "update #{Config.DB_TABLE} set name = \'#{newName}\' where name = \'#{@tmpName}\'"
      @mysql.query(queryString, (err,docs) ->
        if !err
          callback()
      )

  @mysqlRealEscapeString: (string) ->
    string.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, (char) ->
      switch (char)
        when "\0" then return "\\0"
        when "\x08" then return "\\b"
        when "\x09" then return "\\t"
        when "\x1a" then return "\\z"
        when "\n" then return "\\n"
        when "\r" then return "\\r"
        when "\"", "'", "\\", "%" then return "\\"+char
    )
