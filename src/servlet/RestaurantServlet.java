package servlet;

import entity.DinnerTable;
import entity.Food;
import entity.Member;
import entity.Orders;
import factory.BeanFactory;
import service.IDinnerTableService;
import service.IFoodService;
import com.alibaba.fastjson.JSON;
import service.IMemberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet("*.do")
public class RestaurantServlet extends HttpServlet {
    IFoodService iFoodService;
    IDinnerTableService dinnerTableService;
    IMemberService memberService;
    public RestaurantServlet(){
        dinnerTableService=BeanFactory.getInstance("dinnerTableService",IDinnerTableService.class);
        iFoodService= BeanFactory.getInstance("foodService",IFoodService.class);
        memberService=BeanFactory.getInstance("memberservice",IMemberService.class);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath=request.getServletPath();
        if (servletPath.contains("page")){
            doShowPage(request,response);
        }else if (servletPath.contains("add")){
            doAdd(request,response);
        }else if (servletPath.contains("orders")){
            doShowAdd(request,response);
        }else if(servletPath.contains("login")){
            doLogin(request,response);
        }else if (servletPath.contains("register")){
            doRegister(request,response);
        }else if (servletPath.contains("desk")){
            doDeskShow(request,response);
        }else if (servletPath.contains("sum")){
            doSum(request,response);
        }else if (servletPath.contains("del")){
            doDelAll(request,response);
        }else if (servletPath.contains("upddesk")){
            doUpdDesk(request,response);
        }
    }

    private void doRegister(HttpServletRequest request, HttpServletResponse response) {
        String logname=request.getParameter("logname");
        String id=request.getParameter("password");
        String phone=request.getParameter("phone");
        String gender=request.getParameter("gender");
        Member member=new Member(id,logname,phone,gender);
        int r=memberService.addMember(member);
        try {
            request.getRequestDispatcher("success.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void doUpdDesk(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
//        int tableid=Integer.parseInt(request.getParameter("tableid"));
        int tableid=(int)session.getAttribute("tableid");
        System.out.println(tableid);
        dinnerTableService.updById(tableid);
    }

    private void doDelAll(HttpServletRequest request, HttpServletResponse response) {
        iFoodService.delete();
    }

    private void doSum(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        double sum=iFoodService.count();
        String json= JSON.toJSONString(sum);
        try {
            response.getWriter().print(json);
//        int tableid=Integer.parseInt(request.getParameter("tableid"));
            int tableid=(int)session.getAttribute("tableid");
            System.out.println(tableid);
            dinnerTableService.updById(tableid);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void doDeskShow(HttpServletRequest request, HttpServletResponse response) {
        List<DinnerTable> tables=dinnerTableService.findByStatus();
        String json= JSON.toJSONString(tables);
//        System.out.println("doDeskShow:"+json);
        //把json格式输出到前端
        try {
            response.getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }catch(Exception e) {
        e.printStackTrace();
        }
    }

    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int role=Integer.parseInt(request.getParameter("role"));
        String name=request.getParameter("logname");
        String id=request.getParameter("password");
        String code = request.getParameter("code");
        String scode = (String) request.getSession().getAttribute("scode");
        if (role==0) {
            if ("admin".equalsIgnoreCase(name) && "admin".equalsIgnoreCase(id)) {
                if (!code.equalsIgnoreCase(scode)) {
                    request.setAttribute("msg", "验证码错误,请重新登录");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/restaurant/index.jsp");
                }
            }else {
                request.setAttribute("buspan", "用户名或密码错误,请重新登录!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        if (role == 1) {
            Member member=new Member(name,id);
                if (memberService.findByid(member.getId())!=null) {
                    if (!code.equalsIgnoreCase(scode)) {
                        request.setAttribute("msg", "验证码错误,请重新登录");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                       request.getRequestDispatcher("desk.jsp").forward(request,response);
                    }
                } else {
                    request.setAttribute("buspan", "用户名或密码错误,请重新登录!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        }
    private void doShowAdd(HttpServletRequest request, HttpServletResponse response) {

        try {
            response.setCharacterEncoding("UTF-8");
            List<Orders> list=iFoodService.getOrders();
            String json= JSON.toJSONString(list);
//            System.out.println("servletjson"+json);
            //把json格式输出到前端
            try {
                response.getWriter().print(json);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void doAdd(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            String foodName=request.getParameter("foodName");
            String foodPrice=request.getParameter("foodPrice");
            System.out.println(foodName+"foodName");
            if (iFoodService.insert(foodName,foodPrice)!=1){
                try {
                    response.sendRedirect("app/caidan.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    private void doShowPage(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session=request.getSession();
        int tableid=Integer.parseInt(request.getParameter("tableid"));
        dinnerTableService.updateById(tableid);
        session.setAttribute("tableid",tableid);
        int PAGE_SIZE = 6;
        int currPage = 1; // 当前页码
        if (request.getParameter("page") != null) { // 判断传递页码是否有效
            currPage = Integer.parseInt(request.getParameter("page"));// 对当前页码赋值
        }

        //查询了指定页面的分页的数据
        List<Food> list = iFoodService.findFoodByPage(currPage, PAGE_SIZE); // 查询所有图书信息
        request.setAttribute("list", list); // 将list放置到request中
        int pages; // 总页数
        Long count = iFoodService.getTotalCount(); // 查询总记录数
        Integer total=count.intValue();
        if (total % PAGE_SIZE == 0) { // 计算总页数,总记录数和每页显示的数
            pages = total / PAGE_SIZE; // 对总页数赋值
        } else {
            pages = total / PAGE_SIZE + 1; // 对总页数赋值
        }
        request.setAttribute("page",currPage);
        request.setAttribute("totalpages",pages);
        StringBuffer sb = new StringBuffer(); // 实例化StringBuffer
        // caidan.jsp页面
        try {
            request.getRequestDispatcher("caidan.jsp").forward(request, response);
            doShowPage(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
