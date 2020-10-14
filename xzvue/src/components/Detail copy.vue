<template>
  <div>
    <div class="detail_pic" >
      <div class="big_pic" >
        <img src="img/ps_1806211717572850174.jpg" alt=""  v-show="show">
        <img src="img/ps_1806211718014569191.jpg" alt=""  v-show="show1">
        <img src="img/ps_1806211718054413196.jpg" alt=""  v-show="show2">
        <img src="img/ps_1806211718097694723.jpg" alt=""  v-show="show3">
        <img src="img/ps_1806211718144257521.jpg" alt=""  v-show="show4">
      </div>
      <ul class="icon_list" >
        <li @click="Show"><img src="img/ps_1806211717572850174(1).jpg" alt=""></li>
        <li @click="Show1"><img src="img/ps_1806211718014569191(1).jpg" alt=""></li>
        <li @click="Show2"><img src="img/ps_1806211718054413196(1).jpg" alt=""></li>
        <li @click="Show3"><img src="img/ps_1806211718097694723(1).jpg" alt=""></li>
        <li @click="Show4"><img src="img/ps_1806211718144257521(1).jpg" alt="" ></li>
      </ul>
    </div>  
  </div>
</template>
<script>
export default {
  data(){
    return{
      show:true,
      show1:false,
      show2:false,
      show3:false,
      show4:false,
      detail:[]
    }  
  },
  methods:{
    Show(){
      this.show=true;
      this.show1=false;
      this.show2=false;
      this.show3=false;
      this.show4=false;
    },
    Show1(){
      this.show=false;
      this.show1=true;
      this.show2=false;
      this.show3=false;
      this.show4=false;
    },
    Show2(){
      this.show=false;
      this.show1=false;
      this.show2=true;
      this.show3=false;
      this.show4=false;
    },
    Show3(){
      this.show=false;
      this.show1=false;
      this.show2=false;
      this.show3=true;
      this.show4=false;
    },
    Show4(){
      this.show=false;
      this.show1=false;
      this.show2=false;
      this.show3=false;
      this.show4=true;
    },
  }
}
</script>
<style>
.detail_pic{
  float: left;
   width:450px;
   margin-right:50px;
}
.big_pic>img{
  width:450px;
  height: 450px;
  position:relative; 
}
.icon_list{
  list-style: none;
  margin: 20px 0 10px 0;
  width:450px;
  height: 67px;
  padding:0;
  text-align: center;
  display: block;
}
.icon_list li{
  float: left;
  width:20%;
  text-align: center;
}
</style>

