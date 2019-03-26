<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;

class Common extends Controller
{
    // 当任何函数加载时候  会调用此函数
    public function _initialize(){
        $uid = session('uid');
        $re = input('?session.uid');
        if(empty($re)){
            echo '<script>alert("您还没有登陆");window.parent.location.href="'.url('index/login/login').'"</script>';exit;
            // $this->error('您还没有登录', url('admin/login/login'));
        }

        $AUTH = new Auth();
        // MODULE_NAME(index).'/'.CONTROLLER_NAME(index).'/'.ACTION_NAME(index)==index/index/index

        $controller = request()->controller();
        $action = request()->action();
        $module = request()->action();
        // if(!$AUTH->check(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME, session('user')['id'])){
        if(!$AUTH->check($module.'/'.$controller.'/'.$action, $uid)){
        
          // echo '<script>location.href="'.url('index/login/check_error').'"</script>';
            $this->error('您没有权限', url('index/index/welcome'));
        }
    }
}