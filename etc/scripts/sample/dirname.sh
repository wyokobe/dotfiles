#!/bin/bash
#
# 実行したシェルスクリプトのおいてあるディレクトリを取得する

echo $(dirname ${0})
ls $(dirname ${0})
