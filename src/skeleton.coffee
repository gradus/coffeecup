__cc = buffer: ""

text = (txt) ->
  if typeof txt is "string" or txt instanceof String
    __cc.buffer += txt
  else __cc.buffer += String(txt)  if typeof txt is "number" or txt instanceof Number

h = (txt) ->
  escaped = undefined
  if typeof txt is "string" or txt instanceof String
    escaped = txt.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;")
  else
    escaped = txt
  escaped

cede = (f) ->
  temp_buffer = ""
  old_buffer = __cc.buffer
  __cc.buffer = temp_buffer
  f()
  temp_buffer = __cc.buffer
  __cc.buffer = old_buffer
  return temp_buffer
