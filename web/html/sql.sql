create table role (role_id INT PRIMARY KEY NOT NULL, role_name CHAR(50) NOT NULL, role_decs CHAR(500) DEFAULT NULL);
insert into role values (0, '系统管理员', '负责Execl文档导入，用户添加、更新及删除等');                                
insert into role values (1, '项目负责人', '负责项目数据维护');                                                         
insert into role values (2, '访客', '只能流量项目数据');                                                               
PRAGMA foreign_keys = ON;
create table user (user_id INT NOT NULL PRIMARY KEY, user_name CHAR(20) NOT NULL, user_pwd CHAR(20) NOT NULL, nick_name CHAR(20), email CHAR(50) DEFAULT NULL, create_time TEXT NOT NULL, login_time TEXT, user_status INT(1) DEFAULT '0', role_id INT NOT NULL, FOREIGN KEY(role_id)  REFERENCES role(role_id)); 
insert into user values (0, 'admin', 'admin', 'admin', 'antonlee2013@163.com', '2016-05-05 20:36:45', '', 1, 0);
insert into user values (1, 'test', 'test', 'test', 'd198901@163.com', '2016-05-05 20:36:45', '', 1, 2);

