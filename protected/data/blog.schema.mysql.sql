create table if not exists tbl_project
(
    id integer not null primary key auto_increment,
    name varchar(128),
    description text,
    create_time datetime,
    create_user_id integer,
    update_time datetime,
    update_user_id integer
);


CREATE TABLE if not exists tbl_issue
(
id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
name varchar(256) NOT NULL,
description varchar(2000),
project_id INTEGER,
type_id INTEGER,
status_id INTEGER,
owner_id INTEGER,
requester_id INTEGER,
create_time DATETIME,
create_user_id INTEGER,
update_time DATETIME,
update_user_id INTEGER
) ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS tbl_user
(
id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
email Varchar(256) NOT NULL,
username Varchar(256),
password Varchar(256),
last_login_time Datetime,
create_time DATETIME,
create_user_id INTEGER,
update_time DATETIME,
update_user_id INTEGER
) ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS tbl_project_user_assignment
(
project_id Int(11) NOT NULL,
user_id Int(11) NOT NULL,
create_time DATETIME,
create_user_id INTEGER,
update_time DATETIME,
update_user_id INTEGER,
PRIMARY KEY (project_id,user_id)
) ENGINE = InnoDB
;
-- The Relationships
ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_project FOREIGN KEY(project_id)
 REFERENCES tbl_project(id) ON DELETE CASCADE ON
UPDATE RESTRICT;

ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_owner FOREIGN KEY(owner_id)
 REFERENCES tbl_user(id) ON DELETE CASCADE ON UPDATE
RESTRICT;

ALTER TABLE tbl_issue ADD CONSTRAINT FK_issue_requester FOREIGN
KEY(requester_id) REFERENCES tbl_user(id) ON DELETE CASCADE ON
UPDATE RESTRICT;

ALTER TABLE tbl_project_user_assignment ADD CONSTRAINT FK_project_user
 FOREIGN KEY(project_id) REFERENCES tbl_project(id) ON
DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE tbl_project_user_assignment ADD CONSTRAINT FK_user_project
 FOREIGN KEY(user_id) REFERENCES tbl_user(id) ON
DELETE CASCADE ON UPDATE RESTRICT;


