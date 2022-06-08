<%-- 
    Document   : content
    Created on : 2022-4-19, 10:41:39
    Author     : ASUS
--%>

<%@page import="com.bbs.model.ReplyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.ReplyBeanAction"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String Id = request.getParameter("Id");
    if (Id == null || Id == "") {
        Id = request.getParameter("Id");
    }
    TopicBean tb = new TopicBean();
    TopicBeanAction tba = new TopicBeanAction();
//    tb = tba.getTopicById(Id);
    tb = (TopicBean)request.getAttribute("tb"); // 通过Servlet服务器转发
    ReplyBeanAction rba = new ReplyBeanAction();
    int pageSize = 3;
    int currentPage = 1;
    if (request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    int replyCount = rba.getReplyCount(Id); //回复数
    int pageCount = replyCount / pageSize + 1; // 总页数
    if (replyCount % pageSize == 0) {
        pageCount--;
    }
    ArrayList al = rba.getReplyById(Id, pageSize, currentPage);


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.staticfile.org/bootstrap/5.0.0-alpha2/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
            }
            .content-container {
                display: flex;
                flex-direction: column;
                width: 70%;
                height: auto;
                margin: 0 auto;
                padding-bottom: 10px;
                /*background-color: rgb(134, 192, 243);*/
            }
            .return-box {
                width: 64px;
                height: 40px;
                margin: 5px;
                /*background-color: rgb(250, 250, 250);*/
                display: flex;
                flex-direction: row;
            }
            .return-box:hover{
                border: 1px solid #000;
                cursor: pointer;
                border-radius: 5px;
            }
            .title-box {
                width: auto;
                height: auto;
                margin: 10px;
                /*background-color: antiquewhite;*/
            }
            .user-box {
                width: auto;
                height: 30px;
                margin: 5px 10px;
                /*background-color: rgb(181, 143, 87);*/
                display: flex;
                flex-direction: row;
            }
            .content-box {
                width: auto;
                height: auto;
                margin: 10px;
                /*background-color: aqua;*/
                 /*border-bottom: 1px solid #c0a9a9;*/ 
            }
            .date-box{
                width: auto;
                height: auto;
                margin: 20px 10px;
                display: flex;
                justify-content: center;
                border-bottom: 1px solid #c0a9a9;
            }
            .reply-box{
                width: auto;
                height: auto;
                margin: 0px 10px;
                /*background-color: aqua;*/
            }
            .reply-date{
                width: auto;
                height: auto;
                margin: 0px 10px;
                display: flex;
                justify-content: end;
                border-bottom: 1px solid #c0a9a9;
            }
            .justReply-box{
                width: auto;
                height: 50px;
                margin: 0 10px;
                display: flex;
                flex-direction: row;
            }
        </style>
        
    </head>
    <body>
        <div class="headerInclude">
            <jsp:include flush="true" page="head.jsp"></jsp:include>
        </div>

        <div class="content-container">
            <div class="return-box" onclick="history.go(-1);">
                <svg
                    t="1653838813188"
                    class="return-icon"
                    viewBox="0 0 1024 1024"
                    version="1.1"
                    xmlns="http://www.w3.org/2000/svg"
                    p-id="4793"
                    width="30"
                    height="40"
                    >
                <path
                    d="M694.272 809.024l-295.808-286.848 295.36-274.752a32 32 0 0 0-43.616-46.848l-320 297.696a32 32 0 0 0-0.512 46.4l320 310.304a32.032 32.032 0 0 0 44.576-45.952"
                    p-id="4794"
                    fill="#8a8a8a"
                    ></path>
                </svg>
                <span
                    class="return-text"
                    style="display: block; line-height: 40px; color: #797272; font-size: 15px"
                >返回
                </span>
            </div>
            <div class="title-box">
                <h2 class="title-content"><%=tb.getTitle()%></h2>
            </div>
            <%
            if (tb != null) {
              String fileName = "UserFiles/Images/"+ tb.getUserName() + ".jpg";
            %>
            <div class="user-box">
                <img
                    src="<%=fileName%>"
                    alt=""
                    class="userImg"
                    style="width: 30px; height: 30px; border-radius: 50%;"
                    />
                <span
                    class="username"
                    style="
                    display: block;
                    line-height: 30px;
                    color: #797272;
                    margin-left: 10px;
                    "
                    >
                    <%= tb.getUserName()%>
                </span>
            </div>
            <div class="content-box"><%= tb.getContent()%></div>
            <div class="date-box">
                <span class="date" style="font-size: 16px;"><%= tb.getTopicDate()%></span>
            </div>
            
            <div class="justReply">
                <form action="ReplyServlet" method="post" id="replyForm">
                  <input type="hidden" name="Id" value="<%= tb.getId()%>" />
                  <div class="justReply-box">
                    <textarea id="content" name="replyContent"
                    style="
                      border: 1px solid #797272;
                      border-radius: 5px;
                      flex: 12;
                      resize: none;
                      font-family: 'Courier New', Courier, monospace;
                      font-size: 16px;
                      padding: 5px;
                      "></textarea>
                    <input type="submit" style="display: none" id="toSubmit"/>
                    <input type="button"
                      style="
                        display: block;
                        border: none;
                        flex: 1;
                        height: 50px;
                        font-size: 18px;
                        border-radius: 5px;
                        margin-left: 10px;
                        background-color: rgb(117, 186, 242);
                        color: white;
                      "
                      id="replyBtn"
                      onclick="submitFunc();"
                      value="回复" />
                  </div>
                </form>
            </div>

            <%
                }
                for (int i = 0; i < al.size(); i++) {
                    ReplyBean rb = (ReplyBean) al.get(i);
                    String fileName2 = "UserFiles/Images/" + rb.getUserName() + ".jpg";
            %>
            <div class="comment-box">
                <div class="user-box">
                    <img
                        src="<%=fileName2%>"
                        alt=""
                        class="userImg"
                        style="width: 30px; height: 30px; border-radius: 50%;"
                        />
                    <span
                        class="username"
                        style="
                        display: block;
                        line-height: 30px;
                        color: #797272;
                        margin-left: 10px;
                        "
                        >
                        <%= rb.getUserName()%>
                    </span>
                </div>
                <div class="reply-box">
                    <%= rb.getReplyContent()%>
                </div>
                <div class="reply-date">
                    <span class="date" style="font-size: 15px"><%= rb.getReplyDate()%></span>
                </div>
            </div>
            <% }%>
        </div>
        <div class="foot-nav" style="width: 70%; margin-left: 15%; margin-top: 20px;">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item">
                            <a class="page-link" href="ContentServlet?Id=<%= tb.getId()%>&currentPage=1">首页</a>
                        </li>
                        <%
                            if (currentPage > 1) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="ContentServlet?Id=<%= tb.getId()%>&currentPage=<%= currentPage - 1%>">上一页</a>
                        </li>
                        <% } %> 
                        <%
                            if (currentPage < pageCount & currentPage > 0) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="ContentServlet?Id=<%= tb.getId()%>&currentPage=<%= currentPage + 1%>">下一页</a>
                        </li>
                        <% } %> 
                    </ul>
                </nav>
            </div>
        </div>
        
        <script>
            function submitFunc(){
                var userName = '<%=session.getAttribute("userName")%>';
                console.log(userName);
                if(userName === "null"){
                    console.log("1haha");
                    bgBtn.classList.remove('hiddenBox');
                    loginBox.classList.remove('hiddenBox');
                    regBox.classList.remove('hiddenBox');
                } else {
                    console.log("1haha");
                    document.querySelector("#toSubmit").click();
                }
            };

        </script>

    </body>
</html>
