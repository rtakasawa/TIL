# sql_join

### select coalesce(T.入金額,T.出金額) as 取引金額
- これで入金額または出金額いずれかNULLではない方を出力できる

### full join だと両方のテーブルの外部結合をする
```
select distinct T.取引事由id, j.取引事由名
from 取引 as T full join 取引事由 as J
on T.取引事由id = J.取引事由id;
```

### ３つのテーブルのjoin
```
select k.口座番号, k.名義, k.残高, t.日付, t.入金額, t.出金額, j.取引事由名
from 口座 as k inner join 取引 as t
on k.口座番号 = t.口座番号
join 取引事由 as j
on t.取引事由id = j.取引事由id
where k.口座番号 = '0887132';
```

### 副問い合わせをしたテーブルとの結合
```
select k.口座番号, T.回数, k.名義
from 口座 as k join (
select 口座番号, count(*) as 回数
from 取引
group by 口座番号, 日付
having count(*) >= 3) as t
on k.口座番号 = t.口座番号;
```

### 内部結合（INNER JOIN）
- 左表に該当する右表が複数ある場合⇛左表の行を複製して、右表と結合する
- 左表に該当する右表がない場合⇛この左表の行も消滅する

### 外部結合（OUTER JOIN）
#### left outer join
- 左表に該当する右表がない場合⇛左表を消滅させず、右表はすべてNULLにして結合する
#### right outer join
- 右表に該当する左表がない場合⇛右表を消滅させず、左表はすべてNULLにして結合する

### ３つのテーブルの結合
```
select 日付,費目.名前,経費区分.名称
from 家計簿
join 費目
  on 家計簿.id = 費目.id
join
  on 費目.id = 経費区分.id
```
- 前から順に一つ一つ結合処理がおこわなれる
- 家計簿テーブルと費目テーブルを結合
- その結果に経費区分テーブルを結合

### 副問い合わせの結果との結合
```
select 日付, 費目.名前, 費目.経費区分id
from 家計簿
join ( select * from 費目
       where 経費区分id = 1
     ) as 費目
  on 家計簿.費目id = 費目.id
```
- 副問い合わせの結果に別名をつける必要あり

### 同じテーブル同士の結合も可能
- その場合は同じテーブルに別名をつける必要あり

### テーブルの不足分を別のテーブルで補う
- 商品テーブルの不足分を廃番テーブルで補う
```
select t.注文日, t.注文番号, t.注文枝番, t.商品コード,
coalesce(s.商品名,h.商品名) as 商品名,
coalesce(s.単価, h.単価) as 単価,
t.数量,
coalesce(s.単価, h.単価) * t.数量 - coalesce(t.クーポン割引料, 0) as 注文金額
from 注文 as t
left outer join 商品 as s
on t.商品コード = s.商品コード
left outer join 廃番商品 as h
on t.商品コード = h.商品コード
where t.注文番号 = '201704030010';
```