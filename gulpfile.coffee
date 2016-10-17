config = require './buildconfig.coffee'
gulp   = require 'gulp'
gutil  = require 'gulp-util'

require('require-dir') './gulp'

gulp.task 'build', [
  'riot:build'
  'webserver:build'
]

gulp.task 'test', [
  'build'
]

gulp.task 'watch', [
  'riot:watch'
  'webserver:watch'
]

gulp.task 'default', [
  'watch'
  'webserver'
]
