<template>
  <div>
    <div id="register">
      <div>
        <h1>欢迎登录雷士品牌商城</h1>
      </div>
      <div class="mediate" id="app">
        <div>
          <p>用户名</p>
          <input type="text" name="myname" placeholder="6-12位，数字，字母或符号组合" 
          v-model="username" 
          @blur="checkUsername" >
          <span class="span-cls" :class="spanClass">{{msg}}</span>
        </div>
        <div class="log_pwd">
          <p>密码</p>
          <input type="password" name="password" placeholder="8-16位，数字，字母或符号组合" v-model="upassword" @blur="checkPassword">
          <span class="span-cls" :class="spanClass1">{{msg1}}</span>
        </div>
        <div class="auth_code">
          <p>验证码</p>
          <input type="text" name="verifyCode" autocomplete="off" class="YZM text left" >
          <div>
            <img class="verifyImage" src="../assets/verifyimage.jpg" alt="">
          </div>
        </div>  
        <div class="check">
          <a href="#">忘记密码?</a>
          <label>
            <input type="checkbox" name="isRemember" value="1">自动登录
          </label>
        </div>
        <div>
          <div>
            <a>
              <button type="submit" class="log"  @click="handle">登录</button>
               <span class="span-clss" :class="spanClass2">{{msg2}}</span>
            </a>
          </div>
          <div>
            <router-link to="/register">
              <button type="submit" class="reg">注册</button>
              <span class="span-clss" ></span>
            </router-link>
          </div>
        </div>
      </div>
    </div>
    <div style="height:30px;background:#F4F4F4"></div>
  </div>
</template>
<style scoped>
#register{
  background: #f4f4f4;
  width: 100%;
  min-width: 1200px;   
  color:#666;
}
#register>div:nth-child(1){
  text-align: center;
}
#register h1{
  padding-top: 60px;
  padding-bottom: 40px;
  margin: 0 auto;
}
h1{
  font-size: 24px;
}
.mediate {
  width: 840px;
  min-height: 439px;
  margin: 0 auto;
  padding: 50px 200px;
  background: #fff;
  box-sizing: border-box;
  font-size: 12px;
}
.mediate>div {
  float: left;
  line-height: 45px;
  text-align: center;
}
.mediate p {
  float: left;
  width: 60px;
  text-align: right;
  margin: 0 20px 0 0;
  padding: 0;
}
.mediate input {
  width: 240px;
  height: 40px;
  box-sizing: border-box;
  margin-bottom: 20px;
  padding: 0 20px;
  border: 0;
  border: 1px solid #e2e2e2;
  outline: none;
  overflow: visible;
  font-size:12px;
}
.YZM.text.left{
  width:180px;
  margin:0;
  padding:0 20px;
}
.auth_code div{
  float: left;
}
.auth_code input{
  float: left;
}
.verifyImage{
  width:110px;
  height:40px;
  margin-left:10px;
  display:inline-block;
}
.check{
  width:360px;
  height:49px;
}
.check a{
  color: #44adff;
  float:right;
  text-decoration: none;
} 
.check input{
  width:20px;
  height:20px;
  margin:0;
  padding:0;
  position: relative;
  top: 6px;
  padding: 0;
  font-size: 12px;
  margin-left:-130px;
}
.log{
  width: 320px;
  line-height: 40px;
  color: #fff;
  margin-left: 42px;
  background: #1d4f36;
  font-size: 20px;
  border: 0;
  outline: none;
  cursor: pointer;
  margin-bottom: 20px;
  margin-top: 30px;
}
button.reg{
  width: 320px;
  line-height: 40px;
  color: #fff;
  margin-left: 42px;
  background: #ccc;
  font-size: 20px;
  border: 0;
  outline: none;
  cursor: pointer;
  padding:0;
}
.span-cls{
  padding:5px 10px;
  display: block;
  float:right;
}
.span-clss{
  width:48px;
  display:block;
  float:right;
  text-align: center;
  margin:28px 0 0 10px;
}
.success{
  color:green;
}
.error{
  color:red;
}
.success1{
  color:green;
}
.error1{
  color:red;
}
.success2{
  color:green;
}
.error2{
  color:red;
}
</style>
<script>
export default {
  data(){
    return{
      username:"",
      upassword:"",
      spanClass:{
        error:false,
        success:false,
      },
      spanClass1:{
        error1:false,
        success1:false,
      },
      spanClass2:{
        error2:false,
        success2:false,
      },
      msg:"",
      msg1:"",
      msg2:""
    }
  },

  methods:{
    //验证用户名
    checkUsername(){
      let unsernameRegExp=/^[a-zA-Z0-9_]{6,12}$/;
      if(unsernameRegExp.test(this.username)){
        this.spanClass.success=true;
        this.msg="用户名输入正确";
        return true;
      }else{
        this.spanClass.error=true;
        this.msg="用户名输入不正确";
        return false;
      }
    },
    //验证密码格式是否正确
    checkPassword(){
      let upasswordRegExp=/^[a-zA-Z0-9_]{8,16}$/;
      if(upasswordRegExp.test(this.upassword)){
        this.spanClass1.success1=true;
        this.msg1="密码输入正确";
        return true;
      }else{
        this.spanClass1.error1=true;
        this.msg1="密码输入不正确";
        return false;
      }
    },

    //点击按钮校验用户登录的信息
    handle(){
      if(this.checkUsername() && this.checkPassword()){
        //件相关信息提交到服务器
        this.axios.post("/login","username=" + this.username + "&upassword=" +this.upassword).then((res)=>{
          if(res.data.code==0){
            this.spanClass2.error2=true;
            this.msg2="登录失败";
          }else{
            this.$router.push("/");
          }
        });
      }
    }
  }
}
</script>

