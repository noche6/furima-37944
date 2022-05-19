## users

|Column         |Type     |Options      |
|---------------|---------|-------------|
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| name_zennkaku | string  | null: false |
| name_katakana | string  | null: false |
| birthday      | integer | null: false |
 

### Association
- has_many :items
- has_many :purchase_record

## items

|Column       |Type       |Options                        |
|-------------|-----------|-------------------------------|
| item_name   | string    | null: false                   |
| description | text      | null: false                   |
| category    | string    | null: false                   |
| situation   | string    | null: false                   |
| area        | string    | null: false                   |
| date        | string    | null: false                   |
| user        | reference | null: false,foreign_key: true |


### Association
- belongs_to :user
- belongs_to :purchase_record


## purchase_record

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
| user | reference | null: false,foreign_key: true |
| item | reference | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :item


## shipping address

|Column       |Type       |Options                        |
|----------------|-----------|-------------------------------|
| postal_code    | integer   | null: false                   |
| prefectures    | string    | null: false                   |
| municipalities | string    | null: false                   |
| address        | integer   | null: false                   |
| building       | string    | null                          |
| number         | integer   | null: false                   |
| user           | reference | null: false,foreign_key: true |
| item           | reference | null: false,foreign_key: true |


### Association
-has_one :purchase_record