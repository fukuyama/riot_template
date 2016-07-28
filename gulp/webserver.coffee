config = require '../buildconfig.coffee'
gulp   = require 'gulp'

webserver = require 'gulp-webserver'

gulp.task 'webserver', ['webserver:build'], =>
  {
    publicDir
  } = config.webserver
  gulp.src publicDir
    .pipe(
      webserver {
        host       : 'localhost'
        livereload : true
        open       : true
      }
    )

gulp.task 'webserver:build', =>
  {
    files
    publicDir
  } = config.webserver
  gulp.src files
    .pipe gulp.dest(publicDir)

gulp.task 'webserver:watch', =>
  {
    files
  } = config.webserver
  gulp.watch files, [
    'webserver:build'
  ]
