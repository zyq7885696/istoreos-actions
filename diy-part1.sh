#!/bin/bash
# 只保留必要 feeds，无多余插件
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 额外添加 iStore 官方源（确保能编译）
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
