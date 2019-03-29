<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;

class Common extends Controller
{
    // 当任何函数加载时候  会调用此函数
    public function _initialize(){
        $re = input('?session.uid');
        if(empty($re)){
            echo '<script>alert("您还没有登陆");window.parent.location.href="'.url('index/login/login').'"</script>';exit;
            // $this->error('您还没有登录', url('index/login/login'));
        }
        $auth = new Auth(); //实例化auth类

        //获取当前页面的module/controller/action
        $controller = request()->controller();
        $action = request()->action();
        $module = request()->module();

        $rules = $controller.'/'.$action; //定义检查规则：controller/action

        $check = db('auth_rule')->where('status', '1')->select();
        //定义需要检查的controller/action
        $checkList = array();
        foreach ($check as $key => $value) {
            array_push($checkList, $check[$key]['name']);
        }

        if(in_array($rules, $checkList)){  //如果在检查队列里才检查权限
            if(!$auth->check($rules, session('uid'))){ //检查session uid对应的用户组是否具有权限
                $this->error('您没有权限', url('index/index/welcome'));
            }
        }
    }
}