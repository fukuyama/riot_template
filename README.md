Riot.js template
================

CoffeScript + less + Jade(pug) で Riot.js

gulp 版

Tasks
-----

`gulp` デフォルトは、ビルドしてブラウザ起動(コードの監視)

`gulp mktag --name <tag_name>` tag_name のタグ環境を作る

Tree
----

<pre>
src
├─main
│  ├─public
│  │      index.html
│  │
│  └─riot
│      │  main.coffee
│      │
│      └─sample
│              sample.coffee
│              sample.less
│              sample.tag.jade
│
└─template
        name.coffee
        name.less
        name.tag.jade
</pre>

mktag でタグを作成すると、template を使って sample の様なタグを作るためのファイルを作る。
分けて作りたい人向け。


buildconfig.coffee
------------------

```CoffeeScript
config =
  riot :
    entry      : './src/main/riot/main.coffee' # エントリー。最初に読み込むファイル
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
```
