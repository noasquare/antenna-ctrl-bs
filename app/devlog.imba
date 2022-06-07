tag devlog

	<self> 
		<div[d:hflex ja:center].devsearch>
			<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备日志'
			<div[d:hflex]>
				<div> '设备名称'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<div[d:hflex pl:5]>
				<div> '开始日期'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<div[d:hflex pl:5]>
				<div> '结束日期'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6)]> "查询"

		<div[p:3 5].devtable>
			<table[w:100% ta:center ofy:scroll].table>
				<thead[bgc:teal4 c:black]>
					<tr>
						<th scope="col"> '所属塔基'
						<th scope="col"> '设备类型'
						<th scope="col"> '设备版本'
						<th scope="col"> '设备简称'
						<th scope="col"> '设备名称'
						<th scope="col"> '发生时间'
						<th scope="col"> '历史状态'
						<th scope="col"> '内容'
				<tbody[c:gray3 border-color:rgb(64,73,91)]>
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
						<td> 'test'
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
		<div> '分页设置'

