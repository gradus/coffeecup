var OptionParser, argv, coffeecup, compile, fs, handle_error, log, options, path, switches, usage, write;

coffeecup = require('./coffeecup');

fs = require('fs');

path = require('path');

log = console.log;

OptionParser = require('coffee-script/lib/coffee-script/optparse').OptionParser;

argv = process.argv.slice(2);

options = null;

handle_error = function(err) {
  if (err) return console.log(err.stack);
};

compile = function(input_path, output_directory, js, namespace) {
  if (namespace == null) namespace = 'templates';
  return fs.readFile(input_path, 'utf-8', function(err, contents) {
    var ext, func, name, output;
    handle_error(err);
    name = path.basename(input_path, path.extname(input_path));
    if (!js) {
      output = coffeecup.render(contents, options);
      ext = '.html';
    } else {
      func = coffeecup.compile(contents, options);
      output = "(function(){ \n  this." + namespace + " || (this." + namespace + " = {});\n  this." + namespace + "[" + (JSON.stringify(name)) + "] = " + func + ";\n}).call(this);";
      ext = '.js';
    }
    return write(input_path, name, output, output_directory, ext);
  });
};

write = function(input_path, name, contents, output_directory, ext) {
  var dir, filename;
  filename = name + ext;
  dir = output_directory || path.dirname(input_path);
  return path.exists(dir, function(exists) {
    var output_path;
    if (!exists) fs.mkdirSync(dir, 0777);
    output_path = path.join(dir, filename);
    if (contents.length <= 0) contents = ' ';
    return fs.writeFile(output_path, contents, function(err) {
      handle_error(err);
      if (options.print) log(contents);
      if (options.watch) return log("Compiled " + input_path);
    });
  });
};

usage = 'Usage:\n  coffeecup [options] path/to/template.coffee';

switches = [['-j', '--js', 'compile template to js function (template + embedded renderer)'], ['-b', '--bare', 'use with -j to compile template to js (template only)'], ['-c', '--core', 'use with -j to compile renderer to js (renderer only)'], ['-n', '--namespace [name]', 'global object holding the templates (default: "templates")'], ['-w', '--watch', 'watch templates for changes, and recompile'], ['-o', '--output [dir]', 'set the directory for compiled html'], ['-p', '--print', 'print the compiled html to stdout'], ['-f', '--format', 'apply line breaks and indentation to html output'], ['-u', '--utils', 'add helper locals (currently only "render")'], ['-z', '--optimize', 'optimize resulting JS'], ['-v', '--version', 'display coffeecup version'], ['-h', '--help', 'display this help message']];

this.run = function() {
  var args, file, parser;
  parser = new OptionParser(switches, usage);
  options = parser.parse(argv);
  args = options.arguments;
  delete options.arguments;
  if (options.help || argv.length === 0) log(parser.help());
  if (options.version) log(coffeecup.version);
  if (options.utils) {
    if (options.locals == null) options.locals = {};
    options.locals.render = function(file) {
      var contents;
      contents = fs.readFileSync(file, 'utf-8');
      return coffeecup.render(contents, options);
    };
  }
  if (args.length > 0) {
    file = args[0];
    if (options.watch) {
      fs.watchFile(file, {
        persistent: true,
        interval: 500
      }, function(curr, prev) {
        if (curr.size === prev.size && curr.mtime.getTime() === prev.mtime.getTime()) {
          return;
        }
        return compile(file, options.output, options.js, options.namespace);
      });
    }
    return compile(file, options.output, options.js, options.namespace);
  }
};
