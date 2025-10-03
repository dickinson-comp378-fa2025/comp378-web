# Index demo

```
SET search_path TO wine;
```

```
select * from supplier;
```

```
select * from supplier where supstatus=102;
```


Create index:
```
CREATE INDEX status_index ON supplier (supstatus);
```

`\d supplier` -- And also view in DBeaver

If the table was very large then the following query would be faster than before because the index can be used:
```
select * from supplier where supstatus=102;
```

`DROP INDEX wine.status_index;`
