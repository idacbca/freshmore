<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function about_us()
    {
    	return $this->fetch();
    }

    public function my_account()
    {
    	return $this->fetch();
    }
}