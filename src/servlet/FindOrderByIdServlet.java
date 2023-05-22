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
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FindOrderByIdServlet", value = "/FindOrderByIdServlet")
public class FindOrderByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从request中获取订单id的值
        String order_id=request.getParameter("id");
        //从DaoFactory中获取一个OrderItemDao实现类的实例对象；
        OrderItemDao orderitemdao= DaoFactory.getOrderItemDAOInstance();
        //从DaoFactory中获取一个OrderDao实现类的实例对象；
        OrderDao orderdao=DaoFactory.getOrderDAOInstance();
        Order order = null;
        try{
            order = orderdao.findOrderById(order_id);
            //一个订单对应多个OrderItem
            List<OrderItem> items = orderitemdao.findOrderItemByOrder(order);
            //将orderItems对象添加到order对象中；
            order.setOrderItems(items);
        } catch (Exception e) {
            System.out.println("FindOrderByIdServlet:"+e);
        }
        //将查询到的订单信息order添加到request作用域;
        request.setAttribute("order",order);
        //类似FindOrdersServlet中，将请求转发到home.jsp页面，并传递item参数，值为view；
        request.getRequestDispatcher("/admin/login/home.jsp?item="+"view").forward(request,response);
    }
}
