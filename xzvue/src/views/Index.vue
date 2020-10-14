<template>
  <div>
    <!-- banner -->
    <banner></banner>
    <!-- 产品导航 -->
    <tabber></tabber>
    <!-- 3 -->
    <div class="surprise">
      <div class="three_title">
        <span></span>
        <p>
          <span>3</span>
          重惊喜
        </p>
        <span></span>
      </div>
    </div>
    <!-- 1L.图 -->
    <div class="index-coupon">
      <a href="#">
        <img src="img/index-coupon.jpg" alt="">
      </a>
    </div>
    <!-- 促销优惠 -->
    <div class="promotions">
      <div>
        <router-link :to="`/details/${p1.id}`">
          <img :src="p1.img" alt="">
        </router-link>
      </div>
      <div>
        <div>
          <router-link :to="`/details/${p2.id}`">
            <img :src="p2.img" alt="" style="width:100%">  
          </router-link>        
        </div>
        <div>
          <router-link :to="`/details/${p3.id}`">
            <img :src="p3.img" alt="">  
          </router-link>        
        </div>
      </div>
    </div> 
     
    <!-- 爆款系列 -->
    <div class="meal">
      <div class="promotions_head">
        <span></span>
        <span>套餐爆款</span>
        <span></span>
      </div>
      <div class="sale_big">
        <div>
          <router-link :to="`/details/${p4.id}`">
            <img :src="p4.img" alt="">
          </router-link>
        </div>  
      </div>
      <ul>
        <li>
          <router-link :to="`/details/${p5.id}`">
            <img :src="p5.img" alt="" class="sale_small">
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 人气爆棚  -->
    <div class="meal">
      <div class="new_product">
        <div class="promotions_head">
          <span></span>
          <span>人气爆款</span>
          <span></span>
        </div>
        <div class="sale_big">
          <div>
            <router-link :to="`/details/${p6.id}`">
              <img :src="p6.img" alt="">
            </router-link>
          </div>
        </div>
      </div>
    </div>

    <!--热销推荐  -->
    <div class="hots">
      <div class="promotions_head">
        <span></span>
        <span>热销推荐</span>
        <span></span>
      </div>
        <ul>
          <li v-for="(item,index) of others" :key="index">
            <router-link :to="`/details/${item.id}`">
              <p>
                <img :src="item.img" alt="" class="hots_img">
              </p>
              <div>
                <img src="img/house_icon.png" alt="">
                <p>{{item.title}}</p> 
              </div>
              <span>￥{{item.price}}</span>    
            </router-link>
          </li>        
        </ul>
    </div>

    <!-- 风格分类 -->
    <div class="class_style">
      <div class="promotions_head">
        <span></span>
        <span>风格分类</span>
        <span></span>
      </div>
    </div>
    <div class="style_tab">
      <p class="color_tab">现代简约</p>
      <p>小美简欧</p>
      <p>新中式</p>
    </div>
    <!-- 精品推荐 -->
    <div class="boutique">
      <div class="promotions_head">
        <span></span>
        <span>风格分类</span>
        <span></span>
      </div>
    </div>
  </div>
