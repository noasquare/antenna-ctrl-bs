# let logdaßta
tag devlog
	css input color-scheme:dark
	
	def logload url
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				let div

				logdata = data
				console.log data
	def mount

		

	def render
		console.log 'devlog render'
		logload('/loglist')


		<self> 
			<div[d:hflex ja:center fs:14px].devsearch>
				<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备日志'
				<div[d:hflex]>
					<div> '设备名称'
					<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
				<div[d:hflex pl:5]>
					<div> '开始日期'
					<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
				<div[d:hflex pl:5]>
					<div> '结束日期'
					<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
				<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6)]> "查询"

			<div[p:3 5 ofy:scroll].devtable>
				<table[w:100% ta:center].table>
					<thead[bgc:teal4 c:black]>
						<tr>
							<th scope="col"> '所属塔基'
							<th scope="col"> '设备IP'
							<th scope="col"> '设备版本'
							<th scope="col"> '设备简称'
							<th scope="col"> '发生时间'
							<th scope="col"> '历史状态'
					<tbody[c:gray3 border-color:rgb(64,73,91) o@off:0 tween:all 1s ease-in]> if logdata
						for item,inx in logdata
							<tr>
								<th scope='row'> item.antname
								<td> item.ctrlip
								<td> item.ctrlcmd
								<td> item.devname
								<td> item.cmdtime
								<td> item.ctrluser
								<td> item.driverclass
			<div> '分页设置'

