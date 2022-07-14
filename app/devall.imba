import alarm from './imgs/alarm.png'
tag devcard
	prop devstatus
	prop devnum
	prop data
	def mount
		
	<self[d:hflex h:10 ja:center fs:14px rd:10px bd:solid 1px gray4 w:auto bg:linear-gradient(0.25turn,{devstatus.bgcolor1},{devstatus.bgcolor2})]> 
		<div> devstatus.title
		<div[p:2 1 c:{devstatus.color} fs:13 fw:700 ff:mono]> devnum
		<div> '个'

# let devnum = [76,72,3,7]
# let devnum = new Array(4)
let devnum
let devstatus = [
	{
		title : '总数'
		color : 'sky5'
		bgcolor1:'sky7'
		bgcolor2:'sky9'
		url: './imgs/alarm.png'
	}
	{
		title:'在线'
		color:'green5'
		bgcolor1:'green7'
		bgcolor2:'green9'
		url: './imgs/alarm.png'

	}
	{
		title:'告警'
		color:'red5'
		bgcolor1:'purple7'
		bgcolor2:'purple9'
		url: './imgs/alarm.png'

	}
	{
		title:'离线'
		color:'blue5'
		bgcolor1:'blue7'
		bgcolor2:'blue9'
		url: './imgs/alarm.png'

	}
]

let pagesize = 10
let antroute
tag devall
	prop data
	prop alarmNo
	css tbody tr cursor:pointer
	def search
		console.log '查询设备列表'
	def prevPage
	def nextPage
	def devcount
		devnum = [0,0,0,0]
		# console.log '开始计算'
		for item in data
			for devitem in item.Devices
				devnum[0] += 1
				for stitem in devitem.StatusList
					if stitem.StName === '设备状态' && stitem.Value === 'Normal'
						# console.log '判断在线依据'
						devnum[1] += 1
					if stitem.StName === '设备状态' && stitem.Value === 'Disconnected'
						# console.log '判断掉线依据'
						devnum[3] += 1
				if devitem.FaultList.length !== 0 # 这里告警依据待定
					# console.log '判断告警依据'
					devnum[2] += 1
		alarmNo = devnum[2] # 把告警的数量传递给到首页来显示。

	def rowroute e
		console.log e.target.textContent
		let antno = e.target.textContent
		# console.log data
		for item in antroute
			if item.AntNo === antno # 这里用的是绝对等于才可以，如果两个等于号就会出现路由错误的问题。学习了
				route-to = "/txst/{antno}"	

	def mount
		document.querySelectorAll('#devtable tbody tr').forEach do(r)
			# console.log '增加行点击事件'
			r.addEventListener('click',rowroute,no)

	def render
		devcount!
		antroute = data

		<self> 
			<div[d:hflex ja:center mb:4]> for item,index in devstatus
				<devcard[p:10 m:2] devstatus=item devnum=devnum[index]>
			<div[d:hflex ja:center].devsearch>
				<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备状态'
				<div[d:hflex]>
					<div> '设备类型'
					<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
				<div[d:hflex pl:5]>
					<div> '设备状态'
					<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
				<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6) @hover:linear-gradient(teal6,teal4)] @click=search> "查询"
			<div[p:3 5].devtable>
				<table[w:100% ta:center ofy:scroll].table#devtable>
					<thead[bgc:teal4 c:black]>
						<tr>
							<th scope="col"> '所属天线'
							<th scope="col"> '天线编号'
							<th scope="col"> '设备名称'
							<th scope="col"> '状态'
							<th scope="col"> '设备编号'
					<tbody[c:gray3 border-color:rgb(64,73,91)]> for item in data
						for devitem in item.Devices
							<tr>
								<td> item.AntName
								<td> item.AntNo
								<td> devitem.DevName
								for stitem in devitem.StatusList
									if stitem.StName === '设备状态' && stitem.Value === 'Normal' && devitem.FaultList.length == 0
										<td[bgi:url('./imgs/online.png') bgr:no-repeat bgs:30px bgp:left]> '在线'
									if stitem.StName === '设备状态' && stitem.Value === 'Disconnected'
										<td[bgi:url('./imgs/offline.png') bgr:no-repeat bgs:30px bgp:left]> '离线'
								if devitem.FaultList.length !== 0
									<td[bgi:url('./imgs/alarm.png') bgr:no-repeat bgs:30px bgp:left]> '告警'
								<td> devitem.DevNo
			<button[mr:5].btn.btn-secondary @click=prevPage> "前一页"
			<button.btn.btn-secondary @click=nextPage> "下一页"

				




