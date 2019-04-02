<?php
namespace app\index\controller;

use think\Controller;

class Checkout extends Controller
{
    public function checkout()
    {
        return $this->fetch();
    }
}