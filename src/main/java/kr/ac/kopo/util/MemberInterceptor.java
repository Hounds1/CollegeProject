package kr.ac.kopo.util;

import kr.ac.kopo.vo.MemberVO;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        MemberVO memberVO = (MemberVO) session.getAttribute("member");
        if(memberVO != null) {
            System.out.println("Interceptor : True");
            return true;
        }

        String query = request.getQueryString();
        session.setAttribute("target_url", request.getRequestURI() + (query != null ? "?" + query : ""));
        System.out.println("Interceptor : " + session.getAttribute("target_url"));

        response.sendRedirect("/member/login_not_found");

        System.out.println("Interceptor : False");

        return false;
    }
}
