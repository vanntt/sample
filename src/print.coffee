class Print
  @printApple = ->
    'Apple'
  
  @printOrange = ->
    'Orange'
  
  @printDog = ->
    'Gau gau'

module.exports.printApple = Print.printApple
module.exports.printOrange = Print.printOrange
module.exports.printDog = Print.printDog

