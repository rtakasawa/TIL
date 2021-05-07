# sql_aggregation

## substring
- 文字列を切り出す関数

```
口座番号
0037651
0100807
```
- 口座番号の下一桁だけ切り出したい
```
select substring(口座番号, 7, 1) as sub
from 口座
group by substring(口座番号, 7, 1);
```
- substring(指定するカラム, 切り出す開始文字数, 切り出す文字数)


## 下記のsqlの解読
```
substring(coalesce(cast(更新日 as varchar), 'XXXX'), 1, 4)
```

#### coalesce関数
- NULLの値を変換する時に使用する
- coalesce(指定するカラム, nullを変換する値)

#### cast関数
- 型変換を行う
- cast(指定するカラム as 変換する型)

#### 結果
1. castで更新日をvarchar型に変換。（substringが文字列じゃないと使えないので）
2. coalesceで更新日のNULLをXXXXに変換
3. substringで更新日から切り出し

##### メモ
- 結果的に複数の関数を組み合わせるときは、問題を切り分けて小さい条件から作っていくとわかりやすい
###### 例題：名義の全角スペースを削除して名義の文字数の平均を求める
1. 名義の全角スペースを削除
2. 名義の文字数をカウント
3. 名義の文字数の平均を求める

1. replace(名義,'　','')
2. length(replace(名義,'　',''))
3. avg(length(replace(名義,'　','')))
