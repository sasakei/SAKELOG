# SAKELOG
Ruby on Rails(5.2.4)を用いて、日本酒レビューのアプリを作成いたしました。
シンプルなUI(投稿写真が映えるようモノトーンに統一されたデザイン)と明快なUXにこだわりました。

<img width="1209" alt="スクリーンショット 2020-05-29 15 25 14" src="https://user-images.githubusercontent.com/47711244/83228184-ca6aa180-a1c0-11ea-82d5-a7b83e49b950.png">

<img width="862" alt="スクリーンショット 2020-05-29 15 25 45" src="https://user-images.githubusercontent.com/47711244/83228147-bd4db280-a1c0-11ea-8832-62254d5fe1bb.png">

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

<img width="466" alt="スクリーンショット 2020-05-29 15 37 01" src="https://user-images.githubusercontent.com/47711244/83229056-47e2e180-a1c2-11ea-96b3-4574dbf086a7.png">


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
