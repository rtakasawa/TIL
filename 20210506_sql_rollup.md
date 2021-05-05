# sql

### select文の実行順
```
FROM句
↓
JOIN句
↓
WHERE句
↓
GROUP BY句
↓
HAVING句
↓
SELECT句
↓
ORDER BY句
↓
LIMIT句
```
※引用先：https://qiita.com/k_0120/items/a27ea1fc3b9bddc77fa1

### group by句の復習
#### 例１ group byのみ
![名称未設定ファイル](https://user-images.githubusercontent.com/60159339/117205152-2fe0fc80-ae2c-11eb-846e-2c244c3b7e00.png)

#### 例２ rollup 
![名称未設定ファイル-ページ1のコピー](https://user-images.githubusercontent.com/60159339/117207145-9535ed00-ae2e-11eb-9f04-da85e3b9de38.png)

#### 例3 rollup（複数指定）
![名称未設定ファイル-ページ1のコピーのコピー](https://user-images.githubusercontent.com/60159339/117208120-b8ad6780-ae2f-11eb-9937-2ac01acfbcd0.png)

#### rollupはグループの小計や総計を取得するのに便利

#### 参考：https://qiita.com/tlokweng/items/a15b67f3475e38282dca
