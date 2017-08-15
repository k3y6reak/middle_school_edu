CREATE TABLE down_board (
       num int not null auto_increment,
       group_num int not null,
       ord int not null,
       depth int not null,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(20),
       hit int,
       ip varchar(20),
       filename varchar(50),
       filesize varchar(20),
       PRIMARY KEY (num)
       );

CREATE TABLE down_ripple (
       num int not null auto_increment,
       parent int not null,
       id varchar(10) not null,
       name varchar(10) not null,
       content text not null,
       regist_day varchar(20),
       ip varchar(20),
       PRIMARY KEY (num)
       );

CREATE TABLE freeboard (
       num int not null auto_increment,
       name varchar(20) not null,
       passwd varchar(20) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(20),
       hit int,
       ip varchar(20),
       PRIMARY KEY (num)
);

create table guestbook (
   num int not null auto_increment,
   name varchar(10) not null,
   passwd varchar(10) not null,
   content text not null,
   regist_day varchar(20),
   ip varchar(20),
   primary key(num)
);

create table member ( 
    id varchar(10) not null,
    passwd varchar(10) not null,
    name varchar(10) not null,
    sex char(1),
    tel varchar(20),
    address varchar(90),
    primary key(id) 
);

CREATE TABLE notice_board (
       num int not null auto_increment,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(20),
       hit int,
       ip varchar(20),
       PRIMARY KEY (num)
);


CREATE TABLE notice_ripple (
       num int not null auto_increment,
       parent int not null,
       id varchar(10) not null,
       name varchar(10) not null,
       content text not null,
       regist_day varchar(20),
       ip varchar(20),
       PRIMARY KEY (num)
);

CREATE TABLE qna_board (
       num int not null auto_increment,
       group_num int not null,
       ord int not null,
       depth int not null,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(20),
       hit int,
       ip varchar(20),
       PRIMARY KEY (num)
);

CREATE TABLE qna_ripple (
       num int not null auto_increment,
       parent int not null,
       id varchar(10) not null,
       name varchar(10) not null,
       content text not null,
       regist_day varchar(20),
       ip varchar(20),
       PRIMARY KEY (num)
);

create table survey(
   ans1 int,
   ans2 int,
   ans3 int,
   ans4 int
   );

insert into survey values(0, 0, 0, 0);