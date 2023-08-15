# README

## テーブル設計

## usersテーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| nickname           | string | null: false         |
| email              | string | null: false, unique |
| encrypted_password | string | null: false         |
| last_name          | string | null: false         |
| first_name         | string | null: false         |
| last_name_kana     | string | null: false         |
| first_name_kana    | string | null: false         |
| birth_date         | date   | null: false         |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_info         | text       | null: false                    |
| item_category     | integer    | null: false                    |
| item_sales_status | integer    | null: false                    |
| sipping_fee       | integer    | null: false                    |
| item_price        | string     | null: false                    |
| users             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| users  | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :information

## informationテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_cord      | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| street_address | string     | null: false                    |
| build_name     | string     |                                |
| number         | string     | null: false                    |
| records        | references | null: false, foreign_key: true |

### Association

- belongs_to :records
