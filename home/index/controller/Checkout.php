<?php
namespace app\index\controller;

use think\Controller;

class Checkout extends Controller
{
    public function shop_left_sidebar()
    {
        return $this->fetch();
    }
}