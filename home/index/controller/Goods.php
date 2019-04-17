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
        if($_GET['id']){
            $m=db('goods');
            $data=$m->where("tid=".$_GET['id'].'or tpid='.$_GET['id'])->select();
            //var_dump($data);
            $this->assign('data',$data);
            return $this->fetch();
        }
        else{
            $m=db('goods');
          //$data=$m->where("tid=".$_GET['id'].'or tpid='.$_GET['id'])->select();
          //var_dump($data);
            $this->assign('data',$m);
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