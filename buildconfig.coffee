
destDir = 'dest/'

config = {
  riot :
    files      : './src/main/riot/main.js'
    destDir    : destDir + 'public/js/'
    outputFile : 'bundle.js'

  webserver :
    files     : './src/main/public/**/*'
    publicDir : destDir + 'public/'

  cleanDir : destDir
}

module.exports = config
