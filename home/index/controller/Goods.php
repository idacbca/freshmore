<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Common
{
    public function shop_left_sidebar()
    {
        if(input('?get.id')){
            $type = $this->getCatgory();
            $m = db('goods');
            $data = $m->where("tid=".$_GET['id'].'or tpid='.$_GET['id'])->select();
            //var_dump($data);
            $this->assign([
                'product' => $data,
                'type' => $type
            ]);
            return $this->fetch();
        } else{
            $type = $this->getCatgory();
            $goods = model('goods');
            $data = $goods->select();
            $this->assign([
                'product' => $data,
                'type' => $type
            ]);
            return $this->fetch();
        }
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