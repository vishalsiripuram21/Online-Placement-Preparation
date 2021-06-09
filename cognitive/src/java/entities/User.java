/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author vishal
 */
public class User {
    private String userName;
    private String mobile;
    private String email;
    private String password;
    public User(String userName,String mobile,String email,String password)
    {
        this.userName = userName;
        this.email = email;
        this.mobile = mobile;
        this.password = password;
    }
    
    public User(){}
    public String getName()
    {
        return userName;
    }
    public void setName(String userName)
    {
        this.userName = userName;
    }
     public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
     public String getMobile()
    {
        return mobile;
    }
    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }
     public String getPassword()
    {
        return password;
    }
    public void setPassword(String password)
    {
        this.password = password;
    }
 
}
