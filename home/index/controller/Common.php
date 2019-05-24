<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;
use think\Session;

class Common extends Controller
{
    // 当任何函数加载时候  会调用此函数
    public function _initialize(){
        $re = input('?session.cid');
        if($re){
            if(time() - session('session_start_time_f') > config('session')['expire']) {
                session(null);//真正的销毁在这里！
                $this->error('登录已过期！', url('index/users/login'));
            } 
        }
        
    }

    public function getCatgory(){
        $m=db('goods_type');
        $type=$m->where("pid=0")->select();//获取一级分类
        $type2=array();
        $type3=array();
        foreach($type as $key=>$value){
            $type[$key]['chlid']=array();
            $type2=$m->where("pid=".$value['id'])->select();//获取二级分类

            foreach($type2 as $k=>$v){
                array_push($type[$key]['chlid'],$v);//合并一级二级分类
                $type[$key]['chlid'][$k]['chlid2']=array(); //组装三级分类的数组
                $type3=$m->where("pid=".$v['id'])->select(); //获取三级分类
                
                foreach($type3 as $v2){
                    array_push($type[$key]['chlid'][$k]['chlid2'],$v2);//合并一二三级分类
                }
            }
        }
        return $type;
    }
   
    public function getCart(){
            $cid=Session::get('cid');
            $cartdetail=db('cartdetail');
            $allgoods=$cartdetail->where('id',$cid)->select();
            
            $cartdetail = db('cartdetail')->where('id',$cid)->select();
            $totalprice = db('cartdetail')->where('id',$cid)->sum('totalprice');
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






            
            return $allgoods;
    
        }
    

    public function getPath(){//获取商品路径
        $m = db('goods_type');
        //$id = $m->where('id',input('id'))->select();
        $idpath = $m->where('id',input('id'))->value('path');
        //$idpath = $m->where('id',$id)->value('path');
        $arr2 = explode(',',$idpath);
        $arr = array_filter($arr2);
        foreach($arr as $k=>&$pathname){           
            $arr[$k] = $m->where('id',$pathname)->value('name');               
        }
        return $arr;
    }

    public function getGoodsPath(){
        $m = db('goods_type');
        $n = db('goods');
        $id = $n->where('id',input('id'))->value('tid');
        $idpath = $m->where('id',$id)->value('path');
      //  $idpath = $m->where('id',$id)->value('path');
        $arr2 = explode(',',$idpath);
        $arr = array_filter($arr2);
        $pathname2 = array();
        foreach($arr as $k=>&$pathname){           
            $arr[$k] = $m->where('id',$pathname)->value('name');               
        }
        //var_dump($arr);
        return $arr;
    }
    public function getimgPath(){
        $n = db('goods');
        $m = db('goods_files');
        $img = $n->where('id',input('id'))->value('filepath');
        $img2 = explode(',',$img);
        //var_dump($img2);
        $imgpath = array();
        foreach($img2 as $img3){
            $imgpath2 = $m->where('id',$img3)->select();
            //var_dump($imgpath2);
            array_push($imgpath,$imgpath2);
        }
        
       //var_dump($imgpath);
       return $imgpath;
    }
    public function replacevalue($arr,$arr1){
        foreach ($arr as $vi){
            foreach ($vi as $vo){
                $vo['filepath']=$arr1;
            }

        }
        //var_dump($vo);
        
         
        return $arr1;
    }
    public function userlistAction() 
    {
        //分页
        //当前页，默认为1
        $curPage = isset($_GET['curPage']) ? $_GET['curPage'] : 1;

        //获取所有的用户数据
        // 在 getTotalRows() 里面我是用count(id) as total 查询的
        $totalRows = $this->_db->getTotalRows();
        $totalRows = $totalRows['total'];

        //自定义一个最大的页码数
        $rowsPerPage = 10;

        //获取数据
        $offset = ($curPage - 1) * $rowsPerPage;

         //查询每页用户列表
         // 在 selectAll() 中，根据偏移量,使用limit 查询每页的数据
        $ret = $this->_db->selectAll($offset, $rowsPerPage);

        //总页数
        $totalpage = ceil($totalRows / $rowsPerPage);

        //存储页面字符串
        $pageNumString = '';

        if ($curPage <= 5) {
            $begin = 1;
            $end = $totalpage >= 10 ? 10 : $totalpage;
        } else {
            $end = $curPage + 5 > $totalpage ? $totalpage : $curPage + 5;
            $begin = $end - 9 <= 1 ? 1 : $end - 9;
        }

        //上一页
        $prev = $curPage - 1 <= 1 ? 1: $curPage - 1;
        $pageNumString .= "<li><a href='/user/userlist?curPage=1'>首页</a></li>";
        $pageNumString .= "<li><a href='/user/userlist?curPage=$prev'>&laquo;</a></li>";

        //根据起始页与终止页将当前页面的页码显示出来
        for ($i = $begin; $i <= $end;$i ++) {
            //使用if实现高亮显示当前点击的页码
            //这是 bootstrap的全局样式
            if ($curPage == $i) {
                $pageNumString .= "<li class='active'><a href='/user/userlist?curPage=$i'>$i</a></li>";
            } else {
                $pageNumString .= "<li><a href='/user/userlist?curPage=$i'>$i</a></li>";
            }
        }

        //实现下一页
        $next = $curPage + 1 >= $totalpage ? $totalpage : $curPage + 1;
        $pageNumString .= "<li><a href='/user/userlist?curPage=$next'>&raquo;</a></li>";
        $pageNumString .= "<li><a href='/user/userlist?curPage=$totalpage'>尾页</a></li>";

        $this->getView()->assign('pageNumString', $pageNumString);     
        $this->getView()->assign("ret",$ret);
    }
}