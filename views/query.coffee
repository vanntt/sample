div -> "welcome to query page"
div -> "first row in db has name " + data.users[1].getName()
div -> "Total DB Queris: " +  data.totalQueries
div -> "Total time: " + data.totalTimeSeconds
br ->
form action:"/query/add", method:"get", ->
  div -> "Add a new user:"
  table ->
    tr ->
      td -> "Name: "
      td -> input name:"user_name",type:"text",->
    tr ->
      td ->
      td -> input type:"submit", -> "Add"
br ->
form action:"/query/edit", method:"get", ->
  div -> "Edit user has name:"
  table ->
    tr ->
      td -> "Name: "
      td -> input name:"before_user_name",type:"text",->
    tr ->
      td -> "To another name: "
      td -> input name:"after_user_name",type:"text",->
    tr ->
      td ->
      td -> input type:"submit", -> "Edit"
