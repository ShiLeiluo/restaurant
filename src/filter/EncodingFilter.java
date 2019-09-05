package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(urlPatterns = {"/*"},initParams ={@WebInitParam(name="charset",value ="utf-8")} )
public class EncodingFilter implements Filter {
    private String charset;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding(charset);
        response.setCharacterEncoding(charset);
//        System.out.println("进入了过滤器");
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

        charset=config.getInitParameter("charset");
//        System.out.println("获取指定的编码为："+charset);
    }
}

