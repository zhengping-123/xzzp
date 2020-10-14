<template>
  <div>
    <!-- 产品简介 -->
    <div class="detail_list">
      <div class="crumbs">
        <span>吊灯 - 分类</span>
        <span class="gt">></span>
        <span>
          <a href="#">吊灯</a>
        </span>
        <span class="gt">></span>
        <span>商品详情</span>
      </div>
    </div>
    <!--商品详情  -->
    <div class="shop_detail">
      <!-- 左侧图片 -->
      <detail></detail>
      <!-- 右侧说明 -->
      <div class="detial_text">
        <div>
          <img src="/img/house_icon.png" alt="">
          <span>{{commodity[0] && commodity[0].name}}</span>  
        </div>
        <!-- 价格 -->
        <div class="team_price">
          <span>价格</span>
          <span class="red1">￥</span>
          <span class="red2">{{commodity[0] && commodity[0].price}}</span>
          <a href="#" class="go-coupon">
            去抢卷 
            <img src="/img/team_right.png" alt="">
          </a>
        </div>
        <!-- 颜色 -->
        <div class="nature">
          <span>颜色分类</span>
          <div>
            <a href="#" class="mi" v-for="(item,index) of commodity" :key="index">{{item.color}}</a>
          </div>
        </div>
        <!-- 数量加减 -->
        <div class="nature_num">
          <span>数量</span>
          <button class="sub_num"  @click="minus">
            <span >-</span>
          </button>
          <a href="javescript:;" class="sums" >
            <span>{{num}}</span>
          </a>
          <button class="add_num" @click="add">
            <span>+</span>
          </button>
          <span class="inventory">库存数量{{commodity[0] && commodity[0].inventory}}</span>
        </div>
        <div class="nature quantity">
          <span>服务</span>
          <a  class="door">
            上门服务
            <input type="hidden" name="installationFee" id="installationFee" value="0" autocomplete="off">
            <span>¥{{commodity[0] && commodity[0].servicePrice}}</span>
            <img src="/img/gou.png" style="display:none">
          </a>
        </div> 
        <div>
          <router-link to="/register">
            <input class="btn_li btn_buyProduct" type="button" value="立即购买">
          </router-link>
          <a href="#" >
            <input type="button" @click="addcrt" class="btn_add" value="加入购物车">
          </a>
        </div> 
        <div class="comm">
          <span>无忧安装</span>
          <span>三年质保</span>&nbsp;
          <span>正品保证</span>&nbsp;
          <span>破损保障</span>&nbsp;
          <span>七天无理由退换</span>
        </div>
      </div>
    </div>
    <div style="clear:both"></div>
    <!-- 左2 -->
    <div class="detail_warp">
      <!-- 详情和评价 -->
      <div class="de_ev">
        <ul class="detail_evaluate">
          <li class="detail_qie">详情</li>
          <li class="spReviewShow">晒单评价（0）</li>
        </ul>
          <div class="all_contet">
            <div class="detail_content">
              <div><p></p></div>
            <!-- 详图 -->
            <div class="all_pics">
              <div v-for="(item,index) of particular" :key="index">
                <img :src="item.particularsImg" alt=""> 
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="related_products">
        <p>推荐商品</p>
        <div>
          <a href="#" v-for="(item,index) of recommend" :key="index">
            <div>
              <img :src="item.recommendImg" alt="">
            </div>
            <p>{{item.title}}</p>
            <span>￥{{item.price}}</span>
          </a>   
        </div>
      </div>
    </div>
  </div>
</template>
 <script>
 import Detail from '../components/Detail.vue'
 export default {
   props:['lid'],
   components:{
    Detail
  },
  data(){
    return {
      num:1,
      detail:[],
      //存储详情页上右
      commodity:[], 
      //存储详情页下左
      particular:[],
      //存储详情页下右
      recommend:[]
    }
  },

  methods:{
    minus(){
      if(this.num>1){ this.num-- };
    },
    add(){
      this.num++;
    },
    addcrt(){
      // console.log(this.commodity[0].id);
      this.axios.post("/addcrt",`num=1&id=${this.commodity[0].id}&name=${this.commodity[0].name}&color=${this.commodity[0].color}&price=${this.commodity[0].price}&img=${this.commodity[0].img}&servicePrice=${this.commodity[0].servicePrice}`).then(results=>{
        if(results.data==1 || results.data==2){
          alert("加入购物车")
          this.$router.push("/cart");
        }else if(results.data==0 || results.data==3){
          alert("加入失败");
        }
      });
    },

  },
  mounted(){
    //获取详情页上右
    let id=this.$route.params.lid;
      //console.log(id);
    this.axios.get("/commodity?cid=" +id).then(res=>{
      let data=res.data.results;
      //console.log(data);
      this.commodity=res.data.results;
      // console.log(this.commodity);
    });

    //获取详情页下左
    let did=this.$route.params.lid;
      //console.log(did);
    this.axios.get("/particulars?did=" + did).then(res=>{
      let data=res.data.results; 
      data.forEach(item=>{ 
        item.particularsImg=require("../assets/"+ item.particularsImg);
        this.particular.push(item);
      });
    });
    
    //获取详情页下右
    this.axios.get("/recommend").then(res=>{
      let data=res.data.results; 
      data.forEach(item=>{ 
        item.recommendImg=require("../assets/"+ item.recommendImg);
        this.recommend.push(item);
      });
    });
    
  },
 }
 </script>
 
