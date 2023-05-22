package dbpool;
import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;
import java.sql.*;
import java.util.Properties;
public class DbcpConnectionPool {
    private static BasicDataSource dataSource = null;
    public DbcpConnectionPool() {
    }
    /**
     * 初始化数据库连接池
     */
    public static void init()
    {
        if (dataSource != null)
        {
            try
            {
                dataSource.close();
            } catch (Exception e)
            {
                e.printStackTrace();
            }
            dataSource = null;
        }
        //使用Properties对象定义数据库连接池信息
        try {
            Properties p = new Properties();
            p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
            p.setProperty("url", "jdbc:mysql://localhost:3306/newsdb?useUnicode=true&characterEncoding=utf-8");
            p.setProperty("password", "root");
            p.setProperty("username", "root");
            p.setProperty("maxActive", "30");
            p.setProperty("maxIdle", "10");
            p.setProperty("maxWait", "1000");
            p.setProperty("removeAbandoned", "false");
            p.setProperty("removeAbandonedTimeout", "120");
            p.setProperty("testOnBorrow", "true");
            p.setProperty("logAbandoned", "true");

            //以指定配置信息创建数据源
            dataSource = (BasicDataSource) BasicDataSourceFactory.createDataSource(p);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 从连接池中获取连接
     * @return
     * @throws SQLException
     */
    public static synchronized Connection getConnection() throws  SQLException {
        if (dataSource == null) {
            init();
        }
        Connection conn = null;
        if (dataSource != null) {
            try {
                conn = dataSource.getConnection();
            } catch (Exception e) {
                System.out.println("获取链接失败:" + e);
            }
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