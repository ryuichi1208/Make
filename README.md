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

|変数|概要|
|---|----|
$@|ターゲット名
$<|依存関係の一番最初の名前
$^|ターゲットの全ての依存関係の名前。
