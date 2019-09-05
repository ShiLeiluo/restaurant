package servlet;

import com.alibaba.fastjson.JSON;
import factory.BeanFactory;
import entity.Food;
import service.IFoodService;
import utils.FileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @author SL
 * 2019/7/25 11:20
 */
@WebServlet("*.kitchen")
@MultipartConfig(maxFileSize=5765004,fileSizeThreshold=1000)
public class KitchenServlet extends HttpServlet {
    IFoodService foodService;
    private static final long serialVersionUID = 1L;
    public KitchenServlet(){
        foodService= BeanFactory.getInstance("foodService",IFoodService.class);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath=request.getServletPath();
        if (servletPath.contains("showAllFood")){
            doShowAllFood(request,response);
        }else if (servletPath.contains("addFood")){
            doAddFood(request,response);
        }else if (servletPath.contains("updateFood")){
            doUpdateFood(request,response);
        }else if (servletPath.contains("deleteFood")){
            doDeleteFood(request,response);
        }
    }

    private void doDeleteFood(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println("id="+id);
        if (foodService.deleteFood(id)==1){
            try {
                response.getWriter().print("OK");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void doUpdateFood(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int edit_foodId=Integer.parseInt(request.getParameter("edit_foodId"));
        System.out.println("edit_foodId="+edit_foodId);
        String edit_foodName=request.getParameter("edit_foodName");
        int edit_inventory=Integer.parseInt(request.getParameter("edit_inventory"));
        double edit_normalPrice=Double.parseDouble(request.getParameter("edit_normalPrice"));
        double edit_memberPrice=Double.parseDouble(request.getParameter("edit_memberPrice"));
        Food food=new Food(edit_foodId,edit_foodName,edit_inventory,edit_normalPrice,edit_memberPrice);

        PrintWriter out= response.getWriter();
        int result=foodService.upDate(food);
        String json=JSON.toJSONString(result);
        out.println(json);
    }

    private void doAddFood(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String new_foodName = request.getParameter("new_foodName");
//        System.out.println("addFood菜品名:"+new_foodName);
        int new_inventory =Integer.parseInt(request.getParameter("new_inventory"));
//        System.out.println("addFood库存："+new_inventory);
        Double new_price = Double.parseDouble(request.getParameter("new_price"));
//        System.out.println("addFood普通价格："+new_price);
        Double new_mPrice = Double.parseDouble(request.getParameter("new_mPrice"));
//        System.out.println("addFood会员价格："+new_mPrice);
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //上传目录
        String dir=request.getServletContext().getRealPath("/cai");
//        String dir=request.getServletContext().getRealPath("restaurant/style/images");
        System.out.println("dir="+dir);
        //准备上传的文件
       //Collection<Part> parts=request.getParts();
        //遍历获取每一个文件
        //单个文件上传
        Part part= request.getPart("file");
        System.out.println("part:"+part);
        String header=part.getHeader("Content-Disposition");
        String fileName= FileUtil.getFileName(header);
        //if(parts.size()==1) {
            //获取文件域的文件名
            part.write(dir+ File.separator+fileName);
            System.out.println(dir+ File.separator+fileName);
            System.out.println("上传的单个文件");
        //}
        String new_img="/cai/"+fileName;
        System.out.println("new_img:"+new_img);
        Food food=new Food(new_foodName,new_inventory,new_price,new_mPrice,new_img);
        //提示用户上传成功或者失败
        PrintWriter out=response.getWriter();
        if (foodService.addFood(food)==1){
            out.println("OK");
        }else {
            System.out.println("失败");
        }
        out.flush();//字符串刷新
        out.close();//关闭流
    }

    private void doShowAllFood(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        List<Food> foods=foodService.getAll();
        String json= JSON.toJSONString(foods);
        try {
            response.getWriter().print(json);
//            System.out.println("所有菜品："+json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
