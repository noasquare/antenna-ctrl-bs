tag antcard
	prop rdata
	<self> 
		<button[w:100% c:gray3 d:vflex bd:solid 1px gray4 bg:linear-gradient(0.25turn,rgb(94,94,122),rgb(5,21,44)) rd:10px].ant route-to="/txst/{rdata}">
			<div[w:100% h:20% ta:center p:2 2].anttitle> '天线1'
			<div[w:100% h:80% d:vflex].antbody>
				<div[w:100% h:80% d:hflex].antstatus1>
					<img[p:5 w:24%] src='./imgs/antcardimg.png'>
					<div[w:38% d:vflex]>
						<div[d:hflex w:100% h:25% ja:center]>
							<div[]> '方位:'
							<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
						<div[d:hflex w:100% h:25% ja:center]>
							<div[]> '俯仰:'
							<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
						<div[d:hflex w:100% h:25% ja:center]>
							<div[]> '极化1:'
							<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
						<div[d:hflex w:100% h:25% ja:center]>
							<div[]> '极化2:'
							<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
					<div[w:38% d:vflex ]>
						<div[d:hflex w:100% h:33% ja:center]>
							<div[p:1 2 bgc:green7 rd:4px c:gray2 fs:12px mr:3]> '5'
							<div[fs:14px c:teal5]> '在线'
						<div[d:hflex w:100% h:33% ja:center]>
							<div[p:1 2 bgc:red6 rd:4px c:gray2 fs:12px mr:3]> '2'
							<div[fs:14px c:teal5]> '告警'
						<div[d:hflex w:100% h:33% ja:center]>
							<div[p:1 2 bgc:sky6 rd:4px c:gray2 fs:12px mr:3]> '1'
							<div[fs:14px c:teal5]> '离线'

				<div[p:4 5 w:100% h:20% d:hflex].antstatus2>
					<div[w:30% d:hflex].antagc>
						<div> 'AGC:'
						<div[c:rgb(23,168,62) ml:3]> '00.0'
					<div[w:30% d:hflex].antlock>
						# <img src=''> 'lock pic'
						<div[ml:5]> 'LOCK'
					<div[w:40% ml:auto d:hflex ja:right].antcam>
						<img src='./imgs/cam.png'>
						<div[ml:3]> '监控'

