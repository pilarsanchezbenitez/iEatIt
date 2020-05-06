package mx.spechtech.ieatit.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mx.spechtech.ieatit.RepositorioMenu;



	 
	 @Controller
	 public class ControladorMenu {
	     @Autowired
	     private RepositorioMenu repositorioMenu;


	     @GetMapping(path="/")
	     public String listarAlimentos(Model model) {
	         model.addAttribute("alimentos", repositorioMenu.findAll());
	         return "listar";
	     }
}
