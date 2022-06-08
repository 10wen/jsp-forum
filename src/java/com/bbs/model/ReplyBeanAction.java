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
public class ReplyBeanAction {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public boolean addReply( String topicId, String userName, String replyContent){
        boolean flag = false;
        try {
            String sql = "insert into reply(topicId, userName, replyContent) values(?,?,?)";
            conn = ConnDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicId);
            ps.setString(2, userName);
            ps.setString(3, replyContent);
            ps.executeUpdate();
            sql = "update topic set replycount = replycount + 1 where Id = " + topicId;
            conn.createStatement().execute(sql);
            close();
            flag = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(ReplyBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return flag;
    }
    
    public ArrayList getReplyById(String Id, int pageSize, int currentPage) {
        ArrayList al = new ArrayList();
        
        try {
            String sql = "select * from reply where topicId=" + Id
                + " limit " + pageSize * (currentPage-1) + "," + pageSize;
            conn = ConnDB.getConnection();
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                ReplyBean rb = new ReplyBean();
                rb.setReplyId(rs.getInt(1)+"");
                rb.setTopicId(rs.getInt(2)+"");
                rb.setUserName(rs.getString(3));
                rb.setReplyContent(rs.getString(4));
                rb.setReplyDate(rs.getString(5));
                al.add(rb);
            }
            close();
        } catch (SQLException ex) {
            Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public int getReplyCount(String topicId){
        int replyCount = 0;
        try {
            String sql = "select count(*) from reply where topicId=" + topicId;
            conn = ConnDB.getConnection();
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()){
                replyCount = rs.getInt(1);
            }
            close();
        } catch (SQLException ex) {
            Logger.getLogger(ReplyBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return replyCount;
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
