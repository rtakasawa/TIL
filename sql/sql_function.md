# sql_function

## round関数
- 四捨五入する
- 下記だと「平均」で誤った結果が表示される
```
select 名称,hp,round(hp / (
	select sum(hp)
	from パーティー),2) as 平均
from パーティー
where 職業コード = '01';
```
- hpを数値型に変更すると正しい結果が表示される
- どの言語でも関数に利用できる型があるので注意する
```
select 名称,hp,round(cast(hp as numeric) / (
	select sum(hp)
	from パーティー),2) as 平均
from パーティー
where 職業コード = '01';
```
※スッキリわかるSQL入門_ドリルC_53から抜粋

## except
- 2つのselect結果の差分を求める
```
select * from テーブルA
EXCEPT
select * from テーブルB
```

## all
- 副問合せの結果が複数であり、全て真の場合は真、一つでも偽があれば偽となる
```
select イベント番号, イベント名称
from イベント
where イベント番号 < all(
select イベント番号
from 経験イベント
where ルート番号 = '5');
```

## any
- 副問合せの結果が複数あり、一つでも真なら真となる。
```
select イベント番号, イベント名称, 前提イベント番号
from イベント
where 前提イベント番号 = any(
select イベント番号
from 経験イベント
where クリア区分 = '1');
```

## count
### select句内の集計関数ではエイリアスは使えない
- これは動く
```
select i1.前提イベント番号 as イベント番号,
i2.イベント名称,
count(i1.前提イベント番号)
from イベント as i1
join (
	select イベント番号,イベント名称
	from イベント) as i2
on i1.前提イベント番号 = i2.イベント番号
group by i1.前提イベント番号, i2.イベント名称
order by i1.前提イベント番号;
```

- これは動かない
```
select i1.前提イベント番号 as イベント番号,
i2.イベント名称,
count(イベント番号)
from イベント as i1
join (
	select イベント番号,イベント名称
	from イベント) as i2
on i1.前提イベント番号 = i2.イベント番号
group by i1.前提イベント番号, i2.イベント名称
order by i1.前提イベント番号;
```
### 引数での挙動の違い
- (*) = グループ内の全レコード数をカウントする
- (列名) = 対象列でNULLはカウントしない