http://www.simpairs.com/scorecard.asp?session=004036&Pair=004036BotaRasaEvora003512667087341
    else
      file = args[0]

    if options.watch
      fs.watchFile file, {persistent: true, interval: 500}, (curr, prev) ->
        return if curr.size is prev.size and curr.mtime.getTime() is prev.mtime.getTime()
        compile file, options.output, options.js, options.namespace

    compile file, options.output, options.js, options.namespace
