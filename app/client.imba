global css html
	ff:sans
# global css body bg:yellow1
global css body bg:center url('./imgs/bg-antenna.jpg') m:0 p:0

tag app
	css .main m:0 p:5px of:hidden d:hflex h:95% bdt:solid rgb(12,100,100)
		.menu mr:5px w:15% ta:center bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.body bg:rgba(11,41,49,.6) w:68% ta:center ai:center shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
		.sider ml:5px bg:yellow4 w:22% bg:rgba(11,41,49,.6) shadow:inset 0px 0px 20px 5px rgb(12,100,100) bd:solid rgb(12,100,100)
	# css .footer bg:gray6 h:5% ta:center o:30% bg:gray8
	css .header bg:rgba(11,41,49,.6) h:5% d:hflex ta:right shadow:inset 0px 0px 10px 5px rgb(12,100,100)
		.logo w:40% d:flex ja:center
		.setting w:30% ta:left
		.notify w:30%
	css .collapsible bgc:rgb(14,73,91) @hover:rgb(54,73,91) c:#fff cursor:pointer p:18px w:100% bd:none ta:left outline:none fs:15px 
		.active bgc:#ccc
	css .mcontent p:0 m:0 d:none of:hidden list-style-type:none 
		.mbtn p:10px 12px d:block of:hidden bgc:transparent @hover:rgb(54,73,91) outline:none fs:14px ta:left bd:none w:100%  c:#fff
	
	def mount
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
			<div.setting> "setting"
			<div.logo>
				<img[scale:0.5] src='./imgs/logo.png'>
				<span[c:#fff fs:18px]> "天线控制软件"
			<div.notify>
				<p> "notify"
		<div.main>
			<div.menu> "menu"
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

			<div.body> "body"
			<div.sider> "sider"
		# <div.footer> "footer"


imba.mount <app>