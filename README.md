# README

## usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| email                  | string     | null: false |
| encrypted_password     | string     | null: false |

### Association
- has_many :recipes
- has_many :menus

## recipes

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| cooking_name           | string     | null: false                    |
| ingredient             | text       | null: false                    |
| process                | text       | null: false                    |
| cook_time_id           | integer    | null: false                    |
| genre_id               | integer    | null: false                    |
| side_dishes_id         | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :menus_recipes
- has_many :menus, through: :menus_recipes

## menus

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| main                   | string     | null: false                    |
| sub_one                | string     | null: false                    |
| sub_two                | string     | null: false                    |
| soup                   | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :menus_recipes
- has_many :recipes, through: :menus_recipes

## menus_recipes

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| menu                   | references | null: false, foreign_key: true |
| recipe                 | references | null: false, foreign_key: true |

### Association
- belongs_to :recipe
- belongs_to :menu

