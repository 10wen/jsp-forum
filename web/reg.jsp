<%-- 
    Document   : index
    Created on : 2022-3-31, 22:15:21
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>JSP Page</title>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <script>

            function check()
            {
                var userName = document.getElementById("userName").value;
                var password1 = document.getElementById("password1").value;
                var password2 = document.getElementById("password2").value;
                var email = document.getElementById("email").value;

                if (userName == "" | userName == null)
                {
                    alert("请输入用户名。");
                    return false;
                }
                if (password1 == "" | password1 == null)
                {
                    alert("请输入密码。");
                    return false;
                }
                if (password1.length < 3)
                {
                    alert("密码长度不够。")
                    return false;
                }
                if (password2 != password1)
                {
                    alert("两次密码不一致。");
                    return false;
                }
                if (email == null | email == "")
                {
                    alert("请输入邮箱。");
                    return false;
                }
                if (email.indexOf(".") == -1 | email.indexOf("@") == -1)
                {
                    alert("邮箱格式不对。");
                    return false;
                }
                return true;
            }

        </script>
        <style>
            .hfback{
                background-color: #0ff;
                font-family: monospace;
                font-size: 20px;
                margin: 0px;
                padding: 0px;
            }
            .index{
                text-align: center;
            }
            .form {
                width: 100%;
                height: 500px;
            }
            
        </style>
    </head>
    <body>
        <table width="80%" border="0" align="center">
            <tr>
                <td class="hfback">
                    <jsp:include flush="true" page="head.jsp"></jsp:include>
                </td>
            </tr>
            <tr>
                <td class="form">
                    <form action="RegServlet" name="form1" method="post" enctype="multipart/form-data"> 
                        <table width="27%" border="0" align="center">
                            <tr align="center">
                                <td colspan="2" class="CSS1">请输入注册信息</td>
                            </tr>
                            <tr>
                                <td><div align="right" class="CSS2">用户名：</div></td>                                                                                                 
                                <td>         
                                    <label>
                                        <input name="userName" type="text" id="userName"/>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><div align="right" class="CSS2">密码：</div></td>
                                <td>          
                                    <label>
                                        <input name="password1" type="password" id="password1" />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><div align="right" class="CSS2">确认密码：</div></td>
                                <td>          
                                    <label>
                                        <input name="password2" type="password" id="password2" />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><div align="right" class="CSS2">性别：</div></td>
                                <td>  
                                    <label for="male">
                                        <input id="male" name="sex" type="radio" value="男" checked="checked" />男
                                    </label>                                            
                                    <label for="female">
                                        <input id="female" name="sex" type="radio" value="女" />女
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td><div align="right" class="CSS2">邮箱：</div></td>
                                <td>          
                                    <label>
                                        <input name="email" type="text" id="email" />
                                    </label>
                                </td>
                                </tr>
                                <tr>
                                <td><div align="right" class="CSS2">头像：</div></td>
                                <td>          
                                    <label>
                                        <input type="file" name="headIcon" value="headIcon" />
                                    </label>
                                </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <label>
                                            <input type="reset" name="Submit3" value="重置" />
                                        </label>  
                                        <label>
                                            <input type="submit" name="Submit4" value="提交" onClick="return check()" />
                                        </label>
                                    </td>
                                </tr>
                            </table>    
                        </form>
                    </td>
                </tr>    
                <tr>
                    <td class="hfback" height="100px">
                    <jsp:include flush="true" page="foot.jsp"></jsp:include>
                </td>
            </tr>
        </table>
    </body>
</html>
