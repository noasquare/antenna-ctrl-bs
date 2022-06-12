tag ctrsider
	css .sdtitle c:rgb(31,219,220) fw:bold p:10px bdb:solid 1px rgb(31,219,220)
	css	.sdstatus d:hflex p:5px c:gray3 fs:14px
		.status-title-left w:50% ta:left
		.status-title-right w:50% ta:right
	css	.status-value mr:1rem pr:1 c:rgb(23,168,62)
	css	.accordion --bs-accordion-bg:transparent bd:none --bs-accordion-border-width:0px
		.triangle-right w:0 h:0 bdt:5px solid transparent bdl:10px solid gray3 bdb:5px solid transparent
		.triangle-down w:0 h:0 bdt:10px solid gray3 bdl:5px solid transparent bdr:5px solid transparent
	prop ws
	prop data
	# prop inputvalue
	prop ant
	def sendremote
		let data = 
			AntNo : ant
			DevNo : data.DevNo
			StName : "RemoteOn"
			value : $remote.checked
		console.log data
		ws.send(JSON.stringify(data))
	def sendpara item,itemvalue
		if itemvalue
			let data =
				AntNo : ant
				DevNo : data.DevNo
				StName : item.StName
				Value : itemvalue
			console.log data
			ws.send(JSON.stringify(data))
	def remotestatus list
		# console.log '检查远控状态'
		for item in list
			if item.StName == 'RemoteOn'
				if item.Value is 'False'
					$remote.checked = no
				else
					$remote.checked = yes


	def mount

	def render()
		remotestatus(data.StatusList) # 显示远控的状态
		<self> 
			<div>
				<div.sdtitle> "设备控制" 
					<div[d:inline float:right].form-check.form-switch>
						<input$remote.form-check-input type="checkbox" role="switch" id="flexSwitchCheckDefault" @change=sendremote>
					if $remote.checked == no
						<div[c:gray3 fs:14px d:inline float:right mr:3]> '远控关闭'
					else 
						<div[c:gray3 fs:14px d:inline float:right mr:3]> '远控开启'


				<div.accordion id='ctl'>
					<div.accordion-item>
						<h6.accordion-header id='headingOne'>
							<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-control='collapseOne'>
								<div[w:90%]> data.DevName+'参数控制' # 变量
								<div[w:10% ml:auto].triangle-right>
						<div.accordion-collapse.collapse.show id='collapseOne' aria-labelledby='headingOne' data-bs-parent='#ctl'>
							<div[m:0 p:5px d:vflex ai:left].accordion-body> for ctritem,stindex in data.StatusList
								if ctritem.ReadOnly == no && ctritem.StName !== 'RemoteOn'
									<div[d:hflex ai:center p:1 2]>
										<div[fs:14px c:gray3 ml:3]>  ctritem.StName+':' # 变量
										<input[h:7 fs:14px bgc:transparent c:gray4 w:50% bd:solid 1px rgb(31,219,220) rd:5px m:1 float:right ml:auto] placeholder="{ctritem.Value}" @change=sendpara(ctritem,this.value) value="{ctritem.Value}" type='number' step='.01'>
							# <div[p:5 d:hflex ja:center mt:3].ctlbtn>
							# 	<button[mr:3].btn.btn-danger.btn-sm> '重置'
							# 	<button.btn.btn-success.btn-sm @click=sendpara($ctrinput.Value)> '提交'
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

						<div.accordion-collapse.collapse.show id='collapseStatus' aria-labelledby='headingStatus' data-bs-parent='#ctl-status'> for item,index in data.StatusList
							if index >= 4 
								<div[m:0 p:5px d:hflex ai:left].accordion-body>
									<div[fs:14px c:gray3 ml:3]> item.StName+':'
									<div[fs:14px ml:auto mr:5 c:rgb(31,219,220)]> item.Value
