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
public class User {
    public int user_id;
    public String username;
    public String password;
    public int user_role;
    
    public static final String USER_ID="user_id";
    public static final String USERNAME="username";
    public static final String PASSWORD="password";
    public static final String USER_ROLE="user_role";
    public static final String IS_LOGIN="is_login";
    
    public static final int ADMIN=0;
    public static final int CLIENT=1;

    public User(int user_id, String username, String password, int role) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.user_role = role;
    }
    
    public boolean is_admin(){
        return user_role==ADMIN;
    }
    
    public boolean is_client(){
        return user_role==CLIENT;
    }
    
    
}
