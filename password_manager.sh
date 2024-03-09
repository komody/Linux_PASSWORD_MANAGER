#!/bin/bash

echo "パスワードマネージャーへようこそ！"

# ループ処理
while true; do
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
    read input

    case $input in
        "Add Password")
            # 標準入力から文字列を受け取って変数に代入する
            echo "サービス名を入力してください："
            read service_name
            echo "ユーザー名を入力してください："
            read user_name
            echo "パスワードを入力してください："
            read -s password
            echo "$service_name:$user_name:$password" >> users.txt
            echo "パスワードの追加は成功しました。"
            ;;
        "Get Password")
            # 標準入力から文字列を受け取って変数に代入する
            echo "サービス名を入力してください："
            read service_name
            password=$(grep "^$service_name:" users.txt | cut -d: -f3)

            if [ -z "$password" ]; then
                echo "そのサービスは登録されていません。"
            else
                echo "サービス名：$service_name"
                echo "ユーザー名：$(grep "^$service_name:" users.txt | cut -d: -f2)"
                echo "パスワード：$password"
            fi
            ;;
        "Exit")
            echo "Thank you!"
            exit
            ;;
        # その他
        *)
            echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
            ;;
    esac
done