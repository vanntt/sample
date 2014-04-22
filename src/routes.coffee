module.exports  = (app) ->
  app.all '/', (req, res, next) ->
    routeMvc('index', 'index', req, res, next)

  app.all '/:controller' , (req, res, next) ->
    routeMvc(req.params.controller, 'index', req, res, next)

  app.all '/:controller/:method' , (req, res, next) ->
    routeMvc(req.params.controller, req.params.method, req, res, next)

  app.all '/:controller/:method/:id' , (req, res, next) ->
    routeMvc(req.params.controller, req.params.method, req, res, next)

  # If all else failed, show 404 page
  app.all '/*', (req, res) ->
    res.render('404', 404)

routeMvc = (controllerName, methodName, req, res, next)->
  controllerName='index' if not controllerName?
  controller=null
  try
    controller=require "./controllers/"+controllerName
  catch e
    console.log(e)
    next()
    return
  
  data=null
  if methodName?
    # eval is evil, so sanitize it
    methodName = methodName.replace(/[^a-z0-9A-Z_-]/i,'')
    method=eval('controller.'+methodName)
    console.log(methodName)
    console.log(controller)
    if method?
      data = {}
      method req, data, (isApi)->
        if not data?
          throw new Error("Controller's return value not implemented!")
        if isApi
          # send JSON based on api
          res.send data
        else
          #render page
          res.render controllerName, data
  else
    next()
