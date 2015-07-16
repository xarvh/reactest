
NumeneraCharacterSheet = React.createClass
  getInitialState: ->
    poolRulerMax: 30

  render: ->

    width = 297
    height = 210
    a4 =
      width: width + 'mm'
      height: height + 'mm'
      viewBox: "0 0 #{width} #{height}"


    poolRulerCell = (n) =>
      border = 2
      N = 1 + @state.poolRulerMax
      w = (width - (N-1)*border) / N
      h = 20
      x = n * (w + border)
      y = 0

      console.log {N, n, w, h, x, y}

      return [
        o 'rect',
          x: x
          y: y
          width: w + 'mm'
          height: h
          fill: 'white'
          stroke: 'black'
          strokeWidth: 1
          rx: '2'
          ry: '2'
      ,
        o 'text',
          x: (x + w / 2) + 'mm'
          y: y + h - border * 2
          fontFamily: 'impact'
          fontSize: h - border * 2
          textAnchor: 'middle'
        , "#{n}"
      ]


    poolRuler = []
    for n in [0..@state.poolRulerMax] then poolRuler.push poolRulerCell(n)...



    return o 'svg', a4,
      o 'g', poolRuler...




#      o fullWidth,
#        '_______________________ is a ________________ ____________ who __________________________________________'



  componentDidMount: ->
    window.sheet = this




flatten = (array, flat = []) ->
  for e in array
    if Array.isArray e then flatten e, flat
    else flat.push e

  return flat


o = (def, children...) ->

  isContent = (thing) -> thing?._isReactElement or typeof thing is 'string'

  # Tag and classes
  [tagName, classes...] = def.split?('.') or []
  tagName or= 'div'

  # Properties and children
  children = flatten children
  properties = if isContent children[0] then {} else children.shift()

  # Set className
  if classes.length
    properties.className = classes.join ' '

  # Assert
  for c, index in children when !isContent(c) then throw new Error "#{def}, #{properties.key}, #{index}"

#  console.log 'o', {tagName, properties, len: children.length}
  return React.createElement tagName, properties, children...



sheet = React.createElement NumeneraCharacterSheet, {}
React.render sheet, document.getElementById('content')
