<?php
namespace Home\Controller;

use Think\Controller;

class UserController extends Controller
{
	public function edit()
	{
		$uid   = $_SESSION['userInfo']['uid'];
		$users = M('bbs_user') -> find($uid);

		$this -> assign('users', $users);
		$this -> display();
	}

	public function update()
	{

		$uid = $_GET['uid'];
		$data = $_POST;

		// 可能上传新的头像
		if ($_FILES['uface']['error'] !== 4) {

			$data['uface'] = $this -> doUp();  // 处理上传文件
			$this -> doSm();  // 生成缩略图
			// unlink('./'.$user -> uface);  // 删除原来的头像
		}

		$row = M('bbs_user') -> where("uid=$uid") -> save($data);

		if($row) {
			$this -> success('更新成功');
		} else {
			$this -> error('更新失败');
		}
	}

	// 文件上传处理
    public function doUp()
    {
		 
        $config = [
              'maxSize' => 3145728,
              'rootPath' => './',
              'savePath' => 'Public/Uploads/',
              'saveName' => array('uniqid',''),
              'exts' => array('jpg', 'gif', 'png', 'jpeg'),
              'autoSub' => true,
              'subName' => array('date','Ymd'),
        ];
        // 实例化对象
        $upload = new \Think\Upload($config);

        $info = $upload -> upload();

        if(!$info) {
        // 上传错误提示错误信息
        $this -> error($upload -> getError());
        }

        // 拼接上传文件的完整名称
        return $this -> filename = $info['uface']['savepath'].$info['uface']['savename'];
    }

    // 生成缩略图
    public function doSm()
	{
	    // 打开$filename文件, 后续进行处理
        $image = new \Think\Image(\Think\Image::IMAGE_GD, $this -> filename);
        // 进行缩放处理,生成新的缩略图文件
        $image -> thumb(100, 100) -> save('./'.getSm($this -> filename));
	}

}