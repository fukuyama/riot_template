config      = require '../buildconfig.coffee'

gulp        = require 'gulp'
gutil       = require 'gulp-util'
guglify     = require 'gulp-uglify'
gsourcemaps = require 'gulp-sourcemaps'

browserify  = require 'browserify'
coffeeify   = require 'coffeeify'
riotify     = require 'riotify'
babelify    = require 'babelify'
source      = require 'vinyl-source-stream'
buffer      = require 'vinyl-buffer'

gulp.task 'riot:build', =>
  {
    entry
    destDir
    outputFile
  } = config.riot
  handleError = (e) ->
    gutil.log(e)
    @emit 'end'
  browserify entry,
      extensions : ['.coffee', '.js', '.jade']
      debug      : true
    .transform coffeeify,
      bare       : true
      header     : false
    .transform riotify,
      template   : 'pug'
      ext        : '.jade'
      type       : 'coffee'
      expr       : false
    .transform babelify,
      presets    : ['es2015-riot']
    .bundle()
    .on 'error', handleError
    .pipe source(outputFile)
    .pipe buffer()
    .pipe gsourcemaps.init { loadMaps : true }
    .pipe guglify()
    .on 'error', handleError
    .pipe gsourcemaps.write('.')
    .pipe gulp.dest(destDir)

gulp.task 'riot:watch', =>
  {
    watchFiles
  } = config.riot
  gulp.watch watchFiles, ['riot:build']
