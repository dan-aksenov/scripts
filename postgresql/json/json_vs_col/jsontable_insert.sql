\set id :scale
\setrandom id 1200001 1500000
\set AUTOCOMMIT 0 
BEGIN;
insert into jsontable (id,type,dt_create,dt_change,nm_column,params)select :id,1 as TYPE, now() - '2 years'::interval * random() as DT_CREATE, now() - '6 month'::interval * random() as DT_CHANGE,random_string( (random() * 40 + 5)::int4) as NM_COLUMN,CAST(json_build_object('PARAM33', random() > 0.5,'PARAM45', random() > 0.5,'PARAM46', random() > 0.5,'PARAM64',random() > 0.5,'PARAM79',random() > 0.5,'PARAM3',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM6',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM9',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM14',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM17',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM18',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM19',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM24',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM25',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM34',case when random() > 0.05 then (50 * random() - 10 * random())::integer end,'PARAM1',case when random() < 0.85 then 13573 * random() - 350 * random() end,'PARAM16',case when random() < 0.85 then 13573 * random() - 350 * random() end,'PARAM29',case when random() < 0.85 then 13573 * random() - 350 * random() end,'PARAM32',case when random() < 0.85 then 13573 * random() - 350 * random() end,'PARAM35',case when random() < 0.85 then 13573 * random() - 350 * random() end,'PARAM2',case when random() > 0.2 then (now() - interval '8 years' * random() + interval '1 year' * random())::date end,'PARAM8',case when random() > 0.2 then (now() - interval '8 years' * random() + interval '1 year' * random())::date end,'PARAM12',case when random() > 0.2 then (now() - interval '8 years' * random() + interval '1 year' * random())::date end,'PARAM22',case when random() > 0.2 then (now() - interval '8 years' * random() + interval '1 year' * random())::date end,'PARAM26',case when random() > 0.2 then (now() - interval '8 years' * random() + interval '1 year' * random())::date end,'PARAM4',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM7',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM10',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM15',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM23',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM28',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM36',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM43',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM50',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM51',case when random() > 0.15 then random_string( (random() * 150 + 10)::int4) end,'PARAM13',case when random() > 0.2 then random_string( (random() * 5000)::int4) end,'PARAM21',case when random() > 0.2 then random_string( (random() * 5000)::int4) end,'PARAM27',case when random() > 0.2 then random_string( (random() * 5000)::int4) end,'PARAM59',case when random() > 0.2 then random_string( (random() * 5000)::int4) end,'PARAM74',case when random() > 0.2 then random_string( (random() * 5000)::int4) end,'PARAM5',(select coalesce(array_agg((random() * 50 - random() * 5)::integer)::integer[], ARRAY[]::integer[]) from generate_series(1,(random() * 15)::integer)),'PARAM11',(select coalesce(array_agg((random() * 50 - random() * 5)::integer)::integer[], ARRAY[]::integer[]) from generate_series(1,(random() * 15)::integer)),'PARAM20',(select coalesce(array_agg((random() * 50 - random() * 5)::integer)::integer[], ARRAY[]::integer[]) from generate_series(1,(random() * 15)::integer)),'PARAM30',(select coalesce(array_agg((random() * 50 - random() * 5)::integer)::integer[], ARRAY[]::integer[]) from generate_series(1,(random() * 15)::integer)),'PARAM44',(select coalesce(array_agg((random() * 50 - random() * 5)::integer)::integer[], ARRAY[]::integer[]) from generate_series(1,(random() * 15)::integer)) )as jsonb);
ROLLBACK;
END;