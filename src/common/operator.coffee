class Operator
  @add: ( a, b) ->
    a + b
  
  @pow: (exp, base) ->
    if exp == 0
      return 1
    product = 1
    for i in [1..exp]
      product *= base
    product
  
module.exports.add = Operator.add
module.exports.pow = Operator.pow
