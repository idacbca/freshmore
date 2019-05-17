<?php
namespace app\index\controller;

use think\Controller;
use think\org\Upload;
class Goods extends Common
{	
	//商品管理页
	public function product_list(){
		// $start_time = '';
		// $end_time = '';
		if($_POST){//输入查询信息时
			$search = $_POST['search'];
			$word=$search;
			$goods = model('goods');
			$data = $goods->where('goodsname','like','%'.$search.'%')->select();
			$count = count($data);
			$this->assign([
				'data' => $data,
				'count' => $count,
				'word' => $word
			]);
			return $this->fetch();
		} else{//没有输入查询信息时
			$goods = model('goods');
			$data = $goods->select();
			$count = count($data);
			$this->assign([
				'data' => $data,
				'count' => $count
			]);
			return $this->fetch();
		}
	}

	// 删除商品ajax
	public function product_del_ajax(){
		$id = $_POST['id'];
		$db = db('goods');
		
		$path= $db->where('id',$id)->column('filepath');
		$images=explode(',',$path);
		$file= db('goods_files');
		foreach($images as $v){
           $file->where('id'.$v)->delete();
        }
		
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

	// 编辑商品页面
	public function product_edit(){
		$data = db('goods_type')->field("*, concat(path, ',', id) as paths")->order('paths')->select();
		foreach ($data as $k => $v) {
			$data[$k]['name'] = str_repeat("|------", $v['level']).$v['name'];
		}
		$this->assign('data', $data);

		
		$db = db('goods');
		$id = input('param.id');
		$goods = $db->find($id);

		$images=explode(',',$goods['filepath']);
		$i=model('GoodsFiles');
        $image=[];
        foreach($images as $v){
           array_push($image,$i->find($v));
        }

		
		$this->assign('goods', $goods);
		$this->assign('image',$image);
		return $this->fetch();
	}

	//修改商品信息函数
	public function goods_edit(){
		/*$data['id'] = $_POST['id'];
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
		$result = $db->where('id', $data['id'])->update($data);*/

		$goods = model('goods');
		$tid = explode(",", $_POST['tid']);
		
		
		if(isset($_POST['imagepath'])){
				$result = $goods->save([
				'goodsname'  =>  $_POST['goodsname'],
				'tid' => $tid[0],
				'tpid' => $tid[1],
				'unit' => $_POST['unit'],
				'attributes' => $_POST['attributes'],
				'number' => $_POST['number'],
				'curprice' => $_POST['curprice'],
				'cosprice' => $_POST['cosprice'],
				'inventory' => $_POST['inventory'],
				'freight' => $_POST['freight'],
				'status' => $_POST['status'],
				'text' => $_POST['editorValue'],
				'filepath' =>implode(',', $_POST['imagepath'])
			],['id' => $_POST['id']]);
		}else{
			$result = $goods->save([
				'goodsname'  =>  $_POST['goodsname'],
				'tid' => $tid[0],
				'tpid' => $tid[1],
				'unit' => $_POST['unit'],
				'attributes' => $_POST['attributes'],
				'number' => $_POST['number'],
				'curprice' => $_POST['curprice'],
				'cosprice' => $_POST['cosprice'],
				'inventory' => $_POST['inventory'],
				'freight' => $_POST['freight'],
				'status' => $_POST['status'],
				'text' => $_POST['editorValue'],
				
			],['id' => $_POST['id']]);

		}

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
		/*$data['goodsname'] = $_POST['goodsname'];
		$data['tid'] = $tid[0];
		$data['tpid'] = $tid[1];
		$data['unit'] = $_POST['unit'];
		$data['attributes'] = $_POST['attributes'];
		$data['imagepath'] = $_POST['imagepath'];
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
	    $data['file'] = $_POST['file'];
		$data['text'] = $_POST['editorValue'];*/

		$goods = model('goods');
		$tid = explode(",", $_POST['tid']);
		$goods->data([
		    'goodsname'  =>  $_POST['goodsname'],
		    'tid' => $tid[0],
			'tpid' => $tid[1],
			'unit' => $_POST['unit'],
			'attributes' => $_POST['attributes'],
			'number' => $_POST['number'],
			'curprice' => $_POST['curprice'],
			'cosprice' => $_POST['cosprice'],
			'inventory' => $_POST['inventory'],
			'freight' => $_POST['freight'],
			'status' => $_POST['status'],
			'text' => $_POST['editorValue'],
			'filepath' => implode(',', $_POST['imagepath']),
		]);

		$result = $goods->save();
		// $result = $db->insert($data);
        
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

	
	public function upload(){
		 // 获取表单上传文件
		 $files = request()->file();
		 foreach($files as $file){
			 // 移动到框架应用根目录/public/uploads/ 目录下
			 $info = $file->rule('date')->move(ROOT_PATH . 'public' . DS . 'uploads');
			 $keyName = $file -> getInfo()['name'];
			 if($info){
				 $db=db('goods_files');
				 $filename =  DS . 'uploads'.'/'.$info->getSaveName();
				 $filename =str_replace('\\', '/', $filename);
				 //$data['id']=$keyName;
				 $data['filepath']=$filename;
				 $res=$db->insert($data);
				 $id = db('goods_files')->getLastInsID();
				 $filedata=['id'=>$id,'paths'=>$data['filepath']];

				 echo json_encode($filedata);

			 }else{
				 // 上传失败获取错误信息
				 echo $file->getError();
			 }
		 }
	}
	//商品图片删除
	public function product_del_images(){
        $db=db('goods_files');
        $result=$db->delete($_GET['id']);
        if($result){
            echo 1;
        }else{
            echo 0;
        }
    }
    
}