
destDir = 'dest/'

config = {
  riot :
    entry      : './src/main/riot/main.js'
    watchFiles : './src/main/riot/**/*'
    destDir    : destDir + 'public/js/'
    outputFile : 'bundle.js'

  webserver :
    files     : './src/main/public/**/*'
    publicDir : destDir + 'public/'

  cleanDir : destDir
}

module.exports = config
