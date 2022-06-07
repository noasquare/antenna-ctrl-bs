import './ctrsider'
const devcolor = ['teal7','red7','sky7'] # 设置设备状态的一个颜色数组
tag tianxian

	css	.btitle h:5% w:100% c:#fff fs:15px lh:30px text-align:center
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
		.tphover p:3 visibility:hidden o:0 transform:translateX(0%) translateY(-20px) tween:1s pos:absolute bgc:teal9 c:gra2 rd:5px b:120%
		.tphover::before content:'' pos:abs w:30px h:30px bg:teal9 b:0 transform:rotate(45deg) zi:-1
	css .tuop-chart@hover 
		.tphover visibility:visible o:1 transform:translateX(0%) translateY(0px)
	prop x
	prop y
	prop data

	def devctr devname
		for item in data.devlist
			if item.devname == devname
				devctrdata = item
				console.log devctrdata

	def mount
		devctrdata = data.devlist[0]




	<self>
		<div[d:hflex w:100% h:100% g:5px]>
			<div[w:70% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)]>
				<div.txbody>
					<div.btitle> "{data.title}-设备拓扑图"
					<div.tuop>
						<div[h:60% d:hflex ja:center g:10px]> for item in data.devlist
							<button[x:{x} y:{y} bgc:{devcolor[0]} c:gray2].tuop-chart @touch.moved.sync(self) @click=devctr(item.devname)> item.devname
								<div.tphover> 'tooltips here'

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
			<div[w:30% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)]>
				<ctrsider data=devctrdata>


