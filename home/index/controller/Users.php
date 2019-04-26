<?php
namespace app\index\controller;

use think\Controller;

class Users extends Common
{
    public function login()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多 - 登录',
            'type' => $type
        ]);
        return $this->fetch();
    }

    public function login_operate()
    {
        if($_POST){
            $captcha = $_POST['captcha'];
            if(!captcha_check($captcha)){
                $this->error('验证码错误', url('index/users/login'));
            } else{
                $user = model('user');
                $user_name = $_POST['user_name'];
                $user_password = $_POST['user_password'];

                $user_info = $user
                ->where('user_name', $user_name)
                ->find();
                $cid = $user_info['id'];
                if(empty($user_info)){
                    $this->error('用户不存在，请重新登陆');
                } else{
                    if(md5($user_password) != $user_info['user_password']){
                        $this->error('密码不正确，请重新登陆');
                    } else{
                        session('cid', $cid);
                        session('session_start_time_f', time());
                        $this->success("登陆成功", url('index/index/index'));
                    }
                }
            }
        }
    }

    public function register()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 注册',
            'type' => $type
        ]);
    	return $this->fetch();
    }

    public function register_operate()
    {
        if($_POST){
            $data['user_name'] = $_POST['user_name'];
            $data['user_password'] = md5($_POST['user_password']);

            $user = model('user');
            $name = $user->where('user_name', $data['user_name'])
                ->find();
            if(!$name){
                $user->data([
                    'user_name' => $data['user_name'],
                    'user_password' => $data['user_password']
                ]);
                $re = $user->save();
                if($re){
                    $this->success('注册成功！', url('index/index/index'));
                }
            } else{
                $this->error('用户名已被使用！');
            }
        }
    }

    public function logout(){
        session(null);
        $re = session('?cid');
        if(!$re){
            $this->success('登出成功', url('index/index/index'));
        } else{
            $this->error('登出失败');
        }
    }

    public function my_account()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 账户中心',
            'type' => $type
        ]);
    	return $this->fetch();
    }
}