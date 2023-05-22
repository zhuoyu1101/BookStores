package servlet;

import dao.Factory.DaoFactory;
import dao.OrderDao;
import dao.OrderItemDao;
import domain.Order;
import domain.OrderItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DelOrderByIdServlet", value = "/DelOrderByIdServlet")
public class DelOrderByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从request中获取订单id的值
        String order_id = request.getParameter("id");
        //从DaoFactory中获取一个OrderItemDao实现类的实例对象；
        OrderItemDao orderitemdao = DaoFactory.getOrderItemDAOInstance();
        //从DaoFactory中获取一个OrderDao实现类的实例对象；
        OrderDao orderdao = DaoFactory.getOrderDAOInstance();
        Order order = null;
        try {
            orderitemdao.DeleteOrderItemById(order_id);
            orderdao.DeleteOrderById(order_id);
        } catch (Exception e) {
            System.out.println("FindOrderByIdServlet:" + e);
        }
        //将查询到的订单信息order添加到request作用域;
        request.setAttribute("order", order);
        request.getRequestDispatcher("FindOrdersServlet").forward(request, response);
    }
}
