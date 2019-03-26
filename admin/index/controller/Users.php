<?php
namespace app\index\controller;

use think\Controller;

class Users extends Controller
{
    public function admin_add()
    {
    	$data=db('auth_group')->where("status=1")->select();
        $this->assign('data',$data);
        return $this->fetch();
    }

    public function admin_add_operate()
    {
    	if($_POST){
            $data['admin_name']=$_POST['admin_name'];
            $data['admin_password']=md5($_POST['admin_password']);
                
            $m=db('admin_user');//用户数据库
            $name=$m->where('admin_name', $data['admin_name'])->find();

            //重复名字过滤    
            if(!$name){
                    $g=db('auth_group_access');//分组数据库

                    $res1=$m->insert($data);//用户数据库
                    $group['group_id']=$_POST['group_id'];
                    $group['uid']=$res1;
                    $res2=$g->insert($group);//分组数据库


                    if($res1 && $res2){
                        $this->success('成功', 'admin_list');
                    }else {
                        $this->error('失败');
                    }
            }else {
                    $this->error('当前用户名已存在');
            }
            
        }
    }

    public function admin_list()
    {
    	$data = db('admin_user')->select();
		$count = count($data);
		$this->assign([
			'data' => $data,
			'count' => $count
		]);
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
    	//分类权限节点选择
    	$cadata = $db->where("status=1")->where('title','like','%分类%')->select();
    	// 管理员权限节点选择
    	$addata = $db->where("status=1")->where('title','like','%管理员%')->select();
    	$this->assign([
    		'cadata' => $cadata,
    		'addata' => $addata
    	]);
        return $this->fetch();
    }

    public function admin_role_add_operte(){
    	$data['title'] = $_POST['roleName'];
    	$data['rules'] = implode(",", $_POST['check']);
    	$data['status'] = 1;
    	$db=db('auth_group');
    	$result=$db->insert($data);
    	if($result){
        	$this->success('角色添加成功！', 'admin_role');
        } else{
        	$this->error('角色添加失败！');
        }
    }
}