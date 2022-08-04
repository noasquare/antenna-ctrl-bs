let mysql = require('mysql')
# const connection = mysql.createConnection
# 	host : 'localhost'
# 	user : 'root'
# 	password : 'password'
# 	database : 'txjl'
export default class test
	prop connection = mysql.createPool
		connectionLimit : 2
		host : 'localhost'
		user : 'root'
		password : 'password'
		database : 'txjl2'
		multipleStatements : true # 非常关键的一条语句，让你可以多条query持续输出。

	def connect
		# console.log connection
		connection.getConnection! do(er)
			if er
				throw er
			else
				console.log 'succes login to mysql'
				





