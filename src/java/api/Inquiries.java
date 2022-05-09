/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import database.*;
import model.Inquiry;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Matrix
 */
public class Inquiries {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Inquiry> get_client_questions(int user_id)throws SQLException{
        String sql="select * from inquiries where user_id="+user_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Inquiry>inquiries=new ArrayList<>();
        
        while(res.next()){
            Inquiry q=new Inquiry(res.getInt(Inquiry.INQUIRY_ID), res.getString(Inquiry.INQUIRY_TITLE), res.getString(Inquiry.ANSWER_TITLE), res.getBoolean(Inquiry.IS_ANSWERED), res.getInt(Inquiry.USER_ID));
            inquiries.add(q);
        }
        
        return inquiries;
    }
    
    public static List<Inquiry> get_all_questions()throws SQLException{
         String sql="select * from inquiries where is_answered="+false;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Inquiry>inquiries=new ArrayList<>();
        
        while(res.next()){
            Inquiry q=new Inquiry(res.getInt(Inquiry.INQUIRY_ID), res.getString(Inquiry.INQUIRY_TITLE), res.getString(Inquiry.ANSWER_TITLE), res.getBoolean(Inquiry.IS_ANSWERED), res.getInt(Inquiry.USER_ID));
            inquiries.add(q);
        }
        
        return inquiries;
    }
    
    public static void add(Inquiry q)throws SQLException{
            String sql=String.format("insert into inquiries(inquiry_title,user_id,is_answered)values('%s',%d,%b)",q.inquiry_title,q.user_id,false);
            db.execute(sql);
    }
    
    public static void update(Inquiry q)throws SQLException{
         String sql=String.format("update inquiries set answer_title='%s',is_answered=%b where inquiry_id=%d",q.answer_title,true,q.inquiry_id);
         db.execute(sql);
     }
    
    public static Inquiry get(int inquiry_id)throws SQLException{
        String sql="select * from inquiries where inquiry_id="+inquiry_id;
        
        ResultSet res=db.executeQuery(sql);
        
        Inquiry q=new Inquiry(0, "", "", false, 0);
        
        if(res.next()){
             q=new Inquiry(res.getInt(Inquiry.INQUIRY_ID), res.getString(Inquiry.INQUIRY_TITLE), res.getString(Inquiry.ANSWER_TITLE), res.getBoolean(Inquiry.IS_ANSWERED), res.getInt(Inquiry.USER_ID));
        }
        
        return q;
    }
}
