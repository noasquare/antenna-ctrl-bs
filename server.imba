import express from 'express'
import index from './app/index.html'
import test from './database'
import bodyParser from 'body-parser'
const cors = require('cors')
const app = express!
const jasonParser = bodyParser.json!
app.use(cors())

const mysql = new test
mysql.connect! # 链接数据库
		

app.get('/testforu') do(req,res)
	mysql.connection.query 'SELECT * FROM user_info;' do(er,rows)
		console.log er if er
		res.send(rows)
app.get('/loglist') do(req,res)
	mysql.connection.query 'SELECT * FROM device_control;' do(er,rows)
		console.log er if er
		res.send(rows)

app.get('/servoplist') do(req,res) 
	mysql.connection.query 'SELECT * FROM servo_poslist;' do(er,rows) # 获取伺服位置列表
		console.log er if er
		res.send(rows)

app.get('/servoslist') do(req,res)
	mysql.connection.query 'SELECT * FROM servo_satlist;' do(er,rows) # 获取伺服的卫星列表
		console.log er if er
		res.send(rows)

app.get('/jihualist') do(req,res)
	mysql.connection.query 'SELECT * FROM polar_satlist;' do(er,rows) # 获取伺服的卫星列表
		console.log er if er
		res.send(rows)

app.get('/tracklist') do(req,res)
	mysql.connection.query 'SELECT * FROM ephemeris LIMIT 20;' do(er,rows) # 获取伺服的卫星列表
		console.log er if er
		res.send(rows)

app.get('/tracklisthis') do(req,res)
	mysql.connection.query 'SELECT * FROM memory LIMIT 20;' do(er,rows) # 获取伺服的昨天的卫星跟踪列表
		console.log er if er
		res.send(rows)

app.post('/savetuop',jasonParser) do(req,res)
	try
		console.log req.body
	catch er
		console.log er.message
		
	# res.send(test)
	# let f_name = req.body.f_name
	# mysql.connection.query `INSERT INTO contacts (f_name) VALUES ("{f_name}");` do(er,rows) # 获取伺服的昨天的卫星跟踪列表
	# 	console.log er if er
	# 	res.send(rows)




# catch-all other route that returns our index.html
app.get(/.*/) do(req,res)
	# only render the html for requests that prefer an html response
	unless req.accepts(['image/*', 'html']) == 'html'
		return res.sendStatus(404)

	res.send index.body
	
app.get '/' do(req,res)
	res.redirect('/antall')
imba.serve app.listen(process.env.PORT or 3000)