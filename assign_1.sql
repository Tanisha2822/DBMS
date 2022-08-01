$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Employee           |
| Flats              |
| Home               |
| Madhuri            |
| TE                 |
| information_schema |
| movies             |
| mysql              |
| newstd             |
| performance_schema |
| student1           |
| sys                |
| theatre            |
+--------------------+
13 rows in set (0.00 sec)

mysql> create database phones;
Query OK, 1 row affected (0.03 sec)

mysql> create table applephn;
ERROR 1046 (3D000): No database selected
mysql> use phones;
Database changed
mysql> create table applephn;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table applephn(name of phone varchar(15),price int, features varchar(15));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'of phone varchar(15),price int, features varchar(15))' at line 1
mysql> create table applephn(name varchar(15),price int, features varchar(15));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into applephn("iphone SE" ,46900,"aluminium frame");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"iphone SE" ,46900,"aluminium frame")' at line 1
mysql> insert into applephn("iphone_SE" ,46900,"aluminium_frame");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"iphone_SE" ,46900,"aluminium_frame")' at line 1
mysql> insert into applephn values("iphone_SE" ,46900,"aluminium_frame");
Query OK, 1 row affected (0.03 sec)

mysql> select*from applephn;
+-----------+-------+-----------------+
| name      | price | features        |
+-----------+-------+-----------------+
| iphone_SE | 46900 | aluminium_frame |
+-----------+-------+-----------------+
1 row in set (0.00 sec)

mysql> insert into applephn values("ipad_Air",70000,"oleophobic_coating"),("iphone_13Pro",110900,"stainless");
ERROR 1406 (22001): Data too long for column 'features' at row 1
mysql> insert into applephn values("ipad_Air",70000,"oleophobic"),("iphone_13Pro",110900,"stainless");
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select*from applephn;
+--------------+--------+-----------------+
| name         | price  | features        |
+--------------+--------+-----------------+
| iphone_SE    |  46900 | aluminium_frame |
| ipad_Air     |  70000 | oleophobic      |
| iphone_13Pro | 110900 | stainless       |
+--------------+--------+-----------------+
3 rows in set (0.00 sec)

mysql> alter table applephn add column phn_id int;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update applphn set phn_id=101 where name="iphone_SE";
ERROR 1146 (42S02): Table 'phones.applphn' doesn't exist
mysql> update applephn set phn_id=101 where name="iphone_SE";
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update applephn set phn_id=102 where name="iphone_Air";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> update applephn set phn_id=103 where name="iphone_13Pro";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from applephn;
+--------------+--------+-----------------+--------+
| name         | price  | features        | phn_id |
+--------------+--------+-----------------+--------+
| iphone_SE    |  46900 | aluminium_frame |    101 |
| ipad_Air     |  70000 | oleophobic      |   NULL |
| iphone_13Pro | 110900 | stainless       |    103 |
+--------------+--------+-----------------+--------+
3 rows in set (0.00 sec)

mysql> update applephn set phn_id=102 where name="ipad_Air";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from applephn;
+--------------+--------+-----------------+--------+
| name         | price  | features        | phn_id |
+--------------+--------+-----------------+--------+
| iphone_SE    |  46900 | aluminium_frame |    101 |
| ipad_Air     |  70000 | oleophobic      |    102 |
| iphone_13Pro | 110900 | stainless       |    103 |
+--------------+--------+-----------------+--------+
3 rows in set (0.00 sec)

mysql> delete from applephn where phn_id=102;
Query OK, 1 row affected (0.03 sec)

mysql> select*from applephn;
+--------------+--------+-----------------+--------+
| name         | price  | features        | phn_id |
+--------------+--------+-----------------+--------+
| iphone_SE    |  46900 | aluminium_frame |    101 |
| iphone_13Pro | 110900 | stainless       |    103 |
+--------------+--------+-----------------+--------+
2 rows in set (0.00 sec)

mysql> exit
Bye
