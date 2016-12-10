
config =
  riot :
    entry      : './src/main/riot/main.coffee'
    watchFiles : './src/main/riot/**'
    destDir    : './dest/public/js/'
    outputFile : 'bundle.js'

  webserver :
    files     : './src/main/public/**'
    publicDir : './dest/public/'

  release :
    files : [
      './dest/public/js/**'
    ]
    options :
      base : './dest/public/'
    destDir : './dest/release/'

  clean :
    dir : './dest/'

module.exports = config
