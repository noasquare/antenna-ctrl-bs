import axios from 'axios'
tag tpframe
	prop display
	prop devdata
	prop tpelement
	isSaved
	squares = []	
	selection = null
	restoredata = []
	context = false
	devname = []
	upConnect = no
	downConnect = no
	def addsquare e
		return '' if display
		# wratio = e.offsetX/tpelement.clientWidth
		# hratio = e.offsetX/tpelement.clientWidth
		return context = false if context
		squares = squares.concat({devname:'设备名称',width:100,height:100,x:e.offsetX,y:e.offsetY,upcon:no,uppoint:{upmovex:0,upmovey:0},downcon:no,downpoint:{downmovex:0,downmovey:0},leftcon:no,leftpoint:{leftmovex:0,leftmovey:0},rightcon:no,rightpoint:{rightmovex:50,rightmovey:50}})
		selection = squares[squares.length - 1] # 这里是选择最新的圆形
		mount!
		# squarex.push(e.offsetX)
		# squarey.push(e.offsetY)
	def setSelection i, showContext = false
		return '' if display
		selectIndex = i
		context = showContext
		selection = squares[i]
		devname[i] = '设备名称'
		console.log devname
		# restoredata = selection # 存储用来恢复的data
	
	css d:block pos:relative

	css svg bg:teal7/50 w:100% h:25em
	css @touch cursor:pointer
	css .context-menu 
		pos:absolute w:50% t:-23 l:50% px:5 py:3 bg:white/90 rd:lg
		bxs:lg transform: translate(-50%,-50%) 
		p fs:sm- c:black mb:2
		input w:100%
	def savedata
		# isSaved = yes
		console.log squares
		axios({
			method:'post'
			url:'/savetuop'
			data:JSON.stringify(squares)
		}).then do(res)
			console.log res

		# try
		# 	let res = await window.fetch('/savetuop',
		# 		method : 'POST'
		# 		body : JSON.stringify(squares)
		# 	)
		# 	console.log 'complete' + res.json!
		# catch er
		# 	console.log 'error is ' + er
		# console.log 'prepare to save to database!'
	def savecurrent index
		devname[index] = $devname.value
	def build
		x=y=10
	def clear
		# window.alert('清除后无法恢复')
		squares = []
	def delcurrent i
		squares.splice(i,1)
		context = no
		# console.log "删除第{selectIndex + 1}个元素"
	def restorecurrent i
		squares[i].width = 100
		squares[i].height = 100
		context = no
	def mount 
		isSaved = no
	def render
		# console.log tpelement
		# console.log $upp.value
		# console.log selection..downcon
		<self>
			if context
				<div[o@off:0].context-menu ease>
					<input$devname type="text" bind=selection..devname>
					# <input$devname type="text" bind=devname[selectIndex]>
					<p> "第{selectIndex + 1}元素位置： ({selection..x}, {selection..y})"
					<div[d:grid gtc:1fr 1fr g:3]>
						<input type="range" bind=selection..height max="400">
						<input type="range" bind=selection..width max="800">
						<input type="range" bind=selection..x max=tpelement.clientWidth>
						<input type="range" bind=selection..y max=tpelement.clientHeight>
					<p> "第{selectIndex + 1}元素连线位置"
					<div[d:hflex j:center g:2]>
						<div[d:hflex ja:center g:1]>
							<input$upp[w:3] type="checkbox" bind=selection..upcon> 
							<span[c:black]> "上连线"
						<div[d:hflex ja:center g:1]>
							<input[w:3] type="checkbox" bind=selection..downcon> 
							<span[c:black]> "下连线"
						<div[d:hflex ja:center g:1]>
							<input[w:3] type="checkbox" bind=selection..leftcon> 
							<span[c:black]> "左连线"
						<div[d:hflex ja:center g:1]>
							<input[w:3] type="checkbox" bind=selection..rightcon> 
							<span[c:black]> "右连线"
					<div[d:grid gtc:1fr 1fr g:3]>
						if selection..upcon
							<input type="range" bind=selection..upmovex max="100" min='-100'>
							<input type="range" bind=selection..upmovey max="100" min='-100'>
						if selection..downcon
							<input type="range" bind=selection..downmovex max="-100" min='-200'>
							<input type="range" bind=selection..downmovey max="100" min='-100'>
						if selection..leftcon
							<input type="range" bind=selection..leftmovex max="200" min='0'>
							<input type="range" bind=selection..leftmovey max="100" min='-100'>
						if selection..rightcon
							<input type="range" bind=selection..rightmovex max="200" min='0'>
							<input type="range" bind=selection..rightmovey max="100" min='-100'>
					<div[d:hflex ja:center g:3]>
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=savecurrent(selectIndex)> '保存'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=delcurrent(selectIndex)> '删除'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=restorecurrent(selectIndex)> '恢复'
			<svg @click=addsquare [bgc:clear]=display>
				<defs>
					<marker#arrowhead[fill:teal5] markerWidth="5" markerHeight="5" 
					refX="0" refY="2" orient="auto">
						<polygon points="0 0, 5 2, 0 4">
				for square,i in squares
					const selected = selection..x === square.x && selection..y === square.y
					
					# console.log selection..x === square.x
					<rect rx=10 ry=10 width=square.width height=square.height
						[x:{square.x} y:{square.y} fill:clear stroke:teal5 stroke-width:1px]
						[fill:teal5/20]=selected [fill:clear]=display
						@click.stop=setSelection(i)
						@contextmenu.prevent=setSelection(i,true)>
					if square.upcon
						let point = `{square..x + square..width/2},{square..y} {square..x + square..width/2},{square..y - square..upmovex} {square..x + square..width/2 + square..upmovey},{square..y - square..upmovex}`
						<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
					if square.downcon
						let point = `{square..x + square..width/2},{square..y + square.height} {square..x + square..width/2},{square..y - square..downmovex} {square..x + square..width/2 + square..downmovey},{square..y - square..downmovex}`
						<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
					if square.rightcon
						let point = `{square..x + square..width},{square..y + square.height/2} {square..x + square..width + square..rightmovex },{square..y + square.height/2} {square..x + square..width + square..rightmovex },{square..y + square.height/2 + square..rightmovey}`
						<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
					if square.leftcon
						let point = `{square..x},{square..y + square.height/2} {square..x + square..width/2 - square..leftmovex},{square..y + square.height/2} {square..x + square..width/2 - square..leftmovex},{square..y + square.height/2 + square..leftmovey}`
						<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
				
			<div[d:hflex j:right g:4] [d:none]=display>
				<button.btn.btn-success.btn-sm @click=addsquare> '添加'
				<button.btn.btn-danger.btn-sm @click=clear> '清空'
				<button.btn.btn-success.btn-sm @click=savedata> '保存'



