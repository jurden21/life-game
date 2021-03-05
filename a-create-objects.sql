create table Life_Table (Step integer default 0 not null, X integer not null, Y integer not null);
create unique index Life_Index on Life_Table (Step asc, X asc, Y asc);
