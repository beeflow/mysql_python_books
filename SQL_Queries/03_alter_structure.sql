create table first_name (
    first_name_id int AUTO_INCREMENT,
    first_name varchar(15) not null,
    PRIMARY KEY(first_name_id),
    UNIQUE(first_name)
);

create table last_name (
    last_name_id int AUTO_INCREMENT,
    last_name varchar(50) not null,
    PRIMARY KEY(last_name_id),
    UNIQUE(last_name)
);

insert ignore into first_name (first_name)
SELECT distinct user_name from `user`
union
SELECT distinct author_name from author;

insert ignore into last_name (last_name) SELECT distinct user_surname from `user`
UNION
SELECT distinct author_surname from author;

alter table `user` add column user_first_name_id int not null;
alter table `user` add column user_last_name_id int not null;

alter table `author` add column author_first_name_id int not null;
alter table `author` add column author_last_name_id int not null;

update `user` set user_first_name_id = (SELECT first_name_id from first_name where first_name = user_name);
update `author` set author_first_name_id = (SELECT first_name_id from first_name where first_name = author_name);

update `user` set user_last_name_id = (SELECT last_name_id from last_name where last_name = user_surname);
update `author` set author_last_name_id = (SELECT last_name_id from last_name where last_name = author_surname);

ALTER TABLE `user` ADD CONSTRAINT user_first_name_id_fk
FOREIGN KEY(user_first_name_id) REFERENCES first_name(first_name_id) on update cascade on delete restrict;

ALTER TABLE `user` ADD CONSTRAINT user_last_name_fk
FOREIGN KEY(user_last_name_id) REFERENCES last_name(last_name_id) on update cascade on delete restrict;

ALTER TABLE `author` ADD CONSTRAINT author_first_name_id_fk
FOREIGN KEY(author_first_name_id) REFERENCES first_name(first_name_id) on update cascade on delete restrict;

ALTER TABLE `author` ADD CONSTRAINT author_last_name_fk
FOREIGN KEY(author_last_name_id) REFERENCES last_name(last_name_id) on update cascade on delete restrict;

alter table `user` drop COLUMN user_name;
alter table `user` drop COLUMN user_surname;

alter table `author` drop COLUMN author_name;
alter table `author` drop COLUMN author_surname;

alter table book_author rename book_author_trough;