# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


  # テーブル設計

## users テーブル

| Colum           | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| email           | string | null: false |
| date            | date   | null: false |
| password        | string | null: false |


### Association

- has_many :items
- has_many :address
- has_many :purchases

## itemsテーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    | 
| postage          | integer    | null: false                    |
| area             | integer    | null: false                    | 
| category         | integer    | null: false                    | 
| status           | integer    | null: false                    |
| price            | integer    | null: false                    |
| shipping_charges | integer    | null: false                    |

### Association

- has_many :address, through: users
- belongs_to :images
- has_many :users

## imagesテーブル
| Colum     | Type   | Options     |
| --------- | ------ | ----------- | 
| image     | text   | null: false | 
| item      | string | null: false |

### Association

- has_many :users

## addressテーブル

| Colum         | Type        | Options                       |
| ------------- | ------------| ----------------------------- |
| post_code     | string      | null: false                   |
| city          | string      | null: false                   |  
| genre_id      | integer     | null: false                   |
| building_name | string      |                               |
| phone_number  | string      | null: false                   |
| address       | string      | null: false                   |
| purchase      | references  | null; false,foreign_key: true |

### Association
- belongs_to :purchase

## purchasesテーブル

| Colum   | Type       | Options                        |
| ------- | ------     | ------------------------------ | 
| item    | references | null: false, foreign_key: true | 
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address


