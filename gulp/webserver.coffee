config = require '../buildconfig.coffee'

gulp   = require 'gulp'

webserver = require 'gulp-webserver'

gulp.task 'webserver', ['build'], =>
  {
    destDir
  } = config.webserver
  gulp.src destDir
    .pipe(
      webserver {
        host       : 'localhost'
        livereload : true
        open       : true
      }
    )

gulp.task 'webserver:build', =>
  {
    watchFiles
    destDir
  } = config.webserver
  gulp.src watchFiles
    .pipe gulp.dest(destDir)

gulp.task 'webserver:watch', =>
  {
    watchFiles
  } = config.webserver
  gulp.watch watchFiles, ['webserver:build']
