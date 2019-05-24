<?php
namespace app\index\controller;

use think\Controller;
use think\Session;

class Index extends Common
{
    public function index()
    {
        $type = $this->getCatgory();
        $allgoods=$this->getCart();
        $total=Session::get('total'); 
        $this->assign([
            'title' => '鲜多多生鲜网',
            'type' => $type,
            'allgoods'=> $allgoods,
            'total'=>$total
        ]);
        // var_dump($allgoods);
        return $this->fetch();
        
    }

    public function aboutus()
    {
        $type = $this->getCatgory();
        $allgoods=$this->getCart();
        $total=Session::get('total'); 
        $this->assign([
            'title' => '鲜多多 - 关于我们',
            'type' => $type,
            'allgoods'=>$allgoods,
            'total'=>$total
        ]);
    	return $this->fetch();
    }
    
    
}