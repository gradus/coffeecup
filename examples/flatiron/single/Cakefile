# ** Cakefile Template ** is a Template for a common Cakefile that you may use in a coffeescript nodejs project.
# 
# It comes baked in with 4 tasks:
#
# * build - compiles your src directory to your lib directory
# * watch - watches any changes in your src directory and automatically compiles to the lib directory
# * test  - runs mocha test framework, you can edit this task to use your favorite test framework
# * docs  - generates annotated documentation using docco
fs = require 'fs'
{print} = require 'util'
{spawn, exec} = require 'child_process'

# ANSI Terminal Colors
bold = '\033[0;1m'
green = '\033[0;32m'
reset = '\033[0m'
red = '\033[0;31m'

# Internal Functions
#
# ## *walk* 
#
# **given** string as dir which represents a directory in relation to local directory
# **and** callback as done in the form of (err, results)
# **then** recurse through directory returning an array of files
walk = (dir, done) ->
  results = []
  fs.readdir dir, (err, list) ->
    return done(err, []) if err
    pending = list.length
    return done(null, results) unless pending
    for name in list
      file = "#{dir}/#{name}"
      try 
        stat = fs.statSync file 
      catch err 
        stat = null
      if stat?.isDirectory()
        walk file, (err, res) -> 
          results.push name for name in res
          done(null, results) unless --pending
      else
        results.push file
        done(null, results) unless --pending

# ## *log* 
# 
# **given** string as a message
# **and** string as a color
# **and** optional string as an explaination
# **then** builds a statement and logs to console.
log = (message, color, explanation) -> console.log color + message + reset + ' ' + (explanation or '')

# ## *launch*
#
# **given** string as a cmd
# **and** optional array and option flags
# **and** optional callback
# **then** spawn cmd with options
# **and** pipe to process stdout and stderr respectively
# **and** on child process exit emit callback if set and status is 0
launch = (cmd, options=[], callback) ->
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0

# ## *build*
#
# **given** optional boolean as watch
# **and** optional function as callback
# **then** invoke launch passing coffee command
# **and** defaulted options to compile src to lib
build = (watch, callback) ->
  if typeof watch is 'function'
    callback = watch
    watch = false

  options = ['-c', '-b', '-o', '.', '.']
  options.unshift '-w' if watch
  launch 'coffee', options, callback

# ## *mocha*
#
# **given** optional array of option flags
# **and** optional function as callback
# **then** invoke launch passing mocha command
mocha = (options, callback) ->
  if typeof options is 'function'
    callback = options 
    options = []
    
  launch 'mocha', options, callback

# ## *docco*
#
# **given** optional function as callback
# **then** invoke launch passing docco command
docco = (callback) ->
  walk 'src', (err, files) -> launch 'docco', files, callback

# Cakefile Tasks
#
# ## *docs*
#
# Generate Annotated Documentation
#
# <small>Usage</small>
#
# ```
# cake docs
# ```
task 'docs', 'generate documentation', -> docco()

# ## *build*
#
# Builds Source
#
# <small>Usage</small>
#
# ```
# cake build
# ```
task 'build', 'compile source', -> build -> log ":)", green

# ## *watch*
#
# Builds your source whenever it changes
#
# <small>Usage</small>
#
# ```
# cake watch
# ```
task 'watch', 'compile and watch', -> build true, -> log ":-)", green

# ## *test*
#
# Runs your test suite.
#
# <small>Usage</small>
#
# ```
# cake docs
# ```
task 'test', 'run tests', -> build -> mocha -> log ":)", green
