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


usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|nickname|string|null:false,unipue: true|
|image|string|
|self_introduction|text|

### Association
- has_many :plans
- has_many :comments


festivalテーブル

|Column|Type|Options|
|------|----|-------|
|eventname|string|null: false|
|overview|string|null: false|

### association
- belongs_to :areas
- has_many :plans


areasテーブル

|Column|Type|Options|
|------|----|-------|
|resion_name|string|null: false|
|country|string|null: false|

### Association
- has_many :plans


plansテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|details|text|null: false|
|image|string|
|region|string|null: false|
|date|date|null: false|

### Association
- belongs_to :user
- belongs_to :festival
- has_many :comments
- has_many :areas
- has_many :tags_plans
- has_many :tags, through: :tags: :plans


tagsテーブル

|Column|Type|Options|
|------|----|-------|
|tag|string|null: false|

### Association
- has_many :tags_plans
- has_many :plans, through: :tags_plans


tags_plansテーブル

|Column|Type|Options|
|------|----|-------|
|tags_id|integer|null: false, foreign_key|
|plans_id|integer|null: false, foreign_key|

### Association
- belongs_to :tag
- belongs_to :plan


commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|image|string|
|user_id|integer|null: false,foreign_key: true|
|plan_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :plan
