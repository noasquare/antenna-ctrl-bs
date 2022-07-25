tag tpframe
	prop devdata
	isSaved = no
	squares = []	
	selection = null
	restoredata = []
	context = false
	devname = []
	def addsquare e
		# console.log $devname
		return context = false if context
		squares = squares.concat({width:100,height:100,x:e.offsetX,y:e.offsetY})
		selection = squares[squares.length - 1] # 这里是选择最新的圆形
		mount!
		# squarex.push(e.offsetX)
		# squarey.push(e.offsetY)
	def setSelection i, showContext = false
		selectIndex = i
		context = showContext
		selection = squares[i]
		devname[i] = '设备名称'
		console.log devname
		# restoredata = selection # 存储用来恢复的data
	
	css d:block pos:relative

	css svg bg:teal7/50 w:100% h:27em
	css @touch cursor:pointer
	css .context-menu 
		pos:absolute w:50% t:-23 l:50% px:5 py:3 bg:white/90 rd:lg
		bxs:lg transform: translate(-50%,-50%) 
		p fs:sm- c:black mb:2
		input w:100%
	def savedata
		isSaved = yes
		console.log 'prepare to save to database!'
	def savecurrent index
		devname[index] = $devname.value
		
	def build
		x=y=10
	def clear
		squares = []
	def delcurrent i
		squares.splice(i,1)
		context = no
		# console.log "删除第{selectIndex + 1}个元素"
	def restorecurrent i
		squares[i].width = 100
		squares[i].height = 100
		context = no
	def render
		# console.log $devname.value
		<self>
			if context
				<div[o@off:0].context-menu ease>
					<p> "第{selectIndex + 1}元素位置： ({selection..x}, {selection..y})"
					<div[d:grid gtc:1fr 1fr g:3]>
						<input type="range" bind=selection..height max="800">
						<input type="range" bind=selection..width max="800">
						<input type="range" bind=selection..x max="800">
						<input type="range" bind=selection..y max="800">
						<input$devname type="text" bind=devname[selectIndex]>
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=savecurrent(selectIndex)> '名称确认'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=delcurrent(selectIndex)> '删除'
						<button[fs:sm- p:1 bgc:gray3 rd:2] @click=restorecurrent(selectIndex)> '恢复'
			<svg @click=addsquare >
				for square,i in squares
					const selected = selection..x === square.x && selection..y === square.y
					# console.log selection..x === square.x
					<rect rx=10 ry=10 width=square.width height=square.height
						[x:{square.x} y:{square.y} fill:clear stroke:teal5 stroke-width:1px]
						[fill:teal5/20]=selected
						@click.stop=setSelection(i)
						@contextmenu.prevent=setSelection(i,true)>
				<defs>
					<marker#arrowhead[fill:teal5] markerWidth="5" markerHeight="5" 
					refX="0" refY="2" orient="auto">
						<polygon points="0 0, 5 2, 0 4">
				<polyline[stroke:teal5 fill:clear] points="0,40 40,40 40,120 50,120"
				stroke-width="2" marker-end="url(#arrowhead)">			
				
			<div[d:hflex ja:center g:4]>
				<button[p:2 rd:2] @click=addsquare> '添加'
				<button[p:2 rd:2] @click=clear!> '清空'
				<button[p:2 rd:2] @click=savedata> '保存'



