package servlet;

import domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

@WebServlet("/servlet/MenuSearchServlet")//（注解方式）配置servlet的访问URL（必设）
public class MenuSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //从request中获取搜索参数的值
        String searchfield=request.getParameter("textfield");
        //连接数据库进行模糊查询，获得结果集rs；
        List<Product> ps = new ArrayList<Product>();
        //循环遍历结果集rs，设置产品属性，并将产品添加到ps产品列表中（类似实验11中的searchAll方法）
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
            rs = stmt.executeQuery("select * from bookstore.products where name like '%"+searchfield+"%'");//查询整个用户表数据
            //执行语句
            while (rs.next()) {
                //System.out.println(searchfield);
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

        }
        //将产品列表ps设置到request对象的ProductList参数中，并将请求转发给ProductList.jsp页面进行后续操作。
        request.setAttribute("ProductList", ps);
        request.getRequestDispatcher("../client/include/ProductList.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
