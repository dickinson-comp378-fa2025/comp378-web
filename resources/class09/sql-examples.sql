------------------------------------------------
--- example 1: what does it do? [q44 from textbook, section 7.3.1.9]
------------------------------------------------
select
    supname
from
    supplier r
where
    exists (
        select
            *
        from
            supplies s
        where
            r.supnr = s.supnr
            and s.prodnr = '0178'
    );

------------------------------------------------
--- example 2: what does it do? [q44 from textbook, section 7.3.1.9]
------------------------------------------------
select
    supname,
    supaddress,
    supcity
from
    supplier r
where
    not exists (
        select
            *
        from
            product p
        where
            not exists (
                select
                    *
                from
                    supplies s
                where
                    r.supnr = s.supnr
                    and p.prodnr = s.prodnr
            )
    );

-- start from the inside and work outwards:
-- Step 1:
(
    select
        *
    from
        supplies s
    where
        r.supnr = s.supnr
        and p.prodnr = s.prodnr
);

-- Use specific values:
select
    *
from
    supplies s
where
    21 = s.supnr
    and '0327' = s.prodnr;

-- Work outwards one level, keeping one specific value. Start with unnegated exists:
select
    *
from
    product p
where
    exists (
        select
            *
        from
            supplies s
        where
            21 = s.supnr
            and p.prodnr = s.prodnr
    );

-- So, the above is all the products that can be supplied by supplier 21.
-- Now add a NOT before EXISTS, and we get the products that *cannot* be supplied by supplier 21. 
-- Work outwards one more level, but start unnegated:
select
    supname,
    supaddress,
    supcity
from
    supplier r
where
    exists (
        select
            *
        from
            product p
        where
            not exists (
                select
                    *
                from
                    supplies s
                where
                    r.supnr = s.supnr
                    and p.prodnr = s.prodnr
            )
    );

-- So the above is all the suppliers who can’t supply at least one product. When we add the NOT, we will get all the suppliers who can supply everything. (In this case, there are none.)
-- Theme: work from the inside out. Choose specific values. Try to describe the meaning of the query in words.

-- Example 2b, to discuss in groups [textbook qu 7.21]: what does it do?

select
    p1.prodnr,
    p1.prodname,
    s1.supnr,
    s1.purchase_price
from
    product p1,
    supplies s1
where
    p1.prodnr = s1.prodnr
    and not exists (
        select
            *
        from
            product p2,
            supplies s2
        where
            p2.prodnr = s2.prodnr
            and p1.prodnr = p2.prodnr
            and s1.purchase_price > s2.purchase_price
    );

------------------------------------------------
--- example 3: union [q48 from textbook, section 7.3.1.11]
------------------------------------------------
select
    supnr,
    supname
from
    supplier
where
    supcity = 'new york'
union
select
    r.supnr,
    r.supname
from
    supplier r,
    supplies s
where
    r.supnr = s.supnr
    and s.prodnr = '0915'
order by
    supname asc;

------------------------------------------------
--- example 4: insert [from textbook section 7.3.2]
------------------------------------------------
insert into
    product (prodnr, prodname, prodtype, available_quantity)
values
    (
        '980',
        'Chateau Angelus, Grand Clu Classé, 1960',
        'red',
        6
    ),
    (
        '1000',
        'Domaine de la Vougeraie, Bâtard Montrachet, Grand cru, 2010',
        'white',
        2
    ),
    (
        '1002',
        'Leeuwin Estate Cabernet Sauvignon 2011',
        'white',
        20
    );

------------------------------------------------
--- example 5: delete one row [from textbook, section 7.3.3]
------------------------------------------------
delete from product
where
    prodnr = '1000';

------------------------------------------------
--- example 6: delete many rows [from textbook, section 7.3.3]
------------------------------------------------
delete from supplies
where
    prodnr in (
        select
            prodnr
        from
            product
        where
            prodname like '%CHARD%'
    );

------------------------------------------------
--- example 7: update one row [from textbook, section 7.3.4]
------------------------------------------------
update product
set
    available_quantity = 26
where
    prodnr = '0185';

------------------------------------------------
--- example 8: update many rows [from textbook, section 7.3.4]
------------------------------------------------
update supplies
set
    deliv_period = deliv_period + 7
where
    supnr in (
        select
            supnr
        from
            supplier
        where
            supname = 'Deliwines'
    );