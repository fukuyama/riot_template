gulp      = require 'gulp'
template  = require 'gulp-template'
rename    = require 'gulp-rename'

gulp.task 'mktag', (cb) =>
  i = process.argv.indexOf '-name'
  if i < 0
    cb new Error('-name tag_name not found')
    return
  name = process.argv[i + 1]
  unless name
    cb new Error('-name tag_name not found')
    return
  gulp.src('src/template/*')
    .pipe template
      name : name
    .pipe rename (path) ->
      path.basename = name
      path.extname  = '.tag.jade' if path.extname is '.jade'
    .pipe gulp.dest('src/main/riot/' + name)
    .on 'end', cb
  return
