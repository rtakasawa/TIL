# Transaction

## 処理を纏めて実行すること = 原子性確保のしくみ
- 原子のように分割できないという意味

## 副作用
### 一つの口座に同時に2件アクセスした場合
#### 1件のアクセスが途中で終了した場合
- 他の人が未確定の情報を読める。未確定の情報を前提に処理されてしまう。
- これをダーティーリードという

#### 1件のアクセス内容が複数のSQLであり、そのアクセス中にもう1件のアクセスがデータを書き換えた場合
- 異なる情報での集計となるので、集計結果が異なる
- 反復不能読み取りという
- 上記で行数が変わったことでの副作用を「ファントムリード」という

## 上記副作用の解決
### 他のアクセスの影響を受けないようにする ⇛ 分離性を維持するという
- Transactionが読み書きしている行、テーブルをロックして、他のアクセスは実行待ちの状態とする。
- その分、待機時間が長くなる可能性もあり。
#### 分離レベルをTransaction分離レベルで指定することができる
- SERIALIZABLE ⇛ 一番安全
- REPEATABLE READ ⇛ ファントムリードのみ可能性あり
- READ COMMITTED ⇛ 反復不能読み取り・ファントムリードのみ可能性あり\
多くのDBMSは、このREAD COMMITTEDがデフォルト設定
- READ UNCOMMITTED ⇛ 一番危険
#### postgresqlは、READ UNCOMMITTEDの設定はない
- 書き換え前の情報が残っており、他のTransactionからも利用できるので、
ロックをかける必要なし ⇛ ダーティーリードが起こらない
- 並列実行制御という
#### 同時に異なる順番でロックをかけると、お互いのTransactionが待機中となる
- これをデットロックという
- 同じ順番でロックが掛かるようにSQLを書く工夫が必要
