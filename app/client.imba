import * as bootstrap from 'bootstrap' # 使用bootstrap作为前端ui组件
import 'bootstrap/dist/css/bootstrap.min.css' # 使用
import './tianxian'
import './ctrsider'
import './antcard'
global css html
	ff:sans
# global css body bg:yellow1
global css body bg:center url('./imgs/bg-antenna.jpg') m:0 p:0 c:gray3

let txs = ['tx1','tx2','tx3','tx4','tx5']
let devdata = {
	tx1:{
		server:{
			el:180
			az:90
			agc:8.5
		}
		temp:{
			tempreture:38
			hum:76
		}
	}
	tx2:{
		server:{
			el:189
			az:45
			agc:4.5
		}
		temp:{
			tempreture:39
			hum:75
		}
	}
	tx3:{
		server:{
			el:170
			az:09
			agc:2.5
		}
		temp:{
			tempreture:39
			hum:75
		}
	}
	tx4:{
		server:{
			el:167
			az:8
			agc:2.5
		}
		temp:{
			tempreture:39
			hum:75
		}
	}
	tx5:{
		server:{
			el:154
			az:8
			agc:9.5
		}
		temp:{
			tempreture:39
			hum:75
		}
	}
}


tag app

	# 有关main的部分都放在以下 
	css .main m:0 p:5px of:hidden d:hflex h:95% bdt:solid rgb(12,100,100)
		
		.menu mr:5px w:15% ta:center bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.menudroplink bgc:transparent @hover:gray8 @focus:gray6 m:0 p:4 d:hflex outline:none bd:none w:100%	
		.body bg:rgba(11,41,49,.6) w:65% shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.sider ml:5px bg:yellow4 w:22% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.accordion --bs-accordion-bg:transparent bd:none --bs-accordion-border-width:0px
		.triangle-right w:0 h:0 bdt:5px solid transparent bdl:10px solid gray3 bdb:5px solid transparent
		.triangle-down w:0 h:0 bdt:10px solid gray3 bdl:5px solid transparent bdr:5px solid transparent
	css .antall bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)


	# 有关header 的都放在以下
	css .header bg:rgba(11,41,49,.6) h:8% d:hflex ta:right shadow:inset 0px 0px 10px 5px rgb(12,100,100)
		.logo w:40% d:flex ja:center
		.setting w:30% ta:left
		.notify w:30%
	css .menunodrop bgc:rgb(14,73,91) @hover:rgb(54,73,91) c:#fff cursor:pointer p:18px w:100% bd:none ta:left outline:none fs:15px 
		.active bgc:#ccc
	css .mcontent p:0 m:0 d:none of:hidden list-style-type:none 
		.mbtn p:10px 12px d:block of:hidden bgc:transparent @hover:rgb(54,73,91) outline:none fs:14px ta:left bd:none w:100% c:#fff
	def menuclickarrow
		console.log '跳转阵地总览界面'

	def mount
		# 引入tooltip第三方组件----
		const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
		# console.log tooltipTriggerList.length
		const tooltipList = [...tooltipTriggerList].map do(item)
			new bootstrap.Tooltip(item)
	<self>
		<div.header>
			<button[d:hflex ai:center pl:5 bgc:transparent bd:none c:gray3].setting>
				<img[mr:2 scale:.7] src='./imgs/menu.png'>
				<div> '菜单'
			<button[bd:none outline:none shadow:none bgc:transparent].logo route-to='/home'>
				<img[scale:0.5] src='./imgs/logo.png'>
				<span[c:#fff fs:18px]> "天线控制软件"
			<div[d:hflex ja:center].notify>
				<button[bgc:transparent bd:none ml:auto].pos-relative.notify-msg>
					<img[scale:.8] src='./imgs/alert.png'>
					<span[w:8 fs:12px pos:absolute top:5 right:21% c:gray2 bgc:red5 rd:9px bd:solid .5px gray2]> '9+'
				<div[d:hflex ja:center ml:auto].notify-user>
					<img[mr:2] src='./imgs/user.png'>
					<div> 'admin'
				<button[d:hflex ja:center bgc:transparent bd:none c:gray3 ml:auto pr:5].notify-logout data-bs-toggle='modal' data-bs-target='#exitModal'>
					<img[mr:2] src='./imgs/logout.png'>
					<div> '退出'
				<div.modal.fade id='exitModal' tabindex='-1' aria-labelledby='exitModalLabel' aria-hidden='true'>
					<div.modal-dialog>
						<div.modal-content>
							<div.modal-header>
								<h5.modal-title id='exitModalLabel'> "退出"
								<button.btn-close data-bs-dismiss='modal' aira-label='close'>
							<div.modal-body> "是否确认退出"
							<div.modal-footer>
								<button.btn.btn-secondary data-bs-dismiss='modal'> "关闭"
								<button.btn.btn-primary> "退出"
		<div.main>
			<div.menu>
				<div.accordion id='menu'>
					<div.accordion-item>
						<h6.accordion-header id='menu01'>
							<button[d:hflex p:5 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#cols01' aria-expanded='true' aria-control='cols01' @click=menuclickarrow route-to='/antall'>
								<div[w:90%]> '阵地天线总览'
								<div[w:10% ml:auto].triangle-right>

						<div.accordion-collapse.collapse.show id='cols01' aria-labelledby='menu01' data-bs-parent='#menu'> for item in txs
							<button.accordion-body.menudroplink route-to="/txst/{item}">
								<div[fs:14px c:gray3 ml:5]> item
							# <button.accordion-body.menudroplink>
							# 	<div[fs:14px c:gray3 ml:5]> '天线2'
							# <button.accordion-body.menudroplink>
							# 	<div[fs:14px c:gray3 ml:5]> '天线3'
							# <button.accordion-body.menudroplink>
							# 	<div[fs:14px c:gray3 ml:5]> '天线4'
							# <button.accordion-body.menudroplink>
							# 	<div[fs:14px c:gray3 ml:5]> '天线5'

					<div.accordion-item>
						<h6.accordion-header id='menu02'>
							<button[d:hflex p:5 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#cols02' aria-expanded='true' aria-control='cols02'>
								<div[w:90%]> '阵地设备总览'
								<div[w:10% ml:auto].triangle-right>
						<div.accordion-collapse.collapse.show id='cols02' aria-labelledby='menu02' data-bs-parent='#ctl'>
							<div[m:0 p:4 d:hflex].accordion-body>
								<div[fs:14px c:gray3 ml:3]> '暂定留空'
				<button.menunodrop> "系统状态"
				<button.menunodrop> "日志"
				<button.menunodrop> "设置"
			<tianxian.body route='/txst/:id' data=devdata>
			<ctrsider.sider route='/txst/:id' data=devdata>
			<div[p:5 w:100% d:grid gtc:1fr 1fr 1fr g:5 a:baseline].antall route='/antall'> for item in txs
				<antcard route='/antall' rdata=item>
				# <antcard route='/antall'>
				# <antcard route='/antall'>
				# <antcard route='/antall'>
				# <antcard route='/antall'>
		<div.devall route='/devall'> '设备总览'

imba.mount <app>