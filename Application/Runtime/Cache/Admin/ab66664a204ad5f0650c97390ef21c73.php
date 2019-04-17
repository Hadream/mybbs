<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/main.css"/>
    <!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/> -->
    <script type="text/javascript" src="/Public/Admin/js/libs/modernizr.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.html">首页</a></li>
                <li><a href="http://www.mycodes.net/" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href=""><?= $_SESSION['userInfo']['uname'] ?></a></li>
                <li><a href="/index.php?m=admin&c=index&a=change">修改密码</a></li>
                <li><a href="/index.php?m=admin&c=login&a=logout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href=""><i class="icon-font">&#xe003;</i>用户管理</a>
                    <ul class="sub-menu">
                        <li><a href="/index.php?m=admin&c=user&a=create"><i class="icon-font">&#xe008;</i>添加用户</a></li>
                        <li><a href="/index.php?m=admin&c=user&a=index"><i class="icon-font">&#xe005;</i>查看用户</a></li>

                    </ul>
                </li>
                <li>
                    <a href=""><i class="icon-font">&#xe018;</i>分区管理</a>
                    <ul class="sub-menu">
                        <li><a href="/index.php?m=admin&c=part&a=create"><i class="icon-font">&#xe017;</i>添加分区</a></li>
                        <li><a href="/index.php?m=admin&c=part&a=index"><i class="icon-font">&#xe037;</i>查看分区</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="icon-font">&#xe018;</i>版块管理</a>
                    <ul class="sub-menu">
                        <li><a href="/index.php?m=admin&c=cate&a=create"><i class="icon-font">&#xe017;</i>添加版块</a></li>
                        <li><a href="/index.php?m=admin&c=cate&a=index"><i class="icon-font">&#xe037;</i>查看版块</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><i class="icon-font">&#xe018;</i>帖子管理</a>
                    <ul class="sub-menu">
                        <li><a href="index.php?m=admin&c=look&a=index"><i class="icon-font">&#xe017;</i>查看帖子</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->

	<div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">作品管理</span>
            </div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tbody><tr>
                            <th width="120">版块:</th>
                            <td>
                                <select name="pid" id="">
                                   <?php foreach($part as $part): ?>
                                   	<option value="<?=$part['pid']?>"><?=$part['pname']?></option>
                                   <?php endforeach; ?>
                                </select>
                            </td>
                            <th width="120">标题:</th>
                            <td><input class="common-text" placeholder="" name="keywords" value="" id="" type="text"></td>

                            <th width="70">发帖人:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </tbody></table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="insert.html"><i class="icon-font"></i>新增作品</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tbody><tr>
                    
                            <th>ID</th>
                            <th>标题</th>
                            <th>作者</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>

                        <?php foreach($post as $post): ?>

                        <tr>
                            <td class="tc">
                                <?=$post['pid']?>
                            </td>
                            <td>
                                <?=$post['title']?>
                            </td>
                            <td><?=$users[$post['uid']]?></td>
                            <td title=""><?=date('Y-m-d H:i:s',$post['created_at'])?>
                            </td>
                            
                            <td>&nbsp&nbsp
                                <a class="link-update" href="/index.php?m=admin&c=look&a=edit&pid=<?=$post['pid']?>">修改</a>  &nbsp|&nbsp
                                <a class="link-del" href="/index.php?m=admin&c=look&a=delete&$pid=<?=$post['pid']?>">删除</a> &nbsp |&nbsp
                                 <a href="/index.php?m=admin&c=look&a=dog&pid=<?=$post['pid']?>">
                                    <?php  echo $post['is_jing']==0 ? '加精' : '取消加精'; ?>
                                            
                                </a> &nbsp |&nbsp
                                <a href="/index.php?m=admin&c=look&a=dol&pid=<?=$post['pid']?>">
                                    <?php  echo $post['is_top']==0 ? '置顶' : '取消置顶'; ?>
                                            
                                </a> &nbsp |&nbsp
                                <a href="">隐藏</a> &nbsp |&nbsp
                                <a href="/index.php?m=admin&c=look&a=rcontent&pid=<?=$post['pid']?>">查看回复</a>
                            </td>
                        </tr>
                        <?php endforeach;?>
                    </tbody></table>
                    <div class="list-page"><?=$html_page?></div>
                </div>
            </form>
        </div>
    </div>

    <!--/main-->
</div>
</body>
</html>