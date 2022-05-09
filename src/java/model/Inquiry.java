/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Matrix
 */
public class Inquiry {
    public int inquiry_id;
    public String inquiry_title;
    public String answer_title;
    public boolean is_answered;
    public int user_id;
    
    public static final String INQUIRY_ID="inquiry_id";
    public static final String INQUIRY_TITLE="inquiry_title";
    public static final String ANSWER_TITLE="answer_title";
    public static final String IS_ANSWERED="is_answered";
    public static final String USER_ID="user_id";

    public Inquiry(int question_id, String inquiry_title, String answer_title, boolean is_answered,int user_id) {
        this.inquiry_id = question_id;
        this.inquiry_title = inquiry_title;
        this.answer_title = answer_title;
        this.is_answered = is_answered;
        this.user_id = user_id;
    }
    
    
}
