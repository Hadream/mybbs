<?php
namespace Home\Controller;

use Think\Controller;

class LoginController extends Controller
{
	// 注册页
	public function signUp()
	{
		$this -> display(); // View/Login/singup.html
	}

	// 接收注册信息,保存到数据库
	public function register()
	{
		$data = $_POST;


		$upwd = $_POST['upwd'];
		// // 密码不能为空
		// if (empty($data['upwd']) || empty($data['reupwd'])) {
		// 	$this -> error('密码不能为空');
		// }
		// // 两次密码不一致
		// if ($data['upwd'] !== $data['reupwd']) {
		// 	$this -> error('两次密码不一致');
	 	// }

		$data['upwd'] = password_hash($upwd, PASSWORD_DEFAULT);

		$data['created_at'] = time();
		$data['auth'] = 3;

		$row = M('bbs_user') -> add($data);

		if($row) {
			$this -> success('注册成功', '/');
		} else {
			$this -> error('注册失败');
		}
	}

	// 接收登录信息,进行验证
	public function dologin()
	{
		$uname = $_POST['uname'];
		$upwd  = $_POST['upwd'];

		$user = M('bbs_user') -> where("uname='$uname'") -> find();


		if($user && password_verify($upwd, $user['upwd'])) {
			$_SESSION['userInfo'] = $user;
			$_SESSION['flag'] = true;

			$this -> success('登录成功', '/');
		} else {
			$this -> error('账号或密码不对' );
		}
	}

	// 退出
	public function logout()
	{
		$_SESSION['flag'] = false;
		$_SESSION['userInfo'] = null;
		unset($_SESSION['userInfo']);
		$this -> success('正在退出...', '/');
	}
}