
# アパレル専用のスキル販売アプリケーション -MyPreta-

## 概要
アパレルメーカーに勤めていた際に、副業で顧客をとりにくいと言っていた友人の悩みを聞き素敵なスキルを持っているのにもったいない！と思いました。
「オリジナルの服を欲しい」人と、「服を作りたい」人を繋げたいと思い、作り手個人が登録できるアパレルコミュニティアプロケーションを作成しました。


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
| item        | references | null: false,  foreign_key: true |


### Association

- belongs_to :buyer
- belongs_to :item
- has_one :transaction



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


## chatsテーブル