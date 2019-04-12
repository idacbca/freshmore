<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
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

        
        
        $this->assign('type',$type);
        //var_dump($type);
        return $this->fetch();
        
    }

    public function about_us()
    {
    	return $this->fetch();
    }
    
}