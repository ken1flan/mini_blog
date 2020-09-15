# Mini Blog

Mini Blogはいわゆるブログアプリケーションです。
自分が`メンテし続ける`ことを試すために作りました。

## 機能
- Google OAUTHによるユーザ認証
- 著者によるブログの管理
- ブログのタグ付け
- sitemap.xml

## システムを構築する上で必要なもの
### 必須
- Ruby
- PostgreSQL
- Node
- Google OAUTH

### 非必須
- Google Webmaster Tool
- Google Analytics
- Google Tag Manager

## 開発環境
開発環境はDockerを利用します。
利用しない場合は適宜、環境を準備してください。

### セットアップ

```console
$ docker-compose up --build
$ docker-compose exec web bundle exec rails db:create RAILS_ENV=development
$ docker-compose exec web bundle exec rails db:create RAILS_ENV=test
```

### 初期ユーザ作成

ログインできない初期ユーザを作成し、
その後、利用するためのアカウントを招待します。
招待を作った際に割り当てられるtokenをパラメータにセットして、ユーザ登録画面を開くと作成されます。

```console
$ docker-compose exec web bundle exec rails console
> User.create(nickname: 'admin')
> invitation =  Invitation.new(email: 'アカウント用email', message: 'Hello!', introducer_id: 1)
> puts invitation.token
```

`http://localhost:3000/sign_up?token=さっき取得したトークン`


#### 環境変数

`dot.env`をコピーして`.env`ファイルを作り、内容を自分の使っているキーに合わせて変更してください。

### 起動

```console
$ docker-compose up
```

### 終了

`Ctrl+C` でdocker-compose upを止めてください。

#### 再起動

```console
$ docker-compose exec web bundle exec rails restart
```

### テスト
`docker-compose up`がされている状態で、下記コマンドを実行してください。

```console
$ docker-compose exec web bundle exec rspec
```

# Licence
MIT