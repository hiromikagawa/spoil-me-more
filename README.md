# README
## アプリ名：  spoil me more  
## アプリケーション概要  
自分が頑張った時や、達成した時に褒めて欲しい人や感動を共有したい人と、褒め力を付けたい又、誰かを褒めたい人をつなげるコミュニティサイトです。
- 本番環境　デプロイ先： 
        - テストアカウント：hiromi
        - ID：2222
## 制作背景　  

###

## 工夫した内容

## 使用技術  
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
## 実装した機能のついて

## 課題や今後実装したい機能
素敵ね機能  
頑張ってるね機能  
マイページ機能  
ランキング機能  
フォロー機能  
個人チャット機能  

###

# DB設計図

## usersテーブル

| Column     | Type   | Options                   |
|------------|--------|---------------------------|
| nickname   | string | null :false               |
| email      | string | null :false, unique: true |
| password   | string | null :false               |

### Association
has_many :tweets
has_many :comments
has_many :likes
has_mane :relations

## tweetsテーブル

| Column| Type       | Options          |
|-------|------------|------------------|
| title | string     | null :false      |
| text  | text       | null :false      |
| user  | references | foreign_key:true |

### Association
belongs_to :user 
has_mane :comments

## commentsテーブル

| Column| Type       | Options          |
|-------|------------|------------------|
| text  | text       | null :falls      |
| tweet | references | foreign_key:true |
| user  | references | foreign_key:true |

### Association
has_mane :likes
belongs_to :user
belongs_to :tweet

## likesテーブル

| Column | Type       | Options          |
|--------|------------|------------------|
| user   | references | foreign_key:true |
|comment | references | foreign_key:true |

### Association
belongs_to :user
belomgs_to :comment

## relationsテーブル
| Column   | Type       | Options          |
|----------|------------|------------------|
| user     | references | foreign_key:true |
| follower | references | foreign_key:true |

### Association
belongs_to :user
