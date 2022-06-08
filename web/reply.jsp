<%-- 
    Document   : reply
    Created on : 2022-5-6, 14:13:49
    Author     : ASUS
--%>
<%
    String userName = (String) request.getSession().getAttribute("userName");
    if (userName == null) {
%>
<script>
    alert("请先登录，前往登录！");
    location.href = 'login.jsp';
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
        <script>
            function check() {
                var content = document.getElementsById("content");
                System.out.println(content.value);
                if(content.value === null ){
                    alert("回复内容不能为空");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <table border="1" align="center" width="90%">
            <thead>
                <tr><td colspan="2"><jsp:include flush="true" page="head.jsp"></jsp:include></td></tr>
            </thead>
            <form action="ReplyServlet" method="post">
            <%
             String Id = request.getParameter("Id");
//             System.out.println(Id);
            %>
            <input type="hidden" name="Id" value="<%=Id%>" />
            <tbody>
                <tr>
                    <table width="90%" border="1" align="center">
                        <tr>
                            <td colspan="2" align="center">回复</td>
                        </tr>
                        <tr>
                            <td>内容</td>
                            <td><textarea rows="15" id="content" name="replyContent"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <label>
                                <input
                                    type="reset"
                                    name="submit"
                                    value="重置"
                                    />
                                </label>
                                <label>
                                    <input type="submit" name="submit2" value="提交" onclick="return check()"/>
                                </label>
                            </td>
                        </tr>
                    </table>
                </tr>
             </tbody>
             </form>
            <tfoot>
                <tr><td colspan="2"><jsp:include flush="true" page="foot.jsp"></jsp:include></td></tr>
            </tfoot>
        </table>
    </body>
</html>
