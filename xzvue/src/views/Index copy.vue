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
      <div v-for="(item,index) of three" :key="index">
        <router-link :to="`/details/${item.id}`">
          <img :src="item.img" alt="">
        </router-link>
      </div>
      <div>
        <div v-for="(item,index) of three1" :key="index">
          <a href="#">
            <img :src="item.img" alt="">  
          </a>        
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
        <div v-for="(item,index) of taocan" :key="index">
          <a href="#">
            <img :src="item.img" alt="">
        </a>
        </div>  
      </div>
      <ul>
        <li v-for="(item,index) of taocan1" :key="index">
          <a href="#">
            <img :src="item.img" alt="">
          </a>
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
          <div v-for="(item,index) of renqi" :key="index">
            <a href="#">
              <img :src="item.img" alt="">
            </a>
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
          <li v-for="(item,index) of hot" :key="index">
            <a href="#">
              <p>
                <img :src="item.img" alt="">
              </p>
              <div>
                <img src="img/house_icon.png" alt="">
                <p>{{item.title}}</p> 
              </div>
              <span>￥{{item.price}}</span>    
            </a>
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
      three:[],
      three1:[],
      taocan:[],
      taocan1:[],
      renqi:[],
      hot:[],
      p1:{},
      p2:{},
      p3:{},
      p4:{},
      p5:{},
      p6:{},
      mainpages:[]
    }
  },
  mounted(){
    //获取三重惊喜左


    

    this.axios.get("/three").then(res=>{
      let data=res.data.results; 
      console.log(data);
      data.forEach(item=>{ 
        item.img=require("../assets/"+ item.img);
        this.three=data;
      });
    });

    //获取三重惊喜右
    this.axios.get("/three1").then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);
        this.three1.push(item);
      });
    });

    //获取套餐爆款
    this.axios.get("/taocan").then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);
        this.taocan.push(item);
      });
    });

    //获取套餐爆款1
    this.axios.get("/taocan1").then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);
        this.taocan1.push(item);
      });
    });

    //获取人气爆款
    this.axios.get("/renqi").then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);
        this.renqi.push(item);
      });
    });

    //获取热销推荐
    this.axios.get("/hot").then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/"+ item.img);
        this.hot.push(item);
      });
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
.meal>ul{
  padding: 0;
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

.hots>ul>li>a{
  display: block;
  width: 276px;
  height: 550px;
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

