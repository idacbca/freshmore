<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{
    public function shop_left_sidebar()
    {
        return $this->fetch();
    }

    public function product_detail()
    {
    	return $this->fetch();
    }
}