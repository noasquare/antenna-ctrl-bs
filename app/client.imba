import * as bootstrap from 'bootstrap' # 使用bootstrap作为前端ui组件
import 'bootstrap/dist/css/bootstrap.min.css' # 使用

global css html
	ff:sans
# global css body bg:yellow1
global css body bg:center url('./imgs/bg-antenna.jpg') m:0 p:0 c:gray3

tag app

	# 有关main的部分都放在以下 
	css .main m:0 p:5px of:hidden d:hflex h:95% bdt:solid rgb(12,100,100)
		.menu mr:5px w:15% ta:center bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.body bg:rgba(11,41,49,.6) w:65% shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
			
		.btitle h:5% w:100% c:#fff fs:15px lh:30px text-align:center
		.tuop h:70% w:100% pos:relative
		.tpimg pos:absolute bottom:0 left:0
		.mlog h:25% w:100% p:5px 15px
		.log-code c:rgb(23,168,62)
		.sider ml:5px bg:yellow4 w:22% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.sdtitle c:rgb(31,219,220) fw:bold p:10px bdb:solid 1px rgb(31,219,220)
		.sdstatus d:hflex p:5px c:gray3 fs:14px
		.status-title-left w:50% ta:left
		.status-title-right w:50% ta:right
		.status-value mr:1rem c:rgb(23,168,62) bdr:solid 1px gray3
		.accordion --bs-accordion-bg:transparent bd:none --bs-accordion-border-width:0px
		.triangle-right w:0 h:0 bdt:5px solid transparent bdl:10px solid gray3 bdb:5px solid transparent


	# 有关header 的都放在以下
	css .header bg:rgba(11,41,49,.6) h:8% d:hflex ta:right shadow:inset 0px 0px 10px 5px rgb(12,100,100)
		.logo w:40% d:flex ja:center
		.setting w:30% ta:left
		.notify w:30%
	css .collapsible bgc:rgb(14,73,91) @hover:rgb(54,73,91) c:#fff cursor:pointer p:18px w:100% bd:none ta:left outline:none fs:15px 
		.active bgc:#ccc
	css .mcontent p:0 m:0 d:none of:hidden list-style-type:none 
		.mbtn p:10px 12px d:block of:hidden bgc:transparent @hover:rgb(54,73,91) outline:none fs:14px ta:left bd:none w:100% c:#fff
	
	def mount
		# 引入tooltip第三方组件----
		const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
		# console.log tooltipTriggerList.length
		const tooltipList = [...tooltipTriggerList].map do(item)
			new bootstrap.Tooltip(item)
		# -----------------
		# 调用对话框
		const myModal = document.getElementById('myModal')
		const myInput = document.getElementById('myInput')

		myModal.addEventListener('shown.bs.modal', do()
			myInput.focus()
		)
		# ------
		
		let col = document.getElementsByClassName('collapsible')
		# let mcollaps = document.getElementsByClassName('mcontent')
		for item in col
			item.addEventListener('click',do()
				this.classList.toggle('active')
				let content = this.nextElementSibling
				if content.style.display === 'block'
					content.style.display = 'none'
				else
					content.style.display = 'block'
				)

	<self>
		<div.header>
			<button[d:hflex ai:center pl:5 bgc:transparent bd:none c:gray3].setting>
				<img[mr:2 scale:.7] src='./imgs/menu.png'>
				<div> '菜单'
			<div.logo>
				<img[scale:0.5] src='./imgs/logo.png'>
				<span[c:#fff fs:18px]> "天线控制软件"
			<div[d:hflex ja:center].notify>
				<button[bgc:transparent bd:none ml:auto].pos-relative.notify-msg>
					<img[scale:.8] src='./imgs/alert.png'>
					<span[w:8 fs:12px pos:absolute top:5 right:21% c:gray2 bgc:red5 rd:9px]> '9+'
				<div[d:hflex ja:center ml:auto].notify-user>
					<img[mr:2] src='./imgs/user.png'>
					<div> 'admin'
				<button[d:hflex ja:center bgc:transparent bd:none c:gray3 ml:auto pr:5].notify-logout data-bs-toggle='modal' data-bs-target='#exitModal'>
					<img[mr:2] src='./imgs/logout.png'>
					<div> '退出'
				<div.modal.fade id='exitModal' tabindex='-1' aria-labelledby='exitModalLabel' aria-hidden='true'>
					<div.modal-dialog>
						<div.modal-content>
							<dib.modal-header>
								<h5.modal-title id='exitModalLabel'> "退出"
								<button.btn-close data-bs-dismiss='modal' aira-label='close'>
							<dib.modal-body> "是否确认退出"
							<dib.modal-footer>
								<button.btn.btn-secondary data-bs-dismiss='modal'> "关闭"
								<button.btn.btn-primary> "退出"
		<div.main>
			<div.menu>
				<button.collapsible> "阵地天线总览"
				<ul.mcontent>
					<li> <button.mbtn> "天线1"
					<li> <button.mbtn> "天线2"
					<li> <button.mbtn> "天线3"
					<li> <button.mbtn> "天线4"
				<button.collapsible> "阵地设备总览"
				<p.mcontent>
				<button.collapsible> "系统状态"
				<button.collapsible> "日志"
				<button.collapsible> "设置"

			<div.body>
				<div.btitle> "天线1-设备拓扑图"
				<div.tuop>
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

			<div.sider>
				<div.sdtitle> "设备控制"
				<div.sdstatus>
					<div.status-title-left> '实时参数'
					<div.status-title-right> '设备名称：ACU11A'
				<div[p:5px m:10px h:10% c:gray3 bgc:gray8 bd:solid 1px gray4 rd:5px ofy:scroll].status-box>
					<span.status-content> '俯仰: '
					<span.status-value> '000'
					<span.status-content> '方位: '
					<span.status-value> '000'
					<span.status-content> 'AGC: '
					<span.status-value> '000'
				<div.accordion id='ctl'>
					<div.accordion-item>
						<h6.accordion-header id='headingOne'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-control='collapseOne'>
								<div[w:90%]> '极化切换'
								<div[w:10% ml:auto].triangle-right>

						<div.accordion-collapse.collapse.show id='collapseOne' aria-labelledby='headingOne' data-bs-parent='#ctl'>
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '极化方式:'
								<select[fs:12px bgc:transparent c:gray4 w:50% ml:auto bd:solid 1px rgb(31,219,220)].form-select.form-select-sm>
									<option selected> 'test'
									<option value='1'> 'one'
									<option value='2'> 'two'
									<option value='3'> 'three'
							<div[p:5 d:hflex ja:center mt:3].ctlbtn>
								<button[mr:3].btn.btn-danger.btn-sm> '重置'
								<button.btn.btn-success.btn-sm> '提交'
					<div.accordion-item>
						<h6.accordion-header id='headingTwo'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseTwo' aria-expanded='true' aria-control='collapseTwo'>
								<div[w:90%]> '极化切换'
								<div[w:10% ml:auto].triangle-right>

						<div.accordion-collapse.collapse.show id='collapseTwo' aria-labelledby='headingTwo' data-bs-parent='#ctl'>
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '角度设置:'
								<select[fs:12px bgc:transparent c:gray4 w:50% ml:auto bd:solid 1px rgb(31,219,220)].form-select.form-select-sm>
									<option selected> 'test'
									<option value='1'> 'one'
									<option value='2'> 'two'
									<option value='3'> 'three'
							<div[p:5 d:hflex ja:center m:5].ctlbtn>
								<button[mr:3].btn.btn-danger.btn-sm> '重置'
								<button.btn.btn-success.btn-sm> '提交'
									
				<div.sdtitle> '更多参数'
				<div.accordion id='ctl-status'>
					<div.accordion-item>
						<h6.accordion-header id='headingStatus'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseStatus' aria-expanded='true' aria-control='collapseStatus'>
								<div[w:90%]> '设备参数'
								<div[w:10% ml:auto].triangle-right>

						<div.accordion-collapse.collapse.show id='collapseStatus' aria-labelledby='headingStatus' data-bs-parent='#ctl-status'>
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> 'ACU电平:'
								<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> '0'
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '方位:'
								<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> '0'
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '俯仰:'
								<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> '0'
							<div[m:0 p:5px d:hflex ja:center].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '电机状态:'
								<div[fs:14px ml:auto c:rgb(31,219,220) pr:5]> '正常'


		# <div.footer> "footer"


imba.mount <app>