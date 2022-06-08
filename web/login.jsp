<%-- Document : login Created on : 2022-4-8, 14:25:59 Author : ASUS --%> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>登录</title>
<!--    <script>
        function check(){
            var userName = document.getElementById("userName").value;
            var password = document.getElementById("password").value;
            if (userName == "" | userName == null)
            {
                alert("请输入用户名。");
                return false;
            }
            if (password == "" | password == null)
            {
                alert("请输入密码。");
                return false;
            }
            if (password.length < 3)
            {
                alert("密码长度不够。")
                return false;
            }
            return true
        }
    </script>-->
    <style>
        body{
            margin: 0;
            padding: 0;
            font-family: "PingFang SC", "Microsoft Yahei", sans-serif;
        }
        
        .bg{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, .4);
            z-index: 100;
            /*display: none;*/ 
        }
        
        .login-container, .reg-container{
            width: auto;
            height: auto;
            display: flex;
            background: url() fixed no-repeat;
            background-size: cover;
            z-index: 999;
            position: fixed;
            left: 50%;
            top: 150px;
            margin-left: -170px;
        }
        .reg-container{
            margin-top: 0px;
        }
        .login-form{
            width: 340px;
            height: 300px;
            display: flex;
            flex-direction: column;
            padding: 40px;
            text-align: center;
            position: relative;
            padding-top: 20px;
            z-index: 100;
            background: inherit;
            border-radius: 8px;
            overflow: hidden;

        }
        .reg-form{
            width: 340px;
            height: 470px;
            display: flex;
            flex-direction: column;
            padding: 40px;
            padding-top: 20px;
            text-align: center;
            position: relative;
            z-index: 100;
            background: inherit;
            border-radius: 8px;
            overflow: hidden;
        }
        .login-form::before, .reg-form::before{
            content: "";
            width: calc(100% + 20px);
            height: calc(100% + 20px);
            position: absolute;
            top: -10px;
            left: -10px;
            overflow: hidden;
            background: inherit;
            box-shadow: inset 0 0 0 200px rgb(255, 255, 255);
            filter: blur(6px);
            z-index: -1;

        }

        .login-form h2, .reg-form h2{
            font-size: 18px;
            font-weight: 400px;
            color: #3d5245;
        }
        .login-form input,
        .login-form button ,
        .reg-form input,
        .reg-form button{
            margin: 6px 0;
            height: 36px;
            border: 2px solid rgba(234, 76, 137, 0.4);
            border-radius: 4px;
            padding: 0 14px;
            color: #3d5245;
            font-size: 14px;
        }

        .login-form input::placeholder,
        .reg-form input::placeholder{
            color: #3d5245;
        }

        /* 补充，取消选中高亮蓝框 */
        .login-form button:focus,
        .login-form input:focus,
        .reg-form button:focus,
        .reg-form input:focus {
            outline: 0;
            box-shadow: 0 0 0 2px rgba(36, 24, 29, 0.3);
        }
        .login-form button,
        .reg-form button {
            margin-top: 24px;
            background-color: rgba(57, 88, 69, 0.4);
            color: white;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            transition: 0.4s;
        }
        .login-form button:hover ,
        .reg-form button:hover{
            background-color: rgba(12, 80, 38, 0.67);
        }
        .login-form button:focus,
        .reg-form button:focus {
            outline: 0;
        }
        .login-form button::before,
        .login-form button::after,
        .reg-form button::before,
        .reg-form button::after  {
            content: "";
            display: block;
            width: 80px;
            height: 100%;
            background: rgba(179, 255, 210, 0.5);
            opacity: 0.5;
            position: absolute;
            top: 0;
            left: 0;
            transform: skewX(-15deg);
            filter: blur(30px);
            overflow: hidden;
            transform: translateX(-100px);
        }
        .login-form button::after,
        .reg-form button::after {
            width: 40px;
            background: rgba(179, 255, 210, 0.3);
            left: 60px;
            opacity: 0;
            filter: blur(5px);
        }

        .login-form button:hover::before,
        .reg-form button:hover::before{
            transition: 1s;
            transform: translateX(320px);
            opacity: 0.7;
        }

        .login-form button:hover::after,
        .reg-form button:hover::after {
            transition: 1s;
            transform: translateX(320px);
            opacity: 1;
        }

        .hiddenBox{
            display: none;
        }

    </style>
    <script>
        window.onload = function(){
            var toReg = document.querySelector(".toreg");
            var toLogin = document.querySelector(".tologin");
            var loginForm = document.querySelector('.login-form');
            var regForm = document.querySelector('.reg-form');
            regForm.classList.add("hiddenBox");

            toReg.onclick = function(){
                loginForm.classList.add("hiddenBox");
                regForm.classList.remove("hiddenBox");
            };
            toLogin.onclick = function(){
                loginForm.classList.remove("hiddenBox");
                regForm.classList.add("hiddenBox");
            };

            // 隐藏登录注册弹出层
            var bgBtn = document.querySelector('.bg');
            var loginBox = document.querySelector('.login-container');
            var regBox = document.querySelector('.reg-container');
            bgBtn.onclick = function(){
                this.classList.add('hiddenBox');
                loginBox.classList.add('hiddenBox');
                regBox.classList.add('hiddenBox');
            };
        };
    </script>
  </head>
  <body>
    <!-- 背景层 -->
    <div class="bg"></div>
    
    <div class="login-container">
        <form action="LoginServlet" method="post" class="login-form">
            <h2>登录</h2>
            <input type="text" name="userName"  placeholder="用户名" />
            <input type="password" name="password" id="password" placeholder="密码">
            <button type="submit">登录</button>
            <span
                style="
                position: absolute;
                top: 240px;
                left: 145px;
                text-align: center;
                "
                class="toreg"
            ><a href="#">注册</a></span>
        </form>
    </div>

    <div class="reg-container">
        <form action="RegServlet" method="post" class="reg-form" enctype="multipart/form-data">
            <h2>注册</h2>
            <input type="text" name="userName" placeholder="用户名" />
            <input type="password" name="password1" id="password1" placeholder="密码" />
            <input type="password" name="password2" id="password2" placeholder="确认密码" />
            <input type="email" name="email" id="email" placeholder="邮箱" />
            <div style="display: flex; margin: 6px;">
                <span>性别：</span>
                <input id="male" name="sex" type="radio" value="男" checked="checked" style="display: inline-block; height: 1em; margin: 6px 5px;"/><span>男</span>
                <input id="female" name="sex" type="radio" value="女" style="display: inline-block; height: 1em; margin: 6px 5px;"/><span>女</span>
            </div>
            <input style="display: block; line-height: 26px;" type="file" name="headIcon" value="headIcon" />
            <div style="display: flex;">
                <button style="width: 100px; margin: 10px;" type="reset">重置</button>
                <button style="width: 100px; margin: 10px;" type="submit">注册</button>
            </div>
            <span
                style="
                position: absolute;
                top: 410px;
                left: 145px;
                text-align: center;
                "
                class="tologin"
            ><a href="#">登录</a></span>
        </form>
    </div>
  </body>
</html>
