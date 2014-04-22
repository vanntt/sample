doctype 5
html ->
  head ->
    title 'hello hi'
  body ->
    # set browser debug flag
    input "#hidden-debug", type:"hidden", value: "#{@debugJs}"
    # here begins the page
    div "#header_wrapper",->
      div "#header_title",-> "coffee-mvc"
      div "#header_des",-> "A MVC template for CoffeeScript, Express.js, Node.js and MySQL."
