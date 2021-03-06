package ar.edu.ubp.lab2.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertarUsuario
 */
@WebServlet("/InsertarUsuario.jsp")
public class InsertarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection conn;
			CallableStatement stmt;
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(false);
			
			stmt = conn.prepareCall("{CALL ins_Usuarios(?,?,?,?,?,?)}");
			

			stmt.setString(1, request.getParameter("Nom_usuario"));
			stmt.setString(2, request.getParameter("Apellido_usuario"));
			stmt.setString(3, request.getParameter("Clave_usuario"));
			stmt.setString(4, request.getParameter("Verificacion_clave_usuario"));
			stmt.setString(5, request.getParameter("Email_usuario"));
			stmt.setString(6, request.getParameter("Alias_usuario"));

			
			try {
				stmt.execute();
				conn.commit();
			}
			catch(SQLException ex) {
				conn.rollback();
				throw ex;
			}			
			finally {
				stmt.close();
				conn.close();
			}
			//response.sendRedirect("login.jsp");
			
	} 
	catch (ClassNotFoundException | SQLException e) {
		request.setAttribute("error", e.getMessage());
		this.gotoPage("/error.jsp", request, response);
	}
}
private void gotoPage(String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(address);
	                  dispatcher.forward(request, response);
}
}
