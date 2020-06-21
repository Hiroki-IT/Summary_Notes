# RESTful APIの概念と実装

## 01. RESTとRESTfulとは

### REST

#### ・RESTとは

分散型システムにおける複数のソフトウェアを連携させるのに適したアーキテクチャスタイルをRESTという．また，アーキテクチャスタイルについては，オブジェクト指向分析・設計のノートを参照せよ．RESTは，以下の特徴を持つ．

#### ・Addressability
#### ・Stateless
#### ・Connectability
#### ・Uniform Interface



### RESTful

#### ・RESTfulとRESTful APIとは

RESTに基づいた設計をRESTfulという．RESTful設計が用いられたWebAPIをRESTful APIという．例えば，RESTful APIの場合，DBにおけるUserInfoのCRUDに対して，一つの「/UserInfo」というURLを対応づけている．

![RESTfulAPIを用いたリクエスト](https://raw.githubusercontent.com/Hiroki-IT/tech-notebook/master/source/images/RESTfulAPIを用いたリクエスト.png)



## 02. RESTful APIへのリクエスト

### RESTfulにおけるデータの送信方法

#### ・エンドポイントとは

APIにリソースをリクエストするためのURLのこと．エンドポイント は，リソース1つごと，あるいはまとまりごとに割り振られる．

#### ・各送信方法の特徴

| **送信方法** | サーバ側の処理 | 使い分け                    | 特徴 | エンドポイント例                        | パスパラメータ |
| :--------------: | --------------------------------------- | ---------------- | ---------------- | ---------------- | ---------------- |
|     **GET**      |   読み  | DBデータのRead |  | ```http://www.example.co.jp/userInfo/{id}```  | id |
|     **POST**     |     書き     | ・DBのCreate操作<br>・DBのUpdate操作<br>・PDFの作成<br>・画像やPDFの送信<br>・ログイン | 冪等的でない | ```http://www.example.co.jp/userInfo/```     | なし |
|     **PUT**      |   書き    | ・DBのCreate操作<br/>・DBのUpdate操作 | 冪等的である | ```http://www.example.co.jp/userInfo/{id}``` | id |
|    **DELETE**    |    書き    | DBのDelete操作 |  | ```http://www.example.co.jp/userInfo/{id}``` | Id |



### URLにおけるパスパラメータとクエリパラメータの使い分け（再掲）

パスパラメータはデータをリクエストするために用いる．また，クエリパラメータは，GET送信の時に，データの検索処理／フィルタ処理／ソート処理をリクエストするために用いる．GET送信については，リクエストメッセージの説明を参照せよ．

| 完全修飾ドメイン名             | 送信先のポート番号（```80```の場合は省略可） | ルート         | パスパラメータ | ？      | クエリパラメータ（GET送信時のみ） |
| ------------------------------ | -------------------------------------------- | -------------- | -------------- | ------- | --------------------------------- |
| ```http://www.example.co.jp``` | ```80```                                     | ```userInfo``` | ```{id}```     | ```?``` | ```text1=a&text2=b```             |

**【URLの具体例】**

```
http://www.example.co.jp:80/userInfo/777?text1=a&text2=b
```



## 02-02. RESTful APIからのレスポンス

### スキーマ

#### ・スキーマとは

例えば，APIが，以下のようなJSON型データをレスポンスするとする．

```json
{
    "name": "山田太郎",
    "age": 42,
    "hobbies": ["野球", "柔道"]
}
```

ここで，以下のように，レスポンスデータの各データ型をJSON型（あるいはYAML型）で記述しておく．これをスキーマという，スキーマは，レスポンスデータのバリデーションを行う時に用いる．

```json
{
    "type": "object",
    "properties": {
        "name": {
            "type": "string"
        },
        "age": {
            "type": "integer",
            "minimum": 0
        },
        "hobbies": {
            "type": "array",
            "items": {
                "type": "string"
            }
        }
    },
    "required": ["name"]
}
```



### ステータスコード

#### ・```415``` Unsupported Media Type

※使いどころを要勉強

#### ・```422``` Unprocessable Entity

※使いどころを要勉強