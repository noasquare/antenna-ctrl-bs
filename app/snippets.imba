						# for item,inx in logdata
						# 	<tr>
						# 		<th scope='row'> item.antname
						# 		<td> item.ctrlip
						# 		<td> item.ctrlcmd
						# 		<td> item.devname
						# 		<td> item.cmdtime
						# 		<td> item.ctrluser
						# 		<td> item.driverclass



			# <div.sdtitle> "设备控制"
			# <div.sdstatus>
			# 	<div.status-title-left> '实时参数'
			# 	<div.status-title-right> '设备名称：'
			# 		<div[d:inline]> 'ACU11A' # 变量 设备名称
			# <div[p:5px m:10px h:10% c:gray3 bgc:gray8 bd:solid 1px gray4 rd:5px ofy:scroll].status-box> for item in data
			# 		if item.antid === route.params.id
			# 	<span.status-content> '俯仰: '

			# 			<span.status-value> item.devlist[0].za
			# 	<span.status-content> '方位: '
			# 	<span.status-value> data[route.params.id]['server'].el
			# 	<span.status-content> 'AGC: '
			# 	<span.status-value> data[route.params.id]['server'].agc
			# <div.accordion id='ctl'>
			# 	<div.accordion-item>
			# 		<h6.accordion-header id='headingOne'>
			# 			<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseOne' aria-expanded='true' aria-control='collapseOne'>
			# 				<div[w:90%]> '极化切换' # 变量
			# 				<div[w:10% ml:auto].triangle-right>

			# 		<div.accordion-collapse.collapse.show id='collapseOne' aria-labelledby='headingOne' data-bs-parent='#ctl'>
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> '极化方式:' # 变量
			# 				<select[fs:12px bgc:transparent c:gray4 w:50% ml:auto bd:solid 1px rgb(31,219,220)].form-select.form-select-sm>
			# 					<option selected> 'test'
			# 					<option value='1'> 'one'
			# 					<option value='2'> 'two'
			# 					<option value='3'> 'three'
			# 			<div[p:5 d:hflex ja:center mt:3].ctlbtn>
			# 				<button[mr:3].btn.btn-danger.btn-sm> '重置'
			# 				<button.btn.btn-success.btn-sm> '提交'
			# 	<div.accordion-item>
			# 		<h6.accordion-header id='headingTwo'>
			# 			<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseTwo' aria-expanded='true' aria-control='collapseTwo'>
			# 				<div[w:90%]> '极化切换'
			# 				<div[w:10% ml:auto].triangle-right>

			# 		<div.accordion-collapse.collapse.show id='collapseTwo' aria-labelledby='headingTwo' data-bs-parent='#ctl'>
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> '角度设置:'
			# 				<select[fs:12px bgc:transparent c:gray4 w:50% ml:auto bd:solid 1px rgb(31,219,220)].form-select.form-select-sm>
			# 					<option selected> 'test'
			# 					<option value='1'> 'one'
			# 					<option value='2'> 'two'
			# 					<option value='3'> 'three'
			# 			<div[p:5 d:hflex ja:center m:5].ctlbtn>
			# 				<button[mr:3].btn.btn-danger.btn-sm> '重置'
			# 				<button.btn.btn-success.btn-sm> '提交'
								
			# <div.sdtitle> '更多参数'
			# <div.accordion id='ctl-status'>
			# 	<div.accordion-item>
			# 		<h6.accordion-header id='headingStatus'>
			# 			<button[d:hflex p:2 4 w:100% bgc:rgb(14,73,91) @hover:rgb(54,73,91) ta:left c:gray3 outline:none bd:none ai:center].accordian-button type='button' data-bs-toggle='collapse' data-bs-target='#collapseStatus' aria-expanded='true' aria-control='collapseStatus'>
			# 				<div[w:90%]> '设备参数'
			# 				<div[w:10% ml:auto].triangle-right>

			# 		<div.accordion-collapse.collapse.show id='collapseStatus' aria-labelledby='headingStatus' data-bs-parent='#ctl-status'>
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> 'ACU电平:'
			# 				<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> data[route.params.id]['server'].agc
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> '方位:'
			# 				<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> '0'
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> '俯仰:'
			# 				<div[fs:14px w:10% ml:auto c:rgb(31,219,220)]> '0'
			# 			<div[m:0 p:5px d:hflex ja:center].accordion-body>
			# 				<div[fs:14px c:gray3 ml:3]> '电机状态:'
			# 				<div[fs:14px ml:auto c:rgb(31,219,220) pr:5]> '正常'
			
