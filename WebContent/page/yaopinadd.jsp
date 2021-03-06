<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
﻿<html class="js cssanimations">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>医疗报销系统</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <link rel="icon" type="image/png" href="/REIMBURSEMENT/page/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/REIMBURSEMENT/page/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI">
    <link rel="stylesheet" href="/REIMBURSEMENT/page/assets/css/amazeui.min.css">
    <link rel="stylesheet" href="/REIMBURSEMENT/page/assets/css/admin.css">
    <link rel="stylesheet" href="/REIMBURSEMENT/page/assets/css/app.css">
    <script src="/REIMBURSEMENT/page/assets/js/echarts.min.js"></script>
	<script src = "/REIMBURSEMENT/page/assets/js/jquery-1.7.2.js"></script>
	<script>
	$(function(){
		$.ajax({
			url:"/REIMBURSEMENT/AjaxHosRankServlet",
			type:"GET",
			dataType:"json",
			success:function(data){
				var str = "";
				$(data).each(function(i,h){
					str += "<option value = " + h.hosRank + ">" + h.hosRank + "</option>";
				});
//					alert(str);
				$("#hosRank").html(str);
			},
			error:function(){
				alert("error");
			}
		});
	});
	$(function(){
		$.ajax({
			url:"/REIMBURSEMENT/AjaxFeeKindServlet",
			type:"GET",
			dataType:"json",
			success:function(data){
				var str = "";
				$(data).each(function(i,h){
					str += "<option value = " + h.feeKind + ">" + h.feeKind + "</option>";
				});
//					alert(str);
				$("#feeKind").html(str);
			},
			error:function(){
				alert("error");
			}
		});
	});
	$(function() {
		$("#mediId")
				.blur(
						function() {
							var value = $("#mediId").val();
							$
									.ajax({
										url : "/REIMBURSEMENT/AjaxCheckMediId?mediId="
												+ value,
										type : "GET",
										dataType : "text",
										success : function(data) {
											if (data == 'yes') {
												$("#divComp")
														.attr("class",
																"am-form-group am-form-success am-form-icon am-form-feedback");
												$("#spanComp").attr("class",
														"am-icon-check");
												$("#spanComp").html("ok");
											} else if (data == 'no') {
												$("#divComp")
														.attr("class",
																"am-form-group am-form-error am-form-icon am-form-feedback");
												$("#spanComp").attr("class",
														"am-icon-times");
												$("#spanComp").html(
														"该编号已被注册");
											} else {
												$("#divComp")
												.attr("class",
														"am-form-group am-form-error am-form-icon am-form-feedback");
												$("#spanComp").attr("class",
														"am-icon-times");
												$("#spanComp").html(
														"编号为4-8位数字");
											}
										},
										error : function() {
											alert("error");
										}
									});
						});
	});
	$(function(){
		$("#mediName").blur(function(){
			var value = $("#mediName").val();
			if(value != ''){
				$("#divComp2")
					.attr("class",
							"am-form-group am-form-success am-form-icon am-form-feedback");
				$("#spanComp2").attr("class",
						"am-icon-check");
				$("#spanComp2").html("ok");
			}else{
				$("#divComp2")
					.attr("class",
							"am-form-group am-form-error am-form-icon am-form-feedback");
				$("#spanComp2").attr("class",
						"am-icon-times");
				$("#spanComp2").html(
						"名称不能为空");
			}
		});
	});
	$(function(){
		$("#ceilingPri").blur(function(){
			var value = $("#ceilingPri").val();
			var req = /^\d+(\.\d+)?$/
			if(req.test(value) || value == ''){
				$("#divComp3")
					.attr("class",
							"am-form-group am-form-success am-form-icon am-form-feedback");
				$("#spanComp3").attr("class",
						"am-icon-check");
				$("#spanComp3").html("ok");
			}else{
				$("#divComp3")
					.attr("class",
							"am-form-group am-form-error am-form-icon am-form-feedback");
				$("#spanComp3").attr("class",
						"am-icon-times");
				$("#spanComp3").html(
						"请输入数字");
			}
		});
	});
	$(function(){
		$("#dayy").blur(function(){
			var value = $("#dayy").val();
			var req = /^[0-9]{0,7}$/
			if(req.test(value)){
				$("#divComp4")
					.attr("class",
							"am-form-group am-form-success am-form-icon am-form-feedback");
				$("#spanComp4").attr("class",
						"am-icon-check");
				$("#spanComp4").html("ok");
			}else{
				$("#divComp4")
					.attr("class",
							"am-form-group am-form-error am-form-icon am-form-feedback");
				$("#spanComp4").attr("class",
						"am-icon-times");
				$("#spanComp4").html(
						"请输入天数");
			}
		});
	});
	function check() {

		if ($("#divComp").hasClass("am-form-success") && $("#divComp2").hasClass("am-form-success") && !$("#divComp3").hasClass("am-form-error") && !$("#divComp4").hasClass("am-form-error")) {
			return true;
		} else {
			alert("请按要求填写");
			return false;
		}

	}
	</script>
