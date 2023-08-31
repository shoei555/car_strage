# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

<!-- * Ruby version Rubyバージョン -->
ruby 3.2.0 
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

<!-- * Deployment instructionデプロイ手順 -->
render
S3 configuration
Aws
* ...


【Users Table】

| Type                | Column              | Options                     | Description               |
| ------------------- | ------------------- | --------------------------- | ------------------------  |
| integer             | employee_num        | null:false                  | 社員番号                   |
| string              | last_name           | null:false                  | 姓                        | 
| string              | first_name          | null:false                  | 名                        |
| string              | email               | null:false, unique:true     | ユーザーのメールアドレス      |
| string              | encrypted_password  | null:false                  | ユーザーのパスワード          |


##Association
has_many: cars


【Cars Table】

| Type                | Column              | Options                     | Description                             |
| ------------------- | ------------------- | --------------------------- | ----------------------------------------|
| string              | name                | null:false                  | 車種名                                   |
| integer             | maker_id            | null:false                  | メーカー名                                |
| date                | model_year          | null:false                  | 年式                                     |
| integer             | mileage             | null:false                  | 走行距離                                  |
| integer             | prefecture_id       | null:false                  | 登録都道府県                               |
| integer             | price               | null:false                  | 車両本体価格                               |
| string              | car_code            | null:false, unique:true     | 車体番号                                  |
| reference           | user                | null:false                  | 登録者                                    |
| string              | car_inspection      | null:false                  | 車検期間                                   |
| integer             | displacement        | null:false                  | 排気量                                     |
| string              | car_color           | null:faise                  | 車体色                                     | 
| integer             | wheel_drive         | null:false                  | 駆動                                       |
| integer             | car_fuel            | null:false                  | 燃料                                       |
| integer             | tag                 |                             | タグ

##Association
belongs_to: user
has_many_attached: images
