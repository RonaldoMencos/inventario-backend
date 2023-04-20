package com.umg.inventariobackend.controller;

import com.umg.inventariobackend.model.ProductoCategoria;
import com.umg.inventariobackend.service.ProductoCategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("http://127.0.0.1:5173/")
@RestController
@RequestMapping("/api/producto-categorias")
public class ProductoCategoriaController {
     @Autowired
     private ProductoCategoriaService productoCategoriaService;

    @GetMapping("/")
    public List<ProductoCategoria> getProductosCategorias() {
        return productoCategoriaService.findAllProductosCategorias();
    }

    @GetMapping("/{id}")
    public ProductoCategoria getProductoCategoria (@PathVariable Long id) {
        return productoCategoriaService.findOneProductoCategoria(id);
    }

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    public ProductoCategoria saveProductoCategoria(@RequestBody ProductoCategoria productoCategoria) {
        return productoCategoriaService.saveProductoCategoria(productoCategoria);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.CREATED)
    public ProductoCategoria updateProductoCategoria(@RequestBody ProductoCategoria productoCategoria, @PathVariable Long id) {
        ProductoCategoria productCategoriaActual = productoCategoriaService.findOneProductoCategoria(id);
        productCategoriaActual.setCodigo(productoCategoria.getCodigo());
        productCategoriaActual.setNombre(productoCategoria.getNombre());
        productCategoriaActual.setDescripcion(productoCategoria.getDescripcion());
        return productoCategoriaService.saveProductoCategoria(productCategoriaActual);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteProductoCategoria(@PathVariable Long id) {
        productoCategoriaService.deleteProductoCategoria(id);
    }
}