</head>

<body data-type="index">


<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <a href="javascript:;" class="tpl-logo">
            <img src="/REIMBURSEMENT/page/assets/img/logo.png" alt="">
        </a>
    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
            <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">

                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-success">5</span> 条提醒</h3><a href="###">全部</a></li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span
                            class="am-icon-btn am-icon-plus tpl-dropdown-ico-btn-size tpl-badge-success"></span>
                        【预览模块】移动端 查看时 手机、电脑框隐藏。</a>
                        <span class="tpl-dropdown-list-fr">3小时前</span>
                    </li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span
                            class="am-icon-btn am-icon-check tpl-dropdown-ico-btn-size tpl-badge-danger"></span>
                        移动端，导航条下边距处理</a>
                        <span class="tpl-dropdown-list-fr">15分钟前</span>
                    </li>
                    <li class="tpl-dropdown-list-bdbc"><a href="#" class="tpl-dropdown-list-fl"><span
                            class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span>
                        追加统计代码</a>
                        <span class="tpl-dropdown-list-fr">2天前</span>
                    </li>
                </ul>
            </li>
            <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">

                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-danger">9</span> 条新消息</h3><a href="###">全部</a></li>
                    <li>
                        <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="/REIMBURSEMENT/page/assets/img/user02.png" alt=""> </span>
                            <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> ${sessionScope.user }            </span>
                                <span class="tpl-dropdown-content-time">10分钟前 </span>
                                </span>
                            <span class="tpl-dropdown-content-font"> Amaze UI 的诞生，依托于 GitHub 及其他技术社区上一些优秀的资源；Amaze UI 的成长，则离不开用户的支持。 </span>
                        </a>
                        <a href="#" class="tpl-dropdown-content-message">
                                <span class="tpl-dropdown-content-photo">
                      <img src="/REIMBURSEMENT/page/assets/img/user03.png" alt=""> </span>
                            <span class="tpl-dropdown-content-subject">
                      <span class="tpl-dropdown-content-from"> Steam </span>
                                <span class="tpl-dropdown-content-time">18分钟前</span>
                                </span>
                            <span class="tpl-dropdown-content-font"> 为了能最准确的传达所描述的问题， 建议你在反馈时附上演示，方便我们理解。 </span>
                        </a>
                    </li>

                </ul>
            </li>
            <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">

                <ul class="am-dropdown-content tpl-dropdown-content">
                    <li class="tpl-dropdown-content-external">
                        <h3>你有 <span class="tpl-color-primary">4</span> 个任务进度</h3><a href="###">全部</a></li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">Amaze UI 用户中心 v1.2 </span>
                                <span class="percent">45%</span>
                                </span>
                            <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div
                                class="am-progress-bar am-progress-bar-success" style="width:45%"></div></div>
                    </span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">新闻内容页 </span>
                                <span class="percent">30%</span>
                                </span>
                            <span class="progress">
                       <div class="am-progress tpl-progress am-progress-striped"><div
                               class="am-progress-bar am-progress-bar-secondary" style="width:30%"></div></div>
                    </span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="tpl-dropdown-content-progress">
                                <span class="task">
                        <span class="desc">管理中心 </span>
                                <span class="percent">60%</span>
                                </span>
                            <span class="progress">
                        <div class="am-progress tpl-progress am-progress-striped"><div
                                class="am-progress-bar am-progress-bar-warning" style="width:60%"></div></div>
                    </span>
                        </a>
                    </li>

                </ul>
            </li>
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

            <li class="am-dropdown" data-am-dropdown="" data-am-dropdown-toggle="">
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                    <span class="tpl-header-list-user-nick">${sessionScope.user }           </span><span class="tpl-header-list-user-ico"> <img
                        src="/REIMBURSEMENT/page/assets/img/user01.png"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>
                    <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li><a href="/REIMBURSEMENT/page/login.jsp" class="tpl-header-list-link"><span
                    class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
        </ul>
    </div>
