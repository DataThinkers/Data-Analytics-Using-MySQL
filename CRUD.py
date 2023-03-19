##########################################
# CRUD - CREATE, READ, UPDATE AND DELETE #
##########################################
import mysql.connector

#STEP:1 Connect to the MySQL DataBase.
try:
    conn=mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="password",
        database="crud_python"

    )
    mycursor=conn.cursor()
    print("Connection Established");
except:
    print("Connection Error");


#STEP:2. Create a DataBase.
mycursor.execute("CREATE DATABASE crud_python")
conn.commit()

print("DATABASE CREATED")


#STEP:3. Create a Table.
# id,name,email and age
mycursor.execute(
    """
    CREATE TABLE customers(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    age INTEGER
    )
    """)
conn.commit()
print("Table is Created")


# STEP:4. Insert New Records Into The "Customers" Table.
# id,name,email and age
mycursor.execute(
    """
      INSERT INTO customers VALUES
      (1,"Anil","anil@gmail.com",40),
      (2,"Rahul","rahul@gmail.com",24),
      (3,"Parshv","parshv@gmail.com",34)

    """)
conn.commit()
print("Rows are inserted")

# STEP:5. READ : Select Data From a Table.
mycursor.execute("select * from customers")
myresult=mycursor.fetchall()

print(myresult)

for x in myresult:
    print(x)

# STEP:6 UPDATE: Update Data in a Table.

# mycursor.execute("update customers set age=14 where id=1")
conn.commit()
print("Updated")


# STEP:7. Delete Data From a Table.
mycursor.execute("delete from customers where id=1")
conn.commit()
print("Deleted")




