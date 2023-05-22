package dbpool;
import javax.naming.*;
import javax.sql.DataSource;
import java.sql.*;
public class poolConnectDB {
    public static  Connection getConnection(){
        Connection conn = null;
        try{
            //Context是javax.name包中的一个接口，用于查找数据库连接池的配置文件
            Context ctx =new InitialContext();
            ctx=(Context)ctx.lookup("java:comp/env");
            //DBPool为context.xml文件中Resource元素的name属性值
            DataSource ds=(DataSource)ctx.lookup("DBPool");
            conn=ds.getConnection();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();// 归还连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
