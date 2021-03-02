package ar.edu.ubp.lab2.tags;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class BusquedaCustomTag extends SimpleTagSupport {
	
	public void doTag() throws JspException, IOException
	{
		
		super.doTag();
		
		Connection conn;
		CallableStatement stmt;		
		ResultSet result;
		
		JspWriter out = this.getJspContext().getOut();
		
		try {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ProyectoLab2", "sa", "jmilia");
			conn.setAutoCommit(true);
			
			stmt = conn.prepareCall("{CALL dbo.get_categorias_videos}");
			stmt.execute();
			
			out.println("<div class=\"row\">");	
				out.println("<div class=\"logo\">");
					out.println("<a href=\"homepage.jsp\"><img src=\"./img/zto.png\" width=\"80\" height=\"70\"></a>");
				out.println("</div>");

			out.println("<div class=\"search_wrap search_wrap_6\">\r\n"
					+ "			<div class=\"search_box\">\r\n"
					+ "				<input id=\"speechToText\" onclick=\"jUtils.record()\" name=\"buscar\" type=\"text\" class=\"input_buscador\" placeholder=\"Ingrese su busqueda......\">\r\n"
					+ "				<div class=\"btn\">\r\n"
					+ "					<input id=\"ibuscar\" class=\"btn btn-primary\" type=\"submit\" value=\"Buscar\">   \r\n"
					+ "				</div>\r\n"
					+ "			</div>\r\n"
					+ "		</div>");	
	        out.println("</div>");
	        out.println("<div class=\"categorias_busqueda \">");	
			out.println("<input type=\"radio\" name=\"categoria\" value=\"0\" checked /> Todos &nbsp;&nbsp;&nbsp;");
				 
	        result = stmt.getResultSet();
	        while(result.next()) 
	        {
	           	out.println("<input type=\"radio\" id=\""+result.getInt("Nro_categoria")+ "\" name=\"categoria\" value=\""+result.getInt("Nro_categoria")+"\" />"+ result.getString("Nom_categoria")+" &nbsp;&nbsp;&nbsp; ");
	        }
	        out.println("</div>");
			stmt.close();
			conn.close();
		}
		
		catch (ClassNotFoundException | SQLException e) 
		{
			out.println("<p>" + e.getMessage() + "</p>");
		}
		
	
	}
}
