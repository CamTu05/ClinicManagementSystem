package Filters;

import DAL.SpecialtyDAO;
import jakarta.servlet.*;
import java.io.IOException;

public class LoadSpecialtyFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        SpecialtyDAO.INSTANCE.LoadSpecialty();
        request.setAttribute("daoSpecialty", SpecialtyDAO.INSTANCE);

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
