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

import ar.edu.ubp.lab2.beans.ContenidoPlaylist;


/**
 * Servlet implementation class MostrarPlaylist
 */
@WebServlet("/MostrarPlaylist.jsp")
public class MostrarPlaylist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarPlaylist() {
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

		LinkedList<ContenidoPlaylist> listadoP = new LinkedList<ContenidoPlaylist>();
		ContenidoPlaylist lp;
		
try {	
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
		conn.setAutoCommit(false);
		
		stmt = conn.prepareCall("{CALL get_Playlist(?,?)}");
		

		stmt.setString(1, request.getParameter("Nom_listado"));
		stmt.setString(2, request.getParameter("Alias_usuario"));
		result = stmt.executeQuery();
		
		while(result.next()) {
			lp = new ContenidoPlaylist();
			lp.setNomCantante(result.getString("Nom_cantante_video"));
			lp.setTituloCancion(result.getString("Nom_titulo_video"));
			lp.setUrlCancion(result.getString("Url_video"));
			lp.setLike(result.getInt("Like_Video"));
			lp.setNomLista(result.getString("Nom_listado"));
			lp.setNro_lista(result.getInt("Nro_listado"));
			lp.setNro_video(result.getInt("Nro_video"));
			lp.setNro_visita(result.getInt("Nro_visita_video"));
			lp.setLink_descarga(result.getString("Link_descarga"));
			listadoP.add(lp);
		}
		request.setAttribute("listadoP", listadoP);

		stmt.close();
		conn.close();
		this.gotoPage("/playlist.jsp", request, response);
		
		
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
