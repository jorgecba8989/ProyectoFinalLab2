package ar.edu.ubp.lab2.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login.jsp")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	
    	String nick = request.getParameter("alias");
		String pass = request.getParameter("contra");
		
		LoginDao dao = new LoginDao();
		
		if(dao.check(nick, pass))
		{
			session.setAttribute("nick", nick);
			response.sendRedirect("homepage.jsp");
		}
		else
		{ 
			response.sendRedirect("login.jsp");
		}
    }

	public class LoginDao {

		Connection conn;
			public boolean check (String nick, String pass)
			{
				try {
						Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
						conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
						PreparedStatement  st = conn.prepareStatement("select * from Usuarios where Alias_usuario = ? and Clave_usuario = ? ");
						st.setString(1, nick);
						st.setString(2, pass);
						ResultSet rs =st.executeQuery();
						if(rs.next())
						{
							
							return true;
						}
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				return false;
			}
	}
	
	
   


}
