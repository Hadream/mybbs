<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title>查看回复</title>
</head>
<body>
	<center>
	<table border=1>
		<tr>
			<th>ID</th>
			<th>回复内容</th>
			<th>用户</th>
			<th>创建时间</th>
		</tr>
		<?php if(empty($replys) ) {echo '暂时无回复';} foreach($replys as $k=>$reply): ?>
		<tr>
			<td><?=$reply['rid']?></td>
			<td><?=$reply['rcontent']?></td>
			<td><?=$users[$reply['uid']]?></td>
			<td><?=date('Y-m-d H:i:s',$reply['created_at'])?></td>
		</tr>
		<?php endforeach; ?>
	</table></center>
</body>
</html>