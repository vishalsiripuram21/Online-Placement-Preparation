package marksUpdation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateMarks {
    static String mark;
    String message;
    UpdateMarks(String message)
    {
        this.message = message;
    }
    UpdateMarks()
    {
    }
    public String getMessage()
    {
        return this.message;
    }
    public static String getMarks(Connection con,String user,String marks) throws SQLException{
        String query = "select * from marks where email=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user);
        ResultSet result =pstmt.executeQuery();
        while(result.next())
            mark=result.getString(marks);
        return mark;
    }
    public static void updateMarks(Connection con,String user,String marks,String query) throws SQLException{
//        String query1="update marks set marks1=? where email=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setString(1, marks);
        pstmt.setString(2, user);
        int rows = pstmt.executeUpdate();
    }
}
