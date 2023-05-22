package servlet;

import dao.Factory.DaoFactory;
import dao.OrderDao;
import domain.Order;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FindOrdersServlet", value = "/FindOrdersServlet")
public class FindOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从DaoFactory中获取一个OrderDao实现类的实例；
        OrderDao orderdao=DaoFactory.getOrderDAOInstance();
        List<Order> orders = null;
        try {
            orders = orderdao.findAllOrder();
            //System.out.println(orders);
            } catch (SQLException e) {
            System.out.println("FindOrdersServlet:"+ e.getMessage());
            }
        // 将查询到的订单链表信息orders添加到request作用域的"orders"变量中
        request.setAttribute("orders",orders);
        // 将请求转发到orderList.jsp页面并传递参数item="+"orders"
        request.getRequestDispatcher("/admin/login/home.jsp?item="+"orders").forward(request,response);

    }
}
