tag antcard
	prop rdata
	prop online
	prop alarm
	prop offline
	def mount
	def countDev da
		online=alarm=offline=0
		for item in da.Devices
			if item.StatusList[item.StatusList.length - 1].Value == 'Normal'
				online++
			else if item.StatusList[item.StatusList.length - 1].Value == 'Disconnected'
				offline++
			else
				alarm++




	def render()
		countDev(rdata)
		console.log 'card load'
		
		<self> 
			<button[w:100% c:gray3 d:vflex bd:solid 1px gray4 bg:linear-gradient(0.25turn,rgb(94,94,122),rgb(5,21,44)) rd:10px].ant route-to="/txst/{rdata.AntNo}">
				<div[w:100% h:20% ta:center p:2 2].anttitle> rdata.AntName
				<div[w:100% h:80% d:vflex].antbody>
					<div[w:100% h:80% d:hflex ja:center].antstatus1>
						<img[size:20% p:2] src='./imgs/antcardimg.png'>
						<div[w:38% d:vflex]> for item,i in rdata.Devices[0].StatusList
							if i < 4
								<div[d:hflex w:100% h:25% ja:center]>
									<div[]> item.StName + ':'
									<div[c:teal4 fs:16px fw:bold ff:mono ml:2 o@off:0].antstatus> item.Value
							# <div[d:hflex w:100% h:25% ja:center]>
							# 	<div[]> '俯仰:'
							# 	<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
							# <div[d:hflex w:100% h:25% ja:center]>
							# 	<div[]> '极化1:'
							# 	<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
							# <div[d:hflex w:100% h:25% ja:center]>
							# 	<div[]> '极化2:'
							# 	<div[c:rgb(23,168,62) ml:3].antstatus> '0.00'
						<div[w:38% d:vflex g:10px]> 
							<div[d:hflex w:100% ja:center]>
								<div[p:1 2 bgc:teal7 rd:4px c:gray2 fs:12px mr:3]> online
								<div[fs:14px c:teal5]> '在线'
							<div[d:hflex w:100% ja:center]>
								<div[p:1 2 bgc:red7 rd:4px c:gray2 fs:12px mr:3]> alarm
								<div[fs:14px c:teal5]> '告警'
							<div[d:hflex w:100% ja:center]>
								<div[p:1 2 bgc:sky7 rd:4px c:gray2 fs:12px mr:3]> offline
								<div[fs:14px c:teal5]> '离线'
							


					<div[p:4 5 w:100% h:20% d:hflex].antstatus2>
						<div[w:30% d:hflex].antagc> for agc in rdata.Devices[0].StatusList
							if agc.StName == "SignalLevel"
								<div> 'AGC:'
								<div[c:rgb(23,168,62) ml:3]> agc.Value
						<div[w:30% d:hflex].antlock>
							# <img src=''> 'lock pic'
							<div[ml:5]> 'LOCK'
						<div[w:40% ml:auto d:hflex ja:right].antcam>
							<img src='./imgs/cam.png'>
							<div[ml:3]> '监控'

