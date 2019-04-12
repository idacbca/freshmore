<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{
    public function shop_left_sidebar()
    {
        $goodstype = model('GoodsType');
        return $this->fetch();
    }

    public function product_details()
    {
    	return $this->fetch();
    }

    public function cart()
    {
    	return $this->fetch();
    }
    
   
}