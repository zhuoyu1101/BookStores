package domain;

import java.sql.*;
import java.util.*;

public class Product {
    private String id;
    private String name;
    private double price;
    private String category;
    private int pnum;
    private String imgurl;
    private String description;

    public List<Product> searchAll() {
        List<Product> ps = new ArrayList<Product>();
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
            System.out.println("创建连接成功<br>");
            //sql预处理
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from bookstore.products");//查询整个用户表数据
            //执行语句
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getDouble(3));
                p.setCategory(rs.getString(4));
                p.setPnum(rs.getInt(5));
                p.setImgurl(rs.getString(6));
                p.setDescription(rs.getString(7));
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
            return ps;
        }
    }
    public boolean add(Product product){
        Connection conn = null;
        Statement stmt = null;
        boolean defaultCommit = false;
        String strSQL1 = "insert into bookstore.products(id,name,price,category,pnum,imgurl,description) values(" +
                "'"+UUID.randomUUID().toString()+"','"+product.getName()+"'," + "'"+product.getPrice()+"'," +
                "'"+product.getCategory()+"','"+product.getPnum()+"','"+product.getImgurl()+"'," +
                "'"+product.getDescription()+"')";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
            stmt = conn.createStatement();
            stmt.executeUpdate(strSQL1);
        }
        catch (Exception e) {
            e.printStackTrace();
        }finally {
            /*if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }*/
        }

        return true;
    }
    public boolean delete(String ID){
        Connection conn = null;
        Statement stmt = null;
        boolean defaultCommit = false;
        String strSQL1 = "DELETE from bookstore.products WHERE id='"+ID+"'";
        System.out.println(ID);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
            stmt = conn.createStatement();
            stmt.executeUpdate(strSQL1);
            System.out.println("删除成功！");
        }
        catch (Exception e) {
            e.printStackTrace();
        }finally {
            /*if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }*/
        }
        return true;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPnum() {
        return pnum;
    }

    public void setPnum(int pnum) {
        this.pnum = pnum;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
