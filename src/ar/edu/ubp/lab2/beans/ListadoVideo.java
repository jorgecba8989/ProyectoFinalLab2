package ar.edu.ubp.lab2.beans;

public class ListadoVideo {
	
	private int nrovideo;
	private int nrocategoria;
	private String nomcategoria;
	private String titulo;
	private String cantante;
	private String link;
	private String img;
	private int like;
	private int visto;
	private String link_descarga;
	
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public int getNrovideo() {
		return nrovideo;
	}
	public void setNrovideo(int nrovideo) {
		this.nrovideo = nrovideo;
	}
	public int getNrocategoria() {
		return nrocategoria;
	}
	public void setNrocategoria(int nrocategoria) {
		this.nrocategoria = nrocategoria;
	}
	public String getNomcategoria() {
		return nomcategoria;
	}
	public void setNomcategoria(String nomcategoria) {
		this.nomcategoria = nomcategoria;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getCantante() {
		return cantante;
	}
	public void setCantante(String cantante) {
		this.cantante = cantante;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getVisto() {
		return visto;
	}
	public void setVisto(int visto) {
		this.visto = visto;
	}
	public String getLink_descarga() {
		return link_descarga;
	}
	public void setLink_descarga(String link_descarga) {
		this.link_descarga = link_descarga;
	}

}
