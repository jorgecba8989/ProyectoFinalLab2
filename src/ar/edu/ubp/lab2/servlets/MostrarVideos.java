package ar.edu.ubp.lab2.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.edu.ubp.lab2.beans.ListadoVideo;

/**
 * Servlet implementation class MostrarVideos
 */
@WebServlet("/listadoVideos.jsp")
public class MostrarVideos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostrarVideos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn;
		PreparedStatement stmt;		
		ResultSet result;
		
		LinkedList<ListadoVideo> listado = new LinkedList<ListadoVideo>();
		ListadoVideo lm;
		
		
		try {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(true);
			
			stmt = conn.prepareStatement("select c.Nom_categoria,\r\n" + 
					"       v.Nro_categoria,\r\n" + 
					"       v.Nom_titulo_video,\r\n" + 
					"	   v.Nom_cantante_video,\r\n" + 
					"	   v.Url_video,\r\n" + 
					"	   v.Nro_video, \r\n" +
					"		v.Like_Video, \r\n"+
					"		v.Nro_visita_video,\r\n"+
					"		v.Imagen_Video, \r\n"+
					"		v.Link_descarga \r\n"+
					"  from Videos v (nolock)\r\n" + 
					"       join Categorias c (nolock)\r\n" + 
					"	     on v.Nro_categoria = c.Nro_categoria\r\n" + 
					" where (?  is null\r\n" + 
					"    or  v.Nro_categoria = ?)\r\n" + 
					"   and  v.Nom_titulo_video + ' ' + v.Nom_cantante_video + ' ' + v.Nom_titulo_video like '%' + isnull(ltrim(rtrim(?)), '') + '%' \r\n" + 
					" order by c.Nom_categoria,\r\n" + 
					"          v.Nom_titulo_video;");
			
			String categoria = Integer.parseInt(request.getParameter("categoria")) == 0 ? null : request.getParameter("categoria")  ;
			stmt.setString(1, categoria );
			stmt.setString(2, categoria);
			stmt.setString(3, request.getParameter("buscar"));
			
			result = stmt.executeQuery();
			
			
			while(result.next())
			{
				lm = new ListadoVideo();
				lm.setCantante(result.getString("Nom_cantante_video"));
				lm.setLink(result.getString("Url_video"));
				lm.setNomcategoria(result.getString("Nom_categoria"));
				lm.setNrocategoria(result.getInt("Nro_categoria"));
				lm.setNrovideo(result.getInt("Nro_video"));
				lm.setTitulo(result.getString("Nom_titulo_video"));
				lm.setImg(result.getString("Imagen_Video"));
				lm.setLike(result.getInt("Like_Video"));
				lm.setVisto(result.getInt("Nro_visita_video"));
				lm.setLink_descarga(result.getString("Link_descarga"));
				listado.add(lm);
			}
			
			stmt.close();
			conn.close();
			
			request.setAttribute("listado", listado);
			this.gotoPage("/homepage.jsp", request, response);
					
		
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
