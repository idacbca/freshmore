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
    	$admin_name = $_POST['admin_name'];
        $admin_password = $_POST['admin_password'];
        $m = db('admin_user');
    	// $admin_info = $m->where('admin_name', $admin_name)->where('admin_password', md5($admin_password))->find();
        $admin_info = $m
        ->where('admin_name', $_POST['admin_name'])
        ->find();
    	$uid = $admin_info['id'];

        if(empty($admin_info)){
            $this->error('用户不存在，请重新登陆',url('index/login/login'));
        } else{
            if(md5($admin_password) != $admin_info['admin_password']){
                $this->error('密码不正确，请重新登陆',url('index/login/login'));
            } else{
                session('uid', $uid);
                $this->success("登陆成功", url('index/index/index'));
            }
        }
    }
}