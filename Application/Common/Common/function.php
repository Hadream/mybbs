<?php
// 项目公共函数

/*
	功能: 根据大图片名称,返回缩略图名称
	参数: $filename 大图片名称
	返回: 缩略图名称
*/
function getSm($filename)
{
	$arr = explode('/', $filename);
	$arr[3] = 'sm_'.$arr[3];
	return implode('/', $arr);
}

// class CateController extends CommonConntroller
// {
// 	public function __consertuct()
// 	{
// 		parent::__consertuct();

// 		if (empty($_SESSION['flag'])) {
// 			$this -> error('请先登录', 'index.php?m=index&c=index&a=index');
// 		}
// 	}
// }