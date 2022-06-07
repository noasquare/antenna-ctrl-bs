tag devcard
	prop devstatus
	prop devnum
	def mount
		console.log 
		
	<self[d:hflex h:10 ja:center fs:14px rd:10px bd:solid 1px gray4 w:50 bg:linear-gradient(0.25turn,{devstatus.bgcolor1},{devstatus.bgcolor2})]> 
		# <img[mr:5] src=devstatus.imgpath>
		<div> devstatus.title
		<div[p:2 1 c:{devstatus.color} fs:13 fw:700 ff:mono]> devnum
		<div> '个'

let devnum = [76,72,3,0,7]
let devstatus = [
	{
		title : '总数'
		color : 'sky5'
		bgcolor1:'sky7'
		bgcolor2:'sky9'
	}
	{
		title:'在线'
		color:'green5'
		bgcolor1:'green7'
		bgcolor2:'green9'
	}
	{
		title:'告警'
		color:'red5'
		bgcolor1:'purple7'
		bgcolor2:'purple9'
	}
	{
		title:'维护'
		color:'orange5'
		bgcolor1:'orange7'
		bgcolor2:'orange9'
	}
	{
		title:'离线'
		color:'blue5'
		bgcolor1:'blue7'
		bgcolor2:'blue9'
	}
]


tag devall

	<self> 
		<div[d:hflex ja:center]> for item,index in devstatus
			<devcard[p:10 m:4] devstatus=item devnum=devnum[index]>
		<div[d:hflex ja:center].devsearch>
			<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备状态'
			<div[d:hflex]>
				<div> '设备类型'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<div[d:hflex pl:5]>
				<div> '设备状态'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6)]> "查询"


		<div[p:3 5].devtable>
			<table[w:100% ta:center ofy:scroll].table>
				<thead[bgc:teal4 c:black]>
					<tr>
						<th scope="col"> '操作'
						<th scope="col"> '所属天线'
						<th scope="col"> '设备名称'
						<th scope="col"> '状态'
						<th scope="col"> '设备简称'
						<th scope="col"> '设备类型'
						<th scope="col"> '设备IP'
						<th scope="col"> '设备端口'
				<tbody[c:gray3 border-color:rgb(64,73,91)]>
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td[d:hflex ai:center p:0]>
							<img[scale:.6] src='./imgs/alarm.png'>
							<div> '离线'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td[d:hflex ai:center p:0 mt:1px]>
							<img[scale:.6] src='./imgs/alarm.png'>
							<div> '离线'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
					<tr>
						<th scope='row'> '01'
						<td> '一号天线'
						<td> 'otto'
						<td[d:hflex ai:center p:0 mt:1px]>
							<img[scale:.6] src='./imgs/alarm.png'>
							<div> '离线'
						<td> '伺服设备'
						<td> '伺服'
						<td> '192.168.2.1'
						<td> '9000'
		<div> '分页设置'
				




