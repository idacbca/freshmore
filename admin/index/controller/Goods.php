<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{	
	//商品管理页
	public function product_list(){
		// $start_time = '';
		// $end_time = '';
		$data = db('goods')->select();
		$count = count($data);
		$this->assign([
			'data' => $data,
			'count' => $count
		]);
		return $this->fetch();
	}

	// 删除商品ajax
	public function product_del_ajax(){
		$id = $_POST['id'];
		$db = db('goods');
		$re = $db->where('id', $id)->delete();
		if($re){
			echo 1;
		}else echo 0;
	}

	// 商品上架ajax
	public function product_start_ajax(){
		$id = $_POST['id'];
		$db = db('goods');
		$re = $db->where('id', $id)->update(['status' => '0']);
		if($re){
			echo 1;
		}else echo 0;
	}

	// 商品下架ajax
	public function product_stop_ajax(){
		$id = $_POST['id'];
		$db = db('goods');
		$re = $db->where('id', $id)->update(['status' => '1']);
		if($re){
			echo 1;
		}else echo 0;
	}

	// 编辑商品
	public function product_edit(){
		$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
		foreach ($data as $k => $v) {
			$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
		}
		$this->assign('data', $data);

		$db = db('goods');
		$id = input('param.id');
		$goods = $db->find($id);
		$this->assign('goods', $goods);
		return $this->fetch();
	}

	//修改商品信息函数
	public function goods_edit(){
		$data['id'] = $_POST['id'];
		$data['goodsname'] = $_POST['goodsname'];
		$tid = explode(",", $_POST['tid']);
		$data['tid'] = $tid[0];
		$data['tpid'] = $tid[1];
		$data['unit'] = $_POST['unit'];
		$data['attributes'] = $_POST['attributes'];
		// $data['imagepath'] = "";
		$data['number'] = $_POST['number'];
		$data['barcode'] = $_POST['barcode'];
		$data['curprice'] = $_POST['curprice'];
		$data['oriprice'] = $_POST['oriprice'];
		$data['cosprice'] = $_POST['cosprice'];
		$data['inventory'] = $_POST['inventory'];
		$data['restrict'] = $_POST['restrict'];
		$data['already'] = $_POST['already'];
		$data['freight'] = $_POST['freight'];
		$data['status'] = $_POST['status'];
		$data['reorder'] = $_POST['reorder'];
		// $data['file'] = $_POST['file'];
		$data['text'] = $_POST['editorValue'];

		$db = db('goods');
		$result = $db->where('id', $data['id'])->update($data);

		if($result){
			$this->success('商品修改成功！', 'product_list');
		} else{
			$this->error('商品修改失败！');
		}
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
		$data['goodsname'] = $_POST['goodsname'];
		$tid = explode(",", $_POST['tid']);
		$data['tid'] = $tid[0];
		$data['tpid'] = $tid[1];
		$data['unit'] = $_POST['unit'];
		$data['attributes'] = $_POST['attributes'];
		// $data['imagepath'] = $_POST['imagepath'];
		$data['number'] = $_POST['number'];
		$data['barcode'] = $_POST['barcode'];
		$data['curprice'] = $_POST['curprice'];
		$data['oriprice'] = $_POST['oriprice'];
		$data['cosprice'] = $_POST['cosprice'];
		$data['inventory'] = $_POST['inventory'];
		$data['restrict'] = $_POST['restrict'];
		$data['already'] = $_POST['already'];
		$data['freight'] = $_POST['freight'];
		$data['status'] = $_POST['status'];
		$data['reorder'] = $_POST['reorder'];
		// $data['file'] = $_POST['file'];
		$data['text'] = $_POST['editorValue'];

		$db = db('goods');
		$result = $db->insert($data);

		if($result){
			$this->success('商品添加成功！', 'product_list');
		} else{
			$this->error('商品添加失败！');
		}
	}

	// 商品分类页
	public function product_category(){
		return $this->fetch();
	}

	// 商品分类添加页
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

	// 图片上传控制器(半成)
	public function uploadpic(){
		$file = $this->request->file('file');//file是传文件的名称，这是webloader插件固定写入的。因为webloader插件会写入一个隐藏input，这里与TP5的写法有点区别
	    $file->size = 524288000;
        $Path = 'public' . DS . 'uploads';
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
	 
	    if($info){
	        // 成功上传后 获取上传信息
	        // 输出 jpg 地址
	        $filePath = "/".$Path. DS .$info->getSaveName();
	        $filePath = str_replace("\\","/",$filePath);   //替换\为/
	        return json(['success'=>true,'filePath'=>$filePath]);
	    }else{
	        // 上传失败获取错误信息
	        echo $file->getError();
	    }
	}
}