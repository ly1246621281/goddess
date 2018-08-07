<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=devce-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <title>寻找女神活动</title>

	<!-- Bootstrap Core CSS -->
     <link href="./resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	
<!-- 	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
    <!-- MetisMenu CSS -->
    <link href="./resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	    <link href="./resources/css/style.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
            <div class="panel " >
                        <div class="panel-heading" style="background:#d87570;color:#fff;">
                            <i class="fa fa-heart-o fa-fw"></i>请填写参赛信息
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- <div class="list-group">
                                <a class="list-group-item">
                                    <input class="form-control" placeholder="真实姓名（必填）">
                                </a>

                            </div> -->
                            <p><input id="name" class="form-control textinput" placeholder="真实姓名（必填）"></p>
                            <p><input id="school" class="form-control textinput" placeholder="学院（必填）"></p>
                           <!--  <p><input id="grade" class="form-control textinput" placeholder="年级（必填）"></p> -->
                            <p><input id="tel" class="form-control textinput" placeholder="邮箱（必填）"></p>
                            <p><select id="grade" class="form-control">
                            <option value = '0'>年级（请选择）</option>
                                <option value = '1'>大一</option>
                                <option value = '2'>大二</option>
                                <option value = '3'>大三</option>
                                <option value = '4'>大四</option>
                                <option value = '5'>研一</option>
                                <option value = '6'>研二</option>
                                </select>
                                </p>
                            <p><select id="styleType" class="form-control">
                                <option value = '0'>风格类型（请选择）</option>
                                <option value = '1'>女神</option>
                                <option value = '2'>女汉子</option>
                                <option value = '3'>小萌妹</option>
                                </select>
                            </p>
                            <p>
                            <div class="form-group">
                            	<button class="btn btn-block"  style="background:#d87570; color:#fff;" id="chooseImage">请选择三张照片（第一张为封面）</button>
                            </div>
                            </p>
                            <div style="text-align:center;">
                                <button type = "button"  style="background:#d87570; color:#fff;" id= 'submitButton' type="button" class="btn btn-block" >提交信息</button>
                            </div>
                            <!-- /.list-group -->
                        </div>
                        <!-- /.panel-body -->
            </div>
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
    </div>

    <!-- jQuery -->
     <script src="./resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
 
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<!-- <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script> -->

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<!-- <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
    <script src="./resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/dist/js/sb-admin-2.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- 	<script src="./resources/js/demo.js"></script> -->
    <script type="text/javascript">
    $(document).ready(function(){
      	 var images = {
      			localId: [],
      			serverId: []
      		};
      	 
      	 var imageNum = 0;
      	 
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
    	})
    	
    	
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

    		
    	$("#chooseImage").click(function () {
    	     wx.chooseImage({
    	      success: function (res) {
    	        images.localId = res.localIds;
    	        if(images.localId.length < 3)
    	        {
    	        	$("#chooseImage").text("已选择" +images.localId.length+ "张照片，点击重选");
    	        	return;
    	        }
    	        $("#chooseImage").text("已选择" +images.localId.length+ "张照片，正在上传");
    	        var i = 0, length = images.localId.length;
        	    images.serverId = [];
        	    function upload() {
        	      wx.uploadImage({
        	        localId: images.localId[i],
        	        success: function (res) {
        	          i++;
        	          imageNum ++;
        	          images.serverId.push(res.serverId);
        	          if (i < length && i<3) {
        	        	  setTimeout(upload,100);
        	          }
        	          else
        	        {
        	        	  $("#chooseImage").text("已上传" +i+ "张照片，点击重选");
        	         }
        	        },
        	        fail: function (res) {
        	          alert(JSON.stringify(res));
        	        }
        	      });
        	    }
        	    setTimeout(upload,100);
    	      }
    	    });
    	  });
    	});
     	
     	
     	
        $( "#submitButton").click(function(){
        	var flag = true;
        	$(".textinput").each(function(){
        		if($(this).val() == "")
        		{
        			 $( "#submitButton").text("请输入完整信息");
        			flag = false;
        			return false;
        		}
        	});
        	if(flag == true &&$("#grade").val() == 0)
        	{
        		$( "#submitButton").text("请选择年级");
        		flag = false;
        	}
        	if(flag == true &&$("#styleType").val() == 0)
        	{
        		$( "#submitButton").text("请选择标签");
        		flag = false;
        	}
        	if(flag == true&&images.serverId.length !=3 )
        	{
        		$( "#submitButton").text("请选择三张照片");
        		flag = false;
        	}
        	if(flag == true)
        	{
        		 $( "#submitButton").text("正在上传，请稍后...");
        		 $( "#submitButton").attr("disabled",true); 
        		 $.post("dojoin",{
                     "name" : $("#name").val(),
                     "school" : $("#school").val(),
                     "grade" : $("#grade").find('option:selected').text(),
                     "tel":$("#tel").val(),
                     "styleType":$("#styleType").find('option:selected').text(),
                     "photo_1": images.serverId[0],
                     "photo_2": images.serverId[1],
                     "photo_3": images.serverId[2],
                     },function(response){
                    	 if(response["status"] == "ok")
                    	 	$( "#submitButton").text("上传成功");
                    	 else if(response["status"] == "rewrite")
                    		 $( "#submitButton").text("更新成功");
                    	 else
                    	{
                    		 $( "#submitButton").text("上传失败："+response["errorstring"]);
                    		 $( "#submitButton").attr("disabled",false); 
                    	}
                    		 
                     },"json"
                     );

        	}   
        });
});
    

    </script>
</body>

</html>
