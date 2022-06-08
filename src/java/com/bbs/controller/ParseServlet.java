/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bbs.controller;

import com.bbs.model.ApproveBeanAction;
import com.bbs.model.FavoriteBeanAction;
import com.bbs.model.FollowBeanAction;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class ParseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        request.setCharacterEncoding("utf-8"); // =============弃用
        String userName = request.getParameter("userName");
//        System.out.println(userName.equals("null"));
        if(userName.equals("null")){
            try (PrintWriter out = response.getWriter()) {
                out.println("{ \"status\": \"0\", \"approveList\": [], \"favoriteList\": [] }");
                out.flush();
            }
        } else {
            StringBuffer sb = initialApproveFavorite(userName);
//            StringBuffer sb = new StringBuffer("");
//            sb.append("{");
//            sb.append("\"userName\":");
//            sb.append("\"kongdewen\"");
//            sb.append("}");
            System.out.println(sb);
            response.setContentType("text/html;charset=utf-8");
            try (PrintWriter out = response.getWriter()) {
                out.println(sb.toString());
                out.flush();
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        
        String dataType = request.getParameter("dataType");  // json
        String sendType = request.getParameter("sendType");  // post
        String flag = request.getParameter("flag"); // 取消点赞还是点赞
        String caseId = request.getParameter("caseId");  // case为1则是点赞，2收藏3关注
        String topicId = request.getParameter("topicId");  // 帖子ID
        String userName = request.getParameter("userName"); // 用户名
        String authorName = request.getParameter("authorName"); //关注的作者
//        System.out.println(flag +",topicId:"+ topicId);
        
        try (PrintWriter out = response.getWriter()) {
            if( !flag.equals("null")&& !caseId.equals("null") && (caseId.equals("1") || caseId.equals("2"))){
                if(!topicId.equals("null")&& !userName.equals("null")){
//                    System.out.println(userName);
                    switch (caseId){
                        case "1":
                            doApprove(flag, topicId, userName);
                            break;
                        case "2":
                            doFavorite(flag, topicId, userName);
                            break;
                        default: break;
                    }
                    out.println("1");
                } else out.println("0");
            }else if( !flag.equals("null")&& caseId.equals("3") && !authorName.equals("null")&& !userName.equals("null")  ){
                doFollow(flag, authorName, userName);
                out.println("1");
            } else out.println("0");
            out.flush();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void doApprove(String flag, String topicId, String userName) {
        ApproveBeanAction approve = new ApproveBeanAction();
        if(flag.equals("0"))
            approve.addApprove(topicId, userName);
        else
            approve.delApprove(topicId, userName);
    }

    private void doFavorite(String flag, String topicId, String userName) {
        FavoriteBeanAction favorite = new FavoriteBeanAction();
        if(flag.equals("0"))
            favorite.addFavorite(topicId, userName);
        else
            favorite.delFavorite(topicId, userName);
    }

    private void doFollow(String flag, String authorName, String userName) {
        FollowBeanAction follow = new FollowBeanAction();
        if(flag.equals("0"))
            follow.addFollow(authorName, userName);
        else 
            follow.delFollow(authorName, userName);
    }

    // 用于初始化用户点赞过收藏过的帖子的按钮样式
    private StringBuffer initialApproveFavorite(String userName) {
        StringBuffer sb = new StringBuffer("");
        ApproveBeanAction approve = new ApproveBeanAction();
        FavoriteBeanAction favorite = new FavoriteBeanAction();
//        
//        sb.append("{ \"status\": \"1\", \"approveList\":");
//        String approveList = approve.initialApprove(userName);
//        sb.append(approveList);
//        sb.append(" ,\"favoriteList\":");
//        String favoriteList = favorite.initialFavorite(userName);
//        sb.append(favoriteList);
//        sb.append("}");
        
        return sb;
    }

}
