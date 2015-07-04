'use strict'

_ = require('lodash')
path = require('path')

appConfig = 
  port: 9005
  hostname: 'localhost'

project =
  app: 'app'
  api: 'api'
  test: 'test'
  dist: 'dist'

coffeeSources = [ '**/*.coffee' ]
sassSources   = [ '**/*.sass' ]


helper = 
  appToDest: ( obj ) -> files: [ _.merge( obj,expand: true, cwd: project.app, dest:project.dist ) ]
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
      base: [ project.app, project.dist, project.api ]

    server:
      middleware: ( connect ) ->
        [
          require( 'connect-livereload' )
          helper.mountFolder( connect, project.dist )
          helper.mountFolder( connect, project.app )
          helper.mountFolder( connect, project.api )
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
      ]


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
  grunt.registerTask 'server',  ['compile', 'connect:server', 'watch:livereload']

