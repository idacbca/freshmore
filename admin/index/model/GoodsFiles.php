<?php	
namespace app\index\model;

class GoodsFiles extends \think\Model
{
	protected $autoWriteTimestamp = 'datetime';
	protected $auto = ['filepath' => null];
}

?>