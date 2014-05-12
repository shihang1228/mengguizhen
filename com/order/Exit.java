package com.order;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

public class Exit extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		forward("exit",req,resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		
	}
	
	public void forward(String page, HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		String jsp = "/WEB-INF/" + page + ".jsp";
		getServletContext().getRequestDispatcher(jsp).forward(req,resp);
	}
}
