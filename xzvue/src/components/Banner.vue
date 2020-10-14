<template>
  <div class="block"> 
    <el-carousel height="600px">
      <el-carousel-item v-for="(item,index) of banner" :key="index">
        <img :src="item.img">
      </el-carousel-item>   
    </el-carousel>
  </div>  
</template>

<style>
  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }  
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }
  .block img{
    width:100%;
  }
</style>
<script>
export default {
  data(){
    return{
      banner:[],
    }
  },
  mounted(){
    //获取轮播图
    this.axios.get("/banner").then(res=>{ 
      let data=res.data.results;
      data.forEach(item=>{
        item.img=require("../assets/" + item.img);
        this.banner.push(item);
      });
    });
  } 
}
</script>