package servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("DispatcherServlet init() 角青"); 
		String name1 = config.getInitParameter("name1"); // value1 府畔
		String name2 = config.getInitParameter("name2"); // value2 府畔
		System.out.println(name1);
		System.out.println(name2);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DispatcherServlet service() 角青");
	}

}
