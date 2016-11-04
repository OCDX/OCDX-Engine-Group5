drop schema swedb;
create schema swedb;

drop table if exists swedb.pages;
create table swedb.pages(
	pageid      serial,
	userid      integer,
    json        varchar(100),  
    updatedjson varchar(100),
    archivejson varchar(100));

drop table if exists swedb.comment;
create table swedb.comment(
    cid      	serial,
	userid      integer, 
    pageid      integer, 
    time        timestamp, 
    content     varchar(140));

drop table if exists swedb.users;
create table swedb.users(
    userid      serial, 
    email       varchar(100),
    password    varchar(20),
    usertype    varchar(20),
    gender      varchar(10), 
    jobtitle    varchar(50),
    org         varchar(50),
    edlevel     varchar(50),
    fname       varchar(50),
    lname       varchar(50),
    city        varchar(50),
    state       varchar(5),
    zip         integer,
    country     varchar(50),
    phone       varchar(20),
    banstatus   integer);

drop table if exists swedb.stats;
create table swedb.stats(
    tid         serial,
    action      varchar(10),
    date        timestamp,
    pageid      integer,
    timeonpage  integer,
    updatedjson varchar(100),
    archivejson varchar(100),
    accepterid  integer,
    changerid   integer,
    requestorid integer,
    assignedid  integer,
    reporterid  integer,
    reporteeid  integer,
    content     varchar(140),
    reason      varchar(140),
    json        varchar(20));
