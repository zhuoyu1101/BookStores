package dao.impl;

import dao.OrderItemDao;
import domain.Order;
import domain.OrderItem;
import domain.Product;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import util.DataSourceUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDaoImpl implements OrderItemDao {
    public List<OrderItem> findOrderItemByOrder(Order order) throws SQLException {
        //此处类似OrderDaoImpl文件中的findAllOrder方法，select * from orderItem,Products where   类似findOrderById方法
        String sql = "select * from orderitem,products where orderitem.product_id=products.id and orderitem.order_id=?";
        //2.构造一个指定数据源ds的QueryRunner对象
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        //3.返回QueryRunner对象query()方法的查询结果
        return runner.query(sql, new ResultSetHandler<List<OrderItem>>() {
            public List<OrderItem> handle(ResultSet rs) throws SQLException {
                //创建订单集合
                List<OrderItem> orderitems = new ArrayList<OrderItem>();
                //循环遍历订单项和商品信息
                OrderDaoImpl orderdaoimpl=new OrderDaoImpl();
                while (rs.next()) {
                    //创建订单项对象，将从数据库中查询到的订单项属性添加到订单项对象中
                    OrderItem orderitem = new OrderItem();
                    orderitem.setOrder(orderdaoimpl.findOrderById(rs.getString("orderitem.order_id")));
                    orderitem.setBuynum(rs.getInt("orderitem.buynum"));
                    //创建商品对象，将从数据库中查询到的商品属性添加到订单项对象中
                    Product products = new Product();
                    products.setId(rs.getString("products.id"));
                    products.setName(rs.getString("products.name"));
                    products.setPrice(rs.getDouble("products.price"));
                    products.setCategory(rs.getString("products.category"));
                    products.setPnum(rs.getInt("products.pnum"));
                    products.setImgurl(rs.getString("products.imgurl"));
                    products.setDescription(rs.getString("products.description"));
                    //将商品对象添加到订单项对象中
                    orderitem.setP(products);
                    //将订单项对象添加到订单项链表集合中
                    orderitems.add(orderitem);
                }
                //返回订单项链表集合
                return orderitems;
            }//注意这里查询时需要参数--订单order的id。类似findOrderById方法
        },order.getId());
    }

    @Override
    public void DeleteOrderItemById(String id) throws SQLException {
        String sql ="delete from orderitem where orderitem.order_id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        Object[] params = {id};
        int result=runner.update(sql,params);
        //System.out.println(result);
    }
}


