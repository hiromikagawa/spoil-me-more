# README
## アプリ名： spoil me 
## 使い方： 自分が頑張った時や、達成した時に褒めて欲しい人や感動を共有したい人と、褒め力を伸ばしたい人、自分の幸せをお裾分けしたい人をつなげるコミュニティサイトです。
- 本番環境　デプロイ先：
        - テストアカウント：
        - ID：
## 制作背景
###

## 工夫した内容
## 使用技術 
## 課題や今後実装したい機能

# DB設計図

## usersテーブル

| Column    | Type   | Options     |
|-----------|--------|-------------|
| nickname  | string | null :false |
| email     | string | null :false |
| password  | string | null :false |
| lastname  | string | null :false |
| firstname | string | null :false |
| birthday  | date   | null :false |

### Association
has_many :posts
has_many :comments
has_many :likes
has_mane :relations

## postsテーブル

| Column| Type       | Options          |
|-------|------------|------------------|
| title | string     | null :false      |
| text  | text       | null :false      |
| user  | references | foreign_key:true |

### Association
belongs_to :user 
has_mane :comments

## commentsテーブル

| Column  | Type       | Options          |
|---------|------------|------------------|
| comment | text       | null :falls      |
| post    | references | foreign_key:true |
| user    | references | foreign_key:true |

### Association
has_mane :likes
belongs_to :user

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
