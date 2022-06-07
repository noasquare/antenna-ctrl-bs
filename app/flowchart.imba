
tag flowchart
	css .tuop p:4 pos:rel d:block cursor:grab rd:5px
		@touch scale:1.05 rotate:2deg zi:2
		@move scale:1.05 rotate:2deg zi:2
	css .tuop bd:none shadow:none @hover:0 0 0 4px teal9,0 0 0 6px teal5 tween:0.2s
		.tphover p:3 visibility:hidden o:0 transform:translateX(0%) translateY(-20px) tween:1s pos:absolute bgc:teal9 c:gra2 rd:5px b:120%
		.tphover::before content:'' pos:abs w:30px h:30px bg:teal9 b:0 transform:rotate(45deg) zi:-1
	css .tuop@hover 
		.tphover visibility:visible o:1 transform:translateX(0%) translateY(0px)
	prop x = 0
	prop y = 0
	prop name
	prop color
	prop devctrdata
	def devctr
		# console.log data
		for item in data
			if name == item.devname
				devctrdata = item
				console.log devctrdata

	<self>
		<button[x:{x} y:{y} bgc:{color} c:gray2].tuop @touch.moved.sync(self) @click=devctr> "{name}"
			<div.tphover> 'tooltips here'
		


