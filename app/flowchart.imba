tag flowchart
	css w:20 p:4 m:4 pos:rel d:block cursor:grab rd:10px 
	css @touch scale:1.05 rotate:2deg zi:2
	css @move scale:1.05 rotate:2deg zi:2
	prop x = 0
	prop y = 0

	def render
		<self[x:{x} y:{y} bgc:{color} shadow:0 0 10px 2px {color}] @touch.moved.sync(self)> <slot>


