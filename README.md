## kondate
<img width="1440" alt="READEME用" src="https://user-images.githubusercontent.com/78068541/113428575-01799700-9412-11eb-9b75-849b0fbb0883.png">

## 概要
献立を考える時、同じようなメニューしか思いつかなかったり、
考えることすら面倒くさいということがあると思います。
kondateは、そのような献立を立てる作業をサポートするアプリです。
料理のジャンル、おかずの種類を指定すればユーザーが投稿した料理が表示されるので
好みの料理を選択するだけで献立が作れます。
また、作成した献立はアプリ内のカレンダーに登録され、いつでも献立の内容を確認することができます。

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

## 利用方法
１・テストアカウントにてログイン

２・日付、料理のジャンル、おかずの種類を設定し料理を検索。好みの料理を選択。
[![Image from Gyazo](https://i.gyazo.com/777ab2f73953bdb6b0dd4a395ff9c5ac.gif)](https://gyazo.com/777ab2f73953bdb6b0dd4a395ff9c5ac)

３・２を繰り返して好みの献立を作れます。
[![Image from Gyazo](https://i.gyazo.com/d0bca03a7ad58305d0956954c67d43fd.gif)](https://gyazo.com/d0bca03a7ad58305d0956954c67d43fd)

## 工夫したポイント
操作性を高める為、条件指定をして料理を検索させる処理は非同期通信で行えるようにしています。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/b464847bf416fddb3ad73000c5608ace.png)](https://gyazo.com/b464847bf416fddb3ad73000c5608ace)

### usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| email                  | string     | null: false |
| encrypted_password     | string     | null: false |

### Association
- has_many :recipes
- has_many :menus

### recipes

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

### menus

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

### menus_recipes

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| menu                   | references | null: false, foreign_key: true |
| recipe                 | references | null: false, foreign_key: true |

### Association
- belongs_to :recipe
- belongs_to :menu

