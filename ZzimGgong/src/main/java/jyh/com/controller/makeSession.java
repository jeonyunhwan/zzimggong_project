package jyh.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jyh.model.memberDAO;
import jyh.model.memberDTO;

/**
 * Servlet implementation class makeSession
 */
@WebServlet("/makeSession")
public class makeSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		memberDAO insert = new memberDAO();
		System.out.println(email);
		request.setAttribute("join","1");
		HttpSession session = request.getSession();
		memberDTO sessionid = insert.sessionNick(email);
		session.setAttribute("sesID",sessionid);
		request.getRequestDispatcher("/ymw/pg0001.jsp").forward(request, response);
		System.out.println(sessionid.getEmail());
		return;
		
	}

}
