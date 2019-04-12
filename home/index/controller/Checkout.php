<?php
namespace app\index\controller;

use think\Controller;

class Checkout extends Controller
{
    public function checkout()
    {
    	$type = $this->getCatgory();
        $this->assign('type',$type);
        return $this->fetch();
    }
}