# README
## アプリ名：  spoil me more  
## アプリケーション概要  
褒められたい人と褒めたい人をつなげるアプリ  
日々の中で、自分が頑張った事や褒めてもらい内容を投稿。
それに対して、感動・共感した人や褒めたい人（褒め力を伸ばしたい人）がコメントをして頑張っている人にエールを送れるアプリケーションです。
- 本番環境  デプロイ先：(<https://spoil-me-more.herokuapp.com>)
        - ID：hiromi
        - PASS：2222
## 制作背景  
■褒める事はモチベーションアップにつながる  
&emsp;自分自身もそうですが、他の方から自分の頑張りを認めてもらえた時、モチベーションが上がりよりやる気が出た事が多々あります。  
■褒める事や感謝を口にする事は意外に難しい  
&emsp;褒める事や感謝の際にどう伝えれば良いのか、特に上司と部下や異性同士では難しいと感じる人が多く、よく相談に乗る事が多かった。  
■褒めて欲しい人・褒め力をのばしたい人を結びつけるアプリ  
&emsp;上記の内容から、アプリの構想を行いました。褒めるアプリは、沢山あるのですプロフィール内容から判断して、決められた内容をBOTが褒めるのではなくやはり、人同士が褒める事に関して意味があると考えたためこの褒められた人と褒めたい人をつなげるアプリを考えました。  
■ペルソナ  
&emsp;ターゲットは、３０代の男女  
&emsp;３０代は、家事や育児又、仕事に置いても責任ある仕事を任される事も多いため、日常で頑張った事を投稿したり、褒め力を伸ばしたいなどで使用する事を想定しています。  
## 工夫した内容
今回、３０代の男女をペルソナとして考えたため、日常で使ってみたいシンプルなデザインを意識しました。  
※まだ全ての機能が実装していないため仮のviewになってます。
## 使用技術  
言語・フレームワーク  
&emsp; Ruby/Ruby on Rails  
フロント  
&emsp; HTML/CSS/SCSS  
データーベース  
&emsp; MySQL  
テスト  
&emsp; RSpec/factory_bot  
開発環境  
Github/Visual Studio Code  
## 実装した機能のついて  10月31日時点
-1)ユーザー管理機能（devise)
[![Image from Gyazo](https://i.gyazo.com/9680f414324ca723e9e40c192dac66a4.gif)](https://gyazo.com/9680f414324ca723e9e40c192dac66a4)
-2)投稿機能
[![Image from Gyazo](https://i.gyazo.com/f8fc4e61e5a11b3531dea15e63c4bfe2.gif)](https://gyazo.com/f8fc4e61e5a11b3531dea15e63c4bfe2)
-3)コメント機能(view修正中)
[![Image from Gyazo](https://i.gyazo.com/9fc83aebed02d42c150fd06b3bd47c15.gif)](https://gyazo.com/9fc83aebed02d42c150fd06b3bd47c15)
-4)画像投稿機能  
-5)テストの実施（userモデルのみ）  
## 課題や今後実装したい機能  
-素敵ね機能  
-頑張ってるね機能  
-マイページ機能  
-ランキング機能  
-フォロー機能  
-個人チャット機能  
-スマホレスポンシブ機能  
## 開発日数  
現在開発中。
### 作業期間  
2021/10/21〜
# DB設計図
## usersテーブル
### user管理機能

| Column     | Type   | Options                   |
|------------|--------|---------------------------|
| nickname   | string | null :false               |
| email      | string | null :false, unique: true |
| password   | string | null :false               |

### Association
has_many :tweets
has_many :comments
has_many :likes
has_many :bests
has_many :chats
has_mane :relations
has_mene :chats

## tweetsテーブル
### 投稿機能
| Column| Type       | Options          |
|-------|------------|------------------|
| title | string     | null :false      |
| text  | text       | null :false      |
| user  | references | foreign_key:true |

### Association
belongs_to :user 
has_mane :comments

## commentsテーブル
### コメント機能

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
### 素敵ね機能
| Column | Type       | Options          |
|--------|------------|------------------|
| user   | references | foreign_key:true |
|comment | references | foreign_key:true |

### Association
belongs_to :user
belongs_to :comment

## bestsテーブル
### 頑張ってるね機能

| Column| Type       | Options          |
|-------|------------|------------------|
| user  | references | foreign_key:true |
| tweet | references | foreign_key:true |

### Association
belongs_to :user
belongs_to :tweet

## relationshipテーブル
### フォロー機能
| Column   | Type       | Options          |
|----------|------------|------------------|
| user     | references | foreign_key:true |
| follower | references | foreign_key:true |

### Association
belongs_to :user

## chatsテーブル
### チャット機能(Action Cableを使用)

| Column     | Type       | Options          |
|------------|------------|------------------|
| sentence   | string     | null :falls      |
| partner_id | integer    | null :falls      |
| user       | references | foreign_key:true |

### Association
belongs_to :user