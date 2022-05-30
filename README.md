## users

|Column               |Type     |Options                    |
|---------------------|---------|---------------------------|
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name_zenkaku  | string  | null: false               |
| last_name_zenkaku   | string  | null: false               |
| first_name_katakana | string  | null: false               |
| last_name_katakana  | string  | null: false               |
| birthday            | date    | null: false               |


### Association
- has_many :items
- has_many :purchase_records

## items

|Column          |Type        |Options                        |
|----------------|------------|-------------------------------|
| price          | string     | null: false                   |
| item_name      | string     | null: false                   |
| description    | text       | null: false                   |
| category_id    | integer    | null: false                   |
| situation_id   | integer    | null: false                   |
| burden_id      | integer    | null: false                   |
| prefectures_id | integer    | null: false                   |
| delivery_id    | integer    | null: false                   |
| user           | references | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :order


## orders

|Column|Type        |Options                        |
|------|------------|-------------------------------|
| user | references | null: false,foreign_key: true |
| item | references | null: false,foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses

|Column           |Type        |Options                        |
|-----------------|------------|-------------------------------|
| postal_code     | string     | null: false                   |
| prefectures_id  | integer    | null: false                   |
| municipalities  | string     | null: false                   |
| address         | string     | null: false                   |
| building        | string     |                               |
| number          | string     | null: false                   |
| order           | references | null: false,foreign_key: true |


### Association
- belongs_to :order