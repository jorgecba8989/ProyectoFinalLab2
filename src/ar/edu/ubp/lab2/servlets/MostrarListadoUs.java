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

import ar.edu.ubp.lab2.beans.PlaylistUsuario;

/**
 * Servlet implementation class MostrarListadoUs
 */
@WebServlet("/MostrarListadoUs.jsp")
public class MostrarListadoUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarListadoUs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn;
		CallableStatement st;
		ResultSet result;
		LinkedList <PlaylistUsuario> playList = new LinkedList <PlaylistUsuario> ();
		PlaylistUsuario pl;
		
    try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(true);
	        
	
			st = conn.prepareCall("{CALL get_listado_usuario(?)}");
			st.setString(1, request.getParameter("datoNickh"));
			st.execute();
	
			result = st.getResultSet();
			
			while(result.next()) {
				pl = new PlaylistUsuario();
				pl.setNomLista(result.getString("Nom_listado"));
				playList.add(pl);
			}
	   	
			request.setAttribute("playList", playList);
	
			st.close();
			conn.close();
			this.gotoPage("/mostrarListado.jsp", request, response);
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
