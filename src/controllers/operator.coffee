add = require('../common/operator').add

exports.index = (req, data, render) ->
  data.text = 'troi nang dep'
  data.result = add(2,6)
  render false
