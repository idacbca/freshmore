<?php
namespace app\index\controller;

use think\Controller;

class Index extends Common
{
    public function index()
    {
        $type = $this->getCatgory();
       
        $this->assign([
            'title' => '鲜多多生鲜网',
            'type' => $type
        ]);
        //var_dump($type);
        return $this->fetch();
        
    }

    public function aboutus()
    {
        $type = $this->getCatgory();

        $this->assign([
            'title' => '鲜多多 - 关于我们',
            'type' => $type
        ]);
    	return $this->fetch();
    }
    
    
}