</template>
<script>
import Tabber from '../components/Tabber.vue'
import Banner from '../components/Banner.vue'
export default {
  components:{
    Tabber,
    Banner
  },
  data(){
    return {
      p1:{},
      p2:{},
      p3:{},
      p4:{},
      p5:{},
      p6:{},
      others:[],
      //detalt:[]
    }
  },
  mounted(){
    //获取首页
    this.axios.get("/mainpage").then(res=>{
      let data=res.data.results;
      [this.p1,this.p2,this.p3,this.p4,this.p5,this.p6]=data;
      //console.log(this.p1,this.p2,this.p3,this.p4,this.p5,this.p6);
      this.others=data.slice(-6);
      //console.log(this.others);
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);  
      }) 
    });   
  },  
}
</script>
<style scoped>
.index_main img{
  width:100%;
}
.three_title{
  display:block;
  overflow: hidden;
  padding:30px;
  min-width: 1200px;
  width:1200px;
  margin: 0 auto; 
}
.three_title>span{
  float: left;
    display: block;
    width: 415px;
    border-top: 1px solid #999;
    height: 1px;
    position: relative;
    top: 60px;
}
.three_title>p {
  float: left;
  font-size: 44px;
  color: #f62e48;
  margin: 30px 85px;
  letter-spacing: 5px;
}
.index-coupon a{
  display: block;
  text-align: center;
}
.index-coupon a>img{
  position: relative;
}
.promotions{
  width:1200px;
  margin: 0 auto;
  overflow: hidden;
  margin-top: 20px;
}
.promotions>div:nth-child(1) {
  position: relative;
  width: 890px;
  height: 490px;
  overflow: hidden;
  float: left;
}
.promotions>div:nth-child(2){
  float: right;
  position: relative;
  margin-top:-18px;
}
.promotions>div:nth-child(2) a{
  display: block;
  position: relative;
  width: 284px;
  height: 234px;
  overflow: hidden;
  }
.promotions>div:nth-child(2) a>img{ 
  position: absolute;
  margin: auto;
}
.promotions>div:nth-child(2) a:last-child{
  margin-top:20px; 
}
.meal{
  width:1200px;
  margin: 0 auto;
}
.promotions_head span:not(:nth-child(2)){
  display: inline-block;
  width:500px;
  border-top:1px solid #ddd;
  top:-10px;
}
.promotions_head span:nth-child(2){
  display: inline-block;
    font-size: 30px;
    color: #f62e48;
    margin: 50px 0px 30px 0px;
    width: 190px;
    text-align: center;
}
.ptomtions_head img{
  width:275px;
  height: 416px;
}
.hots>ul>li>a div>p{
    display:block ;
    float: right;
    margin:0 10px 0 0;
    padding: 0;
}
.sale_big{
  position: relative;
  margin-bottom:20px;
  
}
.sale_big a{
  display: block;
  width: 1200px;
  margin: 0 auto;
}
.sale_small{
  width:592px;
  height:423px;
}
.meal>ul{
  padding: 0;
  list-style: none;
}
.meal>ul>li{
  margin: 0 15px 15px 0;
}
.meal>ul>li>a{
  display:block;
}
.new_product{
  width:1200px;
  margin: 0 auto;
}
.hots{
  width:1200px;
  margin:0 auto;
}
.hots>ul{
  padding:0;
  list-style:none;
  width: 1230px;
  margin: 0 auto;
}
.hots>ul>li>a:hover{
  box-shadow: 0 0 20px 2px #918f8f;
}
.hots>ul li:nth-child(1){
  margin-left:0px; 
}
.hots>ul li:nth-child(5){
  margin-left:0px; 
}
.hots>ul>li{
  display: inline-block;
  margin:10px 15px 40px ;
  background: #f4f8fb;
}
.hots_img{
 width:100%;
 height:350px;
}
.hots>ul>li>a{
  display: block;
  width: 276px;
  height: 480px;
  text-decoration: none;
  /* position:relative; */
}
.hots>ul>li>a div{
  width: 276px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  text-align: center;
  font-size: 20px;
  color: #333;
  padding: 0 5px;
  box-sizing: border-box;
  margin: 25px 0 15px 0;
}
.hots>ul>li>a span{
  display: block;
  text-align: center;
  font-size: 21px;
  color: #f62e48;
}
.class_style{
 display: block;
  width:1200px;
  margin: 0 auto;
}
.style_tab{
  width:1200px;
  margin: 0 auto; 
}
.style_tab>p.color_tab{
  color: #fff;
  background: #666;
}
.style_tab>p {
  float: left;
  width: 33%;
  font-size: 18px;
  color: #666;
  line-height: 60px;
  text-align: center;
}
.boutique{
  width:1200px;
  margin: 0 auto; 
}
</style>

