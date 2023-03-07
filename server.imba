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

app.get('/satbaselist') do(req,res)
	mysql.connection.query 'SELECT * FROM sat_baseinfo;' do(er,rows) # 获取伺服的卫星列表
		console.log er if er
		res.send(rows)

app.get('/satlistinfo') do(req,res)
	mysql.connection.query 'SELECT * FROM sat_listinfo;' do(er,rows) # 获取伺服的卫星列表
		console.log er if er
		res.send(rows)

app.get('/tracklisthis') do(req,res)
	mysql.connection.query 'SELECT * FROM memory LIMIT 20;' do(er,rows) # 获取伺服的昨天的卫星跟踪列表
		console.log er if er
		res.send(rows)

app.get '/savetuop' do(req,res)
	mysql.connection.query 'SELECT * FROM tuop_data ;' do(er,rows) 
		# 绘图数据列表
		console.log er if er
		res.send(rows)

app.get '/getsatlistlon' do(req,res)
	mysql.connection.query 'SELECT * FROM sat_listlon ;' do(er,rows) 
		# 查询第一个卫星经度值
		console.log er if er
		res.send(rows)

	
		

app.post('/savetuop',jasonParser) do(req,res)
	try
		let tuopdata = JSON.parse(req.body.data)
		# console.log JSON.parse(req.body.antNo)
		# console.log tuopdata[0].devname
		let sql = `DELETE FROM tuop_data WHERE antname='{tuopdata[0].antname}'; alter table tuop_data auto_increment=1 ; INSERT INTO tuop_data(antname,devname,width,height,x,y,upcon,uppointx,uppointy,downcon,downpointx,downpointy,leftcon,leftpointx,leftpointy,rightcon,rightpointx,rightpointy) VALUES ? `
		let values = []
		for item,i in tuopdata
			values.push([item.antname,item.devname,item.width,item.height,item.x,item.y,item.upcon,item.uppointx,item.uppointy,item.downcon,item.downpointx,item.downpointy,item.leftcon,item.leftpointx,item.leftpointy,item.rightcon,item.rightpointx,item.rightpointy])
		# console.log values
		mysql.connection.query(sql,[values],do(er,rows)
			console.log er if er
			res.send(rows)
			)

app.post('/search',jasonParser) do(req,res)
	# console.log req.body.data
	let keyword = JSON.parse(req.body.data)
	# console.log keyword
	let sql = `SELECT * FROM sat_baseinfo WHERE SatName LIKE '%{keyword}%'`
	mysql.connection.query(sql,do(er,rows)
		console.log er if er
		res.send(rows)
		)

# catch-all other route that returns our index.html
app.get(/.*/) do(req,res)
	# only render the html for requests that prefer an html response
	unless req.accepts(['image/*', 'html']) == 'html'
		return res.sendStatus(404)

	res.send index.body
	
app.get '/' do(req,res)
	res.redirect('/antall')
imba.serve app.listen(process.env.PORT or 3000)