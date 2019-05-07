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
            $goods = model('goods');
            $tpid = model('goods_type');
            $id = $tpid->where('pid',input('id'))->column('id');
           // var_dump($id);
            if($id){
                foreach($id as $m){
                    $data = $goods->where('tid', $m)
                    ->whereOr('tpid', $m)
                    ->select();
                    //var_dump($data); 
                    
            } 
            //var_dump($data);                           
            $this->assign([
                'product' => $data,
                'type' => $type,
                'idpath' => $idpath, 
                'title' => '鲜多多生鲜网 - 商城'
            ]);
            return $this->fetch(); 
            }else{
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
            $goods = model('goods');
            $data = $goods->select();
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
            $type = $this->getCatgory();
            $goods = model('goods');
            $idpath = $this->getPath();
            $data = $goods->where('id', input('id'))->select();
            $this->assign([
                'details' => $data,
                'idpath' => $idpath,
                'type' => $type
            ]);
            return $this->fetch();
        } else{
            $type = $this->getCatgory();
            $goods = model('goods');
            $idpath = $this->getPath();
            $data = $goods->select();
            $this->assign([
                'details' => $data,
                'type' => $type,
                'idpath' => $idpath
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
    
}