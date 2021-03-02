package ar.edu.ubp.lab2.beans;

public class ContenidoPlaylist {
	
	private String nomCantante;
	private String tituloCancion;
	private String urlCancion;
	private Integer like;
	private String nomLista;
	private Integer nro_video;
	private Integer nro_lista;
	private Integer nro_visita;
	private String link_descarga;
	
	public Integer getNro_video() {
		return nro_video;
	}
	public void setNro_video(Integer nro_video) {
		this.nro_video = nro_video;
	}
	public Integer getNro_lista() {
		return nro_lista;
	}
	public void setNro_lista(Integer nro_lista) {
		this.nro_lista = nro_lista;
	}
	public String getNomCantante() {
		return nomCantante;
	}
	public void setNomCantante(String nomCantante) {
		this.nomCantante = nomCantante;
	}
	public String getTituloCancion() {
		return tituloCancion;
	}
	public void setTituloCancion(String tituloCancion) {
		this.tituloCancion = tituloCancion;
	}
	public String getUrlCancion() {
		return urlCancion;
	}
	public void setUrlCancion(String urlCancion) {
		this.urlCancion = urlCancion;
	}
	public Integer getLike() {
		return like;
	}
	public void setLike(Integer like) {
		this.like = like;
	}
	public String getNomLista() {
		return nomLista;
	}
	public void setNomLista(String nomLista) {
		this.nomLista = nomLista;
	}
	public Integer getNro_visita() {
		return nro_visita;
	}
	public void setNro_visita(Integer nro_visita) {
		this.nro_visita = nro_visita;
	}
	public String getLink_descarga() {
		return link_descarga;
	}
	public void setLink_descarga(String link_descarga) {
		this.link_descarga = link_descarga;
	}
}
