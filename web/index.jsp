<%-- 
    Document   : index.jsp
    Created on : 2022-4-12, 11:10:03
    Author     : ASUS
--%>

<%@page import="com.bbs.model.FavoriteBeanAction"%>
<%@page import="com.bbs.model.ApproveBeanAction"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>首页</title>
<!--        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>-->
        <link href="https://cdn.staticfile.org/bootstrap/5.0.0-alpha2/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            .container {
                width: 70%;
                height: auto;
                margin: auto;
                /* background-color: aliceblue; */
                padding-bottom: 20px;
            }

            /* 头部nav栏 */
            .navClass{
                position: relative;
            }
            
            .search-box {
                display: flex;
                line-height: 28px;
                align-items: center;
                position: relative;
                max-width: 190px;
                position: absolute;
                left: 40%;
                top: 5px;
                
            }

            .search {
                width: 100%;
                height: 40px;
                line-height: 28px;
                padding: 0 1rem;
                padding-left: 2.5rem;
                border: 2px solid transparent;
                border-radius: 8px;
                outline: none;
                background-color: #f3f3f4;
                color: #0d0c22;
                transition: 0.3s ease;
            }

            .search::placeholder {
                color: #9e9ea7;
            }

            .search:focus,
            search:hover {
                outline: none;
                border-color: rgba(234, 76, 137, 0.4);
                background-color: #fff;
                box-shadow: 0 0 0 1px rgb(234 76 137 / 10%);
            }

            .icon {
                position: absolute;
                left: 1rem;
                fill: #9e9ea7;
                width: 1rem;
                height: 1rem;
            }

            /* 文章盒子 */
            .content {
                width: 100%;
                height: auto;
                margin-top: 10px;
                /*background-color: #9e9ea7;*/
                
            }
            .topic-box {
                width: 100%;
                height: 140px;
                /*background-color: #fff;*/
                
            }
            .title-box {
                width: 100%;
                height: 50px;
                /*background-color: antiquewhite;*/
                padding: 5px 10px;
            }
            .title-box a{
                text-decoration: none;
                font-size: 18px;
            }
            .content-box {
                width: 100%;
                height: 100px;
                /*background-color: #9e9ea7;*/
                font-size: 16px;
                padding: 0px 10px;
            }
            .bottom-box {
                display: flex;
                flex-direction: row;
                width: 100%;
                height: 50px;
                /*background-color: #f3f3f4;*/
                border-bottom: 1px solid #dee2e6;
            }

            .image-box {
                width: 40px;
                height: 40px;
                background-color: #7474a7;
                margin: 5px 5px 5px 20px;
                border-radius: 50%;
            }
            .name-box{
                width: 150px;
                height: 50px;
            }
            .name-box span{
                /*width: 100px;*/
                display: block;
                width: 150px;
                height: 50px;
                overflow: hidden;
                line-height: 50px;
                font-size: 17px;
            }

            .button-box {
                float: left;
                display: flex;
                left: 50px;
                width: auto;
                height: 50px;
            }
            .button-box div {
                display: inline-flex;
                width: 90px;
                height: 50px;
                justify-content: center;
                /*padding-top: 15px;*/
            }
            .button-box .buttonList:hover{
                cursor: pointer;
                background-color: #dfffff;
                border-radius: 10%;
            }
            .button-box div .svg-icon {
                width: 20px;
                height: 20px;
                margin-top: 15px;
                
            }
            .button-box div span {
                margin-left: 5px;
                font-size: 15px;
                line-height: 50px;
            }

            .date-box {
                width: auto;
                height: 50px;
                float: left;
                margin-left: 30px;
            }
            .date-box span {
                line-height: 50px;
                font-size: 16px;
            }

            /* 换页 */
            .foot-nav{
                width: 70%;
                height: 100px;
                margin: 20px auto;
                
            }
        </style>
        

    </head>
    <%
        TopicBeanAction tba = new TopicBeanAction();
        int pageSize = 3;
        int currentPage = 1;
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
//        按最新时间id=1还有回复数多的热帖id=2
        int byId = 1;
        String idString = "pubdate";
        if(request.getParameter("byId") != null){
            byId = Integer.parseInt(request.getParameter("byId"));
        }
        if (byId == 2) idString = "replycount";
        
