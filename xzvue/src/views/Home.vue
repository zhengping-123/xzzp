<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png"> 
  </div>
</template>

<script>
  export default{
    mounted(){
      this.axios.get("/index")
      .then(result=>{
        console.log(result.data)
      })
    }
  }
</script>
  
<style>
.home>h1{
  background-color:red;
  color:yellow
}
</style>