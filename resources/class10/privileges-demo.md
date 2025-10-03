# Users, roles, permissions, etc.

This quick demo barely scratches the surface, but it does show some commands such as GRANT and REVOKE in action.

## Prepare a user with no privileges (done in advance)

launch in cygwin as default (postgres):
```
cmd.exe /c chcp 1252 
psql -U postgres
```

show schemas: `\dn`

Verify current user: `SELECT current_user;`

Show more details of access privileges (Got this from ChatGPT):
```
SELECT n.nspname AS schema,
       has_schema_privilege(n.nspname, 'USAGE')  AS can_use,
       has_schema_privilege(n.nspname, 'CREATE') AS can_create
FROM pg_namespace n
WHERE n.nspname NOT LIKE 'pg_%' AND n.nspname <> 'information_schema'
ORDER BY n.nspname;
```

show roles: `\du`

Create a non-superuser role (from ChatGPT):

```
-- create a login role with a password; ensure it's NOT a superuser
CREATE ROLE jmac WITH
  LOGIN
  PASSWORD 'changeme'      -- use a secure password in real use
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  NOINHERIT;               -- you can leave INHERIT if you want role membership to pass privileges automatically
```


## Demonstrate simple permissions

launch in cygwin as superuser (postgres):
```
cmd.exe /c chcp 1252 
psql -U postgres
```


new cygwin window:
```
cmd.exe /c chcp 1252 
psql -U jmac -d postgres --password
```

show roles: `\du`

Verify current user: `SELECT current_user;`

list tables: `\dt wine.*`

`select * from wine.supplier;` -- permission denied

In superuser window:
```
GRANT USAGE ON SCHEMA wine TO jmac;
GRANT SELECT ON ALL TABLES IN SCHEMA wine TO jmac;
```

`select * from wine.supplier;` -- succeeds

`update wine.supplier set supstatus=23 where supnr='68';` -- fails


```
REVOKE CREATE ON SCHEMA wine FROM jmac;
REVOKE USAGE  ON SCHEMA wine FROM jmac;
```