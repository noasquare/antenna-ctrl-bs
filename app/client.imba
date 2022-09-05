import * as bootstrap from 'bootstrap' # 使用bootstrap作为前端ui组件
# import 'bootstrap-icons/font/bootstrap-icons.css'
import 'bootstrap/dist/css/bootstrap.min.css' # 使用
import './tianxian'
import './ctrsider'
import './antcard'
import './devall'
import './devlog'
# import './test'
# import wsdata from './antenna.json'
import wsdata from './状态.json'
global css html
	ff:sans
global css body bg:center url('./imgs/bg-antenna.jpg') m:0 p:0 c:gray3
let tooltipList
let socket
let globaldata = 0
let txs = ['tx1','tx2','tx3','tx4','tx5']
let devdata
let wsAdds
let wsrefresh
let isLogin = no # 判断用户登录的标识
tag app
	# 有关main的部分都放在以下 
	css .main m:0 p:5px of:hidden d:hflex h:95% bdt:solid 1px rgb(12,100,100)
		.menu mr:5px w:15% ta:center bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)
		.menudroplink bgc:transparent @hover:gray8 @focus:gray6 m:0 p:4 d:hflex outline:none bd:none w:100%	
		.accordion --bs-accordion-bg:transparent bd:none --bs-accordion-border-width:0px
		.triangle-right w:0 h:0 bdt:5px solid transparent bdl:10px solid gray3 bdb:5px solid transparent
		.triangle-down w:0 h:0 bdt:10px solid gray3 bdl:5px solid transparent bdr:5px solid transparent
	css .antall bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid 1px rgb(12,100,100)
	# 有关header 的都放在以下
	css .header bg:rgba(11,41,49,.6) h:5% @!500:10% d:hflex ta:right shadow:inset 0px 0px 10px 5px rgb(12,100,100)
		.logo w:40% d:flex ja:center
		.setting w:30% ta:left
		.notify w:30%
	css .menunodrop bgc:rgb(14,73,91) @hover:rgb(54,73,91) c:#fff cursor:pointer p:18px w:100% bd:none ta:left outline:none fs:15px 
		.active bgc:#ccc
	css .mcontent p:0 m:0 d:none of:hidden list-style-type:none 
		.mbtn p:10px 12px d:block of:hidden bgc:transparent @hover:rgb(54,73,91) outline:none fs:14px ta:left bd:none w:100% c:#fff
	def menuclickarrow
		console.log '跳转阵地总览界面'
	def changewsadd ip
		wsopen(ip)
		console.log wsAdds

	prop antindex = 0
	def antdata data
		# console.log data
		antindex = data
	set wscheck dev
		dev ??= '--本地数据'
	def load url
		# console.log 'load 来了'
		# window.fetch(url).then do(res)
		# 	res.json
		let res = await window.fetch(url)
		return res.json!
	def wsopen url
		wsAdds = url
		if socket
			socket.close()
		socket = new WebSocket(url)
		socket.addEventListener 'message' do(e)
		# 进行进来的信号做初始值设定
			devdata = JSON.parse(e.data)
			# 判断服务器发来的用户检查命令
			if devdata.Cmd == 'Login'
				console.log devdata.Params.Status
				switch devdata.Params.Status
					when 'Successful'
						isLogin = yes
					when 'Failed'
						isLogin = no
						window.alert('输入的用户或密码错误！')
					when '未登录'
						window.alert('请登录后操作')
					else
						throw 'nope'
			console.log isLogin
			console.log devdata
			imba.commit!
	def alarmNo

	def login val1,val2
		# console.log val1.length
		if val1.length === 0 || val2.length === 0
			window.alert('用户名或密码不能为空')
		if val1 && val2
			let data = 
				Cmd : 'Login'
				Params : {
					name : val1
					pwd : val2
				}
			console.log data
			socket.send(JSON.stringify(data))

		# isLogin = yes
	def usrlogout
		$txjm.$txctrl.islogined = no
		$txjm.islogined = no

	def mount
		# console.log 'mount 开始'
		wsopen(wsAdds ??= "ws://localhost:1880/test")
		# console.log '来自mount' # mount里面的数据只加载一次。
		const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
		# console.log tooltipTriggerList.length
		tooltipList = [...tooltipTriggerList].map do(item) # 这里有个小技巧 不能再这里指定const,否则就变成局部变量了。
			new bootstrap.Tooltip(item)
		# console.log tooltipList
		load('/testforu').then do(data)  # 这里是查询数据库里面的 用户信息。
			# console.log data
	def displaySeting
		$txjm.$txctrl.islogined = $txjm.islogined = isLogin = no

		# 一个简单的登录登出判断
		if $txjm.isadminClick
			$txjm.isadminClick = no
		else
			return
		# $txjm.isadminClick = !$txjm.isadminClick


	def render()
		# console.log $txjm.$txctrl.islogined
		# console.log $txjm.islogined
		if $txjm.$txctrl.islogined || $txjm.islogined
			isLogin = $txjm.$txctrl.islogined || $txjm.islogined
		# else
		# 	isLogin = no
		devdata ??= wsdata # 当devdata 没有ws数据灌入时候，就赋值本地的jsondata
		# 这里是一个初始值，确保devlist不管是否点击目录也可以有值
		devlist ??= wsdata[0]
		# console.log 'render 开始' # 知道有事件发生就会render
		# console.log $devall.alarmNo
		if !isLogin 
			username = '观察员'
			$txjm.$txctrl.islogined = $txjm.islogined = no
		else
			username = 'admin'
		<self>
			<div.header>
				<button[d:hflex ai:center pl:5 bgc:transparent bd:none c:gray3].setting route-to='/setting'>
					<img[mr:2 scale:.7] src='./imgs/menu.png'>
					<div> '菜单'
					<span[fs:10px ml:3 c:gray4/70]> "上海盛磊2022{<sup> '©'}"
				<button[bd:none outline:none shadow:none bgc:transparent].logo route-to='/antall'>
					<img[scale:0.5] src='./imgs/logo.png'>
					<span[c:#fff fs:18px]> "天线精灵控制软件" 
						<sub> 'v1.0'
				<div[d:hflex ja:center].notify>
					<button[bgc:transparent bd:none ml:auto].pos-relative.notify-msg route-to='/devall'>
						<img[scale:.8] src='./imgs/alert.png'>
						<span[w:8 fs:12px pos:absolute top:1 right:21% c:gray2 bgc:red5 rd:9px bd:solid .5px gray2]> $devall.alarmNo
					<button[d:hflex ja:center ml:auto bgc:transparent bd:none c:gray2].notify-user route-to='/login'>
						<img[mr:2] src='./imgs/user.png'>
						<span> username  # 增加对用户登录状态的判断。点击进去登录界面。
					<button[d:hflex ja:center bgc:transparent bd:none c:gray3 ml:auto pr:5] route-to='/logout' @click=displaySeting>
					# <button[d:hflex ja:center bgc:transparent bd:none c:gray3 ml:auto pr:5].notify-logout data-bs-toggle='modal' data-bs-target='#exitModal'>
						<img[mr:2] src='./imgs/logout.png'> 
						if isLogin
							<div> '退出'
						else 
							<div> '登录'
			<div.main>
				<div.menu>
					<div.accordion id='menu'>
						<div.accordion-item>
							<h6.accordion-header id='menu01'>
								<button[d:hflex p:5 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#cols01' aria-expanded='true' aria-control='cols01' @click=menuclickarrow route-to='/antall'>
									<div[w:90%]> '阵地天线总览'
									<div[w:10% ml:auto].triangle-right>

							<div.accordion-collapse.collapse.show id='cols01' aria-labelledby='menu01' data-bs-parent='#menu'> for item,index in devdata
								<button.accordion-body.menudroplink route-to="/txst/{item.AntNo}" @click=antdata(index)>
									<div[fs:14px c:gray3 ml:5]> item.AntName

					<button.menunodrop route-to='/devlog' route-to='/devall'> "阵地设备总览"
					<button.menunodrop route-to='/devlog'> "日志"
					<button.menunodrop route-to='/setting'> "设置"
					# <button.menunodrop route-to='/test'> "test"
					<i.bi.bi-alarm>

				<tianxian$txjm[w:100%] route='/txst/:id' data=devdata ws=socket antindex=antindex islogin=isLogin> # 这里的index是为了区分是哪个天线的数据，但是如果这样，就会导致纯通过route不能获取最新的数据了。解决方案就是，点击要的index传进去，然后再component里面直接做，不转手。
				<div[p:5 w:100% d:grid gtc:1fr 1fr 1fr g:5 a:baseline].antall route='/antall'> for item in devdata
					<antcard rdata=item>
				<div[w:100% ta:center].antall route='/devall'>
					<div[mt:3]> '阵地设备总览'
					<devall$devall data=devdata>
				<div[w:100% ta:center].antall route='/devlog'>
					<devlog[mt:4]>
				<div[w:100% ta:center].antall route='/setting'>
					<div[w:50% p:5 4 bdb:solid 1px teal4 ml:25%]> '参数设置'
					<div[mt:5]>
						<div> 'websocket地址设置：'
							<input$wsadd type='text' placeholder='ws://....' bind=wsAdds>
							<button[ml:5].btn.btn-success @click=changewsadd($wsadd.value)> "修改"
					<div[mt:5]>
						<div> '系统刷新率设置：'
							<input$wsrefresh type='text' placeholder='刷新率' bind=wsrefresh>
							<button[ml:5].btn.btn-success @click=changewsadd($wsrefresh.value)> "修改"
				
				<div[w:100% pt:40].antall route='/login'>
					if isLogin || username === 'admin'
						<div[ta:center mb:10]> '您已登录'

					<div[ta:center mb:5] [visibility:hidden]=isLogin> '请登录后，进行命令指令下发操作！'
					<div[d:vflex ja:center g:5].mdlogin>
						<div>
							<span[visibility:hidden]=isLogin> '用户名:'
							<input$uname[ml:3] [visibility:hidden]=isLogin type='string' placeholder='输入...'>
						<div>
							<span[visibility:hidden]=isLogin> '密码:'
							<input$pass[ml:7] [visibility:hidden]=isLogin type='password' placeholder='输入...'>
						<div>
							<button[mr:4].btn.btn-danger route-to='/antall' [visibility:hidden]=isLogin> '取消'
							<button.btn.btn-success @click=login($uname.value,$pass.value) route-to='/antall' [visibility:hidden]=isLogin> '登录'
				<div[w:100% d:vflex a:center pt:30].antall route='/logout'>
					<h1> '欢迎使用天线精灵远控系统'
					<div> '如果要进行设备操控，请您登录后进行操作'
					<button[mt:10].btn.btn-success route-to='/login'> "登录"
				# <div route='/test'>
				# 	<test>


imba.mount <app>