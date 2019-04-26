<?php
namespace app\index\controller;

use think\Controller;

class Checkout extends Common
{
    public function checkout()
    {
    	$type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 结算',
            'type' => $type
        ]);
        return $this->fetch();
    }
}