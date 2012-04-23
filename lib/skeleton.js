var cede, h, text, __cc;

__cc = {
  buffer: ""
};

text = function(txt) {
  if (typeof txt === "string" || txt instanceof String) {
    return __cc.buffer += txt;
  } else {
    if (typeof txt === "number" || txt instanceof Number) {
      return __cc.buffer += String(txt);
    }
  }
};

h = function(txt) {
  var escaped;
  escaped = void 0;
  if (typeof txt === "string" || txt instanceof String) {
    escaped = txt.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
  } else {
    escaped = txt;
  }
  return escaped;
};

cede = function(f) {
  var old_buffer, temp_buffer;
  temp_buffer = "";
  old_buffer = __cc.buffer;
  __cc.buffer = temp_buffer;
  f();
  temp_buffer = __cc.buffer;
  __cc.buffer = old_buffer;
  return temp_buffer;
};
