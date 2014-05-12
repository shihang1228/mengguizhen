package com.order;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;

public class Shop extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException
	{
		
		String pid = req.getParameter("p_id");
		if(pid!=null)
		{
			forward("product",req,resp);
		}
		else
		{
			forward("index",req,resp);
		}
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
