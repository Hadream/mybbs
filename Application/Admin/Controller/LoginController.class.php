<?php
namespace Admin\Controller;

use Think\Controller;

class LoginController extends Controller
{
	// 登录页面
	public function login()
	{
		$this -> display();  // View/Login/login.html
	}

	// 接收登录页面账号和密码等信息,进行验证
	public function dologin()
	{
		$uname = $_POST['uname'];
		$upwd  = $_POST['upwd'];
		$code  = $_POST['code'];

		$verify = new \Think\Verify();

		if(!$verify -> check($code)) {
			$this -> error('验证码不对');
		}

		// 用这个账号返回一个数组,没有返回一个NULL
		$user = M('bbs_user') -> where("uname='$uname'") -> find();
		
		if($user && password_verify($upwd, $user['upwd'])) {

			// 保存当前登录成功的用户信息
			$_SESSION['userInfo'] = $user;

			// 是否登录 true登录成功  false 未登录
			$_SESSION['flag'] = true;

			$this -> success('登录成功', '/index.php?m=admin&c=index&a=index');
		} else {		
			$this -> error('账号或密码不对');
		}
		
	}

	// 退出
	public function logout()
	{
		$_SESSION['userInfo'] = NULL;
		$_SESSION['flag'] = false;

		$this -> success('成功退出', '/index.php?m=admin&c=login&a=login');
	}

	// 生成验证码
	public function code()
	{
		ob_clean;
		
		$config = array(
					'fontSize' => 20,   // 验证码数字大小
					'length' => 3,		// 验证码位数大小
					'userNoise' => false,
					'useCurve' => false,
					'imageM' => 120,
					'imageH' => 38,
				  );

		$Verify = new \Think\Verify($config);
		$Verify -> entry();
	}

}