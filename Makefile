VAR1 := hoge.h hoge.cpp hogera.h hogera.cpp
VAR2 := hoge foo hogera fuga

# TEXT内からPATTERNの文字列に一致する要素を取得する
.PHONY: filter
filter:
	@echo "$(filter %.cpp,$(VAR1))"

# TEXT内からPATTERNの文字列に一致しない要素を取得する
.PHONY: filter-out
filter-out:
	@echo "$(filter-out %.cpp,$(VAR1))"

# LISTの各要素をソートする
.PHONY: sort
sort:
	@echo "$(sort $(VAR2))"

# Shellコマンドを実行
.PHONY: shell
shell:
	@echo $(shell pwd)
