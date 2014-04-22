exports.setEnvironment = (env) ->
  console.log "set app environment: #{env}"
  switch(env)
    when "development"
      exports.DB_HOST = 'us-cdbr-east-05.cleardb.net'
      exports.DB_PORT = '3306'
      exports.DB_NAME = 'heroku_c02074c7e207b16'
      exports.DB_USER = 'b7c77e2cd0996c'
      exports.DB_PASS = 'b043648d'
      exports.DB_TABLE = 'users'
    
    when "production"
      exports.DB_HOST = 'us-cdbr-east-05.cleardb.net'
      exports.DB_PORT = '3306'
      exports.DB_NAME = 'heroku_c02074c7e207b16'
      exports.DB_USER = 'b7c77e2cd0996c'
      exports.DB_PASS = 'b043648d'
      exports.DB_TABLE = 'users'
    else
      console.log "environment #{env} not found"
