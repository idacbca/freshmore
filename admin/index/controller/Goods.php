<?php
namespace app\index\controller;

use think\Controller;

class Goods extends Controller
{
	public function product_category(){
		return $this->fetch();
	}

	public function product_category_add(){
		return $this->fetch();
	}
}