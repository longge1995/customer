package Item.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import Item.entity.LoginUser;
import java.util.Objects;
/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*System.out.println(request.getRequestURI());*/
		if(Objects.nonNull(request.getSession().getAttribute("USER_SESSION"))){
			System.out.println("session不为空");
			return true;
		}
		//重定向
		System.out.println("session为空");
		request.setAttribute("msg", "您还没有登录，请先登录！");
		//response.sendRedirect("../login.jsp");
		request.getRequestDispatcher("../login.jsp").forward(request, response);
		return false;
		//return true;
	}

	/*@Override
	public boolean preHandle(HttpServletRequest request, 
		HttpServletResponse response, Object handler) throws Exception {
	    // 获取请求的URL  
        String url = request.getRequestURI();  
        // URL:除了login.jsp是可以公开访问的，其它的URL都进行拦截控制  
        if(url.indexOf("/login")>=0){  
            return true;  
        }  
        // 获取Session  
        HttpSession session = request.getSession();  
        LoginUser loginUser = (LoginUser) session.getAttribute("USER_SESSION");
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if(loginUser != null){
			System.out.println("您已经登录！");
            return true;  
        }
		System.out.println("您还没有登录，请先登录！");
         // 不符合条件的给出提示信息，并转发到登录页面
         request.setAttribute("msg", "您还没有登录，请先登录！");
         request.getRequestDispatcher("../login.jsp")
                                                .forward(request, response);
		return false;
	}
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}*/
}
