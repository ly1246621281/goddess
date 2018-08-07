<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=devce-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>西电女神季</title>

    <!-- Bootstrap Core CSS -->
    <link href="./resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

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
     <!-- jQuery -->
    <script src="./resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/dist/js/sb-admin-2.js"></script>
</head>
<body class="body_single">
    <div id="content">

        <div class="single">
            <ul class="wxlist" >
                <li>
                    <div class="ChannelName">
                        <h1>西电华为俱乐部简介</h1>
                    </div>
                    <div class="ChannelPicture"style="margin-top:10px;">
                        <img src="./resources/pic/huawei.png" alt="品牌简介">
                    </div>
                    <div class="ChannelContent">
                      &nbsp;&nbsp;&nbsp;西电华为创新俱乐部是我校与华为公司合作创办的学生社团，隶属于西电校团委，成立于2010年10月24日。下设无线通信一组、无线通信二组、固定带宽组、云计算与海量数据组、网络媒体宣传组（技术主导）、新媒体中心（新媒体运营主导）及秘书处，共七个小组。俱乐部现有会员百余名，其中西电优秀青年教师十余名，华为技术专家二十余名。<br>
　俱乐部自诞生那天其，一路走来，精彩无限：高校技术类俱乐部交流会、技术讲座、趣味运动会、联欢会、茶话会、孵化计划、优才领航计划、麦子地·为碰撞系列活动、全国高校华为俱乐部年会，创新科技比赛“华创杯”更是年年出新，从最初的安卓手机软件设计大赛，到第二届不在拘泥于安卓软件的软件创新设计大赛，到2014第三届“华创杯”抛却地域限制和题材限制，发展成为全国性比赛……<br>
  &nbsp;&nbsp;&nbsp;以下为部门简介：具体请关注微信公众号：华为西引力，并回复：西电华为创新俱乐部。<br>
  &nbsp;&nbsp;&nbsp;无线一组：主要涉及Linux，单片机，FPGA等技术，承接公司项目。<br>
  &nbsp;&nbsp;&nbsp;无线二组：对象的程序设计语言Java以及以此为基础的Android开发。<br>
  &nbsp;&nbsp;&nbsp;固定带宽组：热门软硬件产品技术分析，承接公司项目。<br>
  &nbsp;&nbsp;&nbsp;云计算与海量数据组：与海量数据，云计算相关技术，对接华为公司相应部门。<br>
  &nbsp;&nbsp;&nbsp;网媒组：了解网站开发流程，着手网站开发，未来西电某个类似睿思的网站可能就有人的身影哦。<br>
  &nbsp;&nbsp;&nbsp;新媒体中心：维护粉丝量100万+的俱乐部微博，微信运营。俱乐部品牌建设。<br>
  &nbsp;&nbsp;&nbsp;秘书处：文化传承，日常协调，负责各部门之间的衔接与沟通工作。<br>
  &nbsp;&nbsp;&nbsp;欢迎关注我们的微信公众账号“华为西引力”，回复“西电华为创新俱乐部”获取最新招新信息。同时，欢迎关注我们的新浪微博（@西电华为创新俱乐部）、人人主页（@西电华为俱乐部）及睿思专区。
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="footer">
        <div style="text-align:center; margin-top:15px;">
        </div>
        <div class="copyright">西电华为俱乐部&nbsp;版权所有</div>
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
        <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
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
    </script>
    </body>
    </html>