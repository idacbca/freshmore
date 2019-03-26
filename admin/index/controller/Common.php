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
            // echo '<script>alert("您还没有登陆");window.parent.location.href="'.url('index/login/login').'"</script>';exit;
            $this->error('您还没有登录', url('admin/login/login'));
        }
        $auth = new Auth(); //实例化auth类

        //获取当前页面的module/controller/action
        $controller = request()->controller();
        $action = request()->action();
        $module = request()->module();

        $rules = $controller.'/'.$action; //定义检查规则：controller/action
        $notCheck = array('index/index','index/welcome'); //定义不需要检查的c/a

        // if(!$AUTH->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME, session('user')['id'])){
        if(!$auth->check($rules, session('uid'))){
            $this->error('您没有权限', url('index/index/welcome'));
        }
    }
}