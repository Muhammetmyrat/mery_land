drop role maryland_db_user;

CREATE ROLE maryland_db_user LOGIN SUPERUSER PASSWORD '1234';
-- windows
-- psql -U postgres -d maryland < ....
-- linux
-- sudo su postgres psql -d maryland < ....

sudo -su postgres pg_dump -d maryland > marylanddatabase.sql


