C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.22 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> use college;
Database changed
mysql> create table books(book_id int NOT NULL , name varchar(10) , cost int);
Query OK, 0 rows affected (0.10 sec)

mysql> insert into books(null,"IKIGAI",550);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'null,"IKIGAI",550)' at line 1
mysql> insert into books values(null,"IKIGAI",550);
ERROR 1048 (23000): Column 'book_id' cannot be null
mysql> insert into books values(101,"IKIGAI",550),(102,"EPIC",600);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select* from books;
+---------+--------+------+
| book_id | name   | cost |
+---------+--------+------+
|     101 | IKIGAI |  550 |
|     102 | EPIC   |  600 |
+---------+--------+------+
2 rows in set (0.00 sec)

mysql> create table branch(clg_id int NOT NULL,name varchar(10),building varchar(10) default"A");
Query OK, 0 rows affected (0.05 sec)

mysql> select* from branch;
Empty set (0.00 sec)

mysql> insert into branch(101,"computer"),(102,"electronic","B");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '101,"computer"),(102,"electronic","B")' at line 1
mysql> insert into branch(101,"computer");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '101,"computer")' at line 1
mysql> insert into branch values(101,"computer"),(102,"electronic","B");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into branch values(101,"computer"),(102,"electronic");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into branch values(101,"computer"," ");
Query OK, 1 row affected (0.01 sec)

mysql> select* from branch;
+--------+----------+----------+
| clg_id | name     | building |
+--------+----------+----------+
|    101 | computer |          |
+--------+----------+----------+
1 row in set (0.00 sec)

mysql> insert into branch values(103,"civil","A");
Query OK, 1 row affected (0.01 sec)

mysql> select* from branch;
+--------+----------+----------+
| clg_id | name     | building |
+--------+----------+----------+
|    101 | computer |          |
|    103 | civil    | A        |
+--------+----------+----------+
2 rows in set (0.00 sec)

mysql> create table subjects(name varchar(10) UNIQUE , sub_id int, teacher varchar(10));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into subjects values("DBMS", 101, "vrushali"),("TOC",102,"yasmin")("TOC",103,"shanti");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '("TOC",103,"shanti")' at line 1
mysql> insert into subjects values("DBMS", 101, "vrushali"),("TOC",102,"yasmin"),("TOC",103,"shanti");
ERROR 1062 (23000): Duplicate entry 'TOC' for key 'subjects.name'
mysql> select* from subjects;
Empty set (0.00 sec)

mysql> update subjects set name="SPOS" where sub_id=103;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select* from subjects;
Empty set (0.00 sec)

mysql> insert into subjects values("DBMS", 101, "vrushali"),("TOC",102,"yasmin"),("MPL",103,"shanti");
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select* from subjects;
+------+--------+----------+
| name | sub_id | teacher  |
+------+--------+----------+
| DBMS |    101 | vrushali |
| TOC  |    102 | yasmin   |
| MPL  |    103 | shanti   |
+------+--------+----------+
3 rows in set (0.00 sec)

mysql> create table student(stud_id int NOT NULL auto increment, name varchar(10), primary key(stud_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto increment, name varchar(10), primary key(stud_id)' at line 1
mysql> create table student(stud_id int NOT NULL auto-increment, name varchar(10), primary key(stud_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto-increment, name varchar(10), primary key(stud_id)' at line 1
mysql> create table student(stud_id int NOT NULL auto-increment, name varchar(10), primary key(stud_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto-increment, name varchar(10), primary key(stud_id))' at line 1
mysql> create table student(id int NOT NULL auto-increment, name varchar(10), primary key(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto-increment, name varchar(10), primary key(id))' at line 1
mysql> create table student(id int NOT NULL Auto-increment, name varchar(10), primary key(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Auto-increment, name varchar(10), primary key(id))' at line 1
mysql> create table student(id int NOT NULL AUTO-INCREMENT, name varchar(10), primary key(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO-INCREMENT, name varchar(10), primary key(id))' at line 1
mysql> create table student(id int not null AUTO-INCREMENT, name varchar(10), primary key(id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO-INCREMENT, name varchar(10), primary key(id))' at line 1
mysql> create table student(id int not null AUTO_INCREMENT, name varchar(10), primary key(id));
Query OK, 0 rows affected (0.05 sec)

mysql> insert  into student (name)values("tanisha"),("deeksha"),("khushi");
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select* from student;
+----+---------+
| id | name    |
+----+---------+
|  1 | tanisha |
|  2 | deeksha |
|  3 | khushi  |
+----+---------+
3 rows in set (0.00 sec)

mysql> create table labs(id int UNIQUE , name varchar(10) , students int, credits int check(students<20));
ERROR 3813 (HY000): Column check constraint 'labs_chk_1' references other column.
mysql> insert into labs values(101,"DBMS",18);
ERROR 1146 (42S02): Table 'college.labs' doesn't exist
mysql> create table labs(id int UNIQUE , name varchar(10) , students int, int check(students<20));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int check(students<20))' at line 1
mysql> create table labs(id int UNIQUE , name varchar(10) , students int check(students<20));
Query OK, 0 rows affected (0.05 sec)

mysql> insert into labs values(101,"DBMS",18);
Query OK, 1 row affected (0.01 sec)

mysql> insert into labs values(101,"DBMS",24);
ERROR 3819 (HY000): Check constraint 'labs_chk_1' is violated.
mysql>
