tag devcard
	prop devstatus
	prop devnum
	def mount
		console.log 
		
	<self[d:hflex h:10 ja:center fs:14px rd:10px bd:solid 1px {devstatus.color} w:50]> 
		# <img[mr:5] src=devstatus.imgpath>
		<div> devstatus.title
		<div[p:2 1 c:{devstatus.color} fs:25px fw:700 ff:mono]> devnum
		<div> '个'

let devnum = [76,72,3,0,7]
let devstatus = [
	{
		title : '总数'
		color : 'sky4'
	}
	{
		title:'在线'
		color:'green'
	}
	{
		title:'告警'
		color:'red'
	}
	{
		title:'维护'
		color:'orange'
	}
	{
		title:'离线'
		color:'blue'
	}
]

tag devall

	<self> 
		<div[d:grid a:baseline]> for item,index in devstatus
			<devcard devstatus=item devnum=devnum[index]>


