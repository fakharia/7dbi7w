create table events (event_id SERIAL PRIMARY KEY,
                     title varchar(255),
                     starts timestamp,
                     ends timestamp,
                     venue_id integer,
                     FOREIGN KEY (venue_id) references venues (venue_id));

insert into events (title, starts, ends, venue_id)
  values ('LARP Club', '2012-02-15 17:30:00', '2012-02-15 19:30:00', 2);
insert into events (title, starts, ends)
  values ('April Fools Day', '2012-04-01 00:00:00', '2012-04-01 23:59:00');
insert into events (title, starts, ends)
  values ('Christmas Day', '2012-12-25 00:00:00', '2012-12-25 23:59:00');

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
