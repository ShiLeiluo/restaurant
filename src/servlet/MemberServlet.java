package servlet;

import com.alibaba.fastjson.JSON;
import entity.Member;
import service.IMemberService;
import service.impl.MemberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet( "*.member")
public class MemberServlet extends HttpServlet {
    IMemberService memberService = new MemberService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }
    protected void doadd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        if("".equals(id)){
            id=null;
        }
//        System.out.println(id);
        String memberName= request.getParameter("memberName");
        String phone=request.getParameter("phone");
        String gender=request.getParameter("gender");
        Member member=new Member(id,memberName,phone,gender);
        int r=memberService.addMember(member);
        response.getWriter().print(r);

    }
    protected void dodel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("dodelByid 1111111111111111");
        String id=request.getParameter("id");
//        System.out.println(id);
        int r=memberService.delMember(id);
        response.getWriter().print(r);


    }
    protected void doupdataByid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//          System.out.println("doupdataByid 1111111111111111");
        String id=request.getParameter("id");
        System.out.println(id);
        String memberName= request.getParameter("memberName");
        String phone=request.getParameter("phone");
        String gender=request.getParameter("gender");
         Member member=new Member(id,memberName,phone,gender);
//         System.out.println(member);
         int r=memberService.updateMember(member);
       response.getWriter().print(r);

    }

    protected void dofindByid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        System.out.println("获取到的名字："+id);
        Member member=memberService.findByid(id);
        String json= JSON.toJSONString(member);
        //把json格式输出到前端
        response.getWriter().print(json);
        System.out.println("查询到会员："+json);

    }

    protected void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       System.out.println("dolist");

        List<Member> members= memberService.getAllStus();
        System.out.println(members);
        //转换为json格式
        String json= JSON.toJSONString(members);
        //把json格式输出到前端
        response.getWriter().print(json);
//        System.out.println("查询到所有会员："+json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();

        if (servletPath.contains("list")) {
            doList(request, response);
        }

        else if (servletPath.contains("find")) {
            dofindByid(request, response);
        }
        else if (servletPath.contains("upd")) {
            doupdataByid(request, response);
        }
        else if (servletPath.contains("del")) {
            dodel(request, response);
        }
        else if (servletPath.contains("add")) {
            doadd(request, response);
        }
    }
}
