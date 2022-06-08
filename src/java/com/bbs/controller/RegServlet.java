/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bbs.controller;

import com.bbs.model.UserBeanAction;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class RegServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            // 文件上传
            SmartUpload mySmartUpload = new SmartUpload();
            mySmartUpload.initialize(this.getServletConfig(), request, response);
            mySmartUpload.setAllowedFilesList("jpg,gif,png,JPG,GIF,PNG");
            String root = getServletContext().getRealPath("/");
            String savePath = root + "\\UserFiles\\Images\\";
            System.out.println(savePath);
            java.io.File dir = new java.io.File(savePath);
            if(!dir.exists())
                dir.mkdirs();
            try {
                mySmartUpload.upload();
            } catch (SmartUploadException ex) {
                Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
            String userName = mySmartUpload.getRequest().getParameter("userName");
            String fileName = userName + ".jpg";
            try {
                myFile.saveAs(savePath+fileName, SmartUpload.SAVE_PHYSICAL);
            } catch (SmartUploadException ex) {
                Logger.getLogger(RegServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
//            用户密码，性别，邮箱
            String passWord1 = mySmartUpload.getRequest().getParameter("password1");
            String sex = mySmartUpload.getRequest().getParameter("sex");
            String email = mySmartUpload.getRequest().getParameter("email");
            String url = request.getHeader("Referer");
            UserBeanAction uba = new UserBeanAction();
            if(uba.checkUser(userName)){
                boolean flag = uba.regUser(userName, passWord1, sex, email);

                if (flag) {
                    out.println("<script>");
                    out.println("alert('注册成功，请前往登录');");
                    out.println("location.href='" + url + "';");
                    out.println("</script>");
                } else {
                    out.println("<script>");
                    out.println("alert('注册失败，请重新注册');");
                    out.println("location.href='" + url + "';");
                    out.println("</script>");
                }
            }else {
                out.println("<script>");
                out.println("alert('用户名已存在请重新输入');");
                out.println("location.href='" + url + "';");
                out.println("</script>");
            }
            
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
