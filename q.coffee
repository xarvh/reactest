
reactTagFactory = (tagName) ->
  (properties, children...) ->
    React.createElement tagName, properties, children

htmlTags = {}
for tagName in 'div table tr td'.split(' ') then htmlTags[tagName] = htmlTags[tagName.toUpperCase()] = reactTagFactory tagName

o = Object.seal {}




CommentBox = React.createClass render: ->
  {table, tr, td} = htmlTags

  table {},

    # Pools 1 to 30
    tr o,
      td {colSpan: 3},
        table o,
          tr o,
            [1..30].map (n) -> td o, "#{n}"

    # Name, descriptor, type, focus
    tr o,
      td colSpan: 3,
        '_______________________ is a ________________ ____________ who __________________________________________'

    tr o,
      # LEFT COLUMN
      td o, table o,
        tr o, td o, 'SKILLS'

        [1..15].map(-> tr o, td o, 'T S _________________________________')

        tr o, td o, 'Inability __________________________'
        tr o, td o, ''
        tr o, td o, 'SPECIAL ABILITIES'

        [1..10].map(-> tr o, td o, '____________________________')

      # CENTRE COLUMN
      td o, table,
        tr o, td o, 'SQUAAAAAAAAAAACK!'


      # RIGHT COLUMN



#  div className: 'commentBox', [
#    h1 key: 'meh', 'HELLO WORLD'
#  ]




React.render React.createElement(CommentBox, null), document.getElementById('content')


#expose = -> for tagName in arguments then window[tagName] = reactTagFactory tagName
#expose 'table', 'tr', 'td', 'div', 'h1', 'h3'


#    [a0] = arguments
#    [properties, children] = if a0?.constructor.name is 'Object' then arguments else [{}, a0]
#    if typeof children is 'function' then children = [children]
#    React.createElement tagName, properties, children

#    switch
#    when typeof a1 is 'string', Array.isArray(a1) then [{}, a1]
#    when typeof a1 is 'function' then [{}, [a1]]
#    else arguments
#  React.createElement tagName, properties, _.flatten children










