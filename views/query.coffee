div -> "welcome to query page"
div -> "first row in db has name " + data.users[1].getName()
div -> "Total DB Queris: " +  data.totalQueries
div -> "Total time: " + data.totalTimeSeconds

form action:"/query/add", method:"get", name:"add0", ->
  div -> "Add a new user:"
  table ->
    tr ->
      td -> "Name: "
      td -> input name:"user_name",type:"text",->
    tr ->
      td ->
      td -> input type:"submit", -> "Add"
