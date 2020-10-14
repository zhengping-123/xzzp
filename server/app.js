//加载Express模块
const express = require("express");
//加载CORS模块
const cors = require("cors");

//加载MySQL模块
const mysql = require("mysql");

//加载body-parser
const bodyParser=require('body-parser');
//创建MySQL连接池
const pool = mysql.createPool({
  //数据库服务器的地址
  host: "127.0.0.1",
  //数据库服务器的端口号
  port: 3306,
  //数据库用户的用户名
  user: "root",
  //数据库用户的密码
  password: "",
  //数据库名称
  database: "xzzp",
  //数据库的编码方式
  charset: "utf8",
  //支持的最大连接数
  connectionLimit: 20,
});

//创建Express对象
const server = express();

//使用CORS模块
server.use(
  cors({
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
  })
);

//使用body-parser中间件
server.use(bodyParser.urlencoded({
  extended:false
}));

// //用户注册的接口
server.post('/register',(req,res)=>{
  //1.获取客户端提交的用户名和密码
  let username=req.body.username;
  let upassword=req.body.upassword;
  //2.以当前的用户名为条件进项查找操作,因为需要保证用户名的唯一性
  let sql='SELECT id,username FROM user WHERE  username=?';
  pool.query(sql,[username],(err,results)=>{
    if(err) throw err;
    //用户名是存在然后进行不同的操作
    if(results.length==0){
      //3.将用户名信息写入到数据表
      sql='INSERT INTO user(username,upassword) VALUES(?,MD5(?))';
      pool.query(sql,[username,upassword],(err,results)=>{
        if(err) throw err;
        res.send({message:'注册成功',code:1});
      });
    }else{
      //4.如果找到的话，则直接产生错误响应信息到客户端
      res.send({message:'用户名已经存在',code:0});
    }
  });
});

//用户登录的接口
server.post("/login",(req,res)=>{
  //1.获取用户名及密码信息
  let username=req.body.username;
  let upassword=req.body.upassword;
  
  //2.以用户名和密码为条件进行查找
  let sql="SELECT id,username,upassword FROM user WHERE username=? AND upassword=MD5(?)";
  pool.query(sql,[username,upassword],(err,results)=>{
    if(err) throw err;
    if(results.length == 0){
      res.send({message:'登录失败',code:0});
    }else{
      res.send({message:'登录成功',code:1});
    }
  });
});

//获取轮播图接口
server.get("/banner", (req, res) => {
  //SQL语句
  let sql = "SELECT id,img FROM banner";
  //执行SQL语句
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 1, results: results });
  });
});

//获取首页接口
server.get("/mainpage",(req,res)=>{
  let sql="select id,img,title,price from mainpage ";
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    res.send({message:"查询成功",code:1,results:results});
  });
});

//获取详情页左上
server.get("/detalts",(req,res)=>{
  let lid=req.query.lid;
  let sql="select id,img from detalts where img_id=?";
  pool.query(sql,[lid],(err,results)=>{
    if(err) throw err;
    res.send({message:"查询成功",code:1,results:results});
  });
})

//获取详情页
server.get("/commodity",(req,res)=>{
  let cid=req.query.cid;
  let sql="SELECT id,name,price,color,num,img,servicePrice FROM commodity where commodityId=?";
  //console.log(req.query);
  //执行sql语句
  pool.query(sql,[cid],(err,results)=>{
    if(err) throw err;
    res.send({message:"查询成功",code:1,results:results});
    });
});

//获取详情页下左
server.get("/particulars",(req,res)=>{
  let did=req.query.did;
  //console.log(req.query);
  let sql="SELECT id,particularsImg FROM  particulars where  commodityType=?";
  //console.log(did);
  pool.query(sql,[did],(err,results)=>{
    if(err) throw err;
    res.send({message:"查询成功",code:1,results:results});
  });
});

//获取详情页下右
server.get("/recommend",(req,res)=>{
  let sql="SELECT * FROM recommend";
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    res.send({message:"查询成功",code:1,results:results});
  });
});

//添加购物车接口
server.post("/addcrt",(req,res)=>{
  let id=req.body.id;
  let sql1="select * from cart where id=?";
  let sql2="insert into cart set ?";
  let sql3="update cart set num=num+1 where id=?";
  //console.log(req.body);
  pool.query(sql1,[id],(err,results)=>{
    if(err) throw err; 
    if(results.length==0){
      pool.query(sql2,[req.body],(err,results)=>{
        //console.log(results)
        if(results.affectedRows>0){
          res.send("1")
        }else{
          res.send("0");
        }
      })
    }else{
      pool.query(sql3,[id],(err,results)=>{
        if(err) throw err;
        if(results.affectedRows>0){
          res.send("2");
        }else{
          res.send("3");
        }
      });
    }
  });
});

//获取购物车
server.get("/cart",(req,res)=>{
  let sql="select * from cart";
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    res.send(results);
    //console.log(results)
  });
});

//删除购物车
server.post("/cart1",(req,res)=>{
  let id=req.body.id;
  let sql="delete from cart where id=?";
  console.log(req.body)
  pool.query(sql,[id],(err,results)=>{
    if(err) throw err;
    if(results.affectedRows>0){
      res.send("1");
    }else{
      res.send("0"); 
    }
  });
});

//获取购物车
// server.get("/cart",(req,res)=>{
//   let id=req.body.id;
//   let sql="select * from cart";
//   let sql1="delete from cart where id=?";
//   pool.query(sql,(err,results)=>{
//     if(err) throw err; 
//     if((results.affectedRows>0)){
//       pool.query(sql1,[req.body],(err,results)=>{
//         if(results.affectedRows>0){
//           res.send("1")
//         }else{
//           res.send("0");
//         }
//       })
//     }
  
//     //console.log(results)
//   });
// });

  //指定监听端口号
  server.listen(9999, () => {
   console.log("server is runing...");
  });
