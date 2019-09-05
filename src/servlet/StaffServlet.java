package servlet;

import com.alibaba.fastjson.JSON;
import dao.IStaffDao;
import dao.impl.StaffDaoImpl;
import factory.BeanFactory;
import org.junit.Test;
import entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("*.staff")
public class StaffServlet extends HttpServlet {
    IStaffDao staffDao;

    public StaffServlet() {
        staffDao = BeanFactory.getInstance("staffdao", IStaffDao.class);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        response.setContentType("text/xml;character=utf-8");
        response.setCharacterEncoding("utf-8");
        if (servletPath.contains("add")) {
            doAdd(request, response);
        }else if (servletPath.contains("del")) {
            doDelete(request, response);
        }else if (servletPath.contains("list")) {
            doList(request, response);
        }else if (servletPath.contains("upd")) {
            doUpdate(request, response);
        } else if (servletPath.contains("page")) {
            doPage(request, response);
        } else if (servletPath.contains("find")) {
            doFindByid(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String sName=request.getParameter("sName");
        String phone=request.getParameter("phone");
        String gender=request.getParameter("gender");
        String post=request.getParameter("post");
        Staff staff=new Staff(id,sName,phone,gender,post);
        int r=staffDao.saveStaff(staff);
        response.getWriter().print(r);
        if(r>0){
            response.getWriter().print("<script language='javascript'>alert('员工招聘成功')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");

        }else{
            //如果成功弹出登陆失败并跳到下一个页面
            response.getWriter().print("<script language='javascript'>alert('员工招聘失败')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");
        }
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        int r=staffDao.deleteStaff(id);
        response.getWriter().print(r);
        if(r>0){
            response.getWriter().print("<script language='javascript'>alert('员工解聘成功')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");

        }else{
            //如果成功弹出登陆失败并跳到下一个页面
            response.getWriter().print("<script language='javascript'>alert('员工解聘失败')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");
        }
    }

    protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Staff> staffs=staffDao.getAllStaff();
        //转换为json格式
        String json= JSON.toJSONString(staffs);
        //把json格式输出到前端
        response.getWriter().print(json);
        //System.out.println("查询到所有员工："+json);
    }

    protected void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id=Integer.parseInt(request.getParameter("staffid"));
//        System.out.println(id);
        String sName=request.getParameter("sName");
        String phone=request.getParameter("phone");
        String gender=request.getParameter("gender");
        String post=request.getParameter("post");
        Staff staff=new Staff(id,sName,phone,gender,post);
        int r=staffDao.updateStaff(staff);
        response.getWriter().print(r);
        if(r>0){
            response.getWriter().print("<script language='javascript'>alert('员工信息修改成功')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");

        }else{
            //如果成功弹出登陆失败并跳到下一个页面
            response.getWriter().print("<script language='javascript'>alert('员工信息修改失败')</script>");
            response.setHeader("refresh", "0;URL=staff.jsp");
        }
    }

    private void doPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        int PAGE_SIZE = 4;
        int currPage = 1; // 当前页码
        if (request.getParameter("page") != null) { // 判断传递页码是否有效
            currPage = Integer.parseInt(request.getParameter("page"));// 对当前页码赋值
        }
        int pages; // 总页数
        Long count = staffDao.getTotalCount(); // 查询总记录数
        Integer total = count.intValue();
        if (total % PAGE_SIZE == 0) { // 计算总页数,总记录数和每页显示的数
            pages = total / PAGE_SIZE; // 对总页数赋值
        } else {
            pages = total / PAGE_SIZE + 1; // 对总页数赋值
        }
        if(currPage>pages){
            currPage=pages;
        }else if(currPage<1){
            currPage=1;
        }
        //查询了指定页面的分页的数据
        List<Staff> list = staffDao.getAllStusbypage(currPage,PAGE_SIZE); // 查询所有图书信息
        request.setAttribute("list", list); // 将list放置到request中
        request.setAttribute("page",currPage);
        request.setAttribute("totalpages",pages);
        StringBuffer sb = new StringBuffer(); // 实例化StringBuffer
        for (int i = 1; i <= pages; i++) { // 通过循环构建分页导航条
            if (i == currPage) { // 判断是否为当前页
                sb.append( i ); // 构建分页导航条
            }
        }
        request.setAttribute("bar", sb.toString()); // 将分页导航条的字符串放置到request中*/

        // 转发到staff.jsp页面
        request.getRequestDispatcher("staff.jsp").forward(request, response);
    }

    private void doFindByid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        int id=Integer.parseInt(request.getParameter("id"));

        System.out.println("获取到的名字："+id);
        Staff staff=staffDao.findById(id);
        String json= JSON.toJSONString(staff);
        //把json格式输出到前端
        response.getWriter().print(json);
    }

}


