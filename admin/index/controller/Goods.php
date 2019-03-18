<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{
	public function product_list(){
		$start_time = '';
		$end_time = '';
		$this->assign([
			'start_time' => $start_time,
			'end_time' => $end_time
		]);
		return $this->fetch();
	}

	// 商品添加页
	public function product_add(){
		$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
		foreach ($data as $k => $v) {
			$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
		}
		$this->assign('data', $data);
		return $this->fetch();
	}

	//添加商品函数
	public function goods_add(){
		var_dump($_POST);
	}

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

	// 获取分类信息
	public function product_category_ajax(){
		$db = db('goods_type');
		$data = $db->field('id, pid, name')->select();
		echo json_encode($data);
	}

	// 删除分类信息
	public function product_category_del(){
		$id = $_GET['id'];
		$db = db('goods_type');
		$data = $db->where('pid', $id)->find();
		if($data){
			$str = '分类下存在子分类，不能删除！';
			echo json_encode($str);
		} else{
			$re = $db->where('id', $id)->delete();
			if($re){
				echo 1;
			}
		}
	}

	// 添加分类信息
	public function goods_type_add(){
		$data['name'] = $_POST['name'];
		$data['pid'] = $_POST['pid'];
		$db = db('goods_type');
		if($data['name'] != "" && $data['pid'] != 0){
			$path = $db->field("path")->find($data['pid']);
			$data['path'] = $path['path'];
			$data['level'] = substr_count($data['path'],',');
			$re = $db->insert($data);
			$id = db('user')->getLastInsID();//获取此次插入分类的id
			$path['id'] = $id;
			$path['path'] = $data['path'].','.$id;
			$path['level'] = substr_count($path['path'],',');
			$res = $db->update($path);
			if($res){
				echo '<script>alert("添加成功！");parent.location.href="product_category"</script>';
			} else{
				echo '<script>alert("添加失败！");parent.location.href="product_category"</script>';
			}
		}else if ($data['name'] != "" && $data['pid'] == 0){
			$path = $db->field("path")->find($data['pid']);
			$data['path'] = $data['pid'];
			$data['level'] = 1;
			$re = $db->insert($data);
			$id = db('user')->getLastInsID();//获取此次插入分类的id
			$path['id'] = $id;
			$path['path'] = $data['path'].','.$id;
			$res = $db->update($path);
			if($res){
				echo '<script>alert("添加成功！");parent.location.href="product_category"</script>';
			} else{
				echo '<script>alert("添加失败！");parent.location.href="product_category"</script>';
			}
		} else{
			echo '<script>alert("分类名不能为空！");parent.location.href="product_category"</script>';
		}
	}
}