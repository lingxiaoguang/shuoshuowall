<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>说说墙</title>
	<meta name="keywords" content="说说墙">
	<meta name="description" content="说说墙">
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
	<meta charset="UTF-8">
	<style>
		*{margin:0;padding:0;}
		body{font-size:12px;font-family:"微软雅黑";}
		.clearfix:after{content:" ";display:block;clear:both;}
		/*input_box start*/
		.input_box{width:900px;height:350px;background:url('images/bg.jpg');margin:0 auto;margin-top:20px;position:relative;box-shadow:0 0 4px #ccc;}
		.input_box .b_msg{width:355px;position:absolute;top:180px;left:40px;border-radius:6px;padding:10px;background:#fff;}
		.input_box .b_msg .b_text{border:1px solid #eee;width:355px;height:80px;border-radius:3px;}
		.input_box .b_msg .b_text a{display:block;border-right:1px solid #ccc;
		width:78px;height:56px;text-decoration:none;text-align:center;padding-top:24px;color:#666;float:left;}
		.input_box .b_msg .b_text a span{display:block;width:30px;height:23px;background:url('images/img.png');margin:0 auto;}
        .input_box .b_msg .b_text a:hover{background:#eee;}
		.input_box .b_msg .b_text .b_edit{padding:5px;float:left;width:263px;height:67px;outline:none;resize:none;border:0;}
		.input_box .b_msg .b_text #file{display:none;}
		.input_box .b_msg .sub_btn{border:1px solid #ccc;background:#4A4Ed4;color:#fff;padding:4px 12px;border-radius:2px;outline:none;float:right;font-size:14px;margin-top:5px;cursor:pointer;}
		.input_box .b_msg .sub_btn:hover,.input_box .b_msg .sub_btn:active{background:#4A4Ee4;}
		.input_box .b_show{width: 360px;height: 148px;background:#fff;position:absolute;top:15px;left: 40px;border-radius:2px;border:1px solid #ccc;padding:5px;display:none;}
		/*end input_box*/
		/*msg_list start*/
		.msg_list{width:900px;margin:0 auto;margin-bottom:20px;}
		.msg_list .m_item{width:290px;height:400px;border:1px solid #ccc;margin-left:10px;float:left;margin-top:10px;box-shadow:0 0 4px #ccc;}
		.msg_list .m_item:nth-child(3n+1){margin-left:0;}
		.msg_list .m_item .m_img{width:100%;height:300px;background:#eee;}
		.msg_list .m_item .m_msg{color:#666;padding:10px;height:50px;overflow:auto;font-size:16px;}
		.msg_list .m_item .m_img img{width:100%;height:310px;}
        .msg_list .m_item .m_date{color:#aaa;line-height:30px;padding-left:10px;}
		/*end msg_list*/
		/*响应式调整 start*/
		@media screen and (max-width:800px){
			.input_box{width:600px;}
			.input_box .b_msg{left:24px;}
			.input_box .b_show{left:24px;}
			.msg_list{width:600px;}
			.msg_list .m_item{margin-left:0;}
			.msg_list .m_item:nth-child(2n){margin-left:16px;}
		}
		@media screen and (max-width:600px){
			.input_box{width:400px;}
			.input_box .b_msg{left:14px;}
			.input_box .b_show{left:14px;}
			.msg_list{width:400px;}
			.msg_list .m_item{margin-left:0;width:400px;}
			.msg_list .m_item:nth-child(2n){margin-left:0;}
		}
		/*end 响应式调整*/
	</style>
	<link rel="stylesheet" href="css/guangCss/guang.css"/> 
</head>
<body>
	<!--input_box start-->
	<div class="input_box">
		<div class="b_msg">
			<div class="b_text">
				<a href="javascript:void(0);" id="uploadImg">
				<span></span>
				图片</a>
				<form action="uploadImg" id="upload-img-form" method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="file"/>
				</form>
				<form action="saveShuoshuo" id="upload-shuoshuo-form" method="post">
					<input type="hidden" id="imgPath" name="imgPath"/> 
					<textarea class="b_edit" name="content" id="content"></textarea>
				</form>
			</div>
			<input type="button" value="发表" class="sub_btn" id="sub_btn"/>
		</div>
		<div class="b_show">
		</div>
	</div>
	<!--end input_box-->
	<!--msg-list start-->
	<div class="msg_list clearfix" data-pageNo="1" data-pageSize="12">
	</div>
	<!--end msg-list-->
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/guangJs/guang-utils.js"></script>
	<script type="text/javascript" src="js/jquery.form.js"></script>
	<script>
		$(function(){
			//加载说说列表
			ajaxInitMsgList();
			//初始化时间
			initEvents();
		});		
		//ajax加载说说列表
		function ajaxInitMsgList(){
			guangLoading.init().fadeIn();
			$.ajax({
				url:"msgList",
				data:{"pageNo":$(".msg_list").attr("data-pageNo"),"pageSize":$(".msg_list").attr("data-pageSize")},
				dataType:"json",
				success:function(json){
					var html="";
					for(var i in json){
						html+="<div class='m_item'>"+
						"<div class='m_img'>"+
						"	<img src='"+json[i].imgPath+"'/>"+
						"</div>"+
						"<p class='m_msg'>"+json[i].content+
						"</p>"+
						"<span class='m_date'>"+$.guangDate._format(json[i].createTime)+"</span>"+
					"</div>";					
					}
					$(".msg_list").append(html);
					var pageNo=parseInt($(".msg_list").attr("data-pageNo"));
					$(".msg_list").attr("data-pageNo",pageNo+1);
				},
				error:function(){
					guangAlert.init({content:"数据加载失败！"}).show();	
				},
				complete:function(){
					guangLoading.fadeOut();
				}
			});
		}
		//给dom元素绑定事件
		function initEvents(){
			//弹出选择文件窗口
			$("#uploadImg").on("click",function(){
				$("#file").click();
			});
			//上传文件
			$("#file").on("change",function(){
				$("#upload-img-form").ajaxSubmit({
					type:"post",
					dataType:"json",
					success:function(json){
						$(".input_box .b_show").show().html(
								"<img src='${pageContext.request.contextPath}/"+json.imgPath+"' width='360' height='148'/>"		
						);		
						$("#imgPath").val(json.imgPath);
					}
				});
			});
			//提交说说
			$("#sub_btn").click(function(){
				if(isEmpty($("#content").val())){
					guangAlert.init({content:"请输入说说内容！"}).show();
					return;
				}
				if($("#content").val().length>300){
					guangAlert.init({content:"说说内容不能超过300个字符！"}).show();
					return;
				}
				if(isEmpty($("#imgPath").val())){
					guangAlert.init({content:"请上传图片！"}).show();
					return;
				}
				$("#upload-shuoshuo-form").ajaxSubmit({
					type:"post",
					dataType:"json",
					success:function(json){
						if(json.result=="success"){
							var html="<div class='m_item'>"+
							"<div class='m_img'>"+
							"	<img src='"+$("#imgPath").val()+"'/>"+
							"</div>"+
							"<p class='m_msg'>"+$("#content").val()+
							"</p>"+
							"<span class='m_date'>"+$.guangDate._format(new Date())+"</span>"+
						"</div>";
							$(".msg_list").prepend(html);
							guangAlert.init({content:"发表成功！"}).show();
							$(".input_box .b_show").fadeOut();
							$("#content").val("");
						}else{
							guangAlert.init({content:"说说保存失败！"}).show();
						}
					}
				});				
			});
			//滚动分页加载数据
			guangUnlimitedScroll(ajaxInitMsgList);
		}
	</script>
</body>
</html>	