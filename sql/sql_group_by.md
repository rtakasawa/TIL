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

### CUBE
- 例２の実行結果にプラスして、```group by torokubi```を実行
- すべてのgroup byの組み合わせを実行する
```
select shohin_bunrui,torokubi,sum(hanbai_tanka)
from shohin
group by cube(shohin_bunrui,torokubi)
order by shohin_bunrui;
 shohin_bunrui |  torokubi  |  sum
---------------+------------+-------
 キッチン用品  | 2008-04-28 |   880
 キッチン用品  |            | 11180
 キッチン用品  | 2009-01-15 |  6800
 キッチン用品  | 2009-09-20 |  3500
 事務用品      |            |   600
 事務用品      | 2009-11-11 |   100
 事務用品      | 2009-09-11 |   500
 衣服          | 2009-09-20 |  1000
 衣服          |            |  4000
 衣服          |            |  5000
               | 2008-04-28 |   880
               |            |  4000
               | 2009-11-11 |   100
               | 2009-09-20 |  4500
               | 2009-09-11 |   500
               | 2009-01-15 |  6800
               |            | 16780
(17 rows)
```

### grouping sets
- rollupやcubeの結果から指定の条件だけ取り出したい場合に使用する
- 以下はshohin_bunrui,torokubiそれぞれのgroupでのselect結果を出力
```
shop=# select shohin_bunrui,torokubi,sum(hanbai_tanka)
from shohin
group by grouping sets(shohin_bunrui,torokubi)
order by shohin_bunrui;
 shohin_bunrui |  torokubi  |  sum
---------------+------------+-------
 キッチン用品  |            | 11180
 事務用品      |            |   600
 衣服          |            |  5000
               | 2009-09-20 |  4500
               | 2009-09-11 |   500
               | 2009-01-15 |  6800
               | 2008-04-28 |   880
               |            |  4000
               | 2009-11-11 |   100
(9 rows)
```

## 復習
![名称未設定ファイル-ページ1](https://user-images.githubusercontent.com/60159339/117723596-86c84680-b21d-11eb-86ea-7f6c87eddf76.png)

