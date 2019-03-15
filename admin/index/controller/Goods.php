<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{
	public function product_category(){
		return $this->fetch();
	}

	public function product_category_add(){
		$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
		foreach ($data as $k => $v) {
			$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
		}
		$this->assign('data', $data);
		return $this->fetch();
	}


	// 向数据库添加分类信息
	public function goods_type_add(){
		$data['name'] = $_POST['name'];
		$data['pid'] = $_POST['pid'];
		$m = db('goods_type');
		if($data['name'] != "" && $data['pid'] != 0){
			$path = $m->field("path")->find($data['pid']);
			$data['path'] = $path['path'];
			$data['level'] = substr_count($data['path'],',');
			$re = $m->insert($data);
			$id = db('user')->getLastInsID();//获取此次插入分类的id
			$path['id'] = $id;
			$path['path'] = $data['path'].','.$id;
			$path['level'] = substr_count($path['path'],',');
			$res = $m->update($path);
			if($res){
				echo '<script>alert("添加成功！");parent.location.href="product_category"</script>';
			} else{
				echo '<script>alert("添加失败！");parent.location.href="product_category"</script>';
			}
		}else if ($data['name'] != "" && $data['pid'] == 0){
			$path = $m->field("path")->find($data['pid']);
			$data['path'] = $data['pid'];
			$data['level'] = 1;
			$re = $m->insert($data);
			$id = db('user')->getLastInsID();//获取此次插入分类的id
			$path['id'] = $id;
			$path['path'] = $data['path'].','.$id;
			$res = $m->update($path);
			if($res){
				echo '<script>alert("添加成功！");parent.location.href="product_category"</script>';
			} else{
				echo '<script>alert("添加失败！");parent.location.href="product_category"</script>';
			}
		}else {
			echo '<script>alert("分类名不能为空！");parent.location.href="product_category"</script>';
		}
	}
}