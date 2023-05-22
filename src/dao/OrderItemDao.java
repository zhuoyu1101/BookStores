package dao;

import domain.Order;
import domain.OrderItem;

import java.sql.SQLException;
import java.util.List;

public interface OrderItemDao {
    // 根据订单id查找订单项.并将订单项中商品查找到。
    public List<OrderItem> findOrderItemByOrder(final Order order)
            throws SQLException;
    public void DeleteOrderItemById(String id) throws SQLException ;
}
