package ar.edu.ubp.lab2.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BorrarVideoListado
 */
@WebServlet("/BorrarVideoListado.jsp")
public class BorrarVideoListado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarVideoListado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection conn;
			PreparedStatement   stmt;
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(false);
			
			stmt = conn.prepareStatement( " delete Listados_Videos\r\n" + 
					" from Listados_Videos \r\n" + 
					" join Listados on listados.Nro_listado = Listados_Videos.Nro_listado\r\n" + 
					" join Videos on Videos.Nro_video=Listados_Videos.Nro_video\r\n" + 
					" where  Listados_Videos.Nro_video= ? and Listados_Videos.Nro_listado= ? " );
			
			
			
			stmt.setString(1, request.getParameter("linkvideoh"));
			stmt.setString(2, request.getParameter("nomListah"));

			
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

			response.sendRedirect( "homepage.jsp" ); //Actualiza la página
			
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
