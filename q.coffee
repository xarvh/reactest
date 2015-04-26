
reactTagFactory = (tagName) -> ->
  [a0] = arguments
  [properties, children] = if a0?.constructor.name is 'Object' then arguments else [{}, a0]
  if typeof children is 'function' then children = [children]
  React.createElement tagName, properties, children



#    
#    
#    switch
#    when typeof a1 is 'string', Array.isArray(a1) then [{}, a1]
#    when typeof a1 is 'function' then [{}, [a1]]
#    else arguments
#  React.createElement tagName, properties, _.flatten children


expose = -> for tagName in arguments then window[tagName] = reactTagFactory tagName
expose 'table', 'tr', 'td', 'div', 'h1', 'h3'


CommentBox = React.createClass render: ->

  table [

    # Pools 1 to 30
    tr td colSpan: 3, [
        table tr [1..30].map (n) -> td "#{n}"
      ]

#    tr td colSpan: 3, '_______________________ is a ________________ ____________ who __________________________________________'

#    tr [
#        td 'SKILLS'
#      ].concat [1..15].map(-> td 'T S _________________________________'), [
#        td 'Inability __________________________'
#        td ''
#        td 'SPECIAL ABILITIES'
#      ], [1..10].map(-> td '____________________________')
#    ]


  ]
#  div className: 'commentBox', [
#    h1 key: 'meh', 'HELLO WORLD'
#  ]




React.render React.createElement(CommentBox, null), document.getElementById('content')










