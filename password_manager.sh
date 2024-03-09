#!/bin/bash
echo "パスワードマネージャーへようこそ！"

# 標準入力から文字列を受け取って変数に代入する
echo "サービス名を入力してください："
read service_name
echo "ユーザー名を入力してください："
read username
echo "パスワードを入力してください："
read -s password

# 変数の値をusers.txtに書き込む
echo "$service_name:$username:$password" >> users.txt
echo "Thank you!"