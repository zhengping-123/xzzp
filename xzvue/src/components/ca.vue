<template>
  <div class="block">
    
    <el-carousel  width="200px">
      <el-carousel-item v-for="item in 4" :key="item">
        <img src="https://mall.nvc-lighting.com.cn//upload/store/-1/product/show/thumb550_550/ps_1806211718144257521.jpg" alt="">
      </el-carousel-item>
       
    </el-carousel>
  </div>
  
</template>

<style>
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 150px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }
</style>