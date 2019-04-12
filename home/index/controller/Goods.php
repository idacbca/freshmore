<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Common
{
    public function shop_left_sidebar()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
        return $this->fetch();
    }

    public function product_details()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
    	return $this->fetch();
    }

    public function cart()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
    	return $this->fetch();
    }
    
   
}