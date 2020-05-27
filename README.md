# SAKELOG
Ruby on Rails(5.2.4)を用いて、日本酒レビューのアプリを作成いたしました。
シンプルなUI(投稿写真が映えるようモノトーンに統一されたデザイン)と明快なUXにこだわりました。

<img width="764" alt="スクリーンショット 2020-05-12 15 09 28" src="https://user-images.githubusercontent.com/47711244/81644462-bc97eb00-9462-11ea-908c-45143878bd9a.png">

<img width="770" alt="スクリーンショット 2020-05-12 15 09 42" src="https://user-images.githubusercontent.com/47711244/81644503-d3d6d880-9462-11ea-802f-2ae89bbb7343.png">

# URL
https://www.sakelog.net

閲覧の際はトップページの【お試しログイン】機能をご利用ください。

## 制作の背景
居酒屋等のネットでのレビュー・口コミと、実際に訪問した際のギャップを感じることがしばしばあり、友人や知り合いの飲んだことのあるお酒・お店がすぐに確認できるツールがあれば良いと思い、開発しました。
今後の改良方針としては、

- GooglemapAPIを用いた、レビューしたお酒を飲んだ場所の記録。
- 日本酒の名前をDBに格納(もしくはAPIを利用)してサジェスト表示する。
- Rspecを用いたテストの充実
- フロントエンドにReactを導入

等のアップデートを考えています。

## 言語・使用技術

- バックエンド
  - Ruby 2.6.2
  - Rails 5.2.4
  - MySQL 5.7

- フロントエンド
  - html
  - Scss
  - bootstrap
  - JavaScript
  - jQuery

- インフラ
  - ローカル
    - Docker
    - docker-compose
  - デプロイ
    - Capistrano
  - CI/CD
    - CircleCI
  - AWS
    - VPC
    - EC2
    - RDS
    - ALB
    - Route53
    - ACM
    - S3
    - Nginx
    - unicorn

<img width="697" alt="スクリーンショット 2020-05-09 16 20 32" src="https://user-images.githubusercontent.com/47711244/81467071-199c6280-9211-11ea-90c9-4e4b20b5a5e0.png">

## 機能一覧

- ユーザー機能
  - 新規登録・ログイン・ログアウト機能
  - マイページ・登録情報編集機能
  - ユーザーフォロー機能
  - ユーザーの一覧表示
- 投稿機能
  - 投稿編集機能
  - 本番環境の画像の保存先にS3を採用
  - 投稿する写真のプレビュー機能
  - jquery-ratyを使用した星評価機能
  - 投稿のブックマーク機能
- お気に入り・フォロー機能(ajax)
- お気に入りの一覧表示
