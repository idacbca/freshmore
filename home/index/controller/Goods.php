<?php
namespace app\index\controller;

use think\Controller;
use think\Session;

class Goods extends Common
{
    public function shop_left_sidebar()
    {
        if(input('id')){
            $type = $this->getCatgory();
            $idpath = $this->getPath();
            $allgoods=$this->getCart();
            $total=Session::get('total'); 
            //$page = $this->userlistAction();
            $goods = db('goods');
            $tpid = model('goods_type');
            $id = $tpid->where('pid',input('id'))->column('id');//父类为传过来的id
            $k = db('goods_files');
            $data = array();
            $data2 = array();
            $imgid = array();
            $data3 = array();
            if($id){
                foreach($id as $m){
                    $data2 = $goods->where('tid|tpid', $m) 
                    ->select();//多个二维数组
                    
                    foreach($data2 as $h=>&$y){
                        $imgid = $k->where('id', $data2[$h]['filepath']) 
                    ->value('filepath');//多个一维数组
                        $data2[$h]['filepath']=$imgid;
                        $stu = $data2[$h]['status'];
                        if($stu == 0){
                            array_push($data3,$data2[$h]);
                        } 
                        

                    }
                }
           // array_push($data3,$data2); 
            //var_dump($data3);       
            $this->assign([
                'product' => $data3,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城',
                'allgoods'=> $allgoods,
                'total'=>$total
            ]);
            return $this->fetch(); 
            } else{//三级分类
                $data = $goods->where('tid', input('id'))
                ->whereOr('tpid', input('id'))
                ->select();
                $imgid = $k->where('id', $data[0]['filepath']) //获取图片
                    ->value('filepath');
                $data[0]['filepath']=$imgid;
                $img = $this->getimgPath();
                $stu = $data[0]['status'];
                if($stu == 0){
                    array_push($data2,$data[0]);
                }
                //var_dump($data2);
                $this->assign([
                    'product' => $data2,
                    'type' => $type,
                    'idpath' => $idpath, 
                    'title' => '鲜多多生鲜网 - 商城',
                    'allgoods'=> $allgoods,
                    'total'=>$total
                ]);
             return $this->fetch(); 

            }
                                     
        } else{//点击商品分类
            $type = $this->getCatgory();
            $idpath = $this->getPath();
            $allgoods=$this->getCart();
            $total=Session::get('total'); 
            $goods = db('goods');
            $k = db('goods_files');
            $data2 = $goods->where('status', 0)->select();
            foreach($data2 as $info=>$is){
                $imgid = $k->where('id', $is['filepath']) //获取图片
                ->value('filepath');
                $data2[$info]['filepath']=$imgid;
                
                

            }
            //var_dump($data2);
            
            $this->assign([
                'product' => $data2,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城',
                'allgoods'=> $allgoods,
                'total'=>$total
            ]);
            return $this->fetch();
        }
    }




 //public function cartadd()  添加商品到购物车

   public function cartadd()
    {
        $cartdetail=model('cartdetail');
        $goods=db('goods');
        $quantity=$_POST['quantity'];
        $goodsid=$_POST['goodsid'];
        $k = db('goods_files');
        $id=input('session.cid');//获取session中用户id
        $goodsname= $goods->where('id',$goodsid)->value('goodsname');
        $unitprice= $goods->where('id',$goodsid)->value('curprice');
        $inventory= $goods->where('id',$goodsid)->value('inventory');
        $totalprice=$unitprice*$quantity;
        if($id==null)
        {
            $this->error("请您先登录！","index/users/login"); 
        }
        if($inventory<$quantity){
            $this->error("库存不足，请重新选择！");
        }
        $ra=db('cartdetail')->where('id',$id)->where('goodsid',$goodsid)->select();
        $imgid = $goods->where('id', $_POST['goodsid']) 
        ->value('filepath');//多个一维数组
        $imgpath = $k->where('id', $imgid) 
        ->value('filepath');
        

        //除此之外还有删除功能需要调整
        
        if($ra)//如果购物车中存在相同商品
        {   
             $selfid=db('cartdetail')->where('id',$id)->where('goodsid',$goodsid)->value('selfid');
             $quantity1=db('cartdetail')->where('selfid',$selfid)->value('quantity');
             $quantity2=$quantity+$quantity1;
             $totalprice1=db('cartdetail')->where('selfid',$selfid)->value('totalprice');
             $totalprice2=$totalprice+$totalprice1;
             $cartdetail->where('selfid',$selfid)->update(['quantity' => $quantity2]);
             $cartdetail->where('selfid',$selfid)->update(['totalprice' =>$totalprice2]);

             //不知道为什么每次这样更新后数据库会额外生成一行为0无意义的数列，所以这里删了之前的0防止冗余,不过还是永远有一行零数据，不过不影响功能
             db('cartdetail')->where('id',0)->delete();
        }
        else{
        $cartdetail->data([
            'id'=>$id,
            'goodsid'=>$goodsid,
            'goodsname'=>$goodsname,
            'unitprice'=>$unitprice,
            'quantity' =>$quantity,
            'totalprice'=>$totalprice,
            'img' =>$imgpath 
            ]);
        }
        //var_dump($cartdetail);
        $newinventory=$inventory-$quantity;

        $goods->where('id', $goodsid)->update(['inventory' => $newinventory]);

        $re = $cartdetail->save();
        if($re)
          {
              $this->success("添加成功","index/goods/shop_left_sidebar");
          }
                     
       return $this->fetch();






    }

