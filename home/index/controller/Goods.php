<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Common
{
    public function shop_left_sidebar()
    {
        if(input('?get.id')){
            $type = $this->getCatgory();
            $goods = model('goods');
            $data = $goods->where("tid=".$_GET['id'].'or tpid='.$_GET['id'])->select();
            //var_dump($data);
            $this->assign([
                'product' => $data,
                'type' => $type,
                'title' => '鲜多多生鲜网 - 商城'
            ]);
            return $this->fetch();
        } else{
            $type = $this->getCatgory();
            $goods = model('goods');
            $data = $goods->select();
            $this->assign([
                'product' => $data,
                'type' => $type,
                'title' => '鲜多多生鲜网 - 商城'
            ]);
            return $this->fetch();
        }
    }


    public function product_details()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 商品详情',
            'type' => $type
        ]);
    	return $this->fetch();
    }

    public function cart()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 购物车',
            'type' => $type
        ]);
        return $this->fetch();
    }
    
    
}