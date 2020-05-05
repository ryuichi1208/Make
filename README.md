# Make
makefile

## 構文

#### ifeq

変数varsが1なら内部の処理を実行

``` makefile
ifeq ($(vars),1)
  @echo "test"
endif
```

#### ifndef

KBUILD_CHECKSRCが定義されていたら内部を実行する

``` makefile
ifndef KBUILD_CHECKSRC
  KBUILD_CHECKSRC = 0
endif
```

下記のようにnestすることも可能

``` makefile
ifeq ($(KBUILD_EXTMOD),)
        ifneq ($(filter config %config,$(MAKECMDGOALS)),)
		config-build := 1
                ifneq ($(words $(MAKECMDGOALS)),1)
			mixed-build := 1
                endif
        endif
endif
```

## 特殊変数

参考: https://tex2e.github.io/blog/makefile/automatic-variables

|変数|概要|
|---|----|
$@|ターゲット名
$<|依存関係の一番最初の名前
$^|ターゲットの全ての依存関係の名前
$?|ターゲットよりタイムスタンプが新しい依存関係の名前
$+|ターゲットの全ての依存関係の名前 (重複があっても省略しない)
$*|ターゲットのパターンマッチに一致した部分

## 関数

参考: 

|関数|概要|
|---|----|
subst|置換動作
patsubst|置換動作，ワイルドカードあり
strip|空白文字の削除
findstring|文字列を探す
filter|一致する単語の削除
filter-out|一致しない単語の削除
sort|ソートする
dir|ディレクトリ部分の抽出
nodir|ファイル部分の抽出
suffix|サフィックス（拡張子）部分
basename|サフィックス以外
addsuffix|サフィックスを加える
addprefix|プレフィックスを加える
join|単語の連結
word|n番目の単語を返す
worldlist|単語のリストを返す
words|単語数を返す
firstword|最初の名前を返す
wildcard|ワイルドカードによりファイル名リストを返す
foreach|引数を複数回展開する

## サンプルMakefile

* [torvalds/linux](https://github.com/torvalds/linux/blob/master/Makefile)
