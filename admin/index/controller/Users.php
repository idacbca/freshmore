<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;

class Users extends Controller
{
    public function admin_add()
    {
        return $this->fetch();
    }

    public function admin_list()
    {
        return $this->fetch();
    }

    public function admin_password_edit()
    {
        return $this->fetch();
    }

    public function admin_permission()
    {
    	$data = db('auth_rule')->select();
		$count = count($data);
		$this->assign([
			'data' => $data,
			'count' => $count
		]);
		return $this->fetch();
    }

    // 权限管理页面
    public function admin_permission_add(){
    	return $this->fetch();
    }

    // 向数据库添加权限
    public function admin_permission_operate(){
    	$data['name'] = $_POST['name'];
        $data['title'] = $_POST['title'];
        $data['type'] = 1;
        $data['status'] = 1;
        $result=db('auth_rule')->insert($data);
        if($result){
        	$this->success('权限添加成功！', 'admin_permission');
        } else{
        	$this->error('权限添加失败！');
        }

    }

    public function admin_role()
    {
    	$data=db('auth_group')->where("status=1")->select();
        $this->assign('data',$data);
        return $this->fetch();
    }

    public function admin_role_add()
    {
    	$db = db('auth_rule');
    	$data = $db->where("status=1")->where('title','like','%分类%')->select();
    	$this->assign('data',$data);
        return $this->fetch();
    }

    public function admin_role_add_operte(){
    	$data['title']=$_POST['roleName'];
    	$data['rules']=implode(",", $_POST['check']);
    	$data['status']=1;
    	$db=db('auth_group');
    	$result=$db->insert($data);
    }
}