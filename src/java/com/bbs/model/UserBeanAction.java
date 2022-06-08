/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bbs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class UserBeanAction {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs;
    public boolean regUser(String userName, String password1,
            String sex, String email) {
        boolean flag = false;
        conn = ConnDB.getConnection();
        String sql = "insert into user(userName,password1,sex,email) values( ?, ?, ?, ?)"; 
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password1);
            ps.setString(3, sex);
            ps.setString(4, email);
            ps.executeUpdate();
            close();
            flag = true;
        } catch (SQLException ex) {
            Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    
    void close() {
        if(ps != null) {
            try {
                ps.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = null;
        }
        if(conn != null) {
            try {
                conn.close();
                conn = null;
            } catch (SQLException ex) {
                Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
            }       
        }
    }
    public boolean checkUser(String userName) {
        boolean flag = true;
        conn = ConnDB.getConnection();
        String sql = "select * from user where userName ='"  + userName + "'";
        System.out.println(sql);
        try {
            rs = conn.createStatement().executeQuery(sql);
            if (rs.next()) {
                flag = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        close();
        return flag;
    }
    
    public boolean login(String userName, String password) {
        boolean flag = false;
        try {
            conn = ConnDB.getConnection();
            String sql = "select * from user where userName=? and password1=?";
            System.out.println(sql);
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(rs.next())
                flag = true;
            close();
        } catch (SQLException ex) {
            Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    
    
}
