
# アパレル専用のスキル販売アプリケーション -MyPreta-

## 概要
出品者(seller)・購入者(buyer)でログイン機能を区別し、スキルの購入とその後の細かいオーダーをチャットでやりとりできるアプリケーションとなります。
スキルを売り買いできる「ココナラ」のアパレル特化版とイメージして作成した、作り手個人で登録できるアプリケーションです。

## 作成背景
アパレルメーカーに勤めていた際に、副業で顧客をとりにくいと言っていた友人の悩みを聞き素敵なスキルを持っているのにもったいない！と思いました。
「オリジナルの服を欲しい」人と、「服を作りたい」人を繋げたいと思い、作り手個人が登録できるアパレルコミュニティアプリケーションを作成しました。

## 本番環境

| 項目                   | 情報                                                   |
| ----------------------| ------------------------------------------------------ |
| URL                   | [http://54.95.209.40:3000/](http://54.95.209.40:3000/) |
| テストアカウント         | プルダウンから選択してください                              |

* [テストアカウントでのログイン方法](https://gyazo.com/d4bc2b8d9446de2a23fc0c06cd699d08)

* 【トークン決済用カード情報】
| カード番号            | 有効期限   | セキュリティコード     |
| ------------------- | --------- | ------------------- |
| 4242424242424242    | 12/24     | 123                 |



## DEMO



## 追加実装中の機能・課題
* 追加実装
    * 出品スキル検索機能
    * トップページの人気商品スライド
    * チャット機能をActionCableを使ったリアルタイムチャットへ変更
    * カテゴリーを増やす
* 課題
    * リファクタリング


## sellers テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |
| gender            | string | null: false |
| info              | text   | null: false |
| schedule          | string | null: false |


### Association

- has_many :items
- has_many :sns_credentials


## buyers テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |
| gender            | string | null: false |


### Association

- has_many :deals
- has_many :items, through :deals
- has_many :sns_credentials


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| seller              | references | null: false, foreign_key: true |
| overview            | string     | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| delivery_fee        | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| price               | integer    | null: false                    |


### Association

- belongs_to :seller
- has_one :image
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shipping_area
- has_many :deals
- has_many :items, through :deals



## deals テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| buyer       | references | null: false,  foreign_key: true |
| seller      | references | null: false,  foreign_key: true |
| item        | references | null: false,  foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :seller
- belongs_to :item
- has_one :transaction
- has_many :comments



## transactions テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| deal                | references | null: false, foreign_key: true  |
| postal_code         | string     | null: false                     |
| shipping_area       | integer    | null: false                     |
| city                | string     | null: false                     |
| house_number        | string     | null: false                     |
| building_name       | string     |                                 |
| phone_number        | string     | null: false                     |


### Association

- belongs_to :deal
- belongs_to_active_hash :shipping_area


## comments テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| seller_id           | string     | optional: true                  |
| buyer_id            | string     | optional: true                  |
| deal_id             | string     | null: false                     |
| text                | text       | null: false                     |


### Association
- belongs_to :seller
- belongs_to :buyer
- belongs_to :deal
- has_one_attached :image


## sns_credential_buyers テーブル


| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| provider            | string     | null: false                     |
| uid                 | string     | null: false                     |
| buyer               | references | null: false,  foreign_key: true |


### Association

- belongs_to :buyer


## sns_credential_sellers テーブル


| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| provider            | string     | null: false                     |
| uid                 | string     | null: false                     |
| seller              | references | null: false,  foreign_key: true |


### Association

- belongs_to :seller


