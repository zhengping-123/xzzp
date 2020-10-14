<template>
    <div>
        <div id="register">
            <div>
                <h1>欢迎注册雷士品牌商城</h1>
            </div>
            <div class="mediate">
                <div>
                    <p>用户名</p>
                    <input type="text" name="myname" placeholder="6-12位，数字，字母或符号组合" v-model="username" @blur="checkUsername">
                    <span class="span-cls" :class="spanClass">{{msg}}</span>
                </div>
                <div class="auth_code">
                    <p>验证码</p>
                    <input  type="text" name="verifyCode" autocomplete="off" class="YZM text left" >
                    <div>
                        <a href="#">发送验证码到手机</a>
                    </div>
                </div>  
                <div class="log_pwd">
                    <p>登录密码</p>
                    <input type="password" name="password" placeholder="8-16位，数字，字母或符号组合" v-model="upassword" @blur="checkPassword">
                    <span class="span-cls" :class="spanClass1">{{msg1}}</span>
                </div>
                <div>
                    <p>确认密码</p>
                    <input type="password" name="confirmPwd" placeholder="再次输入密码" v-model="password2" @blur="checkPassword2">
                    <span class="span-cls" :class="spanClass2">{{msg2}}</span>
                </div>
                <div>
                    <a>
                        <button type="submit" class="log" @click="handle">注册</button>
                        <span class="span-cls" :class="spanClass3">{{msg3}}</span>
                    </a>
                 </div>
                <div class="agree">
                    <span>点击"注册"表示同意</span>
                    <router-link to="/MintContent">《雷士品牌商城用户服务协议》</router-link> 
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
  margin: 0 ;
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
  margin:0 10px 20px 10px;
}
.auth_code div{
  float: left;
}
.auth_code input{
  float: left;
}
.auth_code a{
    text-decoration: none;
    color:#666;
}
.auth_code a:hover{
  color:red;
}
.verifyImage{
  width:150px;
  height:40px;
  margin-left:30px;
  display:inline-block;
}
.log{
  width: 340px;
  line-height: 40px;
  color: #fff;
  margin-left: 6px;
  background: #1d4f36;
  font-size: 20px;
  border: 0;
  outline: none;
  cursor: pointer;
}
button.reg{
  width: 360px;
  line-height: 40px;
  color: #fff;
  margin-left: 80px;
  background: #ccc;
  font-size: 20px;
  border: 0;
  outline: none;
  cursor: pointer;
  padding:0;
}
.agree span{
    margin-left:40px;
}
.agree a{
    text-decoration: none;
    color:#44adff;
}
.span-cls{
  padding:0 10px;
  display: block;
  float:right;
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
.success3{
  color:green;
}
.error3{
  color:red;
}
</style>
<script>
export default {
  data(){
    return{
      username:"",
      upassword:"",
      password2:"",
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
      spanClass3:{
        error3:false,
        success3:false,
      },
      msg:"",
      msg1:"",
      msg2:"",
      msg3:'',
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
    //验证两次密码是否一致
    checkPassword2(){
      if(this.upasswrod ==this.passwrod2 && this.password2!=""){
        this.spanClass2.success2=true;
        this.msg2="两次输入密码一致";
        return true;
      }else{
        this.spanClass2.error2=true;
        this.msg2="两次密码不一致";
        return false;
      }
    },
    handle(){
      if(this.checkUsername() && this.checkPassword() && this.checkPassword2()){
        this.axios.post('/register',"username=" + this.username + '&upassword=' + this.upassword).then(res=>{
          if(res.data.code==0){
            this.spanClass3.error3=true;
            this.msg3="用户名被占用";
          }else{
            this.$router.push("/login"); 
          }
        });
      }
    },
  }, 
}
</script>

