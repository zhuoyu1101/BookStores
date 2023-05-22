package dao.impl;

import dao.OrderDao;
import domain.Order;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import util.DataSourceUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class OrderDaoImpl implements OrderDao{
    public OrderDaoImpl(){}
     /**1、 查找所有订单
     * @return
     * @throws SQLException
     */
    public List<Order> findAllOrder() throws SQLException {
        //1.创建sql
        String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id order by orders.user_id";
        //2.构造一个指定数据源ds的QueryRunner对象
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.返回QueryRunner对象query()方法的查询结果
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            public List<Order> handle(ResultSet rs) throws SQLException {
                //创建订单集合
                List<Order> orders = new ArrayList<Order>();
                //循环遍历订单和用户信息
                while (rs.next()) {
                    //将从数据库中查询到的订单属性添加到订单对象中
                    Order order = new Order();
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    //将从数据库中查询到的用户属性添加到用户对象中
                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setUsername(rs.getString("user.username"));
                    user.setPASSWORD(rs.getString("user.PASSWORD"));
                    user.setUsertype(rs.getString("user.usertype"));
                    user.setGender(rs.getString("user.gender"));
                    user.setBirthday(rs.getString("user.birthday"));
                    user.setHobby(rs.getString("user.hobby"));
                    user.setEmail(rs.getString("user.email"));
                    user.setIntroduce(rs.getString("user.introduce"));
                    user.setRegistTime(rs.getDate("user.registTime"));

                    //将用户对象添加到订单对象中
                    order.setUser(user);
                    //将订单对象添加到订单链表集合中
                    orders.add(order);
                }
                return orders;
            }
        });
    }

    /**
     * 2、根据id查找订单信息
     * @param id
     * @return
     * @throws SQLException
     */
    public Order findOrderById(String id) throws SQLException {
        String sql = "select * from orders,user where orders.user_id=user.id and orders.id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<Order>() {
            public Order handle(ResultSet rs) throws SQLException {
                Order order = new Order();
                while (rs.next()) {
                    //将从数据库中查询到的订单属性添加到订单对象中
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    //将从数据库中查询到的用户属性添加到用户对象中
                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setUsername(rs.getString("user.username"));
                    user.setPASSWORD(rs.getString("user.PASSWORD"));
                    user.setUsertype(rs.getString("user.usertype"));
                    user.setGender(rs.getString("user.gender"));
                    user.setBirthday(rs.getString("user.birthday"));
                    user.setHobby(rs.getString("user.hobby"));
                    user.setEmail(rs.getString("user.email"));
                    user.setIntroduce(rs.getString("user.introduce"));
                    user.setRegistTime(rs.getDate("user.registTime"));
                    //将用户对象添加到订单对象中
                    order.setUser(user);
                }
                return order;
            }
        }, id);
    }
    public void DeleteOrderById(String id) throws SQLException{
        String sql ="delete from orders where orders.id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        Object[] params = {id};
        int result=runner.update(sql,params);
        //System.out.println(result);
    }
}
