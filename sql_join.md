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

