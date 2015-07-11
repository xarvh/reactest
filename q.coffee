
NumeneraCharacterSheet = React.createClass render: ->

  o 'table',

    o 'tr.outer-row',
      o 'td', colSpan: 3,
        o 'table',
          o 'tr',
            for n in [0...30]
              o 'td', key: n, "#{n}"
        o 'table',
          o 'tr',
            o 'td', '_______________________ is a ________________ ____________ who __________________________________________'




o = (def, children...) ->

  isContent = (thing) -> thing?._isReactElement or typeof thing is 'string'

  # Tag and classes
  [tagName, classes...] = def.split '.'
  tagName or= 'div'

  # Properties and children
  children = _.flatten children
  properties = if isContent children[0] then {} else children.shift()

  # Set className
  if classes.length
    properties.className = classes.join ' '

  # Assert
  for c, index in children when !isContent(c) then throw new Error "#{def}, #{properties.key}, #{index}"

#  console.log 'o', {tagName, properties, len: children.length}
  React.createElement tagName, properties, children



React.render React.createElement(NumeneraCharacterSheet, null), document.getElementById('content')