 //删除购物车中的商品
    public function cart_del_ajax(){
        $selfid = $_POST['id'];
        $cartdetail = db('cartdetail');
        $quantity=$cartdetail->where("selfid",$selfid)->value('quantity');
        $goodsid=$cartdetail->where("selfid",$selfid)->value('goodsid');
        $goods=db('goods');
        $inventory=$goods->where('id',$goodsid)->value('inventory');
        $newinventory=$inventory+$quantity;

        $setinventory=$goods->where('id',$goodsid)->update(['inventory'=>$newinventory]);

        $re=$cartdetail->where('selfid',$selfid)->delete();

    if($re){
    echo 1;
       }

    else echo 0;

 }


 //商品详情  
    public function product_details()
    {
        if(input('id')){
            //var_dump(input('id'));
            $type = $this->getCatgory();
            $allgoods=$this->getCart();
            $total=Session::get('total'); 
            $goods = model('goods');
            $img = $this->getimgPath();
            $idpath = $this->getGoodsPath();
            $data = $goods->where('id', input('id'))->select();
            $this->assign([
                'details' => $data,
                'idpath' => $idpath,
                'type' => $type,
                'img' => $img,
                'allgoods'=> $allgoods,
                'total'=>$total
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
                'img' => $img,
                'allgoods'=> $allgoods,
                'total'=>$total
            ]);
            return $this->fetch();
        }

     
    }

    public function cart()
    {
    $type = $this->getCatgory();
    $allgoods=$this->getCart();
    

    $id=input('session.cid');//获取session中用户id

    $cartdetail = db('cartdetail')->where('id',$id)->select();
    $totalprice = db('cartdetail')->where('id',$id)->sum('totalprice');
    $start=0;
    
    foreach ($cartdetail as $vo){
             
    $freight=db('goods')->where('id',$vo['goodsid'])->value('freight');
    if($freight>$start){
        $start=$freight;
     }
    }
  //消费大于99元免运费
    if($totalprice>=99)
        {
            $freight=0;
        }
    else
        {
            $freight=$start;
        }   

    $total=$totalprice+$freight;
        session('total',$total);
    $this->assign([
        'type' => $type,
        'title' => '鲜多多生鲜网 - 购物车',
        'cartdetail' => $cartdetail,
        'totalprice'=> $totalprice,
        'freight'=>$freight,
        'total'=>$total,
        'allgoods'=> $allgoods,
        
    ]);

        return $this->fetch();
    }
    
    public function searchGoods(){
    $goodsname = $_POST['goodsname'];
    //var_dump($goodsname);
    $m = db('goods');
    $k = db('goods_files');
    $type = $this->getCatgory();
    $idpath = $this->getPath();
    //var_dump($idpath);
    $data3 = array(); 
    $data2 = $m->where('goodsname','like','%'.$goodsname.'%')->select();
    //var_dump($data2);
    foreach($data2 as $h=>&$y){
        $imgid = $k->where('id', $data2[$h]['filepath']) 
    ->value('filepath');//多个一维数组
        $data2[$h]['filepath']=$imgid;
        $stu = $data2[$h]['status'];
        if($stu == 0){
            array_push($data3,$data2[$h]);
        } 
        

    }
    //var_dump($data3);
       if($data3){
        $this->assign([
            'product' => $data3,
            'idpath' => $idpath,
            'type' => $type
				
        ]);
        return $this->fetch("shop_left_sidebar");
    } else{
        $this->assign([
            'product' => $data3,
            'idpath' => $idpath,
            'type' => $type
				
        ]);
        
        return $this->fetch("shop_left_sidebar");
    }
   
    }
}