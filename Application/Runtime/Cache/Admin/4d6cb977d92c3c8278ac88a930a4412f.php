<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>	
	<!--内容部分start-->
	<div class="content">			
		<form action="index.php?m=admin&c=look&a=update&pid=<?=$_GET['pid']?>" method="post">
			<table height="60">
				<tr>
					<td><label>所属板块:</label></td>
					<td>
						<select name="cid">
							<?php foreach($cates as $k=>$v): ?>
							<option <?php if($k==$cid){echo 'selected';} ?> value="<?=$k?>"><?=$v?></option>
							<?php endforeach; ?>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>标题:</label></td>
					<td><input type="text" value="<?=$post['title']?>" name="title" size="50"></td>
				</tr>
				<tr>
					<td><label>内容：</label></td>
					<td><textarea name="content" rows="12" cols="80"><?=$post['content']?></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="修改" style="width:100px;height:30px;"></td>
				</tr>
				
			</table>
		</form>
			
	</div>
    <!--内容部分end-->
</body>
</html>