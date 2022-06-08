<%-- 
    Document   : profile
    Created on : 2022-5-30, 14:01:37
    Author     : ASUS
--%>

<%@page import="com.bbs.model.FollowBeanAction"%>
<%@page import="com.bbs.model.TopicBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.model.TopicBeanAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.staticfile.org/bootstrap/5.0.0-alpha2/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            .profile-container{

                width: 70%;
                height: 1000px;
                /* background-color: #c7c7ff; */
                margin: 0px auto;
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
            .user-box{
                display: flex;
                flex-direction: row;
                justify-content: center;
                margin: 0 auto;
                margin-bottom: 20px;
            }

            /* user-card */
            .card1 {
                width: 190px;
                height: 254px;
                display: flex;
                flex-direction: column;
                align-items: center;
                background: rgb(200, 255, 255);
                border-radius: 12px;
/*                box-shadow: inset 1px 1px 2px #a9a9aa77,
                    inset -1px -1px 2px #ffffff7e;*/
                margin-right: 20px;
                border: 1px solid aqua;
            }

            .card1 .img {
                height: 100px;
                margin-top: 1.6em;
                aspect-ratio: 1;
                border-radius: 20%;
                background: #f2f2f3;
                margin-bottom: 0.4em;
                box-shadow: -5px -5px 8px #ffffff7a,
                    5px 5px 8px #a9a9aa7a;
            }

            .card1 .info {
                text-align: center;
                margin-top: 0.4em;
                background: linear-gradient(120deg, rgba(0,194,255,1) 0%, rgba(0,86,255,1) 100%);
                background-clip: border-box;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            .card1 .info > span {
                font-weight: bold;
                font-size: 1em;
            }

            .card1 a {
                margin-top: 1em;
                color: #fff;
                text-decoration: none;
                background: linear-gradient(90deg, rgba(0,194,255,1) 0%, rgba(0,86,255,1) 100%);
                padding: .25em 1em;
                border-radius: 0.7em;
            }

            .card1 a:active {
                box-shadow: inset 3px 3px 3px #0056ff,
                    inset -3px -3px 3px #00c2ff;
            }

            /* info-card */
            .card2 {
                width: 190px;
                height: 254px;
                color: white;
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-template-rows: 1fr 1fr;
                gap: 5px;
                overflow: visible;
                margin-left: 20px;
            }

            .card2 .item {
                border-radius: 10px;
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            .item:hover {
                transform: scale(0.95);
                transition: all 0.3s;
            }

            .item svg {
                width: 40px;
                height: 40px;
                margin-bottom: 7px;
            }

            .item--1 {
                background: #c7c7ff;
            }

            .item--2 {
                background: #ffd8be;
            }

            .item--3 {
                background: #a9ecbf;
            }

            .item--4 {
                background: #f3bbe1;
            }

            .quantity {
                font-size: 25px;
                font-weight: 600;
            }

            .text {
                font-size: 12px;
                font-family: inherit;
                font-weight: 600;
            }

            .text--1 {
                color: rgba(149, 149, 255, 1);
            }

            .text--2 {
                color: rgba(252, 161, 71, 1);
            }

            .text--3 {
                color: rgba(66, 193, 110, 1);
            }

            .text--4 {
                color: rgba(220, 91, 183, 1);
            }
            
            /*文章列表*/
            .content {
                width: 100%;
                height: auto;
                margin-top: 10px;
                /*background-color: #9e9ea7;*/
                
            }
            .topic-box {
                width: 100%;
                height: 150px;
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
                padding: 5px 10px;
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
                /*padding-top: 15px;*/
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
//        获取保持登录状态的用户
        String author = (String)session.getAttribute("userName");
//        获取地址参数的用户
        if(request.getParameter("userName") != null){
            author = request.getParameter("userName");
        }
        
//        分类为1查询作者发布的文章，234查询用户收藏点赞还有关注的作者的文章
        String caseId = "1";
        ArrayList al= tba.getTopicByPageByAuthor(pageSize, currentPage, author);
        int pageCount = tba.getRowCountByAuthor(author) / pageSize + 1;
        
        if(request.getParameter("caseId") != null) {
            caseId = request.getParameter("caseId");
        }
        if(caseId.equals("2")){
            al = tba.getTopicByPageByAuthorFavorite(pageSize, currentPage, author);
            pageCount = tba.getRowCountByAuthorFavorite(author) / pageSize + 1;
        }else if(caseId.equals("3")) {
            al = tba.getTopicByPageByAuthorApprove(pageSize, currentPage, author);
            pageCount = tba.getRowCountByAuthorApprove(author) / pageSize + 1;
        }else if(caseId.equals("4")) {
            al = tba.getTopicByPageByAuthorFollow(pageSize, currentPage, author);
            pageCount = tba.getRowCountByAuthorFollow(author) / pageSize + 1;
        }
 
        if (pageCount % pageSize == 0) {
            pageCount--;
        }
        
//        保持用户关注的作者
        String userName = (String)session.getAttribute("userName");
        FollowBeanAction follow = new FollowBeanAction();
        ArrayList<String> followList = new ArrayList();
        if(userName != null){
            followList = follow.initialFollow(userName);
        }
    %>
    <body>
        <div class="headerInclude">
            <jsp:include flush="true" page="head.jsp"></jsp:include>
        </div>
        
        <div class="profile-container">
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
            <div class="user-box">
                <div class="user-card">
                    <div class="card1">
                        <div class="img">
                            <img src="UserFiles/Images/<%=author%>.jpg" alt="" style="width: 100px; height: 100px; border-radius: 20%;"/>
                        </div>
                        <div class="info">
                            <span><%=author%></span>
                            <!--<p>Web Dev</p>-->
                        </div>
                        <%
                            String user = (String)session.getAttribute("userName");
                            if(user != null && !user.equals(author)){
                        %>
                        <div style="margin-top: 10px;" class="followBtn" data-case-id="3" data-flag="<%= followList.contains(author)? '1':'0'%>" data-author-name="<%=author%>">
                            <a href="#" class="afollow" 
                               style="
                               font-size: 16px;
                               color: <%= followList.contains(author)? "gray":"white"%>;
                               "
                               >
                                <%= followList.contains(author)? "unfollow":"follow"%>
                            </a> 
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="info-card">
                    <div class="card2">
                        <div class="item item--1">
                            <svg
                                height="24"
                                width="24"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path d="M0 0h24v24H0z" fill="none"></path>
                            <path
                                fill="rgba(149,149,255,1)"
                                d="M17 15.245v6.872a.5.5 0 0 1-.757.429L12 20l-4.243 2.546a.5.5 0 0 1-.757-.43v-6.87a8 8 0 1 1 10 0zm-8 1.173v3.05l3-1.8 3 1.8v-3.05A7.978 7.978 0 0 1 12 17a7.978 7.978 0 0 1-3-.582zM12 15a6 6 0 1 0 0-12 6 6 0 0 0 0 12z"
                                ></path>
                            </svg>
                            <span class="quantity"> 90+ </span>
                            <span class="text text--1"> Icons </span>
                        </div>
                        <div class="item item--2">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                width="24"
                                height="24"
                                >
                            <path fill="none" d="M0 0L24 0 24 24 0 24z"></path>
                            <path
                                d="M16 16c1.657 0 3 1.343 3 3s-1.343 3-3 3-3-1.343-3-3 1.343-3 3-3zM6 12c2.21 0 4 1.79 4 4s-1.79 4-4 4-4-1.79-4-4 1.79-4 4-4zm10 6c-.552 0-1 .448-1 1s.448 1 1 1 1-.448 1-1-.448-1-1-1zM6 14c-1.105 0-2 .895-2 2s.895 2 2 2 2-.895 2-2-.895-2-2-2zm8.5-12C17.538 2 20 4.462 20 7.5S17.538 13 14.5 13 9 10.538 9 7.5 11.462 2 14.5 2zm0 2C12.567 4 11 5.567 11 7.5s1.567 3.5 3.5 3.5S18 9.433 18 7.5 16.433 4 14.5 4z"
                                fill="rgba(252,161,71,1)"
                                ></path>
                            </svg>
                            <span class="quantity"> 70+ </span>
                            <span class="text text--2"> Illustrations </span>
                        </div>
                        <div class="item item--3">
                            <svg
                                height="24"
                                width="24"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path d="M0 0h24v24H0z" fill="none"></path>
                            <path
                                fill="rgba(66,193,110,1)"
                                d="M20.083 15.2l1.202.721a.5.5 0 0 1 0 .858l-8.77 5.262a1 1 0 0 1-1.03 0l-8.77-5.262a.5.5 0 0 1 0-.858l1.202-.721L12 20.05l8.083-4.85zm0-4.7l1.202.721a.5.5 0 0 1 0 .858L12 17.65l-9.285-5.571a.5.5 0 0 1 0-.858l1.202-.721L12 15.35l8.083-4.85zm-7.569-9.191l8.771 5.262a.5.5 0 0 1 0 .858L12 13 2.715 7.429a.5.5 0 0 1 0-.858l8.77-5.262a1 1 0 0 1 1.03 0zM12 3.332L5.887 7 12 10.668 18.113 7 12 3.332z"
                                ></path>
                            </svg>
                            <span class="quantity"> 150+ </span>
                            <span class="text text--3"> Components </span>
                        </div>
                        <div class="item item--4">
                            <svg
                                height="24"
                                width="24"
                                viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg"
                                >
                            <path d="M0 0h24v24H0z" fill="none"></path>
                            <path
                                fill="rgba(220,91,183,1)"
                                d="M12 20h8v2h-8C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10a9.956 9.956 0 0 1-2 6h-2.708A8 8 0 1 0 12 20zm0-10a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm-4 4a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm8 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm-4 4a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"
                                ></path>
                            </svg>
                            <span class="quantity"> 30+ </span>
                            <span class="text text--4"> Animations </span>
                        </div>
                    </div>
                </div>
            </div>

            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button
                        class="nav-link"
                        id="nav-home-tab"
                        data-bs-toggle="tab"
                        data-bs-target="#nav-home"
                        type="button"
                        role="tab"
                        aria-controls="nav-home"
                        aria-selected="true"
                        >
                        Public
                    </button>
                    <button
                        class="nav-link"
                        id="nav-profile-tab"
                        data-bs-toggle="tab"
                        data-bs-target="#nav-profile"
                        type="button"
                        role="tab"
                        aria-controls="nav-profile"
                        aria-selected="false"
                        >
                        Favorite
                    </button>
                    <button
                        class="nav-link"
                        id="nav-contact-tab"
                        data-bs-toggle="tab"
                        data-bs-target="#nav-contact"
                        type="button"
                        role="tab"
                        aria-controls="nav-contact"
                        aria-selected="false"
                        >
                        Approve
                    </button>
                    <button
                        class="nav-link"
                        id="nav-disabled-tab"
                        data-bs-toggle="tab"
                        data-bs-target="#nav-disabled"
                        type="button"
                        role="tab"
                        aria-controls="nav-disabled"
                        aria-selected="false"
                        >
                        Follow
                    </button>
                </div>
            </nav>
            <div class="content">
                <%  
                    for (int i = 0; i < al.size(); i++) {
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
                    <div class="image-box">
                        <img src="<%=fileName%>" alt="" srcset="" style="width: 40px; height: 40px; border-radius: 50%;" />
                    </div>
                    <div class="name-box">
                        <span><%= tb.getUserName()%></span>
                    </div>
                    <div class="button-box">
                        <div class="approveBtn">
                            <svg
                                t="1653108577169"
                                class="svg-icon"
                                viewBox="0 0 1024 1024"
                                version="1.1"
                                xmlns="http://www.w3.org/2000/svg"
                                p-id="5739"
                                width="128"
                                height="128"
                                >
                            <path
                                d="M840.88 330H631.67c-11.17 0-19.3-10.6-16.41-21.38l23.16-86.43c14.45-53.93-17.55-109.36-71.48-123.81A98.616 98.616 0 0 0 541.36 95c-43.88 0-84.3 29.38-96.17 73.66l-19.8 73.88C411.57 294.12 364.82 330 311.41 330H150c-17.67 0-32 14.33-32 32v448c0 17.67 14.33 32 32 32h618.88c30.8 0 57.23-21.94 62.9-52.21l72-384c7.39-39.38-22.82-75.79-62.9-75.79zM182 394h93.63L248.2 778H182V394z m586.88 384H312.37l27.6-386.39c69.97-11.15 128.47-62.44 147.25-132.51l19.8-73.88c4.07-15.2 18.52-26.22 34.35-26.22 3.01 0 6.04 0.4 9.01 1.2 19.76 5.29 31.52 25.68 26.23 45.43l-23.16 86.43c-6.57 24.52-1.47 50.13 13.98 70.26 15.45 20.14 38.87 31.69 64.25 31.69h209.21L768.88 778z"
                                p-id="5740"
                                ></path>
                            </svg>
                            <span>点赞</span>
                        </div>
                        <div class="favoriteBtn">
                            <svg
                                t="1653111064285"
                                class="svg-icon"
                                viewBox="0 0 1024 1024"
                                version="1.1"
                                xmlns="http://www.w3.org/2000/svg"
                                p-id="6926"
                                width="128"
                                height="128"
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
                            <a class="page-link" href="ProfileServlet?currentPage=1&userName=<%=author%>&caseId=<%=caseId%>">首页</a>
                        </li>
                        <%
                            if (currentPage > 1) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="ProfileServlet?currentPage=<%= currentPage - 1%>&userName=<%=author%>&caseId=<%=caseId%>">上一页</a>
                        </li>
                        <% } %> 
                        <%
                            if (currentPage < pageCount & currentPage > 0) {
                        %>
                        <li class="page-item">
                            <a class="page-link" href="ProfileServlet?currentPage=<%= currentPage + 1%>&userName=<%=author%>&caseId=<%=caseId%>">下一页</a>
                        </li>
                        <% } %> 
                    </ul>
                </nav>
            </div>
        </div>
        <script type="text/javascript" src="https://cdn.staticfile.org/jquery/3.6.0/jquery.js" ></script>
        <script>
            
            var userName = '<%=session.getAttribute("userName")%>';
            var followBtn = document.querySelector('.followBtn');
            
//            关注
            followBtn.onclick = function(){
                if(userName === "null"){
                    toLogin();
                    return;
                }
                let data = {};
                //如果flag为0则关注，否则取消关注
                data.flag = this.dataset.flag;
                //case为1则是点赞，2收藏3关注
                data.caseId = this.dataset.caseId;;
                data.authorName = this.dataset.authorName;
                data.userName = userName;
                console.log(data);
                doPostAjax(data, this);
            }
            
            
//            绑定点击事件
            var navList = document.getElementsByClassName('nav-link');
            let caseId = "<%=caseId%>";
            navList[caseId - 1].classList.add('active');
            for (let i = 0; i < 4; i++){
                navList[i].onclick = function(){
                    location.href = "ProfileServlet?userName=<%=author%>&caseId=" + (i+1);
                };
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
                                node.children[0].innerText = "unfollow";
                                node.children[0].style.color = "gray";
                            }else {
                                node.dataset.flag = "0";
                                node.children[0].innerText = "follow";
                                node.children[0].style.color = "white";
                            }
                        }
                    }
                });
            }

            //   用户先登录才能点赞和收藏，关注
            function toLogin(){
                if(userName === "null"){
                    bgBtn.classList.remove('hiddenBox');
                    loginBox.classList.remove('hiddenBox');
                    regBox.classList.remove('hiddenBox');
                }
            };
            
            
        </script>
<!--        <script src="https://cdn.staticfile.org/bootstrap/5.0.0-alpha2/js/bootstrap.js"></script>-->
    </body>
</html>
