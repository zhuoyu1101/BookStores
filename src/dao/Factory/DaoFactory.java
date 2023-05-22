package dao.Factory;

import dao.OrderDao;
import dao.OrderItemDao;
import dao.impl.OrderDaoImpl;
import dao.impl.OrderItemDaoImpl;

public class DaoFactory {
    public DaoFactory() {
        // TODO Auto-generated constructor stub
    }
    public static OrderDao getOrderDAOInstance()
    {
        return new OrderDaoImpl();
    }

    public static OrderItemDao getOrderItemDAOInstance()
    {
        return new OrderItemDaoImpl();
    }

}
