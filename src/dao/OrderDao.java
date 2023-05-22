package dao;

import domain.Order;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {
    // 查找所有订单
    public List<Order> findAllOrder() throws SQLException;
    // 根据id查找订单信息
    public Order findOrderById(String id) throws SQLException ;
    public void DeleteOrderById(String id) throws SQLException ;

}
