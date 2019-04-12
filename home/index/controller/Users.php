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