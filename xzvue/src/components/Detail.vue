<template>
  <div>
    <div class="detail_pic" >
      <div class="big_pic">
        <img :src="img || (detail[0] && detail[0].img)" alt="" >
        <!-- <pic-zoom img :url="img || (detail[0] && detail[0].img)"  :scale="3"></pic-zoom> -->
      </div>
      <ul class="icon_list" >
        <li @mouseover="Show(item.img)"  v-for="(item,index) of detail" :key="index">
          <div style="width:60px;height:60px;">
            <img :src="item.img" alt="" :id="item.id">
          </div>
        </li>
      </ul>
    </div>  
  </div>
</template>
<script>
import PicZoom from 'vue-piczoom'
export default {
  components:{
    PicZoom
  },
  data(){
    return{
      id:1,
      img:'',
      detail:[],
      url:""
    }  
  },
  methods:{
    Show(img){
      this.img=img;  
    }
  },
  created(){
    let lid=this.$route.params.lid;
    this.axios.get('/detalts?lid=' + lid).then(res=>{
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/" +item.img);
        this.detail.push(item);
      });
      //console.log(this.detail)
    });
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
  position: relative; 
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
.icon_list img{
  width:100%;
}
</style>

