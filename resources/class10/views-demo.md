Define new view of Chardonnay wines:
```sql
create view wine.chardonnays as
select
    p.prodname as product,
    p.prodnr as p_id,
    r.supname as supplier,
    r.supnr as s_id,
    s.purchase_price as price
from
    wine.product p,
    wine.supplies s,
    wine.supplier r
where
    p.prodname like '%Chardonnay%'
    and p.prodnr = s.prodnr
    and s.supnr = r.supnr
order by
    product;
```

Query the new view:

```sql
select * from wine.chardonnays where price<18;
```
