package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class sales {
    private String name;
    private int buynum;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public List<sales> search(String year, String month) {

        //连接数据库进行多表条件查询，获得查询产品的名称及其销售数量（从高到低排序）结果集rs；
        List<sales> ps = new ArrayList<sales>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动程序以及
            System.out.println("数据库驱动加载成功");
            //建立连接
            conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
            System.out.println("创建连接成功");
            String sql = "SELECT products.name,SUM(orderitem.buynum) totalsalnum "
                    + "FROM orders,products,orderitem "
                    + "WHERE orders.id=orderitem.order_id "
                    + "AND products.id=orderitem.product_id AND orders.paystate=1 "
                    + "AND year(ordertime)= " + year + " and month(ordertime)=" + month + " "
                    + "GROUP BY products.name ORDER BY totalsalnum DESC";
            //sql预处理
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            //执行语句
            //循环遍历结果集，设置sales属性；（类似实验11中的searchAll方法）
            while (rs.next()) {
                sales p = new sales();
                p.setName(rs.getString(1));
                p.setBuynum(rs.getInt(2));
                //将sales添加到ps销售数量列表中；
                ps.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            /*-//释放资源（close报错）
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();*/
            //返回ps
            return ps;
        }









    }

    }
