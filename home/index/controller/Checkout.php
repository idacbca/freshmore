<?php
namespace app\index\controller;

use think\Controller;

class Checkout extends Common

{
    public function checkout()
    {

        $type = $this->getCatgory();
        $id=input('session.cid');//获取session中用户id
        $cartdetail=db('cartdetail')->where('id',$id)->select();
        $totalprice = db('cartdetail')->where('id',$id)->sum('totalprice');
        $start=0;

        foreach ($cartdetail as $vo)
           {
             
            $freight=db('goods')->where('id',$vo['goodsid'])->value('freight');
             if($freight>$start)
             {
                 $start=$freight;
             }
            }
//消费大于五万免运费
        if($totalprice>=50000)
           {
               $freight=0;
           }
       else
           {
               $freight=$start;
           }

           $total=$totalprice+$freight;
        $this->assign([
            'title' => '鲜多多生鲜网 - 结算',
            'type' => $type,
            'cartdetail'=>$cartdetail,
            'totalprice'=>$totalprice,
            'freight'=>$freight,
            'total'=>$total
        ]);
        return $this->fetch();
    }
}  