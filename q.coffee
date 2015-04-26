
reactTagFactory = (tagName) -> ->
  [a1] = arguments
  [properties, children] = if Array.isArray(a1) or typeof a1 is 'string' then [{}, a1] else arguments
  React.createElement tagName, properties, children


expose = -> for tagName in arguments then window[tagName] = reactTagFactory tagName
expose 'div', 'h1', 'h3'


CommentBox = React.createClass render: ->

  div className: 'commentBox', [
    h1 key: 'meh', 'HELLO WORLD'
  ]




React.render React.createElement(CommentBox, null), document.getElementById('content')










