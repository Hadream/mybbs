<?php
namespace Home\Controller;

use Think\Controller;

class ReplyController extends Controller
{
	// 添加回复
	public function create()
	{
		$pid = $_GET['pid'];
		$post = M('bbs_post') -> find($pid);
		// echo '<pre>';
		// print_r($post);die;

		// 帖子所有的回复信息
		$replys = M('bbs_reply') -> where("pid=$pid") -> select();

		// 用户信息
		$users = M('bbs_user') -> select();
		$users = array_column($users, null, 'uid');

		// 帖子浏览数+1 update bbs_post set view_cnt=view_cnt+1 where pid=xxx
		M('bbs_post') -> where("pid=$pid") -> setInc('view_cnt', 1);

		$this -> assign('replys', $replys);
		$this -> assign('users', $users);
		$this -> assign('post', $post);
		$this -> display();  // View/Reply/create.html
	}

	public function save()
	{
		if (empty($_SESSION['flag'])) {
			$this -> error('请先登录', '/');
		}

		$data = $_POST;
		$data['created_at'] = time();
		$data['uid'] = $_SESSION['userInfo']['uid'];

		$row = M('bbs_reply')  -> add($data);

		if($row) {
			$Post = M('bbs_post') -> where('pid='. $data['pid']);			
			
			$Post -> setInc('rep_cnt',1);
			$Post -> save(['updated_at'=>time()]);
			// if(!$row) {
			// 	die('<hr>帖子时间更新失败!');
			// }
			$this -> success('添加回复成功', './index.php?m=home&c=reply&a=create&pid='.$data['pid']);
		} else {
			$this -> error('添加回复失败');
		}
	}
}