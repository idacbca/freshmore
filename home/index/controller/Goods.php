<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Common
{
    public function shop_left_sidebar()
    {
        if(input('id')){
            $type = $this->getCatgory();
            $idpath = $this->getPath();
            $goods = db('goods');
            $tpid = model('goods_type');
            $id = $tpid->where('pid',input('id'))->column('id');//父类为传过来的id
            // var_dump($id);
            $data = array();
            if($id){
                foreach($id as $m){
                    $data2 = $goods->where('tid|tpid', $m) 
                    ->select();
                    //var_dump($data2);
                    if($data2 != null){
                        array_push($data,$data2);
                    }
                     
            }
            //var_dump($data2); 
            //var_dump($data);                           
            $this->assign([
                'product' => $data,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城'
            ]);
            return $this->fetch(); 
            } else{//三级分类
                $data = $goods->where('tid', input('id'))
                ->whereOr('tpid', input('id'))
                ->select();

                $this->assign([
                    'product' => $data,
                    'type' => $type,
                    'idpath' => $idpath, 
                    'title' => '鲜多多生鲜网 - 商城'
                ]);
                return $this->fetch(); 

            }
                                     
        } else{
            $type = $this->getCatgory();
            $idpath = $this->getPath();
            $goods = db('goods');
            $data2 = $goods->select();
            $data[0]= $data2;
            $this->assign([
                'product' => $data,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城'
            ]);
            return $this->fetch();
        }
    }


    public function product_details()
    {
        if(input('id')){
            //var_dump(input('id'));
            $type = $this->getCatgory();
            $goods = model('goods');
            $img = $this->getimgPath();
            $idpath = $this->getGoodsPath();
            $data = $goods->where('id', input('id'))->select();
            $this->assign([
                'details' => $data,
                'idpath' => $idpath,
                'type' => $type,
                'img' => $img
            ]);
            return $this->fetch();
        } else{
            $type = $this->getCatgory();
            $goods = model('goods');
            $idpath = $this->getGoodsPath();
            $img = $this->getimgPath();
            $data = $goods->select();
            $this->assign([
                'details' => $data,
                'type' => $type,
                'idpath' => $idpath,
                'img' => $img
            ]);
            return $this->fetch();
        }
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
    
    public function searchGoods(){
        $goodsname = $_POST['goodsname'];
        $m = db('goods');
        $type = $this->getCatgory();
        $idpath = $this->getPath();
        $data = $m->where('goodsname','like','%'.$goodsname.'%')->select();
        if($data){
            $this->assign([
                'product' => $data,
                'data' => $data,
                'idpath' => $idpath,
                'type' => $type
				
            ]);
            return $this->fetch("shop_left_sidebar");
        } else{
            $this->assign([
                'product' => $data,
                'idpath' => $idpath,
                'type' => $type
				
            ]);
            return $this->fetch("shop_left_sidebar");
        }
    }
    // public function orderWay(){
    //     $orderby=switch(){

    //     }
    //     $id = $_POST['id'];
    //     $popular = $_POST['popular'];
    //     $price = $_POST['price'];
    //     $time = $_POST['time'];
	// 	$db = db('goods');
	// 	$re = $db->orderRaw('id');
	// 	if($re){
	// 		echo 1;
    //     }else echo 0;
    //     return $this->fetch("shop_left_sidebar");

        	  
 
    // }
                 
			
      
    
    
}