import axios from 'axios'
tag tpframe
	prop display
	prop devdata
	prop tpelement
	prop squares
	prop antno
	isSaved
	# squares = tpdata	
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
		squares = squares.concat({id:111,antname:antno,devname:'设备名称',width:100,height:100,x:e.offsetX,y:e.offsetY,upcon:no,uppointx:0,uppointy:0,downcon:no,downpointx:0,downpointy:0,leftcon:no,leftpointx:0,leftpointy:0,rightcon:no,rightpointx:50,rightpointy:50})
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
		context = no
		# isSaved = yes
		let anttpdata = squares.filter(do(item)
			item.antname === antno
			)
		console.log anttpdata
		axios.post('/savetuop',
			data: JSON.stringify(anttpdata)  # 这里的data应该只能是每个天线对应的 框图数组。现在是全部的数组
			# antNo : antno
			).then do(res)
				console.log res

	# def gettpdata
	# 	axios.get('/savetuop')
	# 		.then do(res)
	# 			console.log res
	# 			squares = res.data


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
		console.log '拓扑mount开始'
		isSaved = no
		# gettpdata!

	def render
		# console.log squares
		# console.log antno
		# console.log tpelement
		# console.log $upp.value
		# console.log selection..downcon
		<self>
			if context
				<div[o@off:0].context-menu ease>
					<input$devname type="text" bind=selection..devname >
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
							<input type="range" bind=selection..uppointx max="100" min='-100'>
							<input type="range" bind=selection..uppointy max="100" min='-100' @dblclick=(selection.uppointy = 0)>
						if selection..downcon
							<input type="range" bind=selection..downpointx max="-100" min='-200'>
							<input type="range" bind=selection..downpointy max="100" min='-100' @dblclick=(selection.downpointy = 0)>
						if selection..leftcon
							<input type="range" bind=selection..leftpointx max="200" min='0'>
							<input type="range" bind=selection..leftpointy max="100" min='-100' @dblclick=(selection.leftpointy = 0 )>
						if selection..rightcon
							<input type="range" bind=selection..rightpointx max="200" min='0'>
							<input type="range" bind=selection..rightpointy max="100" min='-100' @dblclick=(selection.rightpointy = 0 )>
					<div[d:hflex ja:center g:3]>
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=savedata> '保存'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=delcurrent(selectIndex)> '删除'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=restorecurrent(selectIndex)> '恢复'
			<svg @click=addsquare [bgc:clear]=display>
				<defs>
					<marker#arrowhead[fill:teal5] markerWidth="5" markerHeight="5" 
					refX="0" refY="2" orient="auto">
						<polygon points="0 0, 5 2, 0 4">
				
				if squares
					for square,i in squares
						if square.antname === antno
							const selected = selection..x === square.x && selection..y === square.y
							# console.log selection..x === square.x
							<rect rx=10 ry=10 width=square.width height=square.height
								[x:{square.x} y:{square.y} fill:clear stroke:teal5 stroke-width:1px]
								[fill:teal5/20]=selected [fill:clear]=display
								@click.stop=setSelection(i)
								@contextmenu.prevent=setSelection(i,true)>
							if square.upcon
								let point = ''
								if square.uppointy == 0
									point = `{square..x + square..width/2},{square..y} {square..x + square..width/2},{square..y - square..uppointx}`
								else
									point = `{square..x + square..width/2},{square..y} {square..x + square..width/2},{square..y - square..uppointx} {square..x + square..width/2 + square..uppointy},{square..y - square..uppointx}`
								<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
							if square.downcon
								let point = ''
								if square.downpointy == 0
									point = `{square..x + square..width/2},{square..y + square.height} {square..x + square..width/2},{square..y - square..downpointx}`
								else
									point = `{square..x + square..width/2},{square..y + square.height} {square..x + square..width/2},{square..y - square..downpointx} {square..x + square..width/2 + square..downpointy},{square..y - square..downpointx}`
								<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
							if square.rightcon
								let point = ''
								if square.rightpointy == 0
									point = `{square..x + square..width},{square..y + square.height/2} {square..x + square..width + square..rightpointx },{square..y + square.height/2}`
								else
									point = `{square..x + square..width},{square..y + square.height/2} {square..x + square..width + square..rightpointx },{square..y + square.height/2} {square..x + square..width + square..rightpointx },{square..y + square.height/2 + square..rightpointy}`
								<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
							if square.leftcon
								let point = ''
								if square.leftpointy == 0
									point = `{square..x},{square..y + square.height/2} {square..x + square..width/2 - square..leftpointx},{square..y + square.height/2}`
								else
									point = `{square..x},{square..y + square.height/2} {square..x + square..width/2 - square..leftpointx},{square..y + square.height/2} {square..x + square..width/2 - square..leftpointx},{square..y + square.height/2 + square..leftpointy}`
								<polyline[stroke:teal5 fill:clear] points=point stroke-width="2" marker-end="url(#arrowhead)">			
					
			<div[d:hflex j:right g:4] [d:none]=display>
				<button.btn.btn-success.btn-sm @click=addsquare> '添加'
				<button.btn.btn-danger.btn-sm @click=clear> '清空'
				<button.btn.btn-success.btn-sm @click=savedata> '保存'



