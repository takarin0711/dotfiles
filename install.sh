#!/bin/bash

# (使用方法)
# 初回は実行権限の付与が必要
# chmod +x install.sh
# スクリプトを実行しシンボリックリンクを一気に作成する
# ./install.sh

# 配置したい設定ファイル
dotfiles=(.bash_profile .bashrc .vimrc .zshrc)

# 設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
        ln -svf $file ~/
done
