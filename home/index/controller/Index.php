<?php
namespace app\index\controller;

use think\Controller;

class Index extends Common
{
    public function index()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
        //var_dump($type);
        return $this->fetch();
        
    }

    public function about_us()
    {
        $type = $this->getCatgory();
        $this->assign('type',$type);
    	return $this->fetch();
    }
    
    
}