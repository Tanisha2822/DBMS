ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| CP                 |
| EMP                |
| Emp                |
| Employee           |
| Flats              |
| Home               |
| Project            |
| UVM                |
| amazon             |
| ekart              |
| hospital           |
| information_schema |
| movies             |
| mysql              |
| newstd             |
| performance_schema |
| phones             |
| shows              |
| student1           |
| sys                |
| theatre            |
| time               |
+--------------------+
22 rows in set (0.00 sec)

mysql> use movies;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> create table CREATE TABLE `users` (
    ->   `auid` int(10) UNSIGNED NOT NULL,
    ->   `username` varchar(100) NOT NULL,
    ->   `password` varchar(150) NOT NULL,
    ->   `createdate` datetime NOT NULL,
    ->   `isActive` tinyint(1) NOT NULL
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATE TABLE `users` (
  `auid` int(10) UNSIGNED NOT NULL,
  `username` varchar(' at line 1
mysql> create table users(auid int ,username varchar(100), password varchar(150),createdate datetime,isActive tinyint);
Query OK, 0 rows affected (0.03 sec)

mysql> create table  userprofile(apid int,auid int, firstname varchar(50),lastname varchar(50),email varchar(100), phone varchar(45));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into users(auid,username,password,createdate,isActive)values(1,"admin","pswrd23",curdate(),1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into userprofile(apid,auid,firstname,lastname,email,phone)values(1,1,"jack","wolf","bettestroom@gmail.com","600075764216");
Query OK, 1 row affected (0.00 sec)

mysql> insert into userprofile(apid,auid,firstname,lastname,email,phone)values(2,"admin1","pass506",curdate(),1);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into users(auid,username,password,createdate,isActive)values(2,"admin1","pass506",curdate(),1);
Query OK, 1 row affected (0.03 sec)

mysql> insert into userprofile(apid,auid,firstname,lastname,email,phone)values(2,3,"tom","Collins","tnkc@outlook.com","878511311054");
Query OK, 1 row affected (0.01 sec)

mysql> insert into users(auid,username,password,createdate,isActive)values(4,"fox12","45@jgo0",curdate(),1);
Query OK, 1 row affected (0.02 sec)

mysql> insert into userprofile(apid,auid,firstname,lastname,email,phone)values(4,5,"Bill","Fonskin","bill_1290@gmail.com","450985764216");
Query OK, 1 row affected (0.03 sec)

mysql> insert into users(auid,username,password,createdate,isActive)values(6,"lexus1267","98hnfRT6",curdate(),1);
Query OK, 1 row affected (0.02 sec)

mysql> insert into userprofile(apid,auid,firstname,lastname,email,phone)values(7,7,"Ivan","levchenko","ivan_new@outlook.com","878511311054");
Query OK, 1 row affected (0.02 sec)

mysql> SELECT columns FROM users INNER JOIN userprofile ON users.column = userprofile.column;
ERROR 1054 (42S22): Unknown column 'columns' in 'field list'
mysql> select *from users;
+------+-----------+----------+---------------------+----------+
| auid | username  | password | createdate          | isActive |
+------+-----------+----------+---------------------+----------+
|    1 | admin     | pswrd23  | 2022-08-23 00:00:00 |        1 |
|    2 | admin1    | pass506  | 2022-08-23 00:00:00 |        1 |
|    4 | fox12     | 45@jgo0  | 2022-08-23 00:00:00 |        1 |
|    6 | lexus1267 | 98hnfRT6 | 2022-08-23 00:00:00 |        1 |
+------+-----------+----------+---------------------+----------+
4 rows in set (0.00 sec)

mysql> select *from userprofile;
+------+------+-----------+-----------+-----------------------+--------------+
| apid | auid | firstname | lastname  | email                 | phone        |
+------+------+-----------+-----------+-----------------------+--------------+
|    1 |    1 | jack      | wolf      | bettestroom@gmail.com | 600075764216 |
|    2 |    3 | tom       | Collins   | tnkc@outlook.com      | 878511311054 |
|    4 |    5 | Bill      | Fonskin   | bill_1290@gmail.com   | 450985764216 |
|    7 |    7 | Ivan      | levchenko | ivan_new@outlook.com  | 878511311054 |
+------+------+-----------+-----------+-----------------------+--------------+
4 rows in set (0.01 sec)

mysql> select *from users inner join userprofile on user.auid = userprofile.auid;
ERROR 1054 (42S22): Unknown column 'user.auid' in 'on clause'
mysql> select *from users inner join userprofile on users.auid = userprofile.auid;
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
| auid | username | password | createdate          | isActive | apid | auid | firstname | lastname | email                 | phone        |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
|    1 | admin    | pswrd23  | 2022-08-23 00:00:00 |        1 |    1 |    1 | jack      | wolf     | bettestroom@gmail.com | 600075764216 |
+------+----------+----------+---------------------+----------+------+------+-----------+----------+-----------------------+--------------+
1 row in set (0.00 sec)

mysql> 