</header>


<div class="tpl-page-container tpl-page-header-fixed">


    <div class="tpl-left-nav tpl-left-nav-hover" style="display: block;">
        <div class="tpl-left-nav-title">业务信息列表</div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="/REIMBURSEMENT/page/index.jsp" class="nav-link active">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>医疗基本信息</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="/REIMBURSEMENT/page/yaopinquery.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>药品信息</span>
                                <i></i>
                            </a>

                            <a href="/REIMBURSEMENT/page/zhenliaoquery.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>诊疗项目信息</span>


                            </a><a href="/REIMBURSEMENT/page/bingzhongquery.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>病种信息</span>


                        </a><a href="/REIMBURSEMENT/page/fuwuquery.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>服务设施项目信息</span>


                        </a><a href="/REIMBURSEMENT/page/jigouquery.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>定点医疗信息</span>

                        </a>
                        </li>
                    </ul>
                </li>


                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>医疗待遇计算参数维护</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="/REIMBURSEMENT/page/fengdingquery.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>封顶线</span>
                                <i></i>
                            </a>

                            <a href="/REIMBURSEMENT/page/qifuquery.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>起付标准</span>


                            </a><a href="/REIMBURSEMENT/page/fenduanquery.jsp">
                            <i class="am-icon-angle-right"></i>
                            <span>个人分段自费比例</span>


                        </a>
                        </li>
                    </ul>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>医疗待遇审批</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            
            <a href="/REIMBURSEMENT/page/jigousp.jsp">
                <i class="am-icon-angle-right"></i>
                <span>人员就诊机构审批</span>
                <i></i>
            </a>







                            
            <a href="/REIMBURSEMENT/page/yaopinsp.jsp">
                <i class="am-icon-angle-right"></i>
                <span>特检特治审批</span>
            </a>










                        </li>
                    </ul>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>医疗中心报销</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="/REIMBURSEMENT/page/zxbx_index.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>中心报销</span>
                                <i></i>
                            </a>

                            <a href="/REIMBURSEMENT/page/cancel.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>取消报销</span>

                            </a>
                        </li>
                    </ul>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>综合查询</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="/REIMBURSEMENT/page/annual_baoxiao.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>医疗人员费用信息</span>
                                <i></i>
                            </a>


                        </li>
                    </ul>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-table"></i>
                        <span>公共业务</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="/REIMBURSEMENT/page/basical_institutions.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>单位基本信息</span>
                                <i></i>
                            </a>

                            <a href="/REIMBURSEMENT/page/basical_people.jsp">
                                <i class="am-icon-angle-right"></i>
                                <span>个人基本信息</span>

                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

	
    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">医疗基本信息</div>
        <ol class="am-breadcrumb">
            <li><a href="/REIMBURSEMENT/page/index.jsp" class="am-icon-home">首页</a></li>
            <li><a href="/REIMBURSEMENT/page/yaopinquery.jsp">药品信息</a></li>
            <li class="am-active">药品信息添加</li>
        </ol>
        <div class="tpl-content-scope">

        </div>


        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span>药品信息添加
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right">

                        </div>
                    </div>
                </div>


            </div>
            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">


                    <div class="am-u-sm-12 am-u-md-9">
                    	<div class="am-text-center" style="color: red">带黄色圆圈项为必填项</div>
						<br>
                        <form class="am-form am-form-horizontal" action = "/REIMBURSEMENT/YaoPinAddServlet" method = "post" onsubmit="return check()">
                            <div class="am-form-group am-form-warning am-form-icon am-form-feedback" id = "divComp">
                                <label for="user-name" class="am-u-sm-3 am-form-label">药品编号</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="mediId" placeholder="输入药品编号" name = "mediId">

                                </div>
                                <span id="spanComp" class="am-icon-circle-o"></span>
                            </div>

                            <div class="am-form-group am-form-warning am-form-icon am-form-feedback" id = "divComp2">
                                <label for="user-email" class="am-u-sm-3 am-form-label">药品名称</label>
                                <div class="am-u-sm-9">
                                    <input type="text" placeholder="输入药品名称" name = "mediName" id = "mediName">

                                </div>
                                <span id="spanComp2" class="am-icon-circle-o"></span>
                            </div>

                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">医院等级</label>

                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1, maxHeight: 100}" style="display: none;" name = "hosRank" id = "hosRank">
