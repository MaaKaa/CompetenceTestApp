package pl.marzenakaa.app.filter;

import org.springframework.web.filter.GenericFilterBean;
import pl.marzenakaa.app.volunteer.Volunteer;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/vol/*"})
public class CustomAuthorizationFilterVolunteer extends GenericFilterBean {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        Volunteer volunteer = (Volunteer) session.getAttribute("volunteerSession");
        if (volunteer == null) {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("/login");
        } else {
            chain.doFilter(request, response);
        }
    }

}
