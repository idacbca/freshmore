<?php
namespace app\index\controller;

use think\Controller;
use \think\Session;

class Users extends Common
{
    public function login()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多 - 登录',
            'type' => $type
        ]);
        return $this->fetch();
    }

    public function login_operate()
    {
        if($_POST){
            $captcha = $_POST['captcha'];
            if(!captcha_check($captcha)){
                $this->error('验证码错误', url('index/users/login'));
            } else{
                $user = model('user');
                $user_name = $_POST['user_name'];
                $user_password = $_POST['user_password'];

                $user_info = $user
                ->where('user_name', $user_name)
                ->find();
                $cid = $user_info['id'];
                if(empty($user_info)){
                    $this->error('用户不存在，请重新登陆');
                } else{
                    if(md5($user_password) != $user_info['user_password']){
                        $this->error('密码不正确，请重新登陆');
                    } else{
                        session('cid', $cid);
                        session('session_start_time_f', time());
                        $this->success("登陆成功", url('index/index/index'));
                    }
                }
            }
        }
    }

    public function register()
    {
        $type = $this->getCatgory();
        $this->assign([
            'title' => '鲜多多生鲜网 - 注册',
            'type' => $type
        ]);
    	return $this->fetch();
    }

    public function register_operate()
    {
        if($_POST){
            $data['user_name'] = $_POST['user_name'];
            $data['user_password'] = md5($_POST['user_password']);

            $user = model('user');
            $name = $user->where('user_name', $data['user_name'])
                ->find();
            if(!$name){
                $user->data([
                    'user_name' => $data['user_name'],
                    'user_password' => $data['user_password'],
                    'nickname' => $data['user_name']
                ]);
                $re = $user->save();
                if($re){
                    $this->success('注册成功！', url('index/index/index'));
                       }
            } else{
                $this->error('用户名已被使用！');
            }
        }
    }

    public function logout(){
        session(null);
        $re = session('?cid');
        if(!$re){
            $this->success('登出成功', url('index/index/index'));
        } else{
            $this->error('登出失败');
        }
    }

    public function my_account()
    {
        $type = $this->getCatgory();
        $id=input('session.cid');
        $order=db('orders')->where('id',$id)->select();
        $orders=array_reverse($order);
        $db = db('user');
        $cid=Session::get('cid');
		$user = $db->find($cid);
        $this->assign([
            'title' => '鲜多多生鲜网 - 账户中心',
            'type' => $type,
            'orders'=>$orders,
            'user' => $user
        ]);
    
    	return $this->fetch();
    }

    public function ordersdetail()
    {
       $type = $this->getCatgory();
       $id = input('param.id');//获取传入的id

       $ordersdetail=db('ordersdetail')->where('orderid',$id)->select();

       $this->assign([
        'title' => '鲜多多生鲜网 - 账户中心',
        'type' => $type,
        'ordersdetail'=>$ordersdetail
    ]);

       return $this->fetch();
    }

    public function user_edit(){
        $user = model('user');
        $cid=Session::get('cid');
        $result = $user->save([
            'nickname'  =>  $_POST['nickname'],
            'address' => $_POST['address'],
            'telephone' => $_POST['telephone'],
                ],['id' => $cid]);

        if($result){
                $this->success('个人信息修改成功！', 'my_account');
            } else{
                $this->error('个人信息修改失败！');
            }
               
    }

    public function user_currency(){
        $user = model('user');
        $cid=Session::get('cid');
        $currency=db('user')->where('id',$cid)->value('currency');
        $newcurrency=$currency+$_POST['currency'];

        $result = $user->save([
            'currency'  => $newcurrency,
              ],['id' => $cid]);
        if($result){
                $this->success('充值成功！', 'my_account');
            } else{
                $this->error('充值失败！');
            }
               
    }

    public function user_drawcurrency(){
        $user = model('user');
        $cid=Session::get('cid');
        $currency=db('user')->where('id',$cid)->value('currency');
        $newcurrency=$currency-$_POST['drawcurrency'];

        $result = $user->save([
            'currency'  => $newcurrency,
              ],['id' => $cid]);
        if($result){
                $this->success('提现成功！', 'my_account');
            } else{
                $this->error('提现失败！');
            }
               
    }


     // 设置收货ajax
	public function orders_get_ajax(){
		$id = $_POST['id'];
		$db = db('orders');
        $re = $db->where('orderid', $id)->update(['status' => '0']);
		if($re){
            echo 1;
		}else echo 0;
	}

	// 设置未收货ajax
	public function orders_notget_ajax(){
		$id = $_POST['id'];
		$db = db('orders');
		$re = $db->where('orderid', $id)->update(['status' => '1']);
		if($re){
			echo 1;
		}else echo 0;
    }
    
     //退款操作
     public function orders_refund_ajax()
     {
     $id = $_POST['id'];
     $db = db('orders');
     $re = $db->where('orderid', $id)->update(['paystatus' => 1]);

    //这里退款的货物就不再放回仓库了
    //  $ordersdetail=$db->where('orderid', $id)->select();

    //  foreach ($ordersdetail as $vo){
      
    //     $quantity1=db('goods')->where('goodsname',$vo['goods'])->value('inventory');
    //     $newquantity=$vo['quantity']+$quantity1;
    //     $rs=db('goods')->where('goodsname',$vo['goods'])->update(['inventory' =>$newquantity]);
    //     }
     
     $payinfo= $db->where('orderid', $id)->value('payinfo');
     $id=input('session.cid');//获取session中用户id
     $currency=db('user')->where('id',$id)->value('currency');
    
     $newcurrency=$currency+$payinfo;
     $ra=db('user')->where('id',$id)->update(['currency' => $newcurrency]);
     
     if($re&&$ra){
         echo 1;
            }
     
     else echo 0;
     }
        

        public function password_edit(){
            $user = model('user');
            $cid=Session::get('cid');
            $info=$user->where('id',$cid)->find();
            $password=md5($_POST['user_password']);
            $a=md5($_POST['newpassword']);
            $b=md5($_POST['again']);
            if($password==$info['user_password']){
                if($password!=$a){
                    if($a==$b){
                        $result = $user->save([
                            'user_password' => $a,
                        ],['id' => $cid]);
                        if($result){    
                            session(null);
                            $re = session('?cid');
                            if(!$re){
                            $this->success('修改密码成功，请重新登录', url('index/users/login'));
                        } 
                        } else{
                            $this->error('密码修改失败');
                        }
                    }else{
                        $this->error('两次新密码不同！');
                    }
                }else{
                    $this->error('原密码错误不能与新密码相同！');
                }
            }else{
                $this->error('原密码错误！');
            }
    }
}