<!--                                         <option value="一级">一级</option> -->
<!--                                         <option value="二级">二级</option> -->
<!--                                         <option value="三级">三级</option> -->
<!--                                         <option value="社区医院">社区医院</option> -->
                                    </select>
                                </div>
                            </div>


                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">收费类别</label>

                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1, maxHeight: 100}" style="display: none;" name = "feeKind" id = "feeKind">
<!--                                         <option value="甲">甲</option> -->
<!--                                         <option value="乙">乙</option> -->
<!--                                         <option value="丙">丙</option> -->
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group" id = "divComp3">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">最高限价</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="ceilingPri" placeholder="输入最高限价" name = "ceilingPri">
                                </div>
                                <span id="spanComp3"></span>
                            </div>

							<div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">审批标志</label>

                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1, maxHeight: 100}" style="display: none;" name = "examine">
                                        <option value="需要审批">需要审批</option>
                                        <option value="不需要审批">不需要审批</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">收费项目等级</label>

                                <div class="am-u-sm-9">
                                    <select data-am-selected="{searchBox: 1, maxHeight: 100}" style="display: none;" name = "chargeRank">
                                        <option value="一级">一级</option>
                                        <option value="二级">二级</option>
                                        <option value="三级">三级</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">药厂名称</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入药厂名称" name = "factorName">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">国药准字</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入国药准字" name = "drugCertificate">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">使用频次</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入使用频次" name = "useFrequency">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">用法</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入使用方法" name = "useMethod">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">产地</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入产地" name = "place">
                                </div>
                            </div>
                            <div class="am-form-group" id = "divComp4">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">限定天数</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="dayy" placeholder="输入限定天数" name = "dayy">
                                </div>
                                 <span id="spanComp4"></span>
                            </div>
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">备注</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="备注" name = "remarks">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary">添加</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


    </div>

</div>



<script src="/REIMBURSEMENT/page/assets/js/jquery.min.js"></script>
<script src="/REIMBURSEMENT/page/assets/js/amazeui.min.js"></script>
<script src="/REIMBURSEMENT/page/assets/js/iscroll.js"></script>
<script src="/REIMBURSEMENT/page/assets/js/app.js"></script>


</body></html>                                                   











































































































































































































































































































































































































































































































































































