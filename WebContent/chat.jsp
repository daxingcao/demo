<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>聊天室窗口</title>
<link href="<%=request.getContextPath() %>/css/adv.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/bootstrap-theme.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/reconnecting-websocket.min.js"></script>
<script src="<%=request.getContextPath() %>/js/chat.js"></script>
<script type="text/javascript">
	function chatContent(){
		var html = "";
		var userId = $("#userId").val();
		$.ajax({
			url:"chat",
			type:"post",
			data:"active=chat",
			dataType:"json",
			success:function(data){
				$(data).each(function(i,item){
					if(userId == item.userId){
						html += "<li id='li-right' class='kuang'>"+item.sendContent+"</li>"
					}else{
						html += "<li id='li-left' class='kuang'>"+item.userName+":"+item.sendContent+"</li>"
					}
				})
				$(".chat-thread").append(html);
				if(data.length>0){
					scroll();
				}
			}
		});
		setTimeout(chatContent,2000);
	}
	
	function scroll(){
		var ul = document.getElementById('scrollUL');
		ul.scrollTop = ul.scrollHeight;
	}
</script>
<link rel="stylesheet" href="css/chat.css" media="screen" type="text/css" />
</head>
<body style="margin: 0px;">
<div id="convo" class="chat-div" data-from="Sonu Joshi">
	<ul id="scrollUL" onmouseover="showScroll()" onmouseout="hiddenScroll()" class="chat-thread">
		<li id='li-right' class='kuang'>hello!</li>
		<li id='li-left' class='kuang'>Hi!</li>
		<li id='li-right' class='kuang'>hello!</li>
		<li id='li-left' class='kuang'>Hi!</li>
		<li id='li-right' class='kuang'>hello!</li>
		<li id='li-left' class='kuang'>Hi!</li>
		<li id='li-right' class='kuang'>hello!</li>
		<li id='li-left' class='kuang'>Hi!</li>
	</ul>
	<div class="credits">
		<div id="tools" class="tool_div">
			<p style="font-size: 20px"><i class="icon-github-alt"></i></p>
		</div>
		<textarea id="txtContent" class="txt"></textarea>
		<input id="send" type="button" onclick="sendContent()" value="发送" class="btn btn-info"/>
	</div>
</div>
<script type="text/javascript">
	var height = window.innerHeight-24;
	$("#convo").css({
		"height":height+"px"
	});
	//鼠标移到聊天框显示下拉条
	function showScroll(){
		$("#scrollUL").css({
			"overflow-y":"scroll"
		})
	}
	//鼠标移出聊天框隐藏下拉条
	function hiddenScroll(){
		$("#scrollUL").css({
			"overflow-y":"hidden"
		})
	}
</script>
<%-- <div class="input-id">
	<input id="userId" type="hidden" value="${sessionScope.user.userId }" />
	<input id="userName" type="hidden" value="${sessionScope.user.userName }" />
</div> --%>
<!-- <a href="javascript:void(0)" onclick="skip()">跳转</a> -->
</body>
</html>