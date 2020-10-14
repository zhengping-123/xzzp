<template>
  <div>
    <div class="shop_car">
      <div class="rook">购物车</div>
      <ul class="car_title">
        <li>
          <input type="checkbox" ckecked="checked" v-model="checked" @click="selAll">
          全选
        </li>
        <li>商品信息</li>
        <li>单价</li>
        <li>数量</li>
        <li>小计</li>
        <li>活动</li>
        <li>操作</li>
      </ul>
      <div class="store">
        <input type="checkbox" v-model="checked1">
        <span>中山家居运营中心</span>
        <img src="/img/fu_logo.png" alt="">
      </div>
      <div class="cat_border" v-for="(item,index) of cart" :key="index">
        <div class="cars">
          <ul class="car_list">
            <li>
              <input type="checkbox" v-model='checkboxList' @click="item.checked = !item.checked" :value="item.id">
              <router-link :to="`/details/${item.id}`">
                <span>
                  <img :src="item.img" alt="">
                </span>
              </router-link>
            </li>
            <li>
              <span>
                <a href="#">{{item.name}}</a>
              </span>
              <div class="pick">
                <span>{{item.color}}</span>
              </div>
            </li>
            <li>
              <span>{{item.price}}</span>
            </li>
            <li>
              <button  class="sub_num" @click="item.num>1? item.num--:item.num">
                <span>-</span>
              </button>
              <a href="#" class="nums">
                <span>{{item.num}}</span>
              </a>
              <button class="add_num"  @click="item.num++">+</button>
            </li>
            <li>
              <div>
                <span class="total">￥{{(Number(item.price*item.num)).toFixed(2)}}</span>
              </div>
            </li>
            <li></li>
            <li>
              <a href="#" class="del" @click="remove(index)">删除</a>
              <a href="#">移入收藏夹</a>
            </li>
          </ul>
          <ul class="car_door">
            <li>
              <input type="checkbox"  v-model="checked2">
            </li>
            <li>售后服务</li>
            <li>上门安装</li>
            <li>1</li>
            <li>{{item.servicePrice}}</li>
            <li>{{item.servicePrice}}</li>
          </ul>
        </div>
      </div>
      <div>
        <ul class="account">
          <li>
            合计(不含运费)：
            <span>{{ total.toFixed(2) }}</span>
          </li>
          <li>
            <a href="#">结算</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>

