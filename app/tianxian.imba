import './ctrsider'
const devcolor = ['teal7','red7','sky7'] # 设置设备状态的一个颜色数组
let xydata = [
	{
		x:-50
		y:100
	}
	{
		x:20
		y:34
	}
]
# let devlistdata # 单个电线数据
tag tianxian
	css	.btitle h:5% w:100% c:#fff fs:15px lh:30px text-align:center mt:3
	css	.tuop h:70% w:100% pos:relative
		.tpimg pos:absolute bottom:0 left:0
	css	.mlog h:25% w:100% p:5px 15px
		.log-code c:rgb(23,168,62)

		# 以下是tooltip的悬浮展示样式。
	css .custom-tooltip --bs-tooltip-bg:var(--bs-primary) bgc:teal9
	css .tuop-chart p:4 pos:rel d:block cursor:grab rd:5px
		@touch scale:1.05 rotate:2deg zi:2
		@move scale:1.05 rotate:2deg zi:2
	css .tuop-chart bd:none shadow:none @hover:0 0 0 4px teal9,0 0 0 6px teal5 tween:0.2s
		.tphover zi:0 w:auto p:3 visibility:hidden o:0 transform:translateX(-20%) translateY(-20px) tween:.6s pos:absolute bgc:cyan9 c:gra2 rd:5px t:125%
		.tphover::before content:'' pos:abs w:30px h:30px bg:cyan9 t:0 r:50% transform:rotate(45deg) zi:-1
	css .tuop-chart@hover 
		.tphover visibility:visible o:.8 transform:translateX(-20%) translateY(0px) zi:10 w:50

	prop data
	prop islogin
	# prop islogined
	# prop routeid = route.params.id
	prop tpname
	prop ws
	prop x
	prop y
	# prop route
	def shutdowncmd
		let data = 
			AntennaNo : data[antindex].AntNo
			DevNo : data[antindex].Devices[0].DevNo
			Cmd : 'DisableDriver'
			Params : null
		console.log data
		ws.send(JSON.stringify(data))
	def devctr index # 查看点击拓扑视图中 设备之后的顺序。
		ctrindex = index

	def mount
	def tpcontent data
		tpname = data.StatusList[0].StName
		tpvalue = data.StatusList[0].Value
		imba.commit!
		# console.log tpname
		# 通过路由id中的天线编号来载入每个天线的全部数据，并初始化设备数据
	def routed params,state
		# console.log data
		for item,index in data
			if item.AntNo == params.id
				antindex = index
				
				# devctrdata ??= data[index].Devices[0] # 并把天线里面的第一台设备赋给devctrdata，这个的？？=意思是如果不存在就赋值。
				# console.log "routed",devctrdata
	def render()
		# islogined = $txctrl.islogined
		# 默认是第一个伺服，如果有点击按钮，就用被点击的设备的序号。
		ctrindex ??= 0
		if ctrindex > (data[antindex].Devices.length - 1) # 当通过路由参数进来的index大于所有列表的长度，就重新赋值0
			ctrindex = 0
		# console.log "天线视图刷新"
		<self>
			<div[d:hflex w:100% h:100% g:5px]>
				<div[w:70% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)]>
					<div.txbody>
						<div.btitle> "{data[antindex].AntName}:设备拓扑图"
						<div.tuop>
							<div[d:flex ja:center h:25%]>
								<div[p:5px m:10px w:50% c:gray3 bgc:teal8/40 bd:solid 1px teal4 rd:5px d:grid gtc:1fr 1fr]> for item,index in data[antindex].Devices[ctrindex].StatusList # 就tm多了一个操作，连通性就断掉了。
									if index < 5 # 这里控制显示的参数数量，5个重要信息。
										<div[p:3]> item.StName+' : '
											<div[d:inline fs:20px c:teal4 fw:bold ff:monospace]> item.Value
							<div[h:auto d:hflex ja:center g:15px m:5 10]> for item,i in data[antindex].Devices
								if item.StatusList[item.StatusList.length - 1].Value === 'Disconnected'
									<button[x:{x} y:{y} bgc:{devcolor[2]} c:gray2 w:auto].tuop-chart @touch.moved.sync(self) @click=devctr(i)> item.DevName
										<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
											if n < 5
												<div[d:hflex ja:left a:center ml:3]>
													<div[fs:12px]> tpitem.StName+':'
													<div[c:teal4 fs:16px fw:bold]> tpitem.Value
								if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length === 0
									<button[x:{x} y:{y} bgc:{devcolor[0]} c:gray2 w:auto].tuop-chart @touch.moved.sync(self) @click=devctr(i)> item.DevName
										<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
											if n < 5
												<div[d:hflex ja:left a:center ml:3]>
													<div[fs:12px]> tpitem.StName+':'
													<div[c:teal4 fs:16px fw:bold]> tpitem.Value
								if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length !== 0
									<button[x:{x} y:{y} bgc:{devcolor[1]} c:gray2 w:auto].tuop-chart @touch.moved.sync(self) @click=devctr(i)> item.DevName
										<div[d:grid gtc:1fr g:2px ta:left].tphover> for tpitem,n in item.StatusList
											if n < 5
												<div[d:hflex ja:left a:center ml:3]>
													<div[fs:12px]> tpitem.StName+':'
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
							<button[d:flex ja:center w:100px h:30px pos:absolute t:1rem r:1rem bgc:red6 @hover:red7 c:#fff outline:none rd:5px cursor:pointer bd:none box-shadow:0 0 15px 5px red5 @hover:0 0 10px 2px red5].tpbtn type='button' data-bs-toggle='tooltip' data-bs-placement='top' title='关闭伺服电源' @click=shutdowncmd>
								<img[scale:.7] src='./imgs/btn-stop.png'>
								<span[fs:12px]> '紧急停车'
						<div[m:0 p:0 5 c:gray4]> '卫星列表数据'
						<div[ofy:scroll].mlog>
							<table[bd:solid 1px gray5].table>
								<thead[bgc:rgb(54,73,91) c:gray3 border-color:rgb(64,73,91)]>
									<tr>
										<th scope="col"> '操作'
										<th scope="col"> '设备名称'
										<th scope="col"> '设备简称'
										<th scope="col"> '发送命令'
								<tbody[c:gray4 border-color:rgb(64,73,91)]>
									<tr>
										<th scope='row'> '1'
										<td> 'mark'
										<td> 'otto'
										<td.log-code> '255>00_2'
									<tr>
										<th scope='row'> '2'
										<td> '伺服器'
										<td> 'acu39'
										<td.log-code> '255>00_2'
									<tr>
										<th scope='row'> '3'
										<td> '光端机'
										<td> '发发射'
										<td.log-code> '255>GAIN_15.00'
									<tr>
										<th scope='row'> '4'
										<td> '光端机'
										<td> '发发射'
										<td.log-code> '255>GAIN_15.00'
									<tr>
										<th scope='row'> '5'
										<td> '光端机'
										<td> '发发射'
										<td.log-code> '255>GAIN_15.00'
				<div[w:30% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)]>
					<ctrsider$txctrl data=data[antindex].Devices[ctrindex] ws=ws ant=route.params.id islogin=islogin>


