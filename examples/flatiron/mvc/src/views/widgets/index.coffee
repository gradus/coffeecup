module.exports = ->
  h1 'Widgets'
  ul ->
    for widget in @widgets
      li -> widget.name