<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>西电女神季</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta name="Title" content="test" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=devce-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<link href="./resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
	<link href="./resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="./resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="./resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<style>
	
#masonry {
	padding: 0px;
	min-height: 0px;
	margin: 0px;
}

#masonry .thumbnail {
	 width: 48%;
	margin: 2px;
	padding: 0px;
	border-width: 0px; 
/* 	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175); */
}

#masonry .thumbnail .imgs {
	padding: 0px;
}

#masonry .thumbnail .imgs img {
	margin-bottom: 0px;
}

/* #masonry .thumbnail .caption {
	background-color: #fff;
	padding-top: 0;
	font-size: 13px;
} */

	body { padding-top: 50px;padding-bottom:50px }

   .background {
	display: block;
	width: 100%;
	height: 100%;
	opacity: 0.4;
	filter: alpha(opacity = 40);
	background: while;
	position: absolute;
	top: 0;
	left: 0;
} 

.progressBar {
	display: block; 
	width: 30px;
	height: 30px;
	position: fixed;
 	top: 50%;
	left: 50%;
	background:  url(./resources/pic/progressBar_m.gif) no-repeat;
}

div.selected a img {
	box-shadow: 0 0 0 4px #FFA07A;
	animation: selected 0.3s cubic-bezier(0.250, 0.100, 0.250, 1.000);
	-o-animation: selected 0.3s cubic-bezier(0.250, 0.100, 0.250, 1.000);
	-ms-animation: selected 0.3s cubic-bezier(0.250, 0.100, 0.250, 1.000);
	-moz-animation: selected 0.3s cubic-bezier(0.250, 0.100, 0.250, 1.000);
	-webkit-animation: selected 0.3s
		cubic-bezier(0.250, 0.100, 0.250, 1.000);
}
</style>
</head>
    
<body>
 <div class="container">
        <div class = "navbar navbar-inverse  navbar-fixed-top" role = "navigation">
            <div class = "container">
                <div class = "navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class = "sr-only">navbar</span>
                         <span class = "icon-bar"></span>
                          <span class = "icon-bar"></span>
                          <span class = "icon-bar"></span>
                      </button>
                      <a class = "navbar-brand " id = "tagname">暂无数据 请切换标签</a>
                      </div>
                <div class = "collapse navbar-collapse">
                    <ul class = "nav navbar-nav">
                <li class= "tagitem"><a class = 'tag'>全部</a></li>
                <li class = "tagitem"><a class = 'tag'>女神</a></li>
                <li class = "tagitem"><a class = 'tag'>女汉子</a></li>
                <li class = "tagitem" ><a class = 'tag'>小萌妹</a></li>
            </ul>
        </div>
    </div>
    </div>
	</div>
    <div id = 'content' style = 'text-align:center;'>
		<div id="masonry" class="container-fluid" >
		</div>		
		<div id="masonry_ghost" class="hide">
		</div>
	</div>
		<div id="tool"><ul class="toollist">
        <li>
            <a href="voteindex">
                <i class="fa fa-home fa-fw"></i>
                <p>首页</p>
            </a>
        </li>
        <li>
            <a href="join">
                <i class="fa  fa-user fa-fw"></i>
                <p>报名</p>
            </a>
        </li>
        <li>
            <a href="show">
                <i class="fa fa-heart fa-fw"></i>
                <p>投票</p>
            </a>
        </li>
        <li>
            <a href="about">
                <i class="fa fa-envelope-o fa-fw"></i>
                <p>关于</p>
            </a>
        </li>
    </div>
   <!-- 弹出框 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-danger" id="myModalLabel">出错啦</h4>
				</div>
				<div class="modal-body">
					<div>
						<h4 id = "errordialog"></h4>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
  </div>
  
         <div class="modal fade bs-example-modal-lg" id="person" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" >
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel" style="color:#d87570">女神详情</h4>
				</div>
				<div id="personl" class="modal-body">
        <!-- 个人详情内容 -->
            <!-- <div class="panel panel-default"> -->
                        <div  style="margin: 0px; ">
                        <div class='list-group'>
                                <a class="list-group-item"  style="color:#d87570" >
                                    <i class="fa fa-heart fa-fw"></i> 姓  名：
                                    <span id = 'personname' class="pull-right text-muted small" style="color:#d87570">高圆圆
                                    </span>
                                </a>
                                <a class="list-group-item " style="color:#d87570">
                                    <i class="fa fa-heart fa-fw" ></i> 学  院：
                                    <span id = 'personschool' class="pull-right text-muted small" style="color:#d87570">计算机学院
                                    </span>
                                </a>
                                <a class="list-group-item" style="color:#d87570">
                                    <i class="fa fa-heart fa-fw"></i> 年  级：
                                    <span id = 'persongrade' class="pull-right text-muted small" style="color:#d87570">研一
                                    </span>
                                </a>
                                <a class="list-group-item" style="color:#d87570">
                                    <i class="fa fa-heart fa-fw"></i> 气质类型：
                                    <span id = 'persontag' class="pull-right text-muted small" style="color:#d87570">女神范
                                    </span>
                                </a>
                                </div>
                                <div  style = "margin:5px 0px 5px 0px;">
                                    <img class = 'img-rounded'  id = 'pic1' src="" width="100%" ></img>
                                </div>
                                <div style = "margin:5px 0px 5px 0px;">
                                    <img class = 'img-rounded'  id = 'pic2' src="" width="100%"></img>
                                </div>
                                <div style = "margin:5px 0px 5px 0px;">
                                    <img class = 'img-rounded'  id = 'pic3' src="" width="100%"></img>
                                </div>
                        </div>
                    <!-- </div> -->
    <!-- 详情结束 -->
      </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" style="background:#d87570;color:#fff;">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
  </div>
  <!-- 弹出框结束 -->
