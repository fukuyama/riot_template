config = require './buildconfig.coffee'
gulp   = require 'gulp'
gutil  = require 'gulp-util'

require('require-dir') './gulp'

gulp.task 'build', [
  'riot:build'
  'webserver:build'
]

gulp.task 'test', [
]

gulp.task 'watch', [
  'riot:watch'
  'webserver:watch'
]

gulp.task 'webserver', [
  'webserver:run'
]

gulp.task 'default', [
  'build'
  'watch'
  'webserver'
]
