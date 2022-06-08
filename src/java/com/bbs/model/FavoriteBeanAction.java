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
public class FavoriteBeanAction {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public boolean addFavorite(String topicId, String userName){
        boolean flag = false;
        
        try {
            String sql = "insert into favorite(topicId, userName) values(?,?)";
            conn = ConnDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicId);
            ps.setString(2, userName);
            ps.executeUpdate();
            
            close();
            flag = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ReplyBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return flag;
    }
    
    public boolean delFavorite(String topicId, String userName){
        boolean flag = false;
        
        try {
            String sql = "delete from favorite where topicId='" + topicId + "' and userName='" + userName + "'";
            conn = ConnDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
//            sql = "update topic set replycount = replycount + 1 where Id = " + topicId;
//            conn.createStatement().execute(sql);
            close();
            flag = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ReplyBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return flag;
    }
    
    public ArrayList<String> initialFavorite(String userName){
//        String result = "[";
        ArrayList<String> result = new ArrayList<>();
        
        try{
            conn = ConnDB.getConnection();
            String sql = "select topicId from favorite where userName='" + userName + "'";
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()){
                result.add(rs.getString(1));
//                result += "\"";
//                result += rs.getString(1);
//                result += "\"";
//                if(rs.next())
//                    result += ",";
            }
            close();
        }catch (SQLException ex) {
            Logger.getLogger(ReplyBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
//        result += "]";
        return result;
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
}
