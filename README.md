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


## usersテーブル

|column|type|options|
|------|----|------|
|name|string|null: false|
|group_id|integer|foreign_key: true|

### Association
- has_many :groups
- has_many :messages


## groupsテーブル

|column|type|options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null :false, foreign_key: true|

### Association

- has_many :messages
- has_many :users


## membersテーブル

|column|type|options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :group
- belonga_to :user



## messagesテーブル

|column|type|options|
|------|----|-------|
|body|text|null: false|
|image|string| |
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
