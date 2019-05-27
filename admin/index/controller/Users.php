<?php
namespace app\index\controller;

use think\Controller;

class Users extends Common
{
    public function admin_add()
    {
        $data = db('auth_group')
        ->where("status=1")
        ->select();
        $this->assign('data',$data);
        return $this->fetch();
    }

    public function admin_add_operate()
    {
    	if($_POST){
            $data['admin_name'] = $_POST['admin_name'];
            $data['admin_password'] = md5($_POST['admin_password']);
                
            $m=db('admin_user');//用户数据库
            $name=$m->where('admin_name', $data['admin_name'])->find();

            //重复名字过滤    
            if(!$name){
                    $g=db('auth_group_access');//分组数据库

                    $res1=$m->insert($data);//用户数据库
                    $group['group_id']=$_POST['group_id'];
                    $uid = db('admin_user')->getLastInsID();
                    $group['uid']=$uid;
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

    //管理员列表页
    public function admin_list()
    {
        if($_POST){
            $search=$_POST['search'];
            $data = db('admin_user')
                ->alias('au')
                ->join('auth_group_access aga','au.id = aga.uid')
                ->join('auth_group ag','aga.group_id = ag.id')
                ->where('admin_name','like','%'.$search.'%')
                ->select();
            $count = count($data);
            $word = $search;
            $this->assign([
                'data' => $data,
                'count' => $count,
                'word' => $word,
            ]);
            return $this->fetch();
        }else {
            $data = db('admin_user')
                ->alias('au')
                ->join('auth_group_access aga','au.id = aga.uid')
                ->join('auth_group ag','aga.group_id = ag.id')
                ->select();
            $count = count($data);
            $this->assign([
                'data' => $data,
                'count' => $count
            ]);
            return $this->fetch();
        }
    }

    //管理员列表页，管理员停用ajax
    public function admin_stop_ajax()
    {
        
    }

    public function admin_password_edit()
    {
        return $this->fetch();
    }

	// 权限管理页面
    public function admin_permission()
    {
        if($_POST){
        $search = $_POST['search'];
        $data=db('auth_rule')->where('title','like','%'.$search.'%')->select();
        $count = count($data);
        $word=$search;
		$this->assign([
			'data' => $data,
            'count' => $count,
            'word'=>$word
		]);
		return $this->fetch();
        }else{
    	$data = db('auth_rule')->select();
        $count = count($data);
		$this->assign([
			'data' => $data,
            'count' => $count
		]);
		return $this->fetch();
    }}

    // 添加权限节点页面
    public function admin_permission_add(){
    	return $this->fetch();
    }

    // 向数据库添加权限函数
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

    // 编辑权限节点页面
    public function admin_permission_edit(){
    	$id = input('param.id');
    	$data = db('auth_rule')->find($id);
    	$this->assign('data', $data);
    	return $this->fetch();
    }

    // 修改权限函数
    public function admin_permission_edit_operate(){
    	$data['id'] = $_POST['id'];
    	$data['name'] = $_POST['name'];
        $data['title'] = $_POST['title'];
        $data['type'] = 1;
        $data['status'] = 1;
        $result=db('auth_rule')->where('id', $data['id'])->update($data);
        if($result){
        	$this->success('权限修改成功！', 'admin_permission');
        } else{
        	$this->error('权限修改失败！');
        }
    }

    //角色管理页
    public function admin_role()
    {
    	$data = db('auth_group')->where("status=1")->select();
    	$count = count($data);
		$this->assign([
			'data' => $data,
			'count' => $count
		]);
        return $this->fetch();
    }

    //添加角色页
    public function admin_role_add()
    {
    	$db = db('auth_rule');
    	//分类权限节点选择
    	$category_data = $db->where('status', '1')->where('title','like','分类%')->select();
    	//管理员权限节点选择
    	$admin_data = $db->where('status', '1')->where('title','like','管理员%')->select();
    	//商品权限节点选择
    	$product_data = $db->where('status', '1')->where('title','like','商品%')->select();
    	//角色管理权限节点选择
    	$role_data = $db->where('status', '1')->where('title','like','角色%')->select();
    	//权限管理权限节点选择
        $permission_data = $db->where('status', '1')->where('title','like','权限%')->select();
        //订单管理权限节点选择
        $order_data = $db->where('status', '1')->where('title','like','订单%')->select();
        //用户管理权限节点选择
        $user_data = $db->where('status', '1')->where('title','like','用户%')->select();
    	$this->assign([
    		'category_data' => $category_data,
    		'admin_data' => $admin_data,
    		'product_data' => $product_data,
    		'role_data' => $role_data,
            'permission_data' => $permission_data,
            'order_data' => $order_data,
            'user_data' => $user_data
    	]);
        return $this->fetch();
    }

    public function admin_role_add_operte(){
    	$data['title'] = $_POST['roleName'];
        $data['rules'] = implode(",", $_POST['check']);
        $data['description'] = $_POST['description'];
    	$data['status'] = 1;
    	$db=db('auth_group');
    	$result=$db->insert($data);
    	if($result){
        	$this->success('角色添加成功！', 'admin_role');
        } else{
        	$this->error('角色添加失败！');
        }
    }

    //编辑角色信息
    public function admin_role_edit(){
        $db = db('auth_rule');
    	//分类权限节点选择
    	$category_data = $db->where('status', '1')->where('title','like','分类%')->select();
    	//管理员权限节点选择
    	$admin_data = $db->where('status', '1')->where('title','like','管理员%')->select();
    	//商品权限节点选择
    	$product_data = $db->where('status', '1')->where('title','like','商品%')->select();
    	//角色管理权限节点选择
    	$role_data = $db->where('status', '1')->where('title','like','角色%')->select();
    	//权限管理权限节点选择
        $permission_data = $db->where('status', '1')->where('title','like','权限%')->select();
        //订单管理权限节点选择
        $order_data = $db->where('status', '1')->where('title','like','订单%')->select();
        //用户管理权限节点选择
        $user_data = $db->where('status', '1')->where('title','like','用户%')->select();
    	$this->assign([
    		'category_data' => $category_data,
    		'admin_data' => $admin_data,
    		'product_data' => $product_data,
    		'role_data' => $role_data,
            'permission_data' => $permission_data,
            'order_data' => $order_data,
            'user_data' => $user_data
    	]);

        $db = db('auth_group');
		$id = input('param.id');
		$auth_group = $db->find($id);
        $this->assign('auth_group', $auth_group);

        $rules=db('auth_group')->where('id',$id)->value('rules');
        $num=explode(",",$rules);
        $this->assign('num', $num);

		return $this->fetch();
    }
       
    public function admin_role_edit_operte()
    {
	    $data['id'] = $_POST['id'];
	    $data['title'] = $_POST['roleName'];
        $data['rules'] = implode(",", $_POST['check']);
        $data['description'] = $_POST['description'];
		$data['status'] = 1;
	    $db=db('auth_group');
		$result=$db->where('id',$data['id'])->update($data);
		if($result){
	    	$this->success('角色修改成功！', 'admin_role');
	    } else{
	    	$this->error('角色修改失败！');
	    }
    }

    //删除角色ajax
    public function admin_del_ajax(){
        $id = $_POST['id'];
        $db_user=db('auth_group_access');
        $user_num=$db_user->where('group_id',$id)->count();
        if($user_num!=0){
            echo 0;
        } else{
	        $db = db('auth_group');
			$re = $db->where('id', $id)->delete();
			if($re){
				echo 1;
	        }else echo 0;
        }
    }

    //用户管理页
    public function user_list(){
        if($_POST){
            $search=$_POST['search'];
            $user = model('user');
            $data = $user
                ->where('user_name','like','%'.$search.'%')
                ->select();
            $count = count($data);
            $word = $search;
            $this->assign([
                'data' => $data,
                'count' => $count,
                'word' => $word,
            ]);
            return $this->fetch();
        }else {
            $user = model('user');
            $data = $user
                ->select();
            $count = count($data);
            $this->assign([
                'data' => $data,
                'count' => $count
            ]);
            return $this->fetch();
        }
    }

    // 修改用户密码页
    public function change_password(){
        $id = input('param.id');
        $user = model('user');
        $data = $user->where('id', $id)
        ->find();
        $this->assign('data', $data);
        return $this->fetch();
    }

    //修改密码函数
    public function change_password_operate(){
        $user = model('user');
        $id = $_POST['id'];
        $user_password = md5($_POST['newpassword']);
        $re = $user->save([
            'user_password' => $user_password
        ],['id' => $id]);
        if($re){
            $this->success('密码修改成功', url('user_list'));
        } else{
            $this->error('密码修改失败！');
        }
    }
}