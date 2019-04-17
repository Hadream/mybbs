<?php
namespace Admin\Controller;

use Think\Controller;

class PartController extends CommonController
{
    // 添加分区-表单
    public function create()
    {
    	$this -> display();  // View/Part/create.html
    }

    // 添加分区-接收数据,保存
    public function save()
    {
    	$row = M('bbs_part') -> add($_POST);

    	if ($row) {
    		$this -> success('添加分区成功');
    	} else {
    		$this -> error('添加分区失败');
    	}
    }

    // 查看所有分区
    public function index()
    {
    	// 获取数据
    	$parts = M('bbs_part') -> select();

        // 实例化一个表对象
        $User = M('bbs_part');
        $condition = [];

        // 得到满足条件的总记录数
        $cnt = $User -> where($condition) -> count();  

        // 实例化分页类 传入总记录数和每页显示的记录数(3)
        $Page = new \Think\Page($cnt, 3);

        // 得到分页显示html代码
        $html_page = $Page -> show();

        // 获取数据
        $parts = $User -> where($condition) 
                     -> limit($Page -> firstRow, $Page -> listRows)
                     -> select();

    	// 遍历显示
    	$this -> assign('parts', $parts);
        $this -> assign('html_page', $html_page);
    	$this -> display(); // View/Part/index.html
    }

    // 删除分区
    public function del()
    {
    	$pid = $_GET['pid'];

    	$row = M('bbs_part') -> delete($pid);

    	if($row) {
    		$this -> success('删除分区成功');
    	} else {
    		$this -> error('删除分区失败');
    	}
    }

    // 修改分区-显示原有数据
    public function edit()
    {
    	$pid = $_GET['pid'];
    	$part = M('bbs_part') -> find($pid);

    	$this -> assign('part', $part);
    	$this -> display();
    }

    // 修改分区-接收修改后的数据,更新
    public function update()
    {
    	$pid = $_GET['pid'];

    	$row = M('bbs_part') -> where("pid = $pid") -> save($_POST);

    	if($row) {
    		$this -> success('修改分区成功');
    	} else {
    		$this -> error('修改分区失败');
    	}
    }

}
