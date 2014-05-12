package com.order;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

public class Register extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		forward("register",req,resp);
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
