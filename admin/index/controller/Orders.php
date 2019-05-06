<?php
namespace app\index\controller;

use think\Controller;

class Orders extends Controller
{

      //订单查询界面
      public function orders()  {
        //输入查询信息时
       if($_POST){
          
         $search=$_POST['search'];
         $orders=db('orders');
        
         $data = $orders->where('orderid','like','%'.$search.'%')->select();
         $count=count($data);
        
         $this->assign([
             'data'=>$data,
             'search'=>$search,
             'count'=>$count,
             
         ]);
          return $this->fetch();
                 
                 }

       //没有输入查询信息时
       else{
         $orders = db('orders');
                        $data = $orders->select();
                        $count = count($data);
                        $this->assign([
                           'data' => $data,
                           'count' => $count
                        ]);
                    return $this->fetch();
          }   
                               }   
       
        public function orders_del_ajax()
        {
		$id = $_POST['id'];
		$db = db('orders');
		$re = $db->where('orderid', $id)->delete();
		if($re){
			echo 1;
		}else echo 0;
        }

        
        //订单详情
        public function ordersdetail()
        {
           
           $id = input('param.id');//获取传入的id
           $data=db('ordersdetail')->where('orderid',$id)->select();


           $this->assign('data',$data);
           return $this->fetch();

        }

        public function ordersdetail_del_ajax()
        {
		$id = $_POST['id'];
		$db = db('ordersdetail');
		$re = $db->where('id', $id)->delete();
		if($re){
			echo 1;
		}else echo 0;
        }
} 




