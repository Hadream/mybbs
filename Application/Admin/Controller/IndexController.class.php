<?php
namespace Admin\Controller;

use Think\Controller;

class IndexController extends CommonController
{
    public function index()
    {
       $this -> display();
    }

    public function change()
    {
    	
    	// echo '<pre>';
    	// print_r($_SESSION['userInfo']);die;
    	$this ->display();
    } 

    public function update()
    {
    	$data = $_POST;
    	// echo '<pre>';
    	// print_r($data['upwd']);die;
    	$uid  = $_SESSION['userInfo']['uid'];

    	// echo '<pre>';
    	// print_r($upwd);die;
    	// 密码不能为空
		if (empty($data['upwd'] ) || empty($data['reupwd'])) {
			$this -> error('密码不能为空');
		}
		// 两次密码不一致
		if ($data['upwd']  !== $data['reupwd'] ) {
			$this -> error('两次密码不一致');
	  	}
	  	

	  	// 加密密码
	  	$data['upwd'] = password_hash($data['upwd'], PASSWORD_DEFAULT);

	  	$row = M('bbs_user') -> where("uid=$uid") -> save($data);
	  	// echo '<pre>';
	  	// print_r($row);die;
	  	if ($row) {
	  		$this -> success('修改密码成功');
	  	} else {
	  		$this -> error('密码修改失败');
	  	}
    }
}