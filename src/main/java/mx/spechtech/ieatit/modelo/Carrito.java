package mx.spechtech.ieatit.modelo;

import java.util.List;



public class Carrito {
	
	public int total;
	public List<Alimento> carrito;
	
	
	public Carrito() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Alimento> getCarrito() {
		return carrito;
	}
	public void setCarrito(List<Alimento> carrito) {
		this.carrito = carrito;
	}
	
	
	
}

