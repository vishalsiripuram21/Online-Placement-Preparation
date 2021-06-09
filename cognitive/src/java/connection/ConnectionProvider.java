/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author vishal
 */
public class ConnectionProvider  {

    public static Connection getConnection() throws SQLException
    {
        Connection con=null;
        try{
            
            if(con == null)
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://b23519f6d7b1e3:23ca72ed@us-cdbr-east-04.cleardb.com/heroku_cb68e33f2f00015");
                if(con!=null)
                {
                    System.out.println("connnection");
                }
                else
                {
                    System.out.println("not connected");
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return con; 
    }
}
