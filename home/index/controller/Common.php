<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;

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

    public function getPath(){
        $m = db('goods_type');
        //$id = $m->where('id',input('id'))->select();
        $idpath = $m->where('id',input('id'))->value('path');
      //  $idpath = $m->where('id',$id)->value('path');
        $arr2 = explode(',',$idpath);
        $arr = array_filter($arr2);
        $pathname2 = array();
        foreach($arr as $k=>&$pathname){           
            $arr[$k] = $m->where('id',$pathname)->value('name');               
        }
        var_dump($arr);
        return $arr;
    }


}