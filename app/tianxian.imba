import './ctrsider'
import test from './imgs/天线1.svg'
import Drawflow from 'drawflow'
import './tpframe'
import axios from 'axios'

const devcolor = ['teal7','red7','sky7'] # 设置设备状态的一个颜色数组
let xdata 
let ydata 
let tpdata
# let tpxydata = []
let xydata = {
		x: 10px
		y: 10px
	}
# let devlistdata # 单个电线数据
tag tianxian
	css	.btitle d:flex h:5% w:100% c:#fff fs:15px ja:center
	css	.tuop h:60% w:100% pos:relative
		.tpimg pos:absolute bottom:0 left:0
	css	.mlog 
		.log-code c:rgb(23,168,62)

		# 以下是tooltip的悬浮展示样式。
	css .custom-tooltip --bs-tooltip-bg:var(--bs-primary) bgc:teal9
	css .tuop-chart p:4 2 pos:rel d:block cursor:grab rd:5px
		@touch scale:1.05 rotate:2deg zi:2
		@move scale:1.05 rotate:2deg zi:2
	css .tuop-chart bd:none shadow:none @hover:0 0 0 4px teal9,0 0 0 6px teal5 tween:0.2s
		.tphover zi:0 w:auto p:3 visibility:hidden o:0 transform:translateX(-40%) translateY(-20px) tween:.6s pos:absolute bgc:gray7 c:gra2 rd:5px t:125%
		.tphover::before content:'' pos:abs w:30px h:30px bg:gray7 t:0 r:40% transform:rotate(45deg) zi:-1
	css .tuop-chart@hover 
		.tphover visibility:visible o:.9 transform:translateX(-40%) translateY(0px) zi:10 w:50
	css table tr d:hgrid
	css	.table >>> .tbody d:hgrid bgc:clear @hover:teal6/50 cursor:pointer
	css .mdlogin bgc:gray6/80 c:gray2 w:40% h:100 pos:absolute t:40% l:50% x:-50% y:-50% rd:xl o:0 tween:all 500ms ease visibility:hidden
	css .table >>> .table-active c:gray3
	squaresdata
	prop data
	prop jihua1
	prop jihua2
	prop islogin
	showlogin = no
	prop islogined
	prop isadminClick
	prop tpname
	prop ws
	prop x
	prop y
	prop tpxydata = []
	prop isdataload = no
	prop jhsendflag = no
	
	def renderTable tada
		let result = ''
		# console.log tabledata
		tada.forEach do(c)
			result += `<tr class="tbody">
			<td> {c.sn}
			<td> {c.Az}
			<td> {c.El}
			`
		console.log result
		let table = querySelector('#servoplist tbody')
		table.innerHTML = result if result
		table.innerHTML = '数据为空' if result === ''
		render!
		document.querySelectorAll('#servoplist tbody tr').forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				tablerowp(e))
	def renderSTable tada
		let result = ''
		tada.forEach do(c)
			result += `<tr class="tbody">
			<td> {c.sn}
			<td> {c.SatLon}
			<td> {c.Az}
			<td> {c.El}
			`
		let stable = querySelector('#servoslist tbody')
		stable.innerHTML = result if result
		stable.innerHTML = '数据为空' if result === ''
		render!
		document.querySelectorAll('#servoslist tbody tr').forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				tablerow(e))
		
	def renderjhTable tada
		let result = ''
		tada.forEach do(c)
			result += `<tr class="tbody">
			<td> {c.id}
			<td> {c.satlon}
			<td> {c.polar1}
			<td> {c.polar2}
			`
		let stable = querySelector('#jihualist tbody')
		stable.innerHTML = '数据为空' if result === ''
		stable.innerHTML = result if result
		render!
		document.querySelectorAll('#jihualist tbody tr').forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				tablerowjh(e))
		
	def listload url # 从数据库查询得到的信息
		# table = querySelector('#servoplist tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data1)
				# console.log data1
				# data1.foreach do(item,index)
				let tbdata = data1.filter do(item)
					item.antNo == data[antindex].AntNo

				console.log tbdata
				renderTable(tbdata)
		
	def slistload url # 从数据库查询得到的信息
		# stable = querySelector('#servoslist tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data1)
				# console.log data1
				let tbdata = data1.filter do(item)
					item.antNo == data[antindex].AntNo
				# console.log tbdata
				renderSTable(tbdata)

	def jhlistload url # 从数据库查询得到的信息
		# stable = querySelector('#jihualist tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data1)
				let tbdata = data1.filter do(item)
					item.antNo == data[antindex].AntNo
				renderjhTable(tbdata)


	# prop route
	def shutdowncmd
		let data = 
			AntennaNo : data[antindex].AntNo
			DevNo : data[antindex].Devices[0].DevNo
			Cmd : 'ShutDown'
			Params : null
		console.log data
		ws.send(JSON.stringify(data))
	def isadmin
		if islogin
			return yes

		else
			window.alert('请先登录！')
			showlogin = !showlogin
			return no


	def sendcmd item,val1,val2
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : data[antindex].AntNo
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item
					Params : {
						"{item}1" : val1
						"{item}2" : val2
					}
				console.log data
				ws.send(JSON.stringify(data))
			else if val1 && val2
				let data =
					AntennaNo : data[antindex]
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}1" : val1
						"{item.StName}2" : val2
					}
				console.log data
				ws.send(JSON.stringify(data))
	def auth
		let data =
			Cmd : 'Login'
			Params : {
				name : $uname.value
				pwd : $pass.value
			}
		console.log data
		ws.send(JSON.stringify(data))
		# uname = $uname.value
		# pass = $pass.value
		if $uname.value === 'admin' && $pass.value === '12345'
			islogin = yes
			showlogin = no
			islogined = yes

	def devctr index # 查看点击拓扑视图中 设备之后的顺序。
		ctrindex = index
		# 这里增加一个点击时候清空sider控件中的input框的命令
		$txctrl.clearinput! # 调用sider里面的一个方法来清空

	def tablerow event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		preAz = array[2]
		preEl = array[3]
		sendcmd('prepos',preAz,preEl)
	def tablerowp event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		preAz = array[1]
		preEl = array[2]
		sendcmd('prepos',preAz,preEl)

	def tablerowjh event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		jh1 = array[2]
		jh2 = array[3]
		sendcmd('prejihua',jh1,jh2)

	def gettpdata # 获取到拓扑图的详细数组数据
		axios.get('/savetuop')
			.then do(res)
				squaresdata = res.data
				isdataload = yes
				# 这里就可以把拓扑数据的xy值赋给 我们的方块数组。
				tpdata = squaresdata.filter do(item)
					item.antname === antrouted
				render!
	def getsatlistlon url
		axios.get(url)
			.then do(res)
				# console.log res.data
				let satlistlons = res.data.filter do(item)
					item.sat_no === antrouted
				satlistlon = satlistlons[0].sat_lon
				render!
	def checksatlon
		satlistlon = $txctrl.satlonvalue
	def anttpdata tpdata
		return tpdata.antname === data[antindex].AntNo

	def listloadsatlist url,thetb # 从数据库查询得到的选取的卫星数据库
		# console.log data[antindex].Devices[ctrindex].polarAxisNum
		# switch data[antindex].Devices[ctrindex].polarAxisNum
		# 	when 2
		# 		isjhshow3 = true
		# 	when 3
		# 		isjhshow4 = true
		# console.log thetb
		# table = querySelector("#{thetb} tbody")
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				# console.log data
				renderSatlistTable(data,thetb)

	def renderSatlistTable tada,tb
		let result = ''
		# console.log tabledata
		# console.log tr[0]
		tada.forEach do(c)
			# console.log c.AntNo
			if c.AntNo === data[antindex].AntNo
				result += `<tr class="tbody">
				<td> {c.SatNo} 
				<td> {c.SatName}
				<td> {c.Az}
				<td> {c.El}
				<td> {c.SatLon}
				<td> {c.Polar1Pos}
				<td> {c.Polar2Pos}
				<td> {c.Polar3Pos}
				<td> {c.Polar4Pos}
				`
		# console.log table
		let table = querySelector("#{tb} tbody")
		table.innerHTML = result if result
		# console.log table
		table.innerHTML = '数据为空' if result === ''
		render!
		let activeCol = querySelectorAll("#{tb} tbody tr")[0]
		activeCol.classList.add('table-active')
		document.querySelectorAll("#{tb} tbody tr").forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				getlistno(e))

	def getlistno event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		satlistno = array[0]
		satlistaz = array[2]
		satlistel = array[3]
		satlistlon = array[4]
		satlistjh1 = array[5]
		satlistjh2 = array[6]
		satlistjh3 = array[7]
		satlistjh4 = array[8]
		render!

	def sendpara_multi item,value1,value2
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item
					Params : {
						"{item}1" : value1
						"{item}2" : value2
					}
				console.log data
				ws.send(JSON.stringify(data))
			else if value1 && value2
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}1" : value1
						"{item.StName}2" : value2
					}
				console.log data
				ws.send(JSON.stringify(data))

	def sendpara_multi3 item,value1,value2,value3
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item
					Params : {
						"{item}1" : value1
						"{item}2" : value2
						"{item}3" : value3
					}
				console.log data
				ws.send(JSON.stringify(data))
			else if value1 && value2 && value3
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}1" : value1
						"{item.StName}2" : value2
						"{item.StName}3" : value3
					}
				console.log data
				ws.send(JSON.stringify(data))


	def mount

		# let jsobj = 
		
		# listload('/servoplist') # 查询伺服位置列表
		# slistload('/servoslist') # 查询伺服卫星列表
		getsatlistlon('/getsatlistlon') # 查询伺服卫星列表
		jhlistload('/jihualist')
		let tblist = 'satlistinfoMain'
		listloadsatlist('/satlistinfo',tblist) # 查询卫星经度保存数据库列表
		
		for item,i in data[antindex].Devices
			tpxydata[i] = xydata
		gettpdata!
		# console.log data[antindex].Devices[ctrindex].DevNo
		# switch data[antindex].Devices[ctrindex].polarAxisNum
		# 	when 1
		# 		isjhshow2 = true
		# 	when 2
		# 		isjhshow3 = true
		# 	when 3
		# 		isjhshow4 = true
		# console.log '数据库mount 加载
	def sendpara item,itemvalue
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item
					Params : {
						"{item}" : itemvalue
					}
				
				console.log data
				ws.send(JSON.stringify(data))
			else if itemvalue
				let data =
					AntennaNo : route.params.id
					DevNo : data[antindex].Devices[ctrindex].DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}" : itemvalue
					}
				console.log data
				ws.send(JSON.stringify(data))


	def tpcontent data
		tpname = data.StatusList[0].StName
		tpvalue = data.StatusList[0].Value
		imba.commit!
	def routed params,state
		antrouted = params.id
		for item,index in data
			if item.AntNo == params.id
				antindex = index
				mount!
	def addnewdata
		if isadmin!
			let data = 
				AntennaNo : route.params.id
				cmd: 'addnewdata'
				satname: $satname.value
				sataz: $sataz.value
				satel: $satel.value
				satlon: $satlon.value
				satjh1: $satjh1.value
				satjh2: $satjh2.value
				satjh3: $satjh3.value
				satjh4: $satjh4.value
			console.log data
			ws.send(JSON.stringify(data))

		
	def sendpara_update cmd
		if isadmin!
			if jhsendflag
				let data = 
					AntennaNo : route.params.id
					cmd: cmd
					satno: $satlistno.value
					sataz: $satlistaz.value
					satel: $satlistel.value
					satlon: $satlistlon.value
					satjh1: $satlistjh1.value
					satjh2: $satlistjh2.value
					satjh3: $satlistjh3.value
					satjh4: $satlistjh4.value
				console.log data
				ws.send(JSON.stringify(data))
			else
				let data = 
					AntennaNo : route.params.id
					cmd: cmd
					satno: $satlistno.value
					sataz: $satlistaz.value
					satel: $satlistel.value
					satlon: $satlistlon.value
					# satjh1: $satlistjh1.value
					# satjh2: $satlistjh2.value
					# satjh3: $satlistjh3.value
					# satjh4: $satlistjh4.value
				console.log data
				ws.send(JSON.stringify(data))

	def send_custom_satlon lon
		if isadmin!
			let data = 
				AntennaNo : route.params.id
				DevNo: data[antindex].Devices[ctrindex].DevNo
				cmd: 'addsatlondata'
				satlon: lon
			console.log data
			ws.send(JSON.stringify(data))

	def render()
		checksatlon!
		# console.log 'render一哈'
		tpbox = querySelector('#tpframe') # 获取拓扑图的画布的宽度
		tpelement = querySelectorAll('.tuop-chart')
		# console.log data[antindex].Devices[0].StatusList[0].params.Polar1Name
		
		if tpelement.length > 0 && isdataload
			tpelement.forEach do(it$satnamei)
				if tpdata[i]
					let xydata = {
						x:"{tpdata[i].x + (tpdata[i].width - item.clientWidth)/2}px"
						y:"{(tpdata[i].y - i*(item.clientHeight)) + (tpdata[i].height - item.clientHeight)/2}px"
					}
					tpxydata[i] = xydata

		ctrindex ??= 0
		if ctrindex > (data[antindex].Devices.length - 1) # 当通过路由参数进来的index大于所有列表的长度，就重新赋值0
			ctrindex = 0
		# islogined = $txctrl.islogined
		if data[antindex].Devices[ctrindex].DevName === '伺服器'
			isServo = yes
			# listload('/servoplist') # 查询伺服位置列表
			# slistload('/servoslist') # 查询伺服卫星列表
		else 
			isServo = no
		if data[antindex].Devices[ctrindex].DevName === '极化控制器'
			isJh = yes
			# jhlistload('/jihualist')
		else
			isJh = no
		# 默认是第一个伺服，如果有点击按钮，就用被点击的设备的序号。
		# console.log "天线视图刷新"
		<self>
			<div[d:hflex w:100% h:100% g:5px]>
				<div[pos:relative w:70% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)]>
					<div.txbody>
						<div.btitle>
							<div[ta:center]> "{data[antindex].AntName}:设备拓扑图"
						<div[pos:absolute b:1 l:1 p:5px 15px w:100%] [visibility:hidden]=!isServo> 
							<div[d:hflex a:center j:left g:5 pb:2]>
								<button.btn.btn-success.btn-sm data-bs-toggle="modal" data-bs-target="#addsatnew"> '新增'
								<div> '伺服位置及卫星列表数据'
							<div[d:hflex ai:center]>
								<table[bd:solid 1px gray5 ta:center w:85%].table.table-hover#satlistinfoMain>
									<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
										<tr>
											<th scope="col"> '编号'
											<th scope="col"> '卫星名称'
											<th scope="col"> '方位'
											<th scope="col"> '俯仰'
											<th scope="col"> '卫星经度'
											<th scope="col"> jihua1
											<th scope="col" > '极化方式'
											<th scope="col" > jihua2
											<th scope="col" > '极化4'
									<tbody[d:block c:gray3 r:rgb(64,73,91) h:35 ofy:auto]>
										<tr> <td colSpan="5"> <i> 'Loading...'
								<div>
									<div[d:flex]>
										<div[ml:auto].form-check.form-switch>
											<input.form-check-input type="checkbox" role="switch" value=jhsendflag id="flexSwitchCheckDefault" @change=(jhsendflag=!jhsendflag)>
											<span> '极化置位开关'
									<div[p:1 d:hflex ja:center g:3]>
										<span[ml:3]> '方位俯仰:'
										<input$satlistaz[h:7 w:20% fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistaz value=1234>
										<input$satlistel[h:7 w:20% fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistel value=1234>
										<button.btn.btn-success.btn-sm[ml:auto] @click=sendpara_update('sat_cmd_set')> '置位' 
										<button.btn.btn-success.btn-sm[mr:3] @click=sendpara_update('sat_cmd_update')> '修改' 
									<div[p:1 d:hflex ja:center g:3]>
										<span[ml:3]> '删除编号：'
										<input$satlistno[h:7 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistno value=1234>
										<button.btn.btn-success.btn-sm[ml:auto] @click=sendpara('delsatalistno',satlistno)> '删除' 
										<button.btn.btn-success.btn-sm[mr:3] @click=(mount!)> '刷新' 
									<div[p:1 d:grid gtc:1fr 1fr 1fr ja:center g:3]>
										<div[d:flex ja:center]>
											<span[ml:3]> '卫星精度:'
											<input$satlistlon[h:7 w:14 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number' bind=satlistlon>
										<div[d:flex ja:center]>
											<span[ml:3]> jihua1+':'
											<input$satlistjh1[h:7 w:14 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistjh1>

										<div[d:flex ja:center]>
											<span[ml:3]> '极化2:'
											<input$satlistjh2[h:7 w:14 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistjh2>

										<div[d:flex ja:center]>
											<span[ml:3]> jihua2+':'
											<input$satlistjh3[h:7 w:14 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistjh3>

										<div[d:flex ja:center]>
											<span[ml:3]> '极化4:'
											<input$satlistjh4[h:7 w:14 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistjh4>
							<div.modal.fade[$bs-modal-bg:gray7/90]#addsatnew tabindex='-1' aria-hidden='true'> 'test'
								<div.modal-dialog>
									<div.modal-content>
										<div.modal-header>
											<h5.modal-title> '新增数据'
											<button.btn-close data-bs-dismiss='modal' aria-lable='Close'>

										<div.modal-content>
											<div[p:1 d:grid gtc:1fr 1fr 1fr ja:center g:3]>
												<div[d:flex ja:center]>
													<span[ml:3]> '名称:'
													<input$satname[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string'>
												<div[d:flex ja:center]>
													<span[ml:3]> '方位:'
													<input$sataz[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>
												<div[d:flex ja:center]>
													<span[ml:3]> '俯仰:'
													<input$satel[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>
												<div[d:flex ja:center]>
													<span[ml:3]> '卫星精度:'
													<input$satlon[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>
												<div[d:flex ja:center]>
													<span[ml:3]> '极化1:'
													<input$satjh1[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>

												<div[d:flex ja:center]>
													<span[ml:3]> '极化2:'
													<input$satjh2[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>

												<div[d:flex ja:center]>
													<span[ml:3]> '极化3:'
													<input$satjh3[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>

												<div[d:flex ja:center]>
													<span[ml:3]> '极化4:'
													<input$satjh4[h:7 w:15 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number'>
											<div[p:1 d:grid gtc:1fr 1fr ja:center g:3]>
												<button.btn.btn-danger.btn-sm data-bs-dismiss='modal' aria-lable='Close'> '取消'
												<button.btn.btn-success.btn-sm @click=addnewdata> '确认'



						# <div[pos:absolute b:1 r:1 p:5px 15px w:100] [visibility:hidden]=!isServo> 
						# 	<div[d:hflex a:center j:left g:5 pb:2]>
						# 		<button.btn.btn-success.btn-sm @click=mount!> '刷新'
						# 		<div> '伺服卫星数据'
						# 	<table[bd:solid 1px gray5 ta:center].table#servoslist>
						# 		<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
						# 			<tr>
						# 				<th scope="col"> '序号'
						# 				<th scope="col"> '经度'
						# 				<th scope="col"> '方位'
						# 				<th scope="col"> '俯仰'
						# 		<tbody[d:block c:gray4 border-color:rgb(64,73,91) h:35 ofy:auto]>
						# 			<tr> <td colSpan="4"> <i> 'Loading...'
						<div[pos:absolute b:1 l:1 p:5px 15px w:150] [visibility:hidden]=!isJh> 
							<div[d:hflex a:center j:left g:5 pb:2]>
								<button.btn.btn-success.btn-sm @click=addnewdata data-bs-toggle="modal" data-bs-target="#addsatnew"> '新增数据'
								<div> '极化卫星及位置数据'
							<table[bd:solid 1px gray5 ta:center].table#jihualist>
								<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
									<tr>
										<th scope="col"> '序号'
										<th scope="col"> '经度'
										<th scope="col"> '极化1'
										<th scope="col"> '极化2'
								<tbody[d:block c:gray4 border-color:rgb(64,73,91) h:35 ofy:auto]>
									<tr> <td colSpan="4"> <i> 'Loading...'

						<div.tuop>
							<div[d:vflex a:center h:30%] [h:auto]=(data[antindex].Devices.length===1)>
								<div[d:hflex w:70% ja:center]>
									<div[fs:medium c:white bgc:teal6/60 p:0 2 rd:4 4 0 0 w:40 ta:center mr:auto]> data[antindex].Devices[ctrindex].DevName
									<div[fs:medium c:white bgc:teal6/60 p:0 2 rd:4 4 0 0 w:40 ta:center mr:auto]> '卫星经度：'
										<input[h:7 w:12 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' placeholder='可修改' bind=satlistlon @change=send_custom_satlon(this.value)>
									<div[fs:medium c:white bgc:teal6/60 p:0 2 rd:4 4 0 0 w:30 ta:center] [visibility:hidden]=!isServo> data[antindex].Devices[ctrindex].TrackStatus # 显示伺服器是否在跟踪状态。
								<div[pos:relative p:2 w:70% c:gray3 bgc:teal8/40 bd:solid 1px teal4 rd:5px d:grid gtc:1fr 1fr 1fr ofy:auto]> for item,index in data[antindex].Devices[ctrindex].StatusList # 就tm多了一个操作，连通性就断掉了。
									# if index < 5 # 这里控制显示的参数数量，5个重要信息。
									<div[p:1 fs:small]> item.StName+ ':'
										<div[d:inline fs:large c:teal4 fw:bold ff:monospace pl:2]> item.Value
							<tpframe$tpframe[pos:absolute t:100 l:0 w:100% h:45%]#tpframe display=(!isadminClick) tpelement=tpbox squares=squaresdata antno=data[antindex].AntNo>
							<div[d:flex j:center pos:relative]>
								<div[mr:auto p:2 pos:absolute t:-10 l:2] [d:none]=!islogin>
									if isadminClick
										<button.btn.btn-primary.btn-sm @click=(isadminClick = !isadminClick)> '关闭编辑'
									else
										<button.btn.btn-success.btn-sm @click=(isadminClick = !isadminClick)> '打开编辑'
								<div[h:0 pos:absolute t:0 l:0]> for item,i in data[antindex].Devices
									if item.StatusList[item.StatusList.length - 1].Value === 'Disconnected' && isdataload
										<button[x:{tpxydata[i].x} y:{tpxydata[i].y} bgc:{devcolor[2]} c:gray2 w:auto].tuop-chart  @click=devctr(i) > item.DevName
											<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
												if n < 5
													<div[d:hflex ja:left a:center ml:3]>
														<div[fs:12px mr:2]> tpitem.StName+':'
														<div[c:teal4 fs:16px fw:bold]> tpitem.Value
									if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length === 0 && isdataload
										<button[x:{tpxydata[i].x} y:{tpxydata[i].y} bgc:{devcolor[0]} c:gray2 w:auto].tuop-chart  @click=devctr(i)> item.DevName
											<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
												if n < 5
													<div[d:hflex ja:left a:center ml:3]>
														<div[fs:12px mr:2]> tpitem.StName+':'
														<div[c:teal4 fs:16px fw:bold]> tpitem.Value
									if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length !== 0 && isdataload
										<button[x:{tpxydata[i].x} y:{tpxydata[i].y} bgc:{devcolor[1]} c:gray2 w:auto].tuop-chart  @click=devctr(i)> item.DevName
											<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
												if n < 5
													<div[d:hflex ja:left a:center ml:3]>
														<div[fs:12px mr:2]> tpitem.StName+':'
														<div[c:teal4 fs:16px fw:bold]> tpitem.Value

								
							<div[bd:solid 1px teal7 bgc:transparent p:3 m:3 d:vflex g:5px w:20 pos:absolute t:-30px l:0]>
								<div> '图例'
								<div[d:hflex ai:center j:left]>
									<div[w:5 h:5 bgc:{devcolor[0]} rd:3px]>
									<div[fs:12px ml:auto]> '在线'
								<div[d:hflex ai:center j:left]>
									<div[w:5 h:5 bgc:{devcolor[1]} rd:3px]>
									<div[fs:12px ml:auto]> '告警'
								<div[d:hflex ai:center j:left]>
									<div[w:5 h:5 bgc:{devcolor[2]} rd:3px]>
									<div[fs:12px ml:auto]> '离线'
							<button[d:flex ja:center w:100px h:30px pos:absolute t:-8 r:1rem bgc:red6 @hover:red7 c:#fff outline:none rd:5px cursor:pointer bd:none box-shadow:0 0 15px 5px red5 @hover:0 0 10px 2px red5].tpbtn type='button' data-bs-toggle='tooltip' data-bs-placement='top' title='关闭伺服电源' @click=shutdowncmd>
								<img[scale:.7] src='./imgs/btn-stop.png'>
								<span[fs:12px]> '伺服去电'
						# <div[m:0 p:0 5 c:gray4]> '伺服卫星数据'
				<div[w:30% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)]>
					<ctrsider$txctrl data=data[antindex].Devices[ctrindex] ws=ws ant=route.params.id islogin=islogin jihua1=jihua1 jihua2=jihua2>
				<global @click.outside=(showlogin=no)>
				<div[d:vflex ja:center g:5].mdlogin [o:1 visibility:visible]=showlogin>
					<div>
						<span> '用户名:'
						<input$uname[ml:3]#userinput type='string' placeholder='输入...'>
					<div>
						<span> '密码:'
						<input$pass[ml:7] type='password' placeholder='输入...'>
					<div>
						<button[mr:4].btn.btn-danger @click=(showlogin=no) @hotkey('esc')=(showlogin=no)> '取消'
						<button.btn.btn-success @click=auth @hotkey('enter')> '确认'


