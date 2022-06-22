tag antcard
	prop rdata
	prop online
	prop alarm
	prop offline
	def opcamera
		console.log '打开摄像头'
	def mount
	def countDev da
		online=alarm=offline=0
		for item in da.Devices
			if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length === 0
				online++
			if item.StatusList[item.StatusList.length - 1].Value === 'Disconnected'
				offline++
			if item.StatusList[item.StatusList.length - 1].Value === 'Normal' && item.FaultList.length !== 0
				alarm++




	def render()
		countDev(rdata)
		# console.log 'card load'
		
		<self> 
			<div[w:100% c:gray3 d:vflex bd:solid 1px gray4 bg:linear-gradient(0.25turn,rgb(94,94,122),rgb(5,21,44)) rd:10px].ant>
				<div[w:100% h:20% ta:center p:2 2].anttitle> rdata.AntName
				<div[w:100% h:80% d:vflex].antbody>
					<button[w:100% h:80% d:hflex ja:center shadow:none bd:none bgc:transparent c:gray2].antstatus1 route-to="/txst/{rdata.AntNo}">
						<img[size:20% p:2] src='./imgs/antcardimg.png'>
						<div[w:38% d:vflex]> for item,i in rdata.Devices[0].StatusList
							if i < 4
								<div[d:hflex w:100% h:25% ja:center]>
									<div[]> item.StName + ':'
									<div[c:teal4 fs:16px fw:bold ff:mono ml:2 o@off:0].antstatus> item.Value
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
						<div[w:30% d:hflex].antagc> for agc in rdata.Devices[0].StatusList # 这里第0个就是伺服，每个天线第0个都是伺服
							if agc.StName == "SignalLevel"
								<div> 'AGC:'
								<div[c:rgb(23,168,62) ml:3]> agc.Value
						<div[w:30% d:hflex].antlock> for agc in rdata.Devices[0].StatusList # 这里第0个就是伺服，每个天线第0个都是伺服
							if agc.StName == "SignalQuality"

								# <img src=''> 'lock pic'
								<div[ml:5]> agc.Value
						<button[shadow:none bd:none bgc:transparent c:gray2 zi:10 w:40% ml:auto d:hflex ja:right].antcam @click=opcamera>
							<img src='./imgs/cam.png'>
							<div[ml:3]> '监控'

