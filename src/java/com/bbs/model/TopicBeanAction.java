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
public class TopicBeanAction {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
//    添加帖子
    public int addTopic(String userName, String title, String content){
        int lastId = 0;
        
        try {
            
            String sql = "insert into topic(author, title, content) values(?, ?, ?)";
            conn = ConnDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.executeUpdate();
            sql = "select last_insert_id()";
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()){
                lastId = rs.getInt(1);
            }
            ps = null;
            conn = null;       
            close();
        } catch (SQLException ex) {
            Logger.getLogger(UserBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lastId;
    }
    
//    按页码按最新还是热帖查询帖子
    public ArrayList getTopicByPageByIdString(int pageSize, int currentPage, String byId) {
        ArrayList al = new ArrayList();
       
        conn = ConnDB.getConnection();
        String sql = "select * from topic " + " order by " + byId + " DESC " + " limit " + pageSize * (currentPage - 1) + "," + pageSize ;
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }
    
//    按页码按类别按搜索内容查询帖子
    public ArrayList getTopicByPageByIdStringByKeyData(int pageSize, int currentPage, String byId, String keyData) {
        ArrayList al = new ArrayList();
       
        conn = ConnDB.getConnection();
        String sql = "select * from topic " + " where title like '%" + keyData + "%' or content like '%" +keyData+ "%' or author like '%" + keyData
                + "%'" + " order by " + byId + " DESC "+ " limit " + pageSize * (currentPage - 1) + "," + pageSize ;
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }
    
//    按作者查询所有帖子
    public ArrayList getTopicByPageByAuthor(int pageSize, int currentPage, String author) {
        ArrayList al = new ArrayList();
       
        conn = ConnDB.getConnection();
        String sql = "select * from topic where author = '" + author + "' limit " + pageSize * (currentPage - 1) + "," + pageSize ;
//        System.out.println(sql);
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }
    
//    按页码按用户的收藏查询帖子
    public ArrayList getTopicByPageByAuthorFavorite(int pageSize, int currentPage, String author) {
        ArrayList al = new ArrayList();
       
        conn = ConnDB.getConnection();
        String sql = "select * from topic where Id in ( select topicId from favorite where userName = '" + author + "' ) limit " + pageSize * (currentPage - 1) + "," + pageSize ;
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
//                System.out.println(rs.getString(2));
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }
    
//    查询用户点赞过的帖子
    public ArrayList getTopicByPageByAuthorApprove(int pageSize, int currentPage, String author) {
        ArrayList al = new ArrayList();
       
        conn = ConnDB.getConnection();
        String sql = "select * from topic where Id in ( select topicId from approve where userName = '" + author + "' ) limit " + pageSize * (currentPage - 1) + "," + pageSize ;
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
//                System.out.println(rs.getString(2));
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }
    
//    查询用户关注的作者的帖子
    public ArrayList getTopicByPageByAuthorFollow(int pageSize, int currentPage, String author) {
        ArrayList al = new ArrayList();
        
        conn = ConnDB.getConnection();
        String sql = "select * from topic where author in ( select authorName from follow where userName = '" + author + "' ) limit " + pageSize * (currentPage - 1) + "," + pageSize ;
        try {
            rs = conn.createStatement().executeQuery(sql);
            while(rs.next()) {
                TopicBean tb = new TopicBean();
                tb.setId(rs.getInt(1));
                tb.setTitle(rs.getString(2));
                tb.setContent(rs.getString(3));
                tb.setUserName(rs.getString(4));
                tb.setTopicDate(rs.getString(5));
                tb.setReplyCount(rs.getInt(6));
                al.add(tb);
//                System.out.println(rs.getString(2));
            } 
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return al;
    }

//    获取所有帖子数量
    public int getRowCount() {
        int rowCount = 0;
        String sql = "select count(*) from topic";
        conn = ConnDB.getConnection();
        try {
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
                rowCount = rs.getInt(1);
        }
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowCount;   
    }
    
    // 查询作者帖子数量
    public int getRowCountByAuthor(String author) {
        int rowCount = 0;
        String sql = "select count(*) from topic where author = '" + author + "'";
        conn = ConnDB.getConnection();
        try {
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
                rowCount = rs.getInt(1);
        }
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowCount;   
    }
//    获取用户收藏的帖子数
    public int getRowCountByAuthorFavorite(String author) {
        int rowCount = 0;
        String sql = "select count(*) from topic where Id in ( select topicId from favorite where userName = '" + author + "' )";
        conn = ConnDB.getConnection();
        try {
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
                rowCount = rs.getInt(1);
        }
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowCount;   
    }
    //    获取用户点赞的帖子数
    public int getRowCountByAuthorApprove(String author) {
        int rowCount = 0;
        String sql = "select count(*) from topic where Id in ( select topicId from approve where userName = '" + author + "' )";
        conn = ConnDB.getConnection();
        try {
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
                rowCount = rs.getInt(1);
        }
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowCount;   
    }
    
    //    获取用户关注的作者的所有帖子数
    public int getRowCountByAuthorFollow(String author) {
        int rowCount = 0;
        String sql = "select count(*) from topic where author in ( select authorName from follow where userName = '" + author + "' )";
        conn = ConnDB.getConnection();
        try {
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
                rowCount = rs.getInt(1);
        }
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rowCount;   
    }
//    获取文章根据文章ID
    public TopicBean getTopicById(String Id){
        TopicBean tb = new TopicBean();
        try {
            String sql = "select * from topic where Id =" + Id;
            conn = ConnDB.getConnection(); 
            rs = conn.createStatement().executeQuery(sql);
            if(rs.next()) {
               tb.setId(rs.getInt(1));
               tb.setTitle(rs.getString(2));
               tb.setContent(rs.getString(3));
               tb.setUserName(rs.getString(4));
               tb.setTopicDate(rs.getString(5));
               tb.setReplyCount(rs.getInt(6));
            }
            close();
        } catch (SQLException ex) {
            Logger.getLogger(TopicBeanAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tb;
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
