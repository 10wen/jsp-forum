/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bbs.model;

/**
 *
 * @author ASUS
 */
public class TopicBean {
    private int Id;
    private String userName;
    private String title;
    private String content;
    private String topicDate;
    private int replyCount;

    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the topicDate
     */
    public String getTopicDate() {
        return topicDate;
    }

    /**
     * @param topicDate the topicDate to set
     */
    public void setTopicDate(String topicDate) {
        this.topicDate = topicDate;
    }

    /**
     * @return the replyCount
     */
    public int getReplyCount() {
        return replyCount;
    }

    /**
     * @param replyCount the replyCount to set
     */
    public void setReplyCount(int replyCount) {
        this.replyCount = replyCount;
    }
}
