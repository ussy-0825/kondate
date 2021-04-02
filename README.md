## kondate


## 概要
献立を立てる事ができるアプリです。
日付を指定し、表示される料理を選択することで、
カレンダーに料理名が登録され献立表を作る事ができます。
レシピの投稿機能があるので、自分が持っているレシピを投稿すれば
献立作成事に投稿した料理が選択できるようになります。
また、カレンダーの料理名をクリックすることで、
料理のレシピを確認することができます。

## 制作背景
私の妻から献立を考える事が大変であるという話を聞き、
それを解決できるようなアプリを作成できないかと思った事がきっかけです。
実際にネットで調べてみても、献立を立てるという「考える家事」が負担になっているという記事を見つけ
特に、家族の料理を作らなければならない主婦層が、この問題を抱えていると感じました。

## 本番環境
http://3.115.80.141/

### テストアカウント
メールアドレス：test@test.com

password：testpass


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

