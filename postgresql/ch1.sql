-- Exercise 1

select c.* from pg_class c, pg_namespace n
  where c.relkind = 'r'
  and n.nspname = 'public'
  and c.relnamespace = n.oid;

-- Exercise 2

select c.country_name from events e, venues v, countries c
  where e.title = 'LARP Club'
  and e.venue_id = v.venue_id
  and v.country_code = c.country_code;

-- Exercise 3

alter table venues add column active boolean default true;
