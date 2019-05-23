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

    //生成订单
    public function ordersadd(){

        $orders=model('orders');
        $ordersdetail=db('ordersdetail');
        
        $id=input('session.cid');//获取session中用户id
        $username=db('user')->where('id',$id)->value('user_name');
        $orderstate=1;
        $freight=$_POST['freight'];
        $payinfo=$_POST['total'];
        
        $user = model('user');
        $data = $user->where('user_name',$username)->find();

        if(is_null($data['address'])||is_null($data['telephone'])){
            $this->error("请先完善个人信息");

        if($payinfo==0)
        {
            $this->error("亲，请先添加商品！","index/index/index");
        }
        
        }else{
        $orders->data([
            'id'=>$id,
            'username'=>$username,
            'orderstate'=>$orderstate,
            'freight'=>$freight,
            'payinfo'=>$payinfo,
            'address'=>$data['address'],
            'telephone'=>$data['telephone']
                  ]);
             

        $re = $orders->save();
        
        $orderid=db('orders')->where('id',$id)->max('orderid');
        $cartdetail=db('cartdetail')->where('id',$id)->select();

        foreach ($cartdetail as $vo)
           {

             
$data=['orderid'=>$orderid,'goods'=>$vo['goodsname'],'quantity'=>$vo['quantity'],'unitprice'=>$vo['unitprice']];

             db('ordersdetail')->insert($data);
            }

         $ra=db('ordersdetail')->where('orderid',$orderid)->select();

         $rg=db('cartdetail')->where('id',$id)->delete();

        if($re&&$ra)
          {
              $this->success("添加成功","index/index/index");
          }
       
        }
    }

//ajax生成订单
//     public function orders_add_ajax(){

//         $orders=model('orders');
//         $ordersdetail=db('ordersdetail');
//         $id=input('session.cid');//获取session中用户id
//         $username=db('user')->where('id',$id)->value('user_name');
//         $orderstate=1;
//         $freight=$_POST['freight'];
//         $payinfo=$_POST['total'];
        
        

//         $orders->data([
//             'id'=>$id,
//             'username'=>$username,
//             'orderstate'=>$orderstate,
//             'freight'=>$freight,
//             'payinfo'=>$payinfo
//                   ]);
             

//         $re = $orders->save();
        
//         $orderid=db('orders')->where('id',$id)->max('orderid');
//         $cartdetail=db('cartdetail')->where('id',$id)->select();

//         foreach ($cartdetail as $vo)
//            {

             
// $data=['orderid'=>$orderid,'goods'=>$vo['goodsname'],'quantity'=>$vo['quantity'],'unitprice'=>$vo['unitprice']];

//              db('ordersdetail')->insert($data);
//             }

//          $ra=db('ordersdetail')->where('orderid',$orderid)->select();

//         if($re&&$ra)
//           {
//               echo 1;
             
//           }

//           else
//               echo 0;
       
       
//     }
}  