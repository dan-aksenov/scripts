--The pg_relation_size() function returns the size of the table only, not included indexes or additional objects. 
--https://wiki.postgresql.org/wiki/Disk_Usage

SELECT nspname || '.' || relname AS "relation", 
    pg_size_pretty(pg_relation_size(C.oid)) AS "size" 
  FROM pg_class C 
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace) 
  WHERE nspname NOT IN ('pg_catalog', 'information_schema') 
  ORDER BY pg_relation_size(C.oid) DESC
 --LIMIT 20 
;
 