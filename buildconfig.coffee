
config =
  riot :
    entry      : './src/main/riot/main.coffee' # エントリー
    watchFiles : './src/main/riot/**'          # 参照するコードの位置
    destDir    : './dest/public/js/'           # outputFile を出力する位置
    outputFile : 'bundle.js'                   # 最終的に１つにまとめた時のファイル名

  webserver :
    watchFiles : './src/main/public/**'        # ブラウザで確認する時に公開するコード
    destDir    : './dest/public/'              # ブラウザで確認する時に公開する場所

  release :
    files : [
      './dest/public/js/**.js'                 # リリース時に公開するファイル
    ]
    options :
      base : './dest/public/'                  # 公開の基本になるパス
    destDir : './dest/release/'                # リリースするファイルを置く場所

  clean :
    dir : './dest/'                            # clean で削除するディレクトリ

module.exports = config