export default {
  props:["lid"],
  data(){
    return{
      num:1,
      cart:[],
      checked:false,
      checked1:false,
      checked2:false,
      checkboxList:[]
    }
  },
  watch:{
    checkboxList:{
			handler:function(){
				if(this.checkboxList.length===this.cart.length){
          this.checked=true
          this.checked1=true
          this.checked2=true
				}else{
          this.checked=false
          this.checked1=false
          this.checked2=false
				}
			}
		}
  },
  methods:{
		remove:function(index) { //移除商品
		alert("确认删除该商品")
        this.cart.splice(index, 1);
        let id=this.$route.params.lid;
        this.axios.post("/cart1").then(res=>{
          this.cart=res.data;
        });
 		},
		selAll:function(){ //全选
			if(this.checked){
				this.checkboxList=[];
			}else{
				this.checkboxList=[];
				this.cart.forEach(item=>{
					this.checkboxList.push(item.id)
				})
			}
		},	
	},
  mounted(){
    this.axios.get("/cart").then(res=>{
      let data=res.data;
      //console.log(res.data)
      data.forEach(item=>{
      item.img=require("../assets/" +item.img);
        this.cart=res.data;
       });
    });  
  },
  computed: {
 		total: function () { //计算总价
			let total = 0;
			let arr=this.checkboxList;
			//console.log(this.checkboxList[0],this.checkboxList[1])
			for(var i=0;i<arr.length;i++){
				total+=(this.cart[arr[i]-1].num)*(this.cart[arr[i]-1].price)
			}			
  			return total
 		}
 	}
}
</script>
<style scoped>
.shop_car{
  width:1200px;
  margin:0 auto;
}
.rook{
  line-height:45px;
  color:#666;
}
.car_title{
  padding:0;
  list-style: none;
  line-height: 45px;
  border:1px solid #ddd;
  background-color:#f6f6f6;
  overflow: hidden;
  box-sizing:border-box;
}
.car_title>li{
  float: left;
  color:#666;
  font-size:14px;
}
.car_title>li:nth-child(1){
  width:190px;
  padding-left:20px;
  box-sizing:border-box;
}
.car_title>li:nth-child(1)>input{
  width:18px;
  height:18px;
  position: relative;
  top:5px;
  margin-right:20px;
}
.car_title>li:nth-child(2){
  width:280px;
}
.car_title>li:nth-child(3){
  width:135px;
}
.car_title>li:nth-child(4){
  width:160px;
  box-sizing:border-box;
  padding-left:40px;
}
.car_title>li:nth-child(5){
  width:125px;
}
.car_title>li:nth-child(6){
  width:175px;
}
.car_title>li:nth-child(7){
  width:130px;
}
.store{
  border-bottom:1px solid #1d4f36;
  margin-bottom:20px;
  padding-top:15px;
  padding-bottom:10px;
}
.store>input{
  width:18px;
  height:18px;
  position: relative;
  top:5px;
  margin-right:10px;
  margin-left:25px;
}
.store>span{
  font-weight: bold;
  font-size:14px;
}
.store>img{
  position: relative;
  top:5px;
  left:10px;
}
.cat_border{
  border:1px solid #ddd;
  border-top:0;
  overflow: hidden;
}
.cars{
  border-top:1px solid #ddd;
   overflow: hidden;
}
.car_list{
  padding:0;
  box-sizing: border-box;
  list-style: none;
  height:120px;
  color:#666;
}
.car_list>li{
  float: left;
  font-size:15px;
}
.car_list>li:nth-child(1){
  width:190px;
  padding-left:20px;
  box-sizing:border-box;
  position: relative;
}
.car_list>li:nth-child(1)>input{
  width:18px;
  height:18px;
  position: relative;
  margin-right:20px;
  top:-35px;
}
a{
  text-decoration: none;
  color:#666;
}
.car_list>li:nth-child(1) img{
  margin-top:10px;
  width:90px;
}
.car_list>li:nth-child(2){
  width:280px; 
}
.car_list>li:nth-child(2)>span {
  color: #000;
  margin: 20px 0;
  width: 245px;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.car_list>li:nth-child(3) {
  width: 135px;
  line-height: 120px;
}
.car_list>li:nth-child(4) {
  width: 160px;
  line-height: 120px;
}
.sub_num, .add_num {
  width: 24px;
  line-height: 24px;
  text-align: center;
  border: 1px solid #ddd;
  display: inline-block;
  background: #f6f6f6;
}
.car_list>li a.nums {
    position: relative;
    top: 1px;
}
.nums {
  width: 55px;
  line-height: 26px;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  display: inline-block;
  text-align: center;
  margin-right: -4px;
  margin-left: -4px;
  font-size: 14px;
}
.car_list>li:nth-child(5) {
  width: 225px;
  line-height: 120px;
}
.car_list>li:nth-child(6) {
  width: 175px;
  line-height: 120px;
}
.car_list>li:nth-child(7) {
  width: 200px;
}
.car_list>li:nth-child(7)>a{
  display: block;
  color:#00a0ff;
}
.car_list>li:nth-child(7)>a.del { 
  margin: 40px 0 10px 58px;  
}
.car_list>li:nth-child(7)>a:nth-child(2){
  margin-left: 58px;
}
.car_door{
  list-style: none;
  line-height: 40px;
  border-top: 1px dashed #ddd;
  overflow: hidden;
  box-sizing: border-box;
  width: 1080px;
  margin: 0 auto;
  padding:0;
}
.car_door>li{
  float: left;  
  font-size:14px;
}
.car_door>li:nth-child(1) {
  width: 125px;
}
.car_door>li:nth-child(2) {
  width: 280px;
}
.car_door>li:nth-child(3) {
  width: 135px;
  color: #666;
}
.car_door>li:nth-child(4) {
  width: 160px;
  padding-left: 53px;
  box-sizing: border-box;
  color: #666;
}
.car_door>li:nth-child(5) {
  width: 125px;
  color: red;
}
.account {
  overflow: hidden;
  line-height: 58px;
  background: #f6f6f6;
  border: 1px solid #ddd;
  margin-bottom: 80px;
  margin-top: 10px;
  list-style: none;
  padding:0;
}
.account>li{
  float: left;
}
.account>li:nth-child(1) {
  margin-left: 555px;
}
.account>li:nth-child(2)>a {
  width: 137px;
  line-height: 64px;
  background: #1d4f36;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  text-align: center;
  font-size: 16px;
  margin-left:309px;
}
</style>