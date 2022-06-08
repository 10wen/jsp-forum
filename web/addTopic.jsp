<%-- 
    Document   : addTopic
    Created on : 2022-4-15, 14:30:14
    Author     : ASUS
--%>
<%
    String userName = (String) request.getSession().getAttribute("userName");
    if (userName == null) {
%>
<script>
//    alert("未登录，前往登录！");
//    location.href = 'login.jsp';

</script>
<%
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <script>
        function check(){
            var title = document.getElementById("title").value;
            if(title == "" | title = null) {
                alert("输入标题")
                return false;
            }
            var content = document.getElementById("content").value;
            if(content == null | content == "") {
                alert("请输入内容")
                return false;
            }
            return true;
        }
        </script>-->
        <style>
      * {
        margin: 0;
        padding: 0;
      }
      body{
          padding-top: 100px;
      }
      
      .container {
        display: flex;
        flex-direction: column;
        width: 60%;
        height: 1000px;
        margin: 10px auto;
      }
      .headerTitle {
        width: 100%;
        height: 50px;
        text-align: center;
      }

      .addTopicBox {
        width: 100%;
        min-height: 500px;
        max-height: 2000px;
        padding: 20px;
        background-color: aliceblue;
        border-radius: 5px;
      }
      .titleBox {
        width: 100%;
        height: 50px;
        border-bottom: 1px solid rgb(230, 224, 224);
      }
      .titleInput{
          display: block;
          width: 100%;
          height: 100%;
          font-size: 20px;
          background: none;
          border: none;
          outline: none;
      }
      .contentBox{
          width: 100%;
          min-height: 500px;
          max-height: 100%;
          padding-top: 10px;
          border: none;
          outline: none;
          font-size: 16px;
          line-height: 24px;
          word-wrap: break-word;
          overflow-y: auto;
          font-family: "Microsoft YaHei", "宋体";
      }
      .pubContainer{
          position: fixed;
          left: 0px;
          bottom: 0px;
          width: 100%;
          height: 50px;
          text-align: center;
          padding-bottom: 10px;
          background-color: aliceblue;
      }
      button{
          width: 100px;
          height: 40px;
          margin-top: 10px;
          font-family: "微软雅黑","宋体";
          font-size: 18px;
          color: rgb(244, 239, 239);
          border: none;
          border-radius: 5px;
          background-color: rgb(162, 118, 204);
      }

    </style>
    
    <script>
        window.onload = function(){
            var btn = document.querySelector('.pubButton');
            btn.onclick = function (){
                var data = document.querySelector('.contentBox').innerText;
                document.querySelector('.hiddenTextarea').value = data;
                document.getElementById("addTopicForm").submit();
            }
        }
    </script>
        
    </head>
    <body>
        <div class="headerInclude">
            <jsp:include flush="true" page="head.jsp"></jsp:include>
        </div>

<!--        <table width="90%" border="0" align="center">
            <tr> </tr>
            <form action="AddTopicServlet" method="post">
            <tr>
                <td>
                    <table width="70%" border="1" align="center">
                        <tr class="titleTable">
                            <td colspan="2">发表新帖</td>
                        </tr>
                        <tr class="content">
                            <td><div align="right">标题</div></td>
                            <td><input name="title" type="text" id="title" size="30"></td>
                        </tr>
                        <tr class="content">
                            <td <div align="right">内容</td>
                            <td><textarea name="content" cols="30" rows="10" id="content"></textarea></td>
                        </tr>
                        <tr class="content">
                            <td colspan="2">
                                <div align="center">
                                    <input type="submit" name="submit" value="提交" onClick="return check()"/>
                                    <input type="reset" name="submit2" value="重置" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </form>-->
        <!--</table>-->
        
        <div class="container">
            <div class="headerTitle">
                <h2>发表帖子</h2>
            </div>
            <div class="addTopicBox">
                <form action="AddTopicServlet" id="addTopicForm" method="post">
                    <div class="titleBox">
                        <input type="text" class="titleInput"
                               name="title" 
                               placeholder="请输入标题（最多100个字）"
                               autocomplete="off"
                               onkeydown="if(event.keyCode==13){return false;}"
                               maxlength="100" 
                               required />
                    </div>
                    <div class="contentBox" name="content" contenteditable="true"></div>
                    <textarea name="content" class="hiddenTextarea" style="display: none;"></textarea>
                </form>
            </div>
            <div class="pubContainer">
                <button class="pubButton">发布</button>
            </div>
        </div>


    </body>
</html>
