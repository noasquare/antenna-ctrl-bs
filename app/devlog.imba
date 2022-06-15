
let table
let tabledata
let sortCol
let sortAsc = no
const pageSize = 15
let curPage = 1
let searchflag = no
let searchdata

tag devlog
	css th cursor:pointer
	css input color-scheme:dark
			
	def sort e
		let thisSort = e.target.dataset.sort
		# console.log e.target.dataset.sort
		sortAsc = !sortAsc if sortCol === thisSort # 如果重复点击就是升序降序
		sortCol = thisSort
		console.log 'sort dir is',sortAsc
		# console.log tabledata
		tabledata.sort do(a,b)
			# console.log a,b
			if a[sortCol] < b[sortCol]
				return sortAsc ? 1 : -1
			if a[sortCol] > b[sortCol]
				return sortAsc ? -1 : 1
			return 0
		let result = ''
		# console.log tabledata
		tabledata.filter(do(row,index)
			let start = (curPage - 1)*pageSize
			let end = curPage * pageSize
			return yes if (index >= start && index < end)
			).forEach do(c)
			result += `<tr>
			<td> {c.id}
			<td> {c.antname}
			<td> {c.ctrlip}
			<td> {c.devname}
			<td> {c.cmdtime}
			<td> {c.ctrlcmd}
			<td> {c.ctrluser}
			`
		table.innerHTML = result if result
	
	def renderTable tada
		let result = ''
		# console.log tabledata
		tada.filter(do(row,index)
			let start = (curPage - 1)*pageSize
			let end = curPage * pageSize
			return yes if (index >= start && index < end)
			).forEach do(c)
			result += `<tr>
			<td> {c.id}
			<td> {c.antname}
			<td> {c.ctrlip}
			<td> {c.devname}
			<td> {c.cmdtime}
			<td> {c.ctrlcmd}
			<td> {c.ctrluser}
			`
		table.innerHTML = result if result
	
	def logload url # 从数据库查询得到的信息

		table = querySelector('#logtable tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				tabledata = data
				renderTable(tabledata)

	def prevPage
		curPage-- if curPage > 1
		if searchflag
			renderTable(searchdata)
		else
			renderTable(tabledata)
	def nextPage
		if !searchflag
			curPage++ if curPage*pageSize < tabledata.length
			renderTable(tabledata)
		else
			curPage++ if curPage*pageSize < searchdata.length
			renderTable(searchdata)

	def searchdate
		console.log '开始日期查询'
		let test = tabledata.filter do(row,index)
			if row.cmdtime > $startdate.value && row.cmdtime < $enddate.value
				return yes
		if test.length > 0
			console.log test.length
			searchflag = yes
			searchdata = test
			renderTable(searchdata)
		else
			searchflag = no
			renderTable(tabledata)


	def searchdev
		console.log '开始查询列表'
		let test = tabledata.filter(do(row,index)
			if (row.devname === $devname.value)
				return yes
			)
		console.log test
		if test.length > 0
			searchflag = yes
			console.log '查询找到了'
			searchdata = test
			console.log searchdata
			renderTable(searchdata)
		else
			searchflag = no
			console.log '啥都没找到'
			renderTable(tabledata)
		# console.log tabledata

	

	def reset
		console.log '重置查询'
		$startdate.value = ''
		$enddate.value = ''
		searchflag = no
		renderTable(tabledata)
		

	def mount
		document.querySelectorAll('#logtable thead tr th').forEach do(t)
			t.addEventListener('click',sort,no)
		logload('/loglist')

	# def render
	# 	console.log 'devlog render'


	<self[o@off:0.5 x@in:5px tween:all 2s ease]> 
		<div[d:hflex ja:center fs:14px].devsearch>
			<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备日志'
			<div[d:hflex]>
				<div> '输入查询'
				<input$devname[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text' @change=searchdev placeholder="输入设备名称-回车查询"> 
			<div[d:hflex pl:5]>
				<div> '开始日期'
				<input$startdate[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
			<div[d:hflex pl:5]>
				<div> '结束日期'
				<input$enddate[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
			<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6) @hover:linear-gradient(teal6,teal4)] @click=searchdate> "查询"
			<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 mr:5 bg:linear-gradient(teal3,teal6) @hover:linear-gradient(teal6,teal4)] @click=reset> "重置"

		<div[p:3 5].devtable>
			<table$logtable[w:100% ta:center].table#logtable>
				<thead[bgc:teal5 c:black]>
					<tr>
						<th scope="col" data-sort='id'> '设备ID'
						<th scope="col" data-sort='loc'> '所属塔基'
						<th scope="col" data-sort='ip'> '设备IP'
						<th scope="col" data-sort='name'> '设备简称'
						<th scope="col" data-sort='time'> '发生时间'
						<th scope="col" data-sort='cmd'> '发送命令'
						<th scope="col" data-sort='user'> '操作人员'
				<tbody[c:gray3 border-color:rgb(64,73,91) o@off:0 tween:all 1s ease-in]>
					<tr> <td colSpan="6"> <i> 'Loading...'
		<button[mr:5].btn.btn-secondary @click=prevPage> "前一页"
		<button.btn.btn-secondary @click=nextPage> "下一页"

