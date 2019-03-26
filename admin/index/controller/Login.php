<?php
namespace app\index\controller;

use think\Controller;

class Login extends Controller
{
    public function login()
    {
        return $this->fetch();
    }

    // 登录函数
    public function do_login()
    {
    	$m=db('admin_user');
    	$data=$m->where('admin_name', $_POST['admin_name'])->where('admin_password', md5($_POST['admin_password']))->find();
    	if($data){
    		session('user',$data);
    		$this->success("登陆成功", url('index/index/index'));
    	}else{
    		$this->error("登陆失败");
    	}
    }
}