import './flowchart'
const devcolor = ['teal7','red7','sky7']
tag tianxian
	css	.btitle h:5% w:100% c:#fff fs:15px lh:30px text-align:center
	css	.tuop h:70% w:100% pos:relative
		.tpimg pos:absolute bottom:0 left:0
	css	.mlog h:25% w:100% p:5px 15px
		.log-code c:rgb(23,168,62)
	def devctr # 测试点击
		this.route-to = '/txst/tx2'
		console.log 'clicked'
	def mount

	<self>
		<div>
			<div.btitle> "天线{route.params.id}-设备拓扑图"
			<div.tuop>
				<div[h:60% d:hflex ja:center]>
					
					<flowchart color=devcolor[0] > "伺服器"
					<flowchart color=devcolor[1] > "光传设备"
					<flowchart color=devcolor[2] > "变频器"

				<img[scale:0.7].tpimg src='./imgs/legend.png'>
				<button[d:flex ja:center w:100px h:30px pos:absolute bottom:1rem right:3rem bgc:red6 @hover:red7 c:#fff outline:none rd:5px cursor:pointer bd:none box-shadow:0 0 15px 5px red5 @hover:0 0 10px 2px red5].tpbtn type='button' data-bs-toggle='tooltip' data-bs-placement='top' title='关闭伺服电源'>
					<img[scale:.7] src='./imgs/btn-stop.png'>
					<span[fs:12px]> '紧急停车'
			<div[m:0 p:0 5 c:gray4]> '命令流日志'
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