//        按搜索查询文章
        String keyData = "";
        if(request.getParameter("keyData") != null){
            keyData = request.getParameter("keyData");
        }
//        按页数按最新还是热帖分类按搜索内容去查询
        ArrayList al= tba.getTopicByPageByIdStringByKeyData(pageSize, currentPage, idString, keyData);

        int pageCount = tba.getRowCount() / pageSize + 1;
        if (tba.getRowCount() % pageSize == 0) {
            pageCount--;
        }
        
//        初始化已经点赞和收藏的帖子的按钮状态
        String userName = (String)session.getAttribute("userName");
        ApproveBeanAction approve = new ApproveBeanAction();
        FavoriteBeanAction favorite = new FavoriteBeanAction();
        ArrayList<String> approveList = new ArrayList();
        ArrayList<String> favoriteList = new ArrayList();
        if(userName != null){
            approveList = approve.initialApprove(userName);
            favoriteList = favorite.initialFavorite(userName);
        }
//        System.out.println(approveList);
//        System.out.println(favoriteList);
    %>
    <body>
        <div class="headerInclude">
            <jsp:include flush="true" page="head.jsp"></jsp:include>
        </div>

        <div class="container">
            <div class="nav-header navClass">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" id="nav1" aria-current="page" href="/WebApp01/index.jsp?byId=1&keyData=<%=keyData%>">最新</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="nav2" href="/WebApp01/index.jsp?byId=2&keyData=<%=keyData%>">热帖</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">推荐</a>
                    </li>
                    <!--<li class="nav-item">-->
                        <div class="search-box">
                            <svg class="icon" aria-hidden="true" viewBox="0 0 24 24">
                            <g>
                            <path
                                d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"
                                ></path>
                            </g>
                            </svg>
                            <input placeholder="Search" type="search" class="search" />
                        </div>
                    <!--</li>-->

                </ul>
            </div>

            <div class="content">
                <%  for (int i = 0; i < al.size(); i++) {
                    TopicBean tb = (TopicBean) al.get(i);
                %>
                <div class="topic-box">
                    <div class="title-box">
                        <a href="ContentServlet?Id=<%= tb.getId()%>" rel="noopener noreferrer"><%= tb.getTitle()%></a>
                    </div>
                    <div class="content-box"><%= tb.getContent()%></div>
                </div>
                <div class="bottom-box">
                    <%
                        String fileName = "UserFiles/Images/" + tb.getUserName() + ".jpg";
                    %>
                    <div class="image-box" onclick="location.href = 'ProfileServlet?userName=<%=tb.getUserName()%>';">
                        <img src="<%=fileName%>" alt="" srcset="" style="width: 40px; height: 40px; border-radius: 50%; cursor: pointer;" />
                    </div>
                    <div class="name-box">
                        <span><%= tb.getUserName()%></span>
                    </div>
                    <div class="button-box">
                        <div class="buttonList approveBtn" data-topic-id="<%= tb.getId()%>" data-flag="<%= approveList.contains(""+tb.getId())? '1':'0'%>" data-case-id="1" onclick="doApprove()">
                            <svg
                                t="1653108577169"
                                id="approveIcon"
                                class="svg-icon"
                                viewBox="0 0 1024 1024"
                                version="1.1"
                                xmlns="http://www.w3.org/2000/svg"
                                p-id="5739"
                                width="128"
                                height="128"
                                style="background-color: <%= approveList.contains(""+tb.getId())? "red":""%>"
                                >
                            <path
                                d="M840.88 330H631.67c-11.17 0-19.3-10.6-16.41-21.38l23.16-86.43c14.45-53.93-17.55-109.36-71.48-123.81A98.616 98.616 0 0 0 541.36 95c-43.88 0-84.3 29.38-96.17 73.66l-19.8 73.88C411.57 294.12 364.82 330 311.41 330H150c-17.67 0-32 14.33-32 32v448c0 17.67 14.33 32 32 32h618.88c30.8 0 57.23-21.94 62.9-52.21l72-384c7.39-39.38-22.82-75.79-62.9-75.79zM182 394h93.63L248.2 778H182V394z m586.88 384H312.37l27.6-386.39c69.97-11.15 128.47-62.44 147.25-132.51l19.8-73.88c4.07-15.2 18.52-26.22 34.35-26.22 3.01 0 6.04 0.4 9.01 1.2 19.76 5.29 31.52 25.68 26.23 45.43l-23.16 86.43c-6.57 24.52-1.47 50.13 13.98 70.26 15.45 20.14 38.87 31.69 64.25 31.69h209.21L768.88 778z"
                                p-id="5740"
                                ></path>
                            </svg>
                            <span>点赞</span>
                        </div>
                        <div class="buttonList favoriteBtn" data-topic-id="<%= tb.getId()%>" data-flag="<%= favoriteList.contains(""+tb.getId())? '1':'0'%>" data-case-id="2" onclick="doFavorite()">
                            <svg
                                t="1653111064285"
                                id="favoriteIcon"
                                class="svg-icon"
                                viewBox="0 0 1024 1024"
                                version="1.1"
                                xmlns="http://www.w3.org/2000/svg"
                                p-id="6926"
                                width="128"
                                height="128"
                                style="background-color: <%= favoriteList.contains(""+tb.getId())? "red":""%>"
                                >
                            <path
                                d="M512 167.6l98.2 203 12.9 26.7 29.3 4.3 221.8 32.9L712.9 595l-20.5 20.4 4.8 28.6L735 869.1 538.5 763.6 512 749.4l-26.5 14.2L289 869.1 326.8 644l4.8-28.6-20.5-20.4-161.3-160.5 221.8-32.9 29.3-4.3 12.9-26.7 98.2-203m0-91.9c-10.2 0-20.4 5.4-25.6 16.3l-123 254.2L88.5 387c-23.4 3.5-32.8 32.9-15.8 49.8l198.9 197.9-47 279.5c-3.2 18.9 11.5 34.2 28.2 34.2 4.4 0 8.9-1.1 13.3-3.4L512 812.9l245.9 131.9c4.4 2.3 8.9 3.4 13.3 3.4 16.7 0 31.3-15.3 28.2-34.2l-47-279.5 198.9-197.9c17-16.9 7.6-46.3-15.8-49.8L660.6 346l-123-254c-5.2-10.9-15.4-16.3-25.6-16.3z"
                                p-id="6927"
                                ></path>
                            </svg>
                            <span>收藏</span>
                        </div>
                        <div class="replyBtn">
                            <svg
                                t="1653119679028"
                                class="svg-icon"
                                viewBox="0 0 1024 1024"
                                version="1.1"
                                xmlns="http://www.w3.org/2000/svg"
                                p-id="3297"
                                width="128"
                                height="128"
                                >
                            <path
                                d="M511.3 925.8L408.8 758.7H192.2c-64.5 0-117-52.5-117-117V215.2c0-64.5 52.5-117 117-117h639.7c64.5 0 117 52.5 117 117v426.4c0 64.5-52.5 117-117 117H621.4L511.3 925.8zM192.2 145.7c-38.3 0-69.5 31.2-69.5 69.5v426.4c0 38.4 31.2 69.6 69.5 69.6h243.1l77.4 126.1 83.1-126.1h236c38.3 0 69.5-31.2 69.5-69.6V215.2c0-38.3-31.2-69.5-69.5-69.5H192.2z"
                                fill="#333333"
                                p-id="3298"
                                ></path>
                            <path
                                d="M292.1 435.1m-60 0a60 60 0 1 0 120 0 60 60 0 1 0-120 0Z"
                                fill="#333333"
                                p-id="3299"
                                ></path>
                            <path
                                d="M512 435.1m-60 0a60 60 0 1 0 120 0 60 60 0 1 0-120 0Z"
                                fill="#333333"
                                p-id="3300"
                                ></path>
                            <path
                                d="M731.9 435.1m-60 0a60 60 0 1 0 120 0 60 60 0 1 0-120 0Z"
                                fill="#333333"
                                p-id="3301"
                                ></path>
                            </svg>
                            <span>回复: <%= tb.getReplyCount()%></span>
                        </div>
                    </div>
                    <div class="date-box">
                        <span><%= tb.getTopicDate()%></span>
                    </div>
                </div>
                <% } %> 
            </div>

            <div class="foot-nav">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?currentPage=1&byId=<%=byId%>&keyData=<%=keyData%>">首页</a>
                        </li>
                        <%
                            if (currentPage > 1) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?currentPage=<%= currentPage - 1%>&byId=<%=byId%>&keyData=<%=keyData%>">上一页</a>
                        </li>
                        <% } %> 
                        <%
                            if (currentPage < pageCount & currentPage > 0) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="index.jsp?currentPage=<%= currentPage + 1%>&byId=<%=byId%>&keyData=<%=keyData%>">下一页</a>
                        </li>
                        <% } %> 
                    </ul>
                </nav>
            </div>
        </div>
                    
        <script type="text/javascript" src="https://cdn.staticfile.org/jquery/3.6.0/jquery.js" ></script>
                    
        <script>
            window.onload = function(){
            
            var navList = document.getElementsByClassName('nav-link');
            var byId = "<%=byId%>";
            navList[byId - 1].classList.add('active');
//            搜索按钮事件监听
            var search =document.querySelector('.search');
            search.onkeypress = function(){
                if(event.which === 13){
                    var keyData = this.value.replace(/\s*/g,"");
                    location.href='/WebApp01/index.jsp?keyData=' + keyData;
                }
            };
            
            var userName = '<%=session.getAttribute("userName")%>';
            var buttonList = document.querySelectorAll('.buttonList');
            
            // 初始化用户是否已经点赞或者收藏
            // 根据用户名查询用户点赞过收藏过的帖子
//            doInitApproveFavorite();
//            function doInitApproveFavorite(){
//                $.ajax({
//                    type: "get",
//                    url: "${pageContext.request.contextPath}/ParseServlet?sendType=get&userName=" + userName,
////                    data: data,
//                    dataType: "json",
//                    success:function(result){   
//                        console.log(result);
//                        if(result.status === '1'){
//                            for(let i=0; i<buttonList.length; i++){
//                                if(result.approveList.indexOf(buttonList[i].dataset.topicId) > -1 || result.favoriteList.indexOf(buttonList[i].dataset.topicId) > -1){
//                                    buttonList[i].dataset.flag = "1";
//                                    buttonList[i].children[0].style.backgroundColor = "red";
//                                }       
//                            }
//                        }
//                    }
//                });
//            }
            
            //点赞收藏功能
            for(let i=0; i<buttonList.length; i++){
                buttonList[i].onclick = function(){
                    if(userName === "null"){
                        toLogin();
                        return;
                    }
                    let data = {};
                    //如果flag为0则点赞，否则取消点赞
                    data.flag = this.dataset.flag;
                    //case为1则是点赞，2收藏3关注
                    data.caseId = this.dataset.caseId;
                    data.topicId = this.dataset.topicId;
                    data.userName = userName;
                    console.log(data);
                    doPostAjax(data, this);
                }
            }
           
            
            
//            ajax请求函数
            function doPostAjax(data, node){
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/ParseServlet?sendType=post&dataType=json",
                    data: data,
                    dataType: "json",
                    success:function(status){   
//                        console.log(status);
                        if(status !== undefined && status !== null){
                            console.log(status + ":成功");
                            if(node.dataset.flag === "0" ){
                                node.dataset.flag = "1";
                                node.children[0].style.backgroundColor = "red";
                            }else {
                                node.dataset.flag = "0";
                                node.children[0].style.backgroundColor = "";
                            }
                        }
                    }
                });
            }

//            用户先登录才能点赞和收藏
            function toLogin(){
                var userName = '<%=session.getAttribute("userName")%>';
                if(userName === "null"){
                    bgBtn.classList.remove('hiddenBox');
                    loginBox.classList.remove('hiddenBox');
                    regBox.classList.remove('hiddenBox');
                }
            };
            }
        </script>
    </body>
</html>