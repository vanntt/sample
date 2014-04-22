class spaceInsideParenthesis
  rule:
    name:         'spaceInsideParenthesis'
    description:  'Validates space inside parenthesis, should be (2, 3)'
    level:        'error'
    message:      'Incorrect space inside parenthesis'
    
  lintLine: ( line, lineApi ) ->
    
    if ((line.indexOf('(') isnt -1) and (line.indexOf(')') isnt -1))
      
      if line.charAt(line.indexOf('(') + 1) is ' ' or (line.charAt(line.indexOf(')') - 1) is ' ' and line.charAt(line.indexOf(')') + 1) isnt '->') then return { context: 'Unexpect space after and before parenthesis' }
    
    else return null

module.exports = spaceInsideParenthesis
