<?php
namespace app\index\controller;

use think\Controller;

class Index extends Common
{
    public function index()
    {
    	$user = db('admin_user')->where('id', session('uid'))->find();
    	$admin_name = $user['admin_name'];
    	$id = $user['id'];
    	$this->assign('admin_name', $admin_name);
        return $this->fetch();
    }

    public function welcome()
    {
        return $this->fetch();
    }

    public function logout()
    {
    	session(null);
    	$re = session('?uid');
    	if(!$re){
    		$this->success('登出成功', url('index/login/login'));
    	} else{
    		$this->error('登出失败');
    	}
    }
}