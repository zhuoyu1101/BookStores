package servlet;

import domain.sales;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DownloadServlet", value = "/DownloadServlet")
public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //从request中获取搜索参数year和month的值；
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        //调用模型层sales.java中的相关业务方法search，获取销售数量列表ps；
        sales s=new sales();
        List<sales> ps= s.search(year,month);
        //以文件形式下载，导出到扩展名为“.csv”的文件中
        String fileName=year+"年"+month+"月销售榜单.csv";
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType(this.getServletContext().getMimeType(fileName));
        response.setHeader("Content-Disposition", "attachement;filename="+new String(fileName.getBytes("GBK"),"iso8859-1"));

        PrintWriter out = response.getWriter();
        out.println("商品名称,销售数量");
        for (int i = 0; i <ps.size(); i++) {
            sales arr=ps.get(i);
            out.println(arr.getName()+","+arr.getBuynum());
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
