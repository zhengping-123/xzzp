<template>
  <div>
    <div class="product_nav" >
      <ul >
        <li >
          <a href="#" @mouseover="mouseOver" @mouseout="mouseOut">
            <img src="img/ch0.png" alt="" v-if="show">
            <img src="img/one0.png" alt="" v-else>                                                                                                                           
            <span>套餐专区</span>
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver1" @mouseout="mouseOut1">
            <img src="img/ch1.png" alt="" v-if="show1">
            <img src="img/one1.png" alt="" v-else>  
            <span>客厅专区</span>
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver2" @mouseout="mouseOut2">
            <img src="img/ch2.png" alt="" v-if="show2">
            <img src="img/one2.png" alt="" v-else>  
            <span>餐厅专区</span> 
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver3" @mouseout="mouseOut3">
            <img src="img/ch3.png" alt="" v-if="show3">
            <img src="img/one3.png" alt="" v-else>  
            <span>卧室专区</span>         
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver4" @mouseout="mouseOut4">
            <img src="img/ch4.png" alt="" v-if="show4">
            <img src="img/one4.png" alt="" v-else>
            <span>厨卫专区</span>      
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver5" @mouseout="mouseOut5">
            <img src="img/ch5.png" alt="" v-if="show5">
            <img src="img/one5.png" alt="" v-else>
            <span>阳台过道</span>     
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver6" @mouseout="mouseOut6">
            <img src="img/ch6.png" alt="" v-if="show6">
            <img src="img/one6.png" alt="" v-else>
            <span>台灯专区</span>  
          </a>
        </li>
        <li>
          <a href="#" @mouseover="mouseOver7" @mouseout="mouseOut7">
            <img src="img/ch7.png" alt="" v-if="show7">
            <img src="img/one7.png" alt="" v-else>
            <span>光源/筒射</span> 
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      show:true,
      show1:true,
      show2:true,
      show3:true,
      show4:true,
      show5:true,
      show6:true,
      show7:true,
    }
  },
  methods:{
    mouseOver(){
      this.show=false;
    },
    mouseOver1(){
      this.show1=false;
    },
    mouseOver2(){
      this.show2=false;
    },
    mouseOver3(){
      this.show3=false;
    },
    mouseOver4(){
      this.show4=false;
    },
    mouseOver5(){
      this.show5=false;
    },
    mouseOver6(){
      this.show6=false;
    },
    mouseOver7(){
      this.show7=false;
    },

    mouseOut(){
      this.show=true;
    },
    mouseOut1(){
      this.show1=true;
    },
    mouseOut2(){
      this.show2=true;
    },
    mouseOut3(){
      this.show3=true;
    },
    mouseOut4(){
      this.show4=true;
    },
    mouseOut5(){
      this.show5=true;
    },
    mouseOut6(){
      this.show6=true;
    },
    mouseOut7(){
      this.show7=true;
    }
  },
}
</script>
<style scoped>
.product_nav{
  border-bottom:1px solid #ddd;
  background-color:#f4f4f4;
  min-width:1200px;
  box-sizing: border-box;
}
.product_nav ul{
  list-style:none;
  width:1200px;
  margin:0 auto;
}
.product_nav ul>li a{
   display:block;
   height:90px; 
   width:12%;
   text-align: center;
   float: left;
   color:rgb(102, 102, 102);
   text-decoration:none;
}
.product_nav ul>li img{
  position: relative;
  top:20px;
  left:25px;
}

.product_nav ul>li span{
  text-align:center;
  top:40px;
  left: -14px;
  font-size:12px;
  position: relative;  
}
.product_nav ul>li:nth-child(2) img{
  left:30px;
}
.product_nav a:hover{
  background-color:#fff;
  color:rgb(72, 152, 105);
}
.product_nav:after{
  content:"";
  display: block;
  clear:both;
}
</style>