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

|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
| item_name    | string    | null: false                   |
| description  | text      | null: false                   |
| category_id  | integer   | null: false                   |
| situation_id | integer   | null: false                   |
| burden_id    | integer   | null: false                   |
| area_id      | integer   | null: false                   |
| date_id      | integer   | null: false                   |
| user         | reference | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_record


## purchase_record

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
| user | reference | null: false,foreign_key: true |
| item | reference | null: false,foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
| postal_code     | string    | null: false                   |
| prefectures_id  | integer   | null: false                   |
| municipalities  | string    | null: false                   |
| address         | integer   | null: false                   |
| building        | string    | null                          |
| number          | string    | null: false                   |
| purchase_record | reference | null: false,foreign_key: true |


### Association
- belongs_to :purchase_record