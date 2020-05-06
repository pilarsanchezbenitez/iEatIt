package mx.spechtech.ieatit.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Alimento{
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private int id;
	    private String nombre;
	    private int precio;
	    private String descripcion;


	public Alimento(){
		// TODO Auto-generated constructor stub
	}

	public void setIdAlimento(int id) {
		this.id = id;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}
	public int getIdAlimento() {
		return id;
	}
	public String getNombre() {
		return nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public int getPrecio() {
		return precio;
	}

}