<style scoped>
a{
  text-decoration: none;
}
.detail_list{
  width:1200px;
  margin:0 auto;
  font-size:12px;
  color:#999;
}
.crumbs{
  margin:15px 0;
}
.gt{
  margin:0 10px;
}
.crumbs a{  
  color:#999;
}
.shop_detail{
  width:1200px;
  position: relative;
  margin:0 auto;
}

.detial_text{
  float:right;
  width:700px;
}
.detial_text span{
  color:#999;
}
.detial_text>div{
  padding-left:20px;
  margin-bottom: 20px;
}
.detial_text>div>span:nth-child(1){
  width:80px;
  text-align: left;
  display: inline-block;
  font-size: 14px;
  padding-left: 0;
}
.detial_text>div:nth-child(1) img{
  height: 18px;
  margin-right: 8px;
  position: relative;
  top: 3px;
}
.team_price{
  line-height: 75px;
  background-color:#f6f6f6;  
}
.team_price span.red1{
  font-size: 16px;
  color:red;
}
.team_price span.red2{
  font-size: 25px;
  color:red;
  margin-right:20px;
}
.go-coupon{
  display: block;
  font-size: 12px;
  color:#e53935;
  float:right;
}
.go-coupon img{
  margin:0 10px;
  position: relative;
  top:2px;
}
.nature>div{
  display: inline-block;
  width:590px;
}
.nature a{
  text-align: center;
  margin-bottom: 10px;
  padding:6px 11px;
  border:1px solid #ddd;
  margin-right:5px;
  color:#666;
  font-size: 14px;
}
.nature a.mi{
  border: 2px solid #1d4f36;
    padding: 5px 10px;
}
.sub_num, .add_num{
  border:1px solid #ddd;
  width:24px;
  line-height: 24px;
  text-align: center;
  display:inline-block;
}
.sums{
  position: relative;
  top:2px;
}
.sums{
  width:55px;
  line-height: 26px;
  border-top:1px solid #ddd;
  border-bottom:1px solid #ddd;
  display:inline-block;
  text-align: center;
  margin-left:-4px;
  margin-right:-4px;
}
.inventory{
  margin-left: 20px;
  font-size: 14px;
}
.quantity{
  border-bottom: 1px solid #ddd;
  padding-bottom: 20px;
  margin-bottom: 30px !important;
}
.nature>a.door{
  display: inline-block;
  text-align: center;
  position: relative;
  font-size: 14px;
  width: auto;
  line-height: normal;
}
.nature>a.door>span{
  color: red;
  font-size: 14px;
}
.btn_li, .btn_add{
  width:200px;
  line-height: 40px;
  border:1px solid #1d4f36;
  color:#1d4f36;
  outline: none;
  background: #fff;
  margin-right:10px;
  margin-bottom: 10px;
  font-size:14px;
}
.btn_add{
  background: #1d4f36 !important;
  color:#fff !important;
}
.comm span:not(:nth-child(1)){
  font-size: 0.5rem;
}
.detail_warp{
  overflow: hidden;
  width:1200px;
  margin-top:60px !important;
  margin-bottom:100px !important;
  margin:0 auto;
}
.de_ev{
  float: left;
  width:830px;
}
.detail_evaluate{
  line-height: 40px;
  overflow: hidden;
  border-bottom:1px solid #1d4f36;
  margin-bottom: 40px;
  background: #f6f6f6; 
  list-style: none;
  padding:0;

}
.detail_evaluate>li{
  float: left;
  width:170px;
  text-align: center;
  font-size: 12px;
  
}
.detail_qie{
  background:#1d4f36;
  color:#fff;
}

.detail_content{
  width:830px;
  margin:0 ;
}
.all_pics img{
  margin:0 auto;
  max-width:830px;
}
.related_products{
  float:right;
  width: 340px;
  border: 1px solid #ddd;
}
.related_products p{
  font-size:16px;
  color:#333;
  text-align:center;
  line-height:40px;
  background:#f6f6f6;
  border-bottom:1px solid #ddd;
  font-weight:bold;
  margin-top:0;
}
.related_products>div{
  padding:0 20px;
}
.related_products>div a{
  display:block;
  border-bottom:1px solid #ddd;
  text-align:center;
}
.related_products>div a div{
  width:260px;
  height:260px;
  overflow: hidden;
  position: relative;
  margin: 40px auto 15px
}
.related_products>div a p{
  width:270px;
  margin:0 auto;
  height:19px;
  font-size:12px;
  color:#666;
  font-weight:normal;
}
.related_products>div a>span{
  display:block;
  font-size:14px;
  color:#d4282d;
  margin:15px 0 20px 0;
}
</style>


  