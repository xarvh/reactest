

poolRuler = (list, strokeWidth, totalWidth, totalHeight) ->
  marginToWidthRatio = 0.1

  N = list.length
  cellWidth = totalWidth / (N + N*marginToWidthRatio + marginToWidthRatio)
  cellMargin = cellWidth * marginToWidthRatio
  cellSpacing = cellWidth * (1 + marginToWidthRatio)

  rounding = strokeWidth * 1.5

  padding = strokeWidth
  cellHeight = totalHeight - 2 * cellMargin
  fontSize = cellHeight - padding

  return list.map (entry, index) ->
    x = cellMargin + index * cellSpacing
    y = cellMargin

    return [
      o 'rect',
        x: x
        y: y
        width: cellWidth
        height: cellHeight
        fill: 'white'
        stroke: 'black'
        strokeWidth: strokeWidth
        rx: rounding
        ry: rounding

      o 'text',
        x: x + cellWidth / 2
        y: y + cellHeight - padding * 1.5
        fontFamily: 'impact'
        fontSize: fontSize
        textAnchor: 'middle'
      , "#{entry}"
    ]


title = (totalWidth) ->



NumeneraCharacterSheet = React.createClass
  getInitialState: ->
    poolRulerMax: 30

  render: ->

#    width = 297
#    height = 210
    width = 594
    height = width * 210 / 297
    a4 =
      width: width + 'mm'
      height: height + 'mm'
      viewBox: "0 0 #{width} #{height}"

    return o 'svg', a4,

      o 'g', poolRuler [0..30], 1, width, height / 30




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
