
let table
let tabledata
let sortCol
let sortAsc = no
const pageSize = 10
let curPage = 1

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
	
	def renderTable
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
	
	def logload url # 从数据库查询得到的信息

		table = querySelector('#logtable tbody')
		window.fetch(url).then do(res)
			res.json!
			.then do(data)
				tabledata = data
				renderTable!

	def prevPage
		curPage-- if curPage > 1
		renderTable!
	def nextPage
		curPage++ if curPage*pageSize < tabledata.length
		renderTable!


	def mount
		document.querySelectorAll('#logtable thead tr th').forEach do(t)
			# console.log t
			t.addEventListener('click',sort,no)

		
		logload('/loglist')

	# def render
	# 	console.log 'devlog render'


	<self[o@off:0.5 x@in:5px tween:all 2s ease]> 
		<div[d:hflex ja:center fs:14px].devsearch>
			<div[bdl:solid 10px teal4 ml:3 pl:2 fs:18px mr:auto]> '阵地设备日志'
			<div[d:hflex]>
				<div> '设备名称'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px] type='text'> 
			<div[d:hflex pl:5]>
				<div> '开始日期'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
			<div[d:hflex pl:5]>
				<div> '结束日期'
				<input[bgc:transparent bd:solid 1px gray4 ml:3 rd:4px c:gray3] type='date'> 
			<button[bd:none shadow:none bgc:teal5 c:white rd:6px p:1 3 m:1 5 bg:linear-gradient(teal3,teal6)]> "查询"

		<div[p:3 5 ofy:scroll].devtable>
			<table[w:100% ta:center].table#logtable>
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

