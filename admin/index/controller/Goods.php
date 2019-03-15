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
}