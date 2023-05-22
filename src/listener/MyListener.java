package listener;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.LinkedList;
import java.util.List;

@WebListener
public class MyListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {
    private ServletContext application=null;
    public MyListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        /* This method is called when the servlet context is initialized(when the Web application is deployed). */
        // TODO Auto-generated method stub
        this.application = sce.getServletContext();
        //设置一个列表属性，用于保存在线用户名
        this.application. setAttribute("online", new LinkedList<String>());
        System.out.println("开始统计在线人数：");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        /* This method is called when an attribute is added to a session. */
        // TODO Auto-generated method stub
        @SuppressWarnings("unchecked")
        List<String> online=(List<String>)this.application.getAttribute("online");
        if("username".equals(se.getName())){
        //将当前用户名添加到列表中
            online.add((String) se.getValue());
        }
        //将添加后的列表重新设置到a ppi i cat ion属性中
        this.application.setAttribute("online",online);
        System.out.println("当前在线人数："+online.size());
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
        /* This method is called when an attribute is removed from a session. */
        //TODO Auto-generated method stub
        @SuppressWarnings("unchecked")
        List<String>online=(List<String>)this.application.getAttribute("online");
        //取得当前用户名
        String username=(String)se.getValue();
        //将此用户名从列表中则除
        online.remove(username);
        //将删除后的列表重新设置到application属性中
        this.application.setAttribute("online",online);
        //输出当前在线人数
        System.out.println("当前在线人数："+online.size());
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
