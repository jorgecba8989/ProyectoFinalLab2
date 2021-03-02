package ar.edu.ubp.lab2.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.edu.ubp.lab2.beans.ComentarioBean;

/**
 * Servlet implementation class MostrarComentarioVideo
 */
@WebServlet("/MostrarComentario.jsp")
public class MostrarComentarioVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarComentarioVideo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Connection conn;
			CallableStatement stmt;
			ResultSet result;

			ComentarioBean c;
			LinkedList<ComentarioBean> comentario = new LinkedList<ComentarioBean>();
			
	try {	
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(false);
			
			stmt = conn.prepareCall("{CALL get_Comentario_Video(?)}");
			

			stmt.setString(1, request.getParameter("Url_Video"));
			result = stmt.executeQuery();
			
			while(result.next()) {
				c= new ComentarioBean();
				c.setDesC(result.getString("Descripcion_comentario"));
				c.setFechaC(result.getString("Fecha_comentario"));
				c.setNomUsu(result.getString("Nro_usuario"));
				comentario.add(c);	
			}
			request.setAttribute("comentario", comentario);

			stmt.close();
    		conn.close();
    		this.gotoPage("/comentarioVideo.jsp", request, response);
			
			
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
