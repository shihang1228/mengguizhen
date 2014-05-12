package com.order;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

public class Regok extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		String action = req.getParameter("action");
		if("submit".equals(action))
		{
			forward("regok",req,resp);
		}
	}
	
	public void forward(String page, HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		String jsp = "/WEB-INF/" + page + ".jsp";
		getServletContext().getRequestDispatcher(jsp).forward(req,resp);
	}
}
