
NumeneraCharacterSheet = React.createClass
  getInitialState: ->
    poolRulerMax: 30

  render: ->

    poolRulerCount = 1 + @state.poolRulerMax
    poolRulerClipWidthPercentage = 100 / poolRulerCount

    fullWidth = style: width: '100%'

    o 'table',

      o 'tr.OUTER-ROW',
        o 'td', colSpan: 3,
          o 'table', fullWidth,
            o 'tr',
              for n in [0..@state.poolRulerMax]
                o 'td', width: "#{poolRulerClipWidthPercentage}%", "#{n}"
          o 'table', fullWidth,
            o 'tr',
              o 'td', '_______________________ is a ________________ ____________ who __________________________________________'


#      o 'tr.MAIN-ROW',
#        o 'td',
#
#          o 'table'





  componentDidMount: ->
    window.sheet = this



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
  return React.createElement tagName, properties, children



sheet = React.createElement NumeneraCharacterSheet, {}
React.render sheet, document.getElementById('content')
