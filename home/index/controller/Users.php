<?php
namespace app\index\controller;

use think\Controller;

class Users extends Controller
{
    public function login()
    {
        return $this->fetch();
    }

    public function register()
    {
    	return $this->fetch();
    }

    public function my_account()
    {
    	return $this->fetch();
    }
}