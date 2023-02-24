let satlistno
let satlistaz
let satlistel
tag ctrsider
	css .sdtitle c:rgb(31,219,220) fw:bold p:10px bdb:solid 1px rgb(31,219,220)
	css	.sdstatus d:hflex p:5px c:gray3 fs:14px
		.status-title-left w:50% ta:left
		.status-title-right w:50% ta:right
	css	.status-value mr:1rem pr:1 c:rgb(23,168,62)
	css	.accordion --bs-accordion-bg:transparent bd:none --bs-accordion-border-width:0px
		.triangle-right w:0 h:0 bdt:5px solid transparent bdl:10px solid gray3 bdb:5px solid transparent
		.triangle-down w:0 h:0 bdt:10px solid gray3 bdl:5px solid transparent bdr:5px solid transparent
	css input color-scheme:dark	
	css table tr d:hgrid
	css	.table >>> .tbody d:hgrid bgc:gray7/20 @hover:teal6/50 cursor:pointer fs:sm
	css	.table-active >>> .tobdy c:red4

	css .mdlogin bgc:gray6/80 c:gray2 w:40% h:100 pos:absolute t:40% l:50% x:-50% y:-50% rd:xl o:0 tween:all 500ms ease visibility:hidden
	prop ws
	prop data
	showlogin = no # 是否显示登录框
	# prop inputvalue
	# make a new date with east 8 timezone offset
	prop today = new Date(Date.now() + 8 * 60 * 60 * 1000).toISOString().substring(0,16)
	prop tomorow = new Date(Date.now() + 32 * 60 * 60 * 1000).toISOString().substring(0,16)

	# prop today = new Date().toISOString().substring(0,16) + 
	prop ant
	prop islogin
	prop islogined
	prop isCctrl
	def auth
		console.log $uname.value
		console.log $pass.value
		if $uname.value === 'admin' && $pass.value === '12345'
			console.log '密码正确'
			islogin = yes
			showlogin = no
			islogined = yes
		let data =
			Cmd : 'Login'
			Params : {
				name : $uname.value
				pwd : $pass.value
			}
		console.log data
		ws.send(JSON.stringify(data))

		# 	return yes
		# else
		# 	window.alert('用户名密码不正确')
		# 	return no

	def isadmin
		# console.log islogin
		if islogin
			return yes

		else
			window.alert('请先登录！')
			showlogin = !showlogin
			setFocus!
			return no

	def sendremote
		let data = 
			AntennaNo : ant
			DevNo : data.DevNo
			Cmd : "Remote"
			Params : {
				Remote: ($remote.checked ? 'ON' : 'OFF')
			}
		console.log data
		ws.send(JSON.stringify(data))
	def sendpara item,itemvalue
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item
					Params : {
						"{item}" : itemvalue
					}
				
				console.log data
				ws.send(JSON.stringify(data))
			else if itemvalue
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}" : itemvalue
					}
				console.log data
				ws.send(JSON.stringify(data))
	def sendpara_multi item,value1,value2
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item
					Params : {
						"{item}1" : value1
						"{item}2" : value2
					}
				console.log data
				ws.send(JSON.stringify(data))
			else if value1 && value2
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
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
					AntennaNo : ant
					DevNo : data.DevNo
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
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}1" : value1
						"{item.StName}2" : value2
						"{item.StName}3" : value3
					}
				console.log data
				ws.send(JSON.stringify(data))

	def sendpara_multi4 item,value1,value2,value3,value4
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object'
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item
					Params : {
						"{item}1" : value1
						"{item}2" : value2
						"{item}3" : value3
						"{item}4" : value4
					}
				console.log data
				ws.send(JSON.stringify(data))
			else if value1 && value2 && value3 && value4
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item.StName
					Params : {
						"{item.StName}1" : value1
						"{item.StName}2" : value2
						"{item.StName}3" : value3
						"{item.StName}4" : value4
					}
				console.log data
				ws.send(JSON.stringify(data))

	def sendCalpara item,val_xl,val_start,val_stop,val_inter
		# todo = 这里要增加一个发指令前的用户权限判断-可以是个函数 应该是个bool函数 ：isadmin
		# 1- 弹出一个用户名密码的窗口弹窗，输入值，不管对不对先发送给
		if isadmin!
			console.log typeof(item)
			if typeof(item) !== 'object' && val_xl && val_start && val_stop && val_inter
				let data =
					AntennaNo : ant
					DevNo : data.DevNo
					Cmd : item
					Params : {
						"{item}1" : val_xl
						"{item}2" : val_start
						"{item}3" : val_stop
						"{item}4" : val_inter
					}
				console.log data
				ws.send(JSON.stringify(data))
			else
				window.alert('输入参数不完整！')

	def colapse
	def remotestatus list
		# console.log '检查远控状态'
		for item in list
			if item.StName == '控制'
				if item.Value is '本控'
					$remote.checked = no
				else
					$remote.checked = yes

	def cmdbyDevice
		# 用来判断是针对某一个设备来制定的命令下发。可以针对不用的设备来触发。
		if data.DevName == '伺服器' # todo-后面部署时 应该把判断依据改成设备编号，保持一致性。
			isServo = no
		else 
			isServo = yes
		
		if data.DevName == '极化控制器'
			isJh = no
		else
			isJh = yes
		
		if data.DevName == "空调控制器"
			isAirctr = no
		else
			isAirctr = yes

		if data.DriverClass == "JWLNAPower"
			isLNAlimits = no
		else
			isLNAlimits = yes
		
		if data.DriverClass == 'TH2152C01'
			isOptical = no
		else
			isOptical = yes

		iscetc39 = (data.DriverClass == 'cetc39') ? yes : no # 39所老私服
		iscetc54 = (data.DriverClass == 'cetc54') ? yes : no # 54所伺服
		isServoAcu2010 = (data.DriverClass == 'ServoAcu2010') ? yes : no # 39所小型伺服
		isServoCetc39 = (data.DriverClass == 'ServoCetc39') ? yes : no # 39所新伺服

		# 根据servo状态中有无极化角度来判断是否显示极化控制按钮
		# for item in data.StatusList
		# 	if item.StName == 'C极化角度'
		# 		isCctrl = yes
		# console.log isCctrl

	def listload url # 从数据库查询得到的信息
		table = querySelector('#servoTracklist tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				# console.log data
				renderTable(data,table)
	def sbsent event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		satno = array[0]
		# jh2 = array[3]
		sendpara('satNo',satno)

	def listloadsatbase url,thetb # 从数据库查询得到的所有卫星数据库
		# console.log thetb
		# table = querySelector("#{thetb} tbody")
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				# console.log data
				renderSatbaseTable(data,thetb)
	def listloadsatlist url,thetb # 从数据库查询得到的选取的卫星数据库
		# console.log thetb
		# table = querySelector("#{thetb} tbody")
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				# console.log data
				renderSatlistTable(data,thetb)
	
	def renderTable tada,table
		let result = ''
		# console.log tabledata
		# console.log tr[0]
		tada.forEach do(c)
			let dateObj = new Date(c.time)
			result += `<tr class="tbody">
			<td> {dateObj.toLocaleString()}
			<td> {c.az}
			<td> {c.el}
			`
		# console.log table
		# let table = querySelector('#servoTracklist tbody')
		table.innerHTML = result if result
		table.innerHTML = '数据为空' if result === ''
		render!
		let activeCol = querySelectorAll('#servoTracklist tbody tr')[0]
		activeCol.classList.add('table-active')
	def getlistno event
		let array = event.currentTarget.innerText.split(/\r?\n/) # 采集获取的行内的所有数据。
		satlistno = array[0]
		satlistaz = array[2]
		satlistel = array[3]
		render!
		# console.log satlistno
		# jh2 = array[3]

		# sendpara('satNo',satno)

	def renderSatbaseTable tada,tb
		let result = ''
		# console.log tabledata
		# console.log tr[0]
		tada.forEach do(c)
			result += `<tr class="tbody">
			<td> {c.SatNo} 
			<td> {c.SatName}
			<td> {c.SatLon}
			`
		# console.log table
		let table = querySelector("#{tb} tbody")

		table.innerHTML = result if result
		table.innerHTML = '数据为空' if result === ''
		render!
		let activeCol = querySelectorAll("#{tb} tbody tr")[0]
		activeCol.classList.add('table-active')
		document.querySelectorAll("#{tb} tbody tr").forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				sbsent(e))
	
	def renderSatlistTable tada,tb
		let result = ''
		# console.log tabledata
		# console.log tr[0]
		tada.forEach do(c)
			result += `<tr class="tbody">
			<td> {c.SatNo} 
			<td> {c.SatName}
			<td> {c.Az}
			<td> {c.El}
			`
		# console.log table
		let table = querySelector("#{tb} tbody")
		table.innerHTML = result if result
		table.innerHTML = '数据为空' if result === ''
		render!
		let activeCol = querySelectorAll("#{tb} tbody tr")[0]
		activeCol.classList.add('table-active')
		document.querySelectorAll("#{tb} tbody tr").forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',do(e)
				getlistno(e))

	def listloadhis url # 从数据库查询得到的信息
		# table = querySelector('#servoplist tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				# console.log data
				renderTablehis(data)
	
	def renderTablehis tada
		let result = ''
		# console.log tabledata
		tada.forEach do(c)
			let dateObj = new Date(c.time)
			result += `<tr class="tbody">
			<td> {dateObj.toLocaleString()}
			<td> {c.az}
			<td> {c.el}
			`
		let table = querySelector('#servoTracklistHis tbody')
		# console.log table
		
		table.innerHTML = result if result

		table.innerHTML = '数据为空' if result === ''
		render!
		
		let activeCol = querySelectorAll('#servoTracklistHis tbody tr')[0]
		activeCol.classList.add('table-active')

		# console.log querySelectorAll('#servoTracklist tbody tr')[0]

	def setFocus
		test = document.getElementById('#userinput')
		console.log test
	def clearinput # 清除上一个设备残留的数值
		# console.log 'input clear'
		querySelectorAll('.status_cmd').forEach(do(item)
			item.value = ''
			)

	def mount
		# console.log 'mount哟哟'
		listload('/tracklist') # 查询二行星历列表
		let thetab = 'satbaselist'
		let tblist = 'satlistinfo'
		# let thetr = ['SatNo','SatName','SatLon']
		listloadsatbase('/satbaselist',thetab) # 查询卫星经度原始数据库列表
		listloadsatlist('/satlistinfo',tblist) # 查询卫星经度保存数据库列表
		listloadhis('/tracklisthis') # 记忆跟踪列表查询
	

	def render()

		cmdbyDevice!
		# console.log today
		remotestatus(data.StatusList) # 显示远控的状态
		<self> 
			<div>
				<div.sdtitle> "设备控制"
					<div[d:inline float:right].form-check.form-switch>
						<input$remote.form-check-input type="checkbox" role="switch" id="flexSwitchCheckDefault" @change=sendremote>
					if $remote.checked == no
						<div[c:gray3 fs:14px d:inline float:right mr:3]> '远控关闭'
					else 
						<div[c:gray3 fs:14px d:inline float:right mr:3]> '远控开启'


				<div.accordion id='ctl'>
					<div.accordion-item>
						<h6.accordion-header id='headingOne'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center ].accordion-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-control='collapseOne'>
								<div[w:90%]> data.DevName+'参数控制' # 变量
						<div.accordion-collapse.collapse.show id='collapseOne' aria-labelledby='headingOne' data-bs-parent='#ctl'>
							<div[m:0 p:5px d:vflex ai:left max-height:60 ofy:auto].accordion-body> for ctritem,stindex in data.StatusList
								if ctritem.ReadOnly == no && ctritem.StName !== '控制' && !ctritem.cmdSelect
									<div[d:hflex ai:center p:1 2]>
										<div[fs:14px c:gray3 ml:3]>  ctritem.StName+':' # 变量
										<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto].status_cmd placeholder=ctritem.Value name="{ctritem.StName}-{stindex}" type='number' min=ctritem.Min max=ctritem.Max step=ctritem.Step @change=sendpara(ctritem,this.value)>
										
										# <input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto].status_cmd placeholder=ctritem.Value name="{ctritem.StName}-{stindex}" @change=sendpara(ctritem,this.value) type='number' min=ctritem.Min max=ctritem.Max step=ctritem.Step @hotkey('enter')=sendpara(ctritem,this.value) >
								if ctritem.cmdSelect
									<div[d:hflex ai:center p:1 2]>
										<div[fs:14px c:gray3 ml:3]>  ctritem.StName+':' # 变量
										<select[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] @change=sendpara(ctritem,this.value) focus=>
											for sel in ctritem.cmdSelect
												if ctritem.Value === sel.option
													<option selected> sel.option
												else
													<option> sel.option
									
					<div.accordion-item[]>
						<h6.accordion-header id='headingTwo'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordion-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseTwo' aria-expanded='true' aria-control='collapseTwo'>
								<div[w:90%]> '指令控制'
						<div[max-height:150 ofy:auto].accordion-collapse.collapse.show id='collapseTwo' aria-labelledby='headingTwo' data-bs-parent='#ctl'>
							# ========伺服指令================================

							<div[d:hflex] [d:none]=isServoAcu2010>
								<div[d:vflex ja:center mt:2 w:50%] [d:none]=isServo>
									<div[mb:2]>
										<button[bgc:teal4 rd:full w:10 h:10 shadow:clear bd:none] @click=sendpara('manuservo_up',$manuspeed.value)> "上"
									<div[d:hflex ja:center g:2]>
										<button[bgc:teal4 rd:full w:10 h:10 shadow:clear bd:none] @click=sendpara('manuservo_cc',$manuspeed.value)> "逆"
										<button[bgc:teal4 rd:full w:10 h:10 shadow:clear bd:none] @click=sendpara('manuservo_stop')> "停"
										<button[bgc:teal4 rd:full w:10 h:10 shadow:clear bd:none] @click=sendpara('manuservo_c',$manuspeed.value)> "顺"
									<div[mt:2]>
										<button[bgc:teal4 rd:full w:10 h:10 shadow:clear bd:none] @click=sendpara('manuservo_down',$manuspeed.value)> "下"

								<div[d:vflex g:3 mt:2 p:5 w:50%] [d:none]=isServo>
									<div[m:0 p:5px d:hflex ja:center]> # 这里的指令下发是针对伺服设备来定制的
										<div[fs:14px c:gray3]> '手动速度：'
										<input$manuspeed[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] type='number' value=0.1 step=0.01 max=1 min=0>
									<div[m:0 p:5px d:hflex ja:center]> # 这里的指令下发是针对伺服设备来定制的
										<div[fs:14px c:gray3]> '驱动上电:'
										<button[ml:auto].btn.btn-success.btn-sm @click=sendpara('EnableDriver',null)> "上电"
									<div[m:0 p:5px d:hflex ja:center]> # 这里的指令下发是针对伺服设备来定制的
										<div[fs:14px c:gray3]> '驱动下电:'
										<button[ml:auto].btn.btn-success.btn-sm @click=sendpara('DisableDriver',null)> "下电"
							for item in data.StatusList
								if item.StName == 'C极化角度'
									<div[m:0 p:5px ja:center d:hflex]>
										<div[fs:14px c:gray3 ml:3]> 'C极化控制：'
										<button[ml:auto mr:4 ].btn.btn-success.btn-sm @click=sendpara('CjhCtrl_anticlock','')> "逆"
										<button[mr:4].btn.btn-success.btn-sm @click=sendpara('CjhCtrl_stop','')> "停"
										<button[mr:4].btn.btn-success.btn-sm @click=sendpara('CjhCtrl_clock','')> "顺"
								if item.StName == 'Ku极化角度'
									<div[m:0 p:5px d:hflex ja:center]>
										<div[fs:14px c:gray3 ml:3]> 'Ku极化控制：'
										<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('KujhCtrl_anticlock','')> "逆"
										<button[mr:4].btn.btn-success.btn-sm @click=sendpara('KujhCtrl_stop','')> "停"
										<button[mr:4].btn.btn-success.btn-sm @click=sendpara('KujhCtrl_clock','')> "顺"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '卫星数据库:'
								<button[ml:auto mr:2].btn.btn-success.btn-sm data-bs-toggle="modal" data-bs-target="#satbase"> "读取"
								<button[mr:4].btn.btn-success.btn-sm data-bs-toggle="modal" data-bs-target="#satlist"> "编辑"
							<div.modal.fade[$bs-modal-bg:gray4/90]#satbase tabindex='-1' aria-hidden='true'> 'test'
								<div.modal-dialog>
									<div.modal-content>
										<div.modal-header>
											<h5> '卫星经度数据库'
											<button.btn-close data-bs-dismiss='modal' aria-lable='Close'>
										<table[bd:solid 1px gray5 ta:center].table.table-hover.table-sm.table-dark#satbaselist>
											<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
												<tr>
													<th scope="col"> '编号'
													<th scope="col"> '名称'
													<th scope="col"> '经度'
											<tbody[d:block c:gray3 r:rgb(64,73,91) h:80 ofy:auto]>
												<tr> <td colSpan="3"> <i> 'Loading...'
							<div.modal.fade[$bs-modal-bg:gray4/90]#satlist tabindex='-1' aria-hidden='true'> 'test'
								<div.modal-dialog>
									<div.modal-content>
										<div.modal-header>
											<h5> '卫星列表-单击选中'
											<button.btn-close data-bs-dismiss='modal' aria-lable='Close'>
										<table[bd:solid 1px gray5 ta:center].table.table-hover.table-sm.table-dark#satlistinfo>
											<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
												<tr>
													<th scope="col"> '编号'
													<th scope="col"> '名称'
													<th scope="col"> '方位'
													<th scope="col"> '俯仰'
											<tbody[d:block c:gray3 r:rgb(64,73,91) h:80 ofy:auto]>
												<tr> <td colSpan="3"> <i> 'Loading...'
										<div[p:1 d:hflex ja:center g:3]>
											<span[ml:3]> '方位俯仰:'
											<input$satlistaz[h:7 w:20% fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistaz value=1234>
											<input$satlistel[h:7 w:20% fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistel value=1234>
											<button.btn.btn-success.btn-sm[ml:auto] @click=sendpara_multi('SetSatAZEL',satlistaz,satlistel)> '置位' 
											<button.btn.btn-success.btn-sm[mr:3] @click=sendpara_multi3('UpdateSatAZEL',$satlistaz.value,$satlistel.value,satlistno)> '修改' 
										<div[p:1 d:hflex ja:center g:3]>
											<span[ml:3]> '删除编号：'
											<input[h:7 fs:14px bgc:gray7/80 c:gray2 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='string' bind=satlistno value=1234>
											<button.btn.btn-success.btn-sm[ml:auto] @click=sendpara('delsatalistno',satlistno)> '删除' 
											<button.btn.btn-success.btn-sm[mr:3] @click=(mount!)> '刷新' 
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '方位收藏:'
								<select$azshoucang[h:7 fs:14px bgc:transparent c:gray4 w:45% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] >
									<option value='01'> '收藏'
									<option value='02'> '收藏停止'
									<option value='03'> '插锁'
									<option value='04'> '插锁停止'
									<option value='05'> '拔锁'
									<option value='06'> '拔锁停止'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('Azshoucang',$azshoucang.value)> "确定"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc54||iscetc39  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '俯仰收藏:'
								<select$elshoucang[h:7 fs:14px bgc:transparent c:gray4 w:45% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] >
									<option value='01'> '收藏'
									<option value='02' > '收藏停止'
									<option value='03'> '入锁'
									<option value='04'> '入锁停止'
									<option value='05'> '退锁'
									<option value='06'> '退锁停止'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('Elshoucang',$elshoucang.value)> "确定"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=isServoAcu2010||isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '俯仰收藏:'
								<select$elshoucang1[h:7 fs:14px bgc:transparent c:gray4 w:45% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] >
									<option value='0'> '自动收藏'
									<option value='1'> '入锁'
									<option value='2'> '退锁'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('Elshoucang',$elshoucang1.value)> "确定"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54 [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '步进跟踪步距:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0.001-1.000" @change=sendpara("SetTrackStep",this.value) type='number' step='0.001'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '跟踪门限:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0.00~9.99V" @change=sendpara("SetTrackMinLevel",this.value) type='number' step='0.01'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '跟踪间隔:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0~999.99min" @change=sendpara("SetTrackInterval",this.value) type='number' step='0.01'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39  [d:none]=iscetc54  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '跟踪失锁门限:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0.00~9.99V" @change=sendpara("SetTrackUnlockLevel",this.value) type='number' step='0.01'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo  [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '步进跟踪:'
								<input$steptrack[h:7 fs:14px bgc:transparent c:gray4 w:40% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0~99999.999MHz" @change=sendpara("SetTrackUnlockLevel",this.value) type='number' step='0.01'  [d:none]=iscetc39||isServoCetc39>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('StepTrack',$steptrack.value)> "跟踪"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo  [d:none]=iscetc39 [d:none]=isServoAcu2010||isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '单脉冲跟踪:'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('StepTrack','test')> "跟踪"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '预置卫星经度:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="0.00~200.00" @change=sendpara("SatLon",this.value) type='number' step='.01'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54 [d:none]=isServoAcu2010> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '自动搜索:'
								<input$azrange[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="方位/0.00" type='number' step='.01'>
								<input$elrange[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="俯仰/0.00" type='number' step='.01'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi('Search',$azrange.value,$elrange.value)> "搜索"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=isServoAcu2010||isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '自动搜索:'
								<input$azrange1[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="方位" type='number' step='.01'>
								<input$azstep[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="AZ步进" type='number' step='.01'>
								<input$elrange1[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="俯仰" type='number' step='.01'>
								<input$elstep[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="EL步进" type='number' step='.01'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi4('Search',$azrange1.value,$azstep.value,$elrange1.value,$elstep.value)> "搜索"
							# <div[m:0 p:5px d:hflex ja:center] [d:none]=isServo> # 这里的指令下发是针对伺服设备来定制的
							# 	<div[fs:14px c:gray3 ml:3]> '存储卫星:'
							# 	<input$satid[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~24" type='number' step='1'>
							# 	<input$satlon[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="经度-0.00" type='number' step='.01'>
							# 	<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi('StoreSat',$satid.value,$satlon.value)> "存储"
							# <div[m:0 p:5px d:hflex ja:center] [d:none]=isServo> # 这里的指令下发是针对伺服设备来定制的
							# 	<div[fs:14px c:gray3 ml:3]> '删除卫星:'
							# 	<input$satdel[h:7 fs:14px bgc:transparent c:gray4 w:35% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~24" type='number' step='1'>
							# 	<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('RemoveSat',$satdel.value)> "删除"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '存储位置:'
								<input$satposStore[h:7 fs:14px bgc:transparent c:gray4 w:35% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~24" type='number' step='1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('StorePos',$satposStore.value)> "存储"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '删除位置:'
								<input$posdel[h:7 fs:14px bgc:transparent c:gray4 w:35% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号" type='number' step='1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('RemovePos',$posdel.value)> "删除"
							# 以下为39所小伺服定制
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54||isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '跟踪：'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('ServoAcu2010Track')> "跟踪"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isServo [d:none]=iscetc39||iscetc54||isServoCetc39> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '待机：'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('ServoAcu2010Standby')> "待机"
							# ========伺服指令================================
						
							# ========极化控制指令================================
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '查询卫星表:'
								<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~24" @change=sendpara("QuerySatelliteTable",this.value) type='number' step='1'>
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '故障复位:'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('Reset','test')> "复位"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '手控:'
								<input$jhManId[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~6" type='number' step='1'>
								<select$jhManDir[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] >
									<option value='0'> '停止运动'
									<option value='1'> '顺时针/左旋'
									<option value='2'> '逆时针/右旋'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi('MenualControl',$jhManId.value,$jhManDir.value)> "手控"

							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对极化控制设备来定制的
								<div[fs:14px c:gray3 ml:3]> '预置位置:'
								<input$posId[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~6" type='number' step='1'>
								<input$posValue[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="位置/0.0" type='number' step='.1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi('PresetPos',$posId.value,$posValue.value)> "预置"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对极化控制设备来定制的
								<div[fs:14px c:gray3 ml:3]> '预置卫星经度:'
								<input$PresetSat[h:7 fs:14px bgc:transparent c:gray4 w:35% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="经度/0.0" type='number' step='.1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('PresetSat',$PresetSat.value)> "预置"

							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对极化控制设备来定制的
								<div[fs:14px c:gray3 ml:3]> '存储卫星:'
								<input$jhSatNo[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号0~23" type='number' step='1'>
								<input$jhSatLon[h:7 fs:14px bgc:transparent c:gray4 w:25% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="经度/0.0" type='number' step='.1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi('StoreSat',$jhSatNo.value,$jhSatLon.value)> "存储"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isJh> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '删除卫星:'
								<input$removesat[h:7 fs:14px bgc:transparent c:gray4 w:35% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="序号1~24" type='number' step='1'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('RemoveSat',$removesat.value)> "删除"
							# ========极化控制指令================================

							# ========跟踪接收机指令================================



							# ========跟踪接收机指令================================
							# ========跟踪接收机指令================================
							# ======== 光端机机指令 ================================
							<div[m:0 p:5px d:hflex ja:center mt:5] [d:none]=isOptical>
								<div[d:grid gtc:1fr 1fr ja:center g:5]> for item,id in data.StatusList
									if item.StName.slice(3,end) == '光功率' && data.DevName == '光发射'
										<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('模块'+(Math.floor(id/6)+1)+'-自动衰减补偿',Math.floor(id/6)+1)> '模块'+(Math.floor(id/6)+1)+'-自动衰减补偿'
									if item.StName.slice(3,end) == '光功率' && data.DevName == '光接收'
										<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('模块'+(Math.floor(id/4)+1)+'-自动衰减补偿',Math.floor(id/4)+1)> '模块'+(Math.floor(id/4)+1)+'-自动衰减补偿'

									


							# ========君威LNA电流上下限指令================================
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isLNAlimits> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '电流上下限:'
								<select$lnaTun[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto]>
									<option> '通道1'
									<option> '通道2'
									<option> '通道3'
									<option> '通道4'
									<option> '通道5'
									<option> '通道6'
								<input$lnamin[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] type='number' placeholder='下限'>
								<input$lnamax[h:7 fs:14px bgc:transparent c:gray4 w:15% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] type='number' placeholder='上限'>
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara_multi3('LNAlimits',$lnaTun.value,$lnamin.value,$lnamax.value)> "设置"
							# ========君威LNA电流上下限指令================================

							# ========温湿度传感指令================================
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isAirctr> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '制冷开:'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('coldOpen','true')> "制冷"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isAirctr> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '制热开:'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('hotOpen','true')> "制热"
							<div[m:0 p:5px d:hflex ja:center] [d:none]=isAirctr> # 这里的指令下发是针对伺服设备来定制的
								<div[fs:14px c:gray3 ml:3]> '空调关闭:'
								<button[ml:auto mr:4].btn.btn-success.btn-sm @click=sendpara('airctrClose','true')> "关闭"
							# ========温湿度传感指令================================
							# ========伺服指令================================
						
						
						<h6.accordion-header id='heading3' [d:none]=isServo>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordion-button type='button' data-bs-toggle='collapse' data-bs-target='#collapse3' aria-expanded='true' aria-control='collapse3'>
								<div[w:90%]> '程序跟踪'
						<div[max-height:100 ofy:auto].accordion-collapse.collapse.show id='collapse3' aria-labelledby='heading3' data-bs-parent='#ctl' [d:none]=isServo>
							<textarea$trackXL[w:90% h:14 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:2 3] placeholder='输入两行星历'>
							<div[m:0 p:5px d:hflex ja:center]> # 这里的指令下发是针对伺服设备来定制的
								<input$startTime[w:33% h:7 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='datetime-local' placeholder='开始日期' defaultValue=today>
								<input$stopTime[w:33% h:7 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='datetime-local' placeholder='结束日期' defaultValue=tomorow>
								<input$trackInterval[w:15% h:7 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='number' placeholder='间隔' step='1' value='1'>
								<span[c:gray3]> '秒/s'
							<div[d:hflex ja:center g:4]>
								<button[].btn.btn-success.btn-sm @click=sendCalpara('TrackCal',$trackXL.value,$startTime.value,$stopTime.value,$trackInterval.value)> "计算"
								<button[].btn.btn-success.btn-sm @click=sendpara('TrackStart',null)> "开始跟踪"
								<button[].btn.btn-success.btn-sm @click=sendpara('TrackStop',null)> "结束跟踪"
								<button.btn.btn-success.btn-sm @click=mount!> '刷新'
							<div[b:1 l:1 p:5px 15px w:100% c:gray2] > 
								<div[d:hflex a:center j:left g:3 pb:1]>
									<div[fs:sm]> '星历跟踪列表:'
								<table[bd:solid 1px gray5 ta:center].table.table-hover.table-sm.table-dark#servoTracklist>
									<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
										<tr>
											<th scope="col"> '时间'
											<th scope="col"> '方位'
											<th scope="col"> '俯仰'
									<tbody[d:block c:gray3 r:rgb(64,73,91) h:35 ofy:auto]>
										<tr> <td colSpan="3"> <i> 'Loading...'
								# <div[fs:14px c:gray3 ml:3]> '程序跟踪：'
						<h6.accordion-header id='heading4' [d:none]=isServo>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordion-button type='button' data-bs-toggle='collapse' data-bs-target='#collapse4' aria-expanded='true' aria-control='collapse4'>
								<div[w:90%]> '记忆跟踪'
						<div[max-height:100 ofy:auto].accordion-collapse.collapse.show id='collapse4' aria-labelledby='heading4' data-bs-parent='#ctl' [d:none]=isServo>
							<div[m:0 p:5px d:hflex ja:center]> # 这里的指令下发是针对伺服设备来定制的
								<input$startTime1[w:33% h:7 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='datetime-local' placeholder='开始日期' defaultValue=today>
								<input$stopTime1[w:33% h:7 fs:14px bgc:transparent c:gray4 bd:solid 1px rgb(31,219,220) rd:5px m:1] type='datetime-local' placeholder='结束日期' defaultValue=tomorow>
							<div[d:hflex ja:center g:4]>
								<button[].btn.btn-success.btn-sm @click=sendpara_multi('TrackCalHis',$startTime1.value,$stopTime1.value)> "计算"
								<button[].btn.btn-success.btn-sm @click=sendpara('TrackStartHis',null)> "开始跟踪"
								<button[].btn.btn-success.btn-sm @click=sendpara('TrackStopHis',null)> "结束跟踪"
								<button.btn.btn-success.btn-sm @click=mount!> '刷新'
							<div[b:1 l:1 p:5px 15px w:100% c:gray2] > 
								<div[d:hflex a:center j:left g:3 pb:1]>
									<div[fs:sm]> '历史数据:'
								<table[bd:solid 1px gray5 ta:center].table.table-hover.table-sm.table-dark#servoTracklistHis>
									<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91) d:block]>
										<tr>
											<th scope="col"> '时间'
											<th scope="col"> '方位'
											<th scope="col"> '俯仰'
									<tbody[d:block c:gray3 r:rgb(64,73,91) h:35 ofy:auto]>
										<tr> <td colSpan="3"> <i> 'Loading...'
								# <div[fs:14px c:gray3 ml:3]> '程序跟踪：'

				<div.sdtitle> '更多参数' 
				<div.accordion id='ctl-status'>
					# <div.accordion-item> # 暂时不把参数显示在这里。
					# 	<h6.accordion-header id='headingStatus'>
					# 		<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseStatus' aria-expanded='true' aria-control='collapseStatus'>
					# 			<div[w:90%]> '设备参数'
					# 			<div[w:10% ml:auto].triangle-right>
					# 	<div[max-height:40 ofy:auto].accordion-collapse.collapse.show id='collapseStatus' aria-labelledby='headingStatus' data-bs-parent='#ctl-status'> for item,index in data.StatusList
					# 		if index > 4
					# 			<div[m:0 p:5px d:hflex ai:left].accordion-body>
					# 				<div[fs:14px c:gray3 ml:3]> item.StName+':'
					# 				<div[fs:14px ml:auto mr:5 c:rgb(31,219,220)]> item.Value
					<div.accordion-item>
						<h6.accordion-header id='headingFault'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordion-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseFault' aria-expanded='true' aria-control='collapseFault'>
								<div[w:90%]> '错误参数'
						<div[max-height:40 ofy:auto].accordion-collapse.collapse.show id='collapseFault' aria-labelledby='headingFault' data-bs-parent='#ctl-status'> for item,index in data.FaultList
							<div[m:0 p:5px d:hflex ai:left].accordion-body>
								<div[fs:14px c:gray3 ml:3]> item.Time+':'
								<div[fs:14px ml:auto mr:5 c:rgb(31,219,220)]> item.Value
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
				
						 



