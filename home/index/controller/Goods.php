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
            //var_dump($id);
            $data = array();
            $path = array();
            if($id){
                foreach($id as $m){
                    $data2 = $goods->where('tid|tpid', $m) 
                    ->select();
                    //var_dump($data2); 
                    if($data2 != null){
                        array_push($data,$data2);
                    }
                    
                     
                }
                foreach($data as $n){
                    foreach($n as $v){
                        $img = $v['filepath'];
                        array_push($path,$img);
                        
                    }
                }
                //var_dump($path);
                $k = db('goods_files');
                $imgpath = array();
                $filepath = array();
                foreach($path as $path2){
                    $img = explode(',',$path2);
                    foreach($img as $img2){
                        $imgpath2 = $k->where('id',$img2)->find();
                        //var_dump($imgpath2);
                        array_push($imgpath,$imgpath2);
                    } 

                }
               
                foreach($imgpath as $q){
                    $filepath2 = $q['filepath'];
                    array_push($filepath,$filepath2);
                }  
            //var_dump($data);
            //var_dump($filepath);
            $id = $this->replacevalue($data,$filepath);                        
            $this->assign([
                'product' => $data,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城',
                'filepath' => $filepath
            ]);
            return $this->fetch(); 
            } else{//三级分类
                $data = $goods->where('tid', input('id'))
                ->whereOr('tpid', input('id'))
                ->select();
                $data2[0]= $data;
                //var_dump($data2); 
                $this->assign([
                    'product' => $data2,
                    'type' => $type,
                    'idpath' => $idpath, 
                    'title' => '鲜多多生鲜网 - 商城',
                    //'img' => $img
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




 //public function cartadd()  添加商品到购物车

   public function cartadd()
    {
        $cartdetail=model('cartdetail');
        $goods=db('goods');
        $quantity=$_POST['quantity'];
        $goodsid=$_POST['goodsid'];
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
            'totalprice'=>$totalprice
                         ]);
        }

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
        'type' => $type,
        'title' => '鲜多多生鲜网 - 购物车',
        'cartdetail' => $cartdetail,
        'totalprice'=> $totalprice,
        'freight'=>$freight,
        'total'=>$total
    ]);

        return $this->fetch();
    }
    
    public function searchGoods(){
    $goodsname = $_POST['goodsname'];
    //var_dump($goodsname);
    $m = db('goods');
    $type = $this->getCatgory();
    $idpath = $this->getPath();
    //var_dump($idpath); 
    $data2 = $m->where('goodsname','like','%'.$goodsname.'%')->select();
    $data[0]= $data2;
    //var_dump($data);
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
}