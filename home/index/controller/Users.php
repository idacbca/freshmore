<?php
namespace app\index\controller;

use think\Controller;

class Users extends Common
{
    public function login()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
        return $this->fetch();
    }

    public function login_operate()
    {
        if($_POST){
            $captcha = $_POST['captcha'];
            if(!captcha_check($captcha)){
                $this->error('验证码错误', url('index/users/login'));
            } else{
                $data['admin_name'] = $_POST['admin_name'];
                $data['admin_password'] = md5($_POST['admin_password']);
            }
        }
    }

    public function register()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
    	return $this->fetch();
    }

    public function my_account()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
    	return $this->fetch();
    }
}