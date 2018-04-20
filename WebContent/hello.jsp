<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" href="css/adv.css" />
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
	$("#chatRoom").tabs({
		pill: true,
		justified: true
	})
	
	function addTab(title, url){
			if ($('#chatRoom').tabs('exists', title)){
				$('#chatRoom').tabs('select', title);
			} else {
				var content = '<iframe name="'+title+'" scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#chatRoom').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
</script>
<body>
<div id="content" style="width: 100%;height: 600px;min-width: 1000px;">
	<!-- 左侧好友栏显示 -->
	<div style="float: left;width: 19%;height: 100%;">
		<a href="#" onclick="addTab('google','chat.jsp')">chat</a>
	</div>
	<div id="chatRoom" class="easyui-tabs" style="width: 80%;height: 100%;float: right;"></div>
</div>
<script type="text/javascript">
	var height = window.innerHeight;
	$("#content").css({
		"height":height+"px"
	});
</script>
</body> 
</html>