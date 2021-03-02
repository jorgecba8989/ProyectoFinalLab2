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

import ar.edu.ubp.lab2.beans.UsuarioBean;



/**
 * Servlet implementation class MostrarDatosUsuario
 */
@WebServlet("/MostrarDatosUsuario.jsp")
public class MostrarDatosUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarDatosUsuario() {
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

		UsuarioBean us;
		LinkedList<UsuarioBean> usuario = new LinkedList<UsuarioBean>();
		
	try {	
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(false);
			
			stmt = conn.prepareCall("{CALL get_datos_usuario(?)}");
			
	
			stmt.setString(1, request.getParameter("datoNickh"));
			result = stmt.executeQuery();
			
			while(result.next()) {
				us= new UsuarioBean();
				us.setNomUsuario(result.getString("Nom_usuario"));
				us.setApellidoUsuario(result.getString("Apellido_usuario"));
				us.setClaveUsuario(result.getString("Clave_usuario"));
				us.setVeriClaveUsuario(result.getString("Verificacion_clave_usuario"));
				us.setEmailUsuario(result.getString("Email_usuario"));
				us.setAliasUsuario(result.getString("Alias_usuario"));
				usuario.add(us);
					
			}
			request.setAttribute("usuario", usuario);
	
			stmt.close();
			conn.close();
			this.gotoPage("/datosUsuario.jsp", request, response);
			
			
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
