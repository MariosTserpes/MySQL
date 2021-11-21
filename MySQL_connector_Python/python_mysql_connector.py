import mysql.connector
localhost = "localhost"
user_name = "root"
my_password = "123456martser"
db = mysql.connector.connect(host = localhost,
                             user = user_name,
                             password = my_password)
 
mycursor = db.cursor()
 
mycursor.execute("SHOW DATABASES")
for data in mycursor:
    print(data)
    
mycursor.execute("CREATE DATABASE FirstDatabase2")
 
mycursor.execute("SHOW DATABASES")
for data in mycursor:
    print(data)

localhost = "localhost"
user_name = "root"
my_password = "123456martser"
db = mysql.connector.connect(host = localhost,
                             user = user_name,
                             password = my_password)
 
mycursor = db.cursor()
 
mycursor.execute("SHOW DATABASES")
for data in mycursor:
    print(data)
    
mycursor.execute("CREATE DATABASE FirstDatabase2")
 
mycursor.execute("SHOW DATABASES")
for data in mycursor:
    print(data)

print("This table has:",mycursor.rowcount, "rows")

mycursor.execute("SELECT * FROM ComputerShop")
result = mycursor.fetchall()
for k in result:
    print(k)
    
mycursor.execute("SELECT * FROM ComputerShop WHERE id = 104")
for data in mycursor:
    print(data)
    
query2 = "SELECT Firstname, Title FROM employees WHERE ReportsTO LIKE '%Representative%'"
mycursor.execute(query2)
result2 = mycursor.fetchall()
for k in result:
    print(k)