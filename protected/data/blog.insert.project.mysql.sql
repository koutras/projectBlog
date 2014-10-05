insert into tbl_project (name,description)
values ("Διαύγεια","Το project της διαύγειας"),
       ("ΕΚΑΒ","Το project του ΕΚΑΒ");

-- Insert some seed data so we can just begin using the database
INSERT INTO tbl_user
(email, username, password)
VALUES
('test1@notanaddress.com','Test_User_One', MD5('test1')),
('test2@notanaddress.com','Test_User_Two', MD5('test2'))
;

