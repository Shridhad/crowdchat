'use strict'

_ = require('lodash')
path = require('path')

appConfig = 
  port: 9005
  hostname: 'localhost'

project =
  app: 'app'
  api: 'api'
  img: "images"
  test: 'test'
  dist: 'dist'

coffeeSources = [ '**/*.coffee' ]
sassSources   = [ '**/*.sass' ]


helper = 
  appToDest: ( obj ) -> files: [ _.merge( obj,expand: true, cwd: project.app, dest:project.dist ) ]
  prepend: (path, arr) -> "#{path}/#{pattern}" for pattern in arr
  mountFolder: (connect, dir) -> connect.static path.resolve(dir)

initConfig = 
  yeoman: project
  coffee:
    options: 
      sourceMap: true,
      sourceRoot: ''

    server:
      helper.appToDest( src: coffeeSources, ext: '.js' )

  sass:
    #options:
    #  sourceMap: true
    server:
      helper.appToDest( src: sassSources, ext: '.css' )

  connect:
    options:
      hostname: appConfig.hostname
      port: appConfig.port
      base: [ project.app, project.dist, project.api, project.img ]

    server:
      middleware: ( connect ) ->
        [
          require( 'connect-livereload' )
          helper.mountFolder( connect, project.dist )
          helper.mountFolder( connect, project.app )
          helper.mountFolder( connect, project.api )
          helper.mountFolder( connect, project.img )
        ]

  watch:
    options:
      nospawn: true
      livereload:
        liveCSS: false
    livereload:
      options:
        livereload: true
      files: [
        '<%= yeoman.app %>/**/*.html'
        '<%= yeoman.dist %>/**/*.{css,js}'
        '<%= yeoman.api %>/**/*.json'
        '<%= yeoman.img %>/**/*.jpg'
      ]
    sass:
      files: helper.prepend(project.app, sassSources)
      tasks: [ "sass" ]

    coffee:
      files: helper.prepend(project.app, coffeeSources)
      tasks: ["coffee"]

module.exports = (grunt) ->
  grunt.initConfig(initConfig)

  # Load NPM tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-serve'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Register Tasks
  grunt.registerTask 'compile', ['coffee', 'sass']
  grunt.registerTask 'server',  ['compile', 'connect:server', 'watch']

