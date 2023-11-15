#!/usr/bin/env python
# coding: utf-8

# In[2]:


get_ipython().system(' pip install PyMySQL')
get_ipython().system(' pip install ipython-sql')
get_ipython().system(' pip install mysqlclient')


# In[3]:


import pymysql # provide a convenient way to connect to mysql
import pandas as pd


# In[4]:


mysqldb = pymysql.connect(host="localhost",
                          user= "root",
                          password = "14112004",
                          database = "student")

mysqlcursor =mysqldb.cursor() # create a cursor object from mysqlconnection object(mysqldb)
# The cursor is used to execute SQL queries and fetch the results from the database.


# In[8]:


# create table students
mysqlcursor.execute("""create table students(student_name nvarchar(50) , 
                                            student_ID INT Primary key  , 
                                            student_address varchar(30), 
                                            student_sex BIT)""")


# In[13]:


# create table classes
mysqlcursor.execute("""create table classes(classes_name nvarchar(50) , 
                                            classes_ID nvarchar(30) )""")


# In[ ]:


# create table subject
mysqlcursor.execute("""create table subject(subject_name nvarchar(50) ,
                                            subject_ID nvarchar(30) primary key )""")


# In[9]:


# insert data into table student
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('bao an', 1, 'thaibinh', 1)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('khanh phuong', 2, 'hanoi', 0)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('ninh hai', 3, 'hai duong', 0)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('phuong anh', 4, 'ha noi', 0)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('hoa ngoc', 5, 'ha noi', 0)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('le duc', 6, 'ha noi', 1)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('ba huy', 7, 'ha noi', 1)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('huy thinh', 8, 'ha noi', 1)")
mysqlcursor.execute("insert into students(student_name, student_ID, student_address, student_sex) values('quoc vuong', 9, 'son tay', 1)")
mysqldb.commit()
print("record inserted into table")


# In[10]:


#  insert data into table subject
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('database', 1)")
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('finance', 2)")
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('quantitative methods', 3)")
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('economic statistics', 4)")
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('Data science', 5)")
mysqlcursor.execute("insert into subject(subject_name, subject_ID) values('Information system', 6)")
mysqldb.commit()
print("record inserted into table")


# In[11]:


# insert data into table classes
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('FF', 'F05')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('FF', 'F04')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('FF', 'F03')")
''''''
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('ES', 'ES01')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('ES', 'ES02')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('ES', 'ES04')")
''''''
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('INS', 'ES04')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('INS', 'ES03')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('INS', 'ES02')")
''''''
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DS', 'DS01')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DS', 'DS02')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DS', 'DS03')")
''''''
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DB', 'DB01')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DB', 'DB02')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('DB', 'DB03')")
''''''
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('IS', 'IS01')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('IS', 'IS02')")
mysqlcursor.execute("insert into classes(classes_name, classes_ID) values('IS', 'IS03')")
mysqldb.commit()
print("record inserted into table")


# In[5]:


# drop table students
try: 
    mysqlcursor.execute("Drop table students")
    mysqldb.commit()
    print("table deleted")
except:
    mysqldb.rollback()


# In[12]:


# drop table classes
try: 
    mysqlcursor.execute("Drop table classes")
    mysqldb.commit()
    print("table deleted")
except:
    mysqldb.rollback()


# In[7]:


# drop table subject
try: 
    mysqlcursor.execute("Drop table subject")
    mysqldb.commit()
    print("table deleted")
except:
    mysqldb.rollback()


# In[52]:


# display record

try: 
    mysqlcursor.execute("select * from students ")
    result = mysqlcursor.fetchall()
    for i in result:
        student_name = i[0]
        student_ID = i[1]
        student_address = i[2]
        student_sex = i[3]
        print(student_name,student_ID,student_address,student_sex)
except exception as e:
    print(e)
    
    


# In[54]:


# display record

try: 
    mysqlcursor.execute("select student_name, student_ID from students inner join subject on subject_ID ")
    result = mysqlcursor.fetchall()
    for i in result:
        student_name = i[0]
        student_ID = i[1]
        subject_ID = i[2]
        
        print(student_name,student_ID,subject_ID)
except exception as e:
    print(e)
    
    


# In[ ]:




