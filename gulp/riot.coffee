config     = require '../buildconfig.coffee'
gulp       = require 'gulp'
gutil      = require 'gulp-util'
uglify     = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'

browserify = require 'browserify'
riotify    = require 'riotify'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'

gulp.task 'riot:build', =>
  {
    files
    destDir
    outputFile
  } = config.riot
  browserify files, { extensions: ['.coffee', '.js', '.jade'], debug : true }
    .transform riotify, { template : 'pug', ext : '.jade', type : 'coffeescript' }
    .bundle()
    .on 'error', (e) ->
      gutil.log(e)
      @emit('end')
    .pipe source(outputFile)
    .pipe buffer()
    .pipe sourcemaps.init { loadMaps : true }
    .pipe uglify()
    .on 'error', (e) ->
      gutil.log(e.message)
      @emit('end')
    .pipe sourcemaps.write('.')
    .pipe gulp.dest(destDir)
