<!--安装vetur插件-->
<template>

  <div>
    <!-- 页头 -->
        <div class="head">
            <div class="head-1">
                <span>欢迎来到雷士照明品牌商城</span>
                <div>
                    <img src="img/adr.png" alt="">
                    <input id="city" type="text" value="成都">
                </div>
                <div>
                    <router-link to="/login">登录</router-link>
                    <span>|</span>
                    <router-link to="/register">注册</router-link> 
                    <span>|</span>
                    <a href="#">雷士官网</a>
                </div>
            </div>
        </div>
        <!-- 搜索 -->
        <div class="seek">
            <div>
                <router-link to="/">
                    <img src="img/logo_biz.png" alt="">
                </router-link>
            </div>
            <div>
               <p>官方商城</p>
               <span>NVCmall</span> 
            </div>
            <div class="seek-1">
                <div>
                    <div>
                        <p>
                            <img src="img/index_seek.png" alt="">
                            <input type="text" placeholder="请输入您需要的商品..."> 
                        </p>
                            <a href="">搜索</a> 
                        <p>热门关键词：</p>
                    </div>
                </div>
            </div>
            <div class="index_car">
                <router-link to="/cart">
                    <img src="img/index_car.png" alt="">
                    我的购物车
                    <img src="img/index_right.jpg" alt="">
                    <span>0</span>
                </router-link>
            </div>
        </div>
        <!-- 导航 -->
        <div class="index_nav">
            <ul>
                <li><a href="#">商品分类</a></li>
                <li><router-link to="/">首页</router-link> </li>
                <li><a href="#">自营店</a></li>
                <li><a href="#">雷士官网</a></li>
                <li><a href="#">商业解决方案</a></li>
                <li><a href="#">设计师频道</a></li>
                <li><a href="#">雷士动态</a></li>
                <li><a href="#">投资者关系</a></li>
                <li><a href="#">伯克利官网</a></li>
            </ul>
        </div>
  </div>
</template>
<style scoped>
  .head:after{
  content:"";
  display: block;
  clear:both;
}
.head{
  display:block;
  background-color:#E9EBEC;
  line-height:30px;
  min-width:1200px;
}
.head-1{
  background-color:#e9ebec;
}
.head-1>span{
  float: left;
  font-size:14px;
  color:#666;
  padding-left:90px;
}
.head-1>div:nth-child(2){
  vertical-align: center;
  float: left;
  margin-left: 20px;
}
.head-1>div:nth-child(3){
float: right;
margin-right: 30px;
padding-right: 60px;
}
.head-1>div:nth-child(3) a{
  text-decoration:none;
  font-size: 14px;
  color:#666;
}
.head-1>div:nth-child(3) span{
  padding:10px 10px;
}
.head input{
  border:none;
  outline:medium;
  background-color:#E9EBEC;
  padding:3px ;
}
/*搜索 */
.seek{
  display:block;
  width:1200px;
  height:160px;
  margin:0 auto;
  font-size:20px;
  color:#999; 
}
.seek>div:first-child{
  float: left;
  margin-top:30px;
  margin-left:45px;
}
.seek>div:nth-child(2) {
  float: left;
  border-left:1px solid #999;
  margin: 55px 180px 0 40px;
  padding:0 0 0 30px;
}
.seek>div:nth-child(2) p{
  margin:0;
}
.seek>div:nth-child(3) p{
  float: left;
  width:344px;
  height: 34px;
  border:2px solid #d72426;
}
.seek>div:nth-child(3) p>img{
  padding-top: 5px;
  padding-left: 5px;
}
.seek-1 p{
  margin: 55px 0 0 0;
}
.seek-1 input{
  width:89%;
  height: 70%;
  border:none;
  outline:medium;
}
.seek>div:nth-child(3) a{
  width:90px;
  line-height: 38px;
  text-align: center;
  font-size: 12px;
  color: #fff;
  background: #d72426;
  float: left;
  margin: 55px 90px 0 0;
  text-decoration:none;
}
.seek-1>div:nth-child(1) p~p{
 border:0;
 margin:0;
 margin-top:16px;
 font-size:12px;
 color:red;
}
.index_car{
  float: left;
  margin-top:-35px;
  margin-left: 180px;
  position: relative;
}
.index_car a{
  display:block;
  width:140px;
  background:#f6f6f6;
  border:1px solid #ddd;
  font-size:12px;
  color:#666;
  text-decoration: none;
  line-height: 34px;
  text-align: center;
  position: absolute;
}
.index_car a>img:nth-child(1){
  position: relative;
  top:5px;
  vertical-align: baseline;
}
.index_car a>img:nth-child(2){
  position: relative;
  left:15px;
}
.index_car span{
  position: absolute;
  top: -8px;
  right: 20px;
  display: block;
  min-width: 16px;
  line-height: 16px;
  font-size: 12px;
  color: #fff;
  background: #d72426;
  border-radius: 8px;
}
/* 导航 */
.index_nav{
  background-color:#121f27;
  height:50px;
  min-width:1200px;
}
.index_nav ul{
  list-style:none;
  width:1200px;
  margin: 0 auto;
}
.index_nav ul>li{
   float: left;  
}
.index_nav ul>li a{
  text-decoration: none;
  font-size:18px;
  color:#fff;
  text-align:center;
  line-height: 48px;
  padding:12px 25px;
}
.index_nav ul>li a:hover{
  background-color:#434242;
}
.index_nav:after{
  content:"";
  display: block;
  clear:both;
}
</style>