<!--      <div id="background" class="background" style="display: none; "></div>  -->
	<div id="progressBar" class="progressBar" style="display: none; "></div> 
    <script src="./resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="./resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script src="./resources/js/masonry.pkgd.min.js"></script>
	<script src="./resources/js/imagesloaded.pkgd.min.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var ajaxbg = $("#progressBar"); 
		var ghostNode;
		var ghostCount;
		var currentIndex;
		var masNode = $('#masonry');
		var imagesLoading;
		var ghostIndexArray;
		
		$.ajax({
      		type:"get",
  			dataType: "json",
  			url:"getjsinfo",
  			data:{"url":window.location.href},
  			success :function(data){
  				wx.config({
  		    	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
  		    	    appId: data["appid"], // 必填，公众号的唯一标识
  		    	    timestamp:data["timestamp"] , // 必填，生成签名的时间戳
  		    	    nonceStr:data["noncestr"], // 必填，生成签名的随机串
  		    	    signature: data["signature"] ,// 必填，签名，见附录1
  		    	    jsApiList: ['chooseImage','uploadImage','onMenuShareTimeline'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
  		    	});
  			}
      	});
      	
      	
      	wx.ready(function () {
      		
      	    wx.onMenuShareTimeline({
      	        title: '寻找女神', // 分享标题
      	      link: 'http://huafengchun.wicp.net/goddess/xdhw', // 分享链接
  	        imgUrl: 'http://huafengchun.wicp.net/goddess/resources/pic/logo.jpg', // 分享图标
      	        success: function () { 
      	            $.ajax({
      	            	type:'get',
      	            	dataType:'json',
      	            	url:'repost',
      	            	success: function(data){
      	            	}
      	            });
      	        },
      	        cancel: function () { 
      	        }
      	    });
      	});
		
		loadData("");
		$(".tag").click(function(){
			var tag = $(this).text();
			$("#tagname").html(tag);
			if(tag == "全部")
				tag = "";
			$.ajax({
				type:"post",
				dataType: "json",
				url:"settag",
				data:{"tag":tag},
				success:function(data){
					location.reload();
				}
				});
		});
		
		function loadData(tag){
		setDivCenter("#progressBar");
		ajaxbg.show();
		$("#masonry").html("");
		$("#masonry_ghost").html("");
			$.ajax({
				type:"post",
				dataType: "json",
				url:"getcampbytag",
				//data:{"tag":tag},
				success:function(data){
					var result = "";
					$(data).each(function(index){
						$("#tagname").html(data[index]["pagetag"]);
						result += "\
							<div class='thumbnail'>\
							<div class='imgs person' id = '"+data[index]["openid"]+"' data-toggle='modal' data-target='#myModal1'>\
								<input type='hidden' value='"+data[index]["photourl_1"]+"'>\
							</div>\
							<class='form-group' style = 'text-align:center'>\
							<button type='button' style='background:#d87570; color:#fff;' class='btn btn-block love' >\
                            <span>"+data[index] ["votenum"]+"票</span><br>\
                            <span>暗恋<i class='glyphicon glyphicon-heart'></i>"+data[index]["name"]+"</span>\
                            </button>\
							</div>\
						</div>";
					});
					$("#masonry_ghost").append(result);
					
					$(".person").on("click",function(){
						var openid = $(this).attr("id");
						$.ajax({
				        	type :'post',
				        	url:"getcampbyopenid",
				        	dataType:"json",
				        	data:{"openid":openid},
				        	success:function(data){
				        		if(data["status"] == "ok")
				        		{
				        			$("#personname").text(data["name"]);
				        			$("#personschool").text(data["school"]);
				        			$("#persongrade").text(data["grade"]);
				        			$("#persontag").text(data["tag"]);
				        			$("#pic1").attr("src","getphoto/" + data["photourl_1"]);
				        			$("#pic2").attr("src","getphoto/" + data["photourl_2"]);
				        			$("#pic3").attr("src","getphoto/" + data["photourl_3"]);
				        			$("#person").modal("toggle");
				        		}
				        		else
				        		{
				        			$("#errordialog").text(data["errorstring"]);
									$("#myModal").modal('toggle');
				        		}
				        	}
				        	});
					});
					
					$(".love").on("click",function(){
						var votebutton = $(this);
						var temp = votebutton.children("span:first-child").text();
						votebutton.children("span:first-child").text("正在提交");
						votebutton.attr("disabled",true); 
					 	$.ajax({
				        	type :'post',
				        	url:"vote",
				        	dataType:"json",
				        	data:{"selected":$(this).parent().prev().attr('id')},
				        	success:function(data){
				        		$(this).attr("disabled",false); 
				        		if(data["status"] == "ok")
				        		{
				        			votebutton.children("span:first-child").text(data["newnum"] + "票");
				        			votebutton.attr("disabled",false); 
				        		}
				        		else
				        		{
				        			votebutton.children("span:first-child").text(temp);
				        			votebutton.attr("disabled",false); 
				        			$("#errordialog").text(data["errorstring"]);
									$("#myModal").modal('toggle');
				        		}
				        	}
				        });
					}); 
					init();
					initMasonry();
				}
			});
		}
			
			
			function init()
			{
				 imagesLoading = false;
				 currentIndex = 0;
				 ghostIndexArray = [];
				ghostNode = $('#masonry_ghost').find('.thumbnail');
				ghostCount = ghostNode.length;
				for(i=0; i<ghostCount; i++){
					ghostIndexArray[i] = i; 
				}
			}
			
			
			function getNewItems() {
				var newItemContainer = $('<div/>');
				for(var i=0; i<6; i++) {
					if(currentIndex < ghostCount) {
						newItemContainer.append(ghostNode.get(ghostIndexArray[currentIndex]));
						currentIndex++;
					}
				}
				return newItemContainer.find('.thumbnail');
			}
			
			function processNewItems(items) {
				items.each(function() {
					setDivCenter("#progressBar");
					ajaxbg.show();
					var $this = $(this);
					var imgsNode = $this.find('.imgs');			
					var imgNames = imgsNode.find('input[type=hidden]').val().split(',');
					$.each(imgNames, function(index, item) {
						imgsNode.append('<a><img class = "img-rounded" src="getphoto/'+ item +'" /></a>');
					});
				});
			}
		
			
			function initMasonry() {
				var items = getNewItems();
				items.css('opacity', 0);
				processNewItems(items);
				masNode.append(items);
				imagesLoading = true;
				items.imagesLoaded(function(){
					imagesLoading = false;
					items.css('opacity', 1);
					if(masNode.find('.thumbnail').length >1)
					{ 
					    masNode.masonry({
						itemSelector: '.thumbnail',
						isFitWidth: true
					});
					}
					ajaxbg.hide();
				});
			}
			
			
			function appendToMasonry() {
				var items = getNewItems();
				items.css('opacity', 0);
				processNewItems(items);
				masNode.append(items);
				imagesLoading = true;
				items.imagesLoaded(function(){
					imagesLoading = false;
					items.css('opacity', 1);
					masNode.masonry('appended',  items);
	     			ajaxbg.hide();
				});
			}
			
			
			function setDivCenter(divName){   
		        var top = ($(window).height() - $(divName).height())/2;   
		        var left = ($(window).width() - $(divName).width())/2;   
		        var scrollTop = $(document).scrollTop();   
		        var scrollLeft = $(document).scrollLeft();   
		        $(divName).css( { position : 'absolute', 'top' : top + scrollTop, left : left + scrollLeft } );  
		    }  
			
			$(window).scroll(function() {
				setDivCenter("#progressBar");
				if($(document).height() - $(window).height() - $(document).scrollTop() < 10) {			
					if(!imagesLoading) {
						appendToMasonry();
					}
				}
			});
			
			function randomColor() {
				var rand = Math.floor(Math.random() * 0xFFFFFF).toString(16);
				for (; rand.length < 6;) {
					rand = '0' + rand;
				}
				return '#' + rand;
			}
			
			
		});
	</script>
</body>
</html>