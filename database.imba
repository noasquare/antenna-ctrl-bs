let mysql = require('mysql')
# const connection = mysql.createConnection
# 	host : 'localhost'
# 	user : 'root'
# 	password : 'password'
# 	database : 'txjl'
export default class test
	prop connection = mysql.createConnection
		host : 'localhost'
		user : 'root'
		password : 'password'
		database : 'txjl'

	def connect
		# console.log connection
		connection.connect! do(er)
			if er
				throw er
			else
				console.log 'succes login to mysql'





