package mx.spechtech.ieatit;

import org.springframework.data.repository.CrudRepository;

import mx.spechtech.ieatit.modelo.Alimento;



public interface RepositorioMenu extends  CrudRepository<Alimento, Integer>{
	
}
