module.exports = ->
  doctype 5
  html ->
    head -> 
      meta charset: 'utf-8'
      title 'flatiron coffeecup views example'
      link rel: 'stylesheet', href: '/css/bootstrap.min.css'
      link rel: 'stylesheet', href: '/css/bootstrap-responsive.min.css'
      style """
        body {
          position: relative;
          padding-top: 90px;
          background-color: #fff;
        }
      """
    body 'data-spy': 'scroll', 'data-target': '.subnav', 'data-offset': '50', ->
      div '.navbar.navbar-fixed-top', ->
        div '.navbar-inner', ->
          div '.container', ->
            a '.brand', href: '/', 'Creamer'
            div '.nav-collapse', ->
              ul '.nav', ->
                li @home || '', -> 
                  a href: '/', 'Home'
                li @about || '', -> 
                    a href: '/widgets', 'Widgets'
                li @about || '', -> 
                    a href: '/about', 'About'

      div '.container', ->
        div '.row-fluid', ->
          div '.span8', -> content()
          div '.span4', ->
            div '.hero-unit', -> 
              h2 'Creamer'
              p 'A great way to add coffee to flatiron'

      script src: 'http://cdnjs.cloudflare.com/ajax/libs/jquery/1.7.1/jquery.min.js'
      script src: '/js/bootstrap.min.js'
