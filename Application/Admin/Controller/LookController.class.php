<?php
namespace Admin\Controller;

use Think\Controller;

class LookController extends Controller
{
	public function index()
	{
		$post = M('bbs_post') -> select();
		$users = M('bbs_user') -> select();
		$users = array_column($users, 'uname', 'uid');

		$reply = M('bbs_reply') -> select();
		// $reply = array_column($reply, 'rcontent', 'pid');

		// echo '<pre>';print_r($reply);die;

		// 实例化一个表对象
     	$User = M('bbs_post');
      	$condition = [];

      	// 得到满足条件的总记录数
      	$cnt = $User -> where($condition) -> count();  

      	// 实例化分页类 传入总记录数和每页显示的记录数(3)
      	$Page = new \Think\Page($cnt, 3);

      	// 得到分页显示html代码
      	$html_page = $Page -> show();

      	// 获取数据
      	$post = $User -> where($condition) 
                     -> limit($Page -> firstRow, $Page -> listRows)
                     -> select();

		$this -> assign('post', $post);
		$this -> assign('users', $users);
		$this -> assign('html_page', $html_page);
		$this -> assign('reply', $reply);
		$this -> display();  // View/Login/login.html
	}
	// 查看回复
	public function rcontent()
	{
		$pid = $_GET['pid'];
		$reply = M('bbs_reply') -> where("pid = $pid") -> select();
		$reply = array_column($reply, NULL, 'rid');

		$users = M('bbs_user') -> select();
		$users = array_column($users, 'uname', 'uid');

		// echo '<pre>';print_r($reply);die;
		$this -> assign('users', $users);
		$this -> assign('replys', $reply);
		$this -> display();
	}

	// 修改帖子
	public function edit()
	{
		$pid = $_GET['pid'];
		$cates = M('bbs_cate') -> getField('cid, cname');
		
		$post = M('bbs_post') -> where("pid=$pid" ) -> field('title, content') -> find();
		$reply = M('bbs_reply') -> where("pid=$pid") -> find();

		// echo '<pre>';
		// print_r($post);die;

		$this -> assign('reply', $reply);
		// $this -> assign('html_page', $html_page);
		$this -> assign('post', $post);
		$this -> assign('cates', $cates);
		$this -> display();
	}

	public function update()
	{
		$pid = $_GET['pid'];
		// echo '<pre>';print_r($pid);die;
		$data = $_POST;

		$row = M('bbs_post') -> where("pid=$pid") -> save($data);
		// var_dump($row);
		// die;
		if ($row) {
			$this -> success('修改帖子成功',);
		} else {
			$this -> error('修改帖子失败');
		}
		// echo '<pre>';
		// print_r($row);
	}

	// 删除帖子
	public function delete()
	{
		$pid = $_GET['$pid'];

	

		$row = M('bbs_post') -> where("pid=$pid") -> delete();
		M('bbs_reply') -> where("pid=$pid") -> delete();
		if ($row) {
			$this -> success('删除帖子成功');
		} else {
			$this -> error('删除帖子失败');
		}
	}

	// 取消置顶
	public function dol()
	{
		$pid = $_GET['pid'];
		// echo $pid;die;

		$post = M('bbs_post') -> where("pid=$pid ") -> find();
		$data = [];
		if($post['is_top']==1) {
			$data['is_top'] = 0;
		} else {
			$data['is_top'] = 1;			
		}
		M('bbs_post') -> where("pid = $pid") ->save($data);

		header('location: /index.php/admin/look/index');
	}


	// 加精
	public function dog()
	{
		$pid = $_GET['pid'];

		$post = M('bbs_post') -> where("pid=$pid ") -> find();
		$data = [];
		if($post['is_jing']==1) {
			$data['is_jing'] = 0;
		} else {
			$data['is_jing'] = 1;			
		}
		M('bbs_post') -> where("pid = $pid") ->save($data);

		header('location: /index.php/admin/look/index');

	}
}