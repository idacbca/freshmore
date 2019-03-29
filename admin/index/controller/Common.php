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
        /*$notCheck = array(
            //不检查主页和登出
            'Index/logout',
            'Index/index',
            'Index/welcome',
            'Goods/product_list',
            //商品分类内嵌页添加/删除函数
            'Goods/product_category_add',
            'Goods/goods_type_add',
            'Goods/product_category_ajax', 
            'Goods/product_category_del',
        ); //定义不需要检查的c/a*/

        $checkList = array(
            'Goods/product_category',  //分类管理页
            'Goods/goods_type_add',  //分类添加
            'Goods/product_list'  //商品管理页
        );

        if(in_array($rules, $checkList)){
            if(!$auth->check($rules, session('uid'))){
                $this->error('您没有权限');
            }
        }
    }
}