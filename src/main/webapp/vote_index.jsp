<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=devce-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    

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
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./resources/dist/js/sb-admin-2.js"></script>
    <!--幻灯片 开始--><script type="text/javascript" src="./resources/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript">
              $(document).ready(function() {
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
          });
        </script>
</head>

<body>
   <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="./resources/pic/gao1.jpg" alt="./resources/pic/gao2.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="./resources/pic/gao2.jpg" alt="./resources/pic/gao3.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="./resources/pic/gao3.jpg" alt="./resources/pic/gao1.jpg">
      <div class="carousel-caption">
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    <div id="content">
        <div class="index">
            <table width="100%" border="0" bordercolor="#000000" cellspacing="0" cellpadding="0" bgcolor="#F4F4F4">
                <tbody>
                    <tr>
                        <td colspan="2" rowspan="2" width="50%">
                      
                            <a>
                           
                                <img src="./resources/pic/1.jpg">
                                
                           <div class="ChannelName"  style="line-height:304px;vertical-align:center;text-align:center">
                                                          <h1>    推荐&报名</h1>
                                     </div>  
                                 
                                
                                    <!-- <li>1.每位参赛者上传三张照片</li>
                                    <li>2.每位关注者有五张票可投</li>
                                    <li>3.由所获得投票数决定排名</li> -->
                                
                           </a>
                              
                        </td>
                        <td width="25%">
                            <a>
                            <img src="./resources/pic/2.jpg">
                            <div class="ChannelName1">网友投票</div>
                            </a>
                        </td>
                        <td width="25%">
                            <a>
                                <img src="./resources/pic/3.jpg">
                                <div class="ChannelName1">4.1-4.30</div>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <a>
                                <img src="./resources/pic/3.jpg">
                                <div class="ChannelName1">华为club</div>
                            </a>
                        </td>
                        <td width="25%">
                            <a>
                                <img src="./resources/pic/2.jpg">
                                <div class="ChannelName1">西电华了个为</div>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>


        </div>
    </div>
    <div id="footer">
        <div style="text-align:center; margin-top:15px;">
        </div>
        <div class="copyright">西电华为俱乐部&nbsp;版权所有</div>
    </div>
    <!-- #D87570 #73A09D #B2CEBF-->

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

   

</body>

</html>
