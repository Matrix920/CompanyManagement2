/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import database.DBConnection;
import model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Matrix
 */
public class Users {
    private static Statement db=DBConnection.getConnection();
    
    public static User login(String username,String password)throws SQLException{
        String sql=String.format("select * from users where username='%s' AND password='%s'", username,password);
        
        ResultSet r=db.executeQuery(sql);
        User user=new User(0, "", "", 0);
        if(r.next()){
           user=new User(r.getInt(User.USER_ID), r.getString(User.USERNAME), r.getString(User.PASSWORD), r.getInt(User.USER_ROLE));
        }
        
        return user;
    }
    
     public static User get(int user_id)throws SQLException{
        String sql=String.format("select * from users where user_id=%d", user_id);
        
        ResultSet r=db.executeQuery(sql);
       User user=new User(0, "", "", 0);
        if(r.next()){
            user=new User(r.getInt(User.USER_ID), r.getString(User.USERNAME), r.getString(User.PASSWORD), r.getInt(User.USER_ROLE));
        }
        
        return user;
    }
    
    public static boolean add(User c)throws SQLException{
        if(check_valid_username(c.username)){
            String sql=String.format("insert into users(username,password,user_role) values('%s','%s',%d)",c.username,c.password,c.user_role);
        
            db.execute(sql);
            
            return true;
        }
        
        return false;
    }
    
    public static boolean check_valid_username(String username)throws SQLException{
        String sql=String.format("select * from users where username='%s'", username);
        
        ResultSet r=db.executeQuery(sql);
        if(r.next())
            return false;
        return true;
    }